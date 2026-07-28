---
sidebar_position: 7
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# ROS Message Zero-Copy Transport

QRB ROS Transport implements DMA-BUF zero-copy transport based on REP 2007 — passing file descriptors between ROS nodes instead of copying image data. Supports Image, IMU, and PointCloud2 types.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)
- Verify DMA heap is available: `ls /dev/dma_heap/system`

## Method 1: Minimal Verification Code

Write publisher and subscriber nodes that allocate DMA-BUF from `/dev/dma_heap/system`, write a 64×48 NV12 image, publish it, and verify byte-for-byte on the subscriber side.

### Create Test Package

Pick any directory as your colcon workspace:

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

### Build

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd [your_workspace]
source /opt/ros/jazzy/setup.bash
colcon build
```

</NewCodeBlock>

### Run

**Terminal 1** — Subscriber:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 run qrb_transport_test image_transport_test sub
```

</NewCodeBlock>

**Terminal 2** — Publisher:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 run qrb_transport_test image_transport_test pub
```

</NewCodeBlock>

### Expected Output

Terminal 1:

```text
[INFO] [qrb_transport_test_subscriber]: PASS: received and verified 4608 image bytes
```

Terminal 2:

```text
[INFO] [qrb_transport_test_publisher]: published 64x48 NV12 DMA-BUF image
```

## Method 2: Official Source Build

Clone the official repository and build, using the built-in test components.

### Build

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_transport.git [your_transport_src]
source /opt/ros/jazzy/setup.bash
colcon build --base-paths [your_transport_src]
```

</NewCodeBlock>

### Prepare Test Data

Generate a 64×48 NV12 random image file:

```bash
head -c 4608 /dev/urandom > [your_data_dir]/input_64x48_nv12.yuv
```

### Run

**Terminal 1** — Subscriber (measures FPS and latency):

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 component standalone qrb_ros_transport_test qrb_ros::transport::TestSubComponent \
  -p topic_name:=official_image
```

</NewCodeBlock>

**Terminal 2** — Dump component (writes received DMA-BUF to file):

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source [your_workspace]/install/setup.bash
ros2 component standalone qrb_ros_transport_test qrb_ros::transport::TestDumpComponent \
  -p topic_name:=official_image \
  -p dump_file:=[your_data_dir]/output_64x48_nv12.yuv
```

</NewCodeBlock>

**Terminal 3** — Publisher (reads file and publishes DMA-BUF messages):

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

### Expected Output

Terminal 1 prints `fps: ~30, latency: ~1.68 ms` after ~5 seconds. Terminal 2 prints `dump success`.
