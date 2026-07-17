---
sidebar_position: 7
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# ROS 消息零拷贝传输

QRB ROS Transport 基于 REP 2007 实现 DMA-BUF 零拷贝传输——在 ROS 节点间传递文件描述符而非拷贝图像数据。支持 Image、IMU、PointCloud2 三种类型。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- 确认 DMA heap 可用：`ls /dev/dma_heap/system`

## 方式一：最小验证代码

编写发布/订阅两个节点，从 `/dev/dma_heap/system` 分配 DMA-BUF，写入 64×48 NV12 图像并发布，订阅端逐字节校验。

### 创建测试包

选取任意目录作为 colcon workspace，在其中创建包：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p [your_workspace]/src/qrb_transport_test/src && cd $_
```

</NewCodeBlock>

#### package.xml

```bash
cat > package.xml << 'EOF'
<?xml version="1.0"?>
<package format="3">
  <name>qrb_transport_test</name>
  <version>0.0.1</version>
  <description>QRB ROS Transport zero-copy test</description>
  <maintainer email="user@example.com">user</maintainer>
  <license>Apache-2.0</license>
  <buildtool_depend>ament_cmake</buildtool_depend>
  <depend>rclcpp</depend>
  <depend>sensor_msgs</depend>
  <depend>qrb_ros_transport_image_type</depend>
  <depend>lib_mem_dmabuf</depend>
  <export><build_type>ament_cmake</build_type></export>
</package>
EOF
```

#### CMakeLists.txt

```bash
cat > CMakeLists.txt << 'EOF'
cmake_minimum_required(VERSION 3.8)
project(qrb_transport_test)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(qrb_ros_transport_image_type REQUIRED)
find_package(lib_mem_dmabuf REQUIRED)

add_executable(image_transport_test src/image_transport_test.cpp)
ament_target_dependencies(image_transport_test
  rclcpp sensor_msgs qrb_ros_transport_image_type lib_mem_dmabuf)
install(TARGETS image_transport_test DESTINATION lib/${PROJECT_NAME})
ament_package()
EOF
```

#### image_transport_test.cpp

```bash
cat > src/image_transport_test.cpp << 'EOF'
#include <cstdint>
#include <memory>
#include <string>
#include <vector>

#include "qrb_ros_transport_image_type/image.hpp"
#include "qrb_ros_transport_image_type/image_utils.hpp"
#include "rclcpp/rclcpp.hpp"

using Image = qrb_ros::transport::type::Image;

class PublisherNode : public rclcpp::Node {
public:
  PublisherNode() : Node("qrb_transport_test_publisher") {
    publisher_ = create_publisher<Image>("qrb_transport_test/image", 10);
    timer_ = create_wall_timer(std::chrono::milliseconds(500),
                               [this]() { publish_image(); });
  }

private:
  void publish_image() {
    constexpr int width = 64, height = 48;
    constexpr char encoding[] = "nv12";
    const auto raw_size = width * height * 3 / 2;
    const auto alloc_size =
        qrb_ros::transport::image_utils::get_image_align_size(width, height,
                                                               encoding);

    std::vector<std::uint8_t> data(raw_size);
    for (std::size_t i = 0; i < data.size(); ++i)
      data[i] = static_cast<std::uint8_t>(i % 251);

    auto dmabuf =
        lib_mem_dmabuf::DmaBuffer::alloc(alloc_size, "/dev/dma_heap/system");
    if (!dmabuf || !qrb_ros::transport::image_utils::save_image_to_dmabuf(
                       dmabuf, data.data(), width, height, width, encoding,
                       true)) {
      RCLCPP_ERROR(get_logger(), "failed to allocate or fill DMA-BUF");
      rclcpp::shutdown();
      return;
    }

    auto message = std::make_unique<Image>();
    message->header.stamp = now();
    message->header.frame_id = "qrb_transport_test";
    message->width = width;
    message->height = height;
    message->encoding = encoding;
    message->dmabuf = std::move(dmabuf);
    publisher_->publish(std::move(message));
    RCLCPP_INFO(get_logger(), "published %dx%d NV12 DMA-BUF image", width,
                height);
  }

  rclcpp::Publisher<Image>::SharedPtr publisher_;
  rclcpp::TimerBase::SharedPtr timer_;
};

class SubscriberNode : public rclcpp::Node {
public:
  SubscriberNode() : Node("qrb_transport_test_subscriber") {
    subscription_ = create_subscription<Image>(
        "qrb_transport_test/image", 10,
        [this](const std::shared_ptr<Image> message) { receive_image(message); });
  }

private:
  void receive_image(const std::shared_ptr<Image> &message) {
    const auto raw_size = message->width * message->height * 3 / 2;
    std::vector<char> data(raw_size);
    const bool read_ok =
        message->dmabuf &&
        qrb_ros::transport::image_utils::read_image_from_dmabuf(
            message->dmabuf, data.data(), message->width, message->height,
            message->width, message->encoding, true);
    bool content_ok = read_ok;
    for (std::size_t i = 0; content_ok && i < data.size(); ++i)
      content_ok = static_cast<std::uint8_t>(data[i]) ==
                   static_cast<std::uint8_t>(i % 251);

    if (message->width == 64 && message->height == 48 &&
        message->encoding == "nv12" && content_ok) {
      RCLCPP_INFO(get_logger(), "PASS: received and verified %zu image bytes",
                  data.size());
    } else {
      RCLCPP_ERROR(get_logger(), "FAIL: invalid metadata or DMA-BUF content");
    }
    rclcpp::shutdown();
  }

  rclcpp::Subscription<Image>::SharedPtr subscription_;
};

int main(int argc, char **argv) {
  rclcpp::init(argc, argv);
  if (argc != 2 ||
      (std::string(argv[1]) != "pub" && std::string(argv[1]) != "sub")) {
    RCLCPP_ERROR(rclcpp::get_logger("qrb_transport_test"),
                 "usage: image_transport_test pub|sub");
    return 2;
  }
  if (std::string(argv[1]) == "pub")
    rclcpp::spin(std::make_shared<PublisherNode>());
  else
    rclcpp::spin(std::make_shared<SubscriberNode>());
  rclcpp::shutdown();
  return 0;
}
EOF
```

### 构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd [your_workspace]
source /opt/ros/jazzy/setup.bash
colcon build
```

</NewCodeBlock>

### 运行

**终端 1** — 订阅者：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 run qrb_transport_test image_transport_test sub
```

</NewCodeBlock>

**终端 2** — 发布者：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 run qrb_transport_test image_transport_test pub
```

</NewCodeBlock>

### 预期输出

终端 1：

```text
[INFO] [qrb_transport_test_subscriber]: PASS: received and verified 4608 image bytes
```

终端 2：

```text
[INFO] [qrb_transport_test_publisher]: published 64x48 NV12 DMA-BUF image
```

## 方式二：官方源码构建

克隆官方仓库并构建，使用内置的测试组件验证。

### 构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_transport.git [your_transport_src]
source /opt/ros/jazzy/setup.bash
colcon build --base-paths [your_transport_src]
```

</NewCodeBlock>

### 准备测试数据

生成 64×48 NV12 随机图像文件：

```bash
head -c 4608 /dev/urandom > [your_data_dir]/input_64x48_nv12.yuv
```

### 运行

**终端 1** — 订阅者（测量 FPS 和延迟）：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 component standalone qrb_ros_transport_test qrb_ros::transport::TestSubComponent \
  -p topic_name:=official_image
```

</NewCodeBlock>

**终端 2** — 落盘组件（将收到的 DMA-BUF 写入文件）：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 component standalone qrb_ros_transport_test qrb_ros::transport::TestDumpComponent \
  -p topic_name:=official_image \
  -p dump_file:=[your_data_dir]/output_64x48_nv12.yuv
```

</NewCodeBlock>

**终端 3** — 发布者（读取文件并发布 DMA-BUF 消息）：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 component standalone qrb_ros_transport_test qrb_ros::transport::TestPubComponent \
  -p input:=[your_data_dir]/input_64x48_nv12.yuv \
  -p width:=64 \
  -p height:=48 \
  -p encoding:=nv12 \
  -p topic_name:=official_image \
  -p fps:=30
```

</NewCodeBlock>

### 预期输出

终端 1 约 5 秒后打印 `fps: ~30, latency: ~1.68 ms`。终端 2 打印 `dump success`。
