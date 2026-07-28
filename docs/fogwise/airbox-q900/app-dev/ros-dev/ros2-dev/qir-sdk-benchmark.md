---
sidebar_position: 11
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# ROS 组件性能基准测试

评估 ROS 组件在 Q900 上的性能表现，支持标准 ROS 消息类型和 QRB Transport DMA-BUF 零拷贝类型。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)

## 开箱即用

### 步骤 1：安装

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-jazzy-qrb-ros-benchmark
```

</NewCodeBlock>

### 步骤 2：创建基准测试模板

以下模板测试 QRB Transport Image 类型（DMA-BUF 零拷贝传输），已修正官方文档中缺失的 topic remapping：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat > image_benchmark.launch.py << 'EOF'
from launch_ros.actions import ComposableNodeContainer
from launch_ros.descriptions import ComposableNode
from ros2_benchmark import ROS2BenchmarkConfig, ROS2BenchmarkTest

def launch_setup(container_prefix, container_sigterm_timeout):
    data_loader_node = ComposableNode(
        name='DataLoaderNode',
        namespace=TestQrbNode.generate_namespace(),
        package='ros2_benchmark',
        plugin='ros2_benchmark::DataLoaderNode',
        remappings=[('data_loader_image', '/data_loader_image')],
    )

    playback_node = ComposableNode(
        name='QrbPlaybackNode',
        namespace=TestQrbNode.generate_namespace(),
        package='qrb_ros_benchmark',
        plugin='qrb_ros::benchmark::QrbPlaybackNode',
        parameters=[{
            'data_formats': ['qrb_ros/transport/type/Image'],
        }],
        remappings=[
            ('buffer/input0', '/data_loader_image'),
            ('input0', '/playback_image'),
        ],
    )

    monitor_node = ComposableNode(
        name='QrbMonitorNode',
        namespace=TestQrbNode.generate_namespace(),
        package='qrb_ros_benchmark',
        plugin='qrb_ros::benchmark::QrbMonitorNode',
        parameters=[{
            'monitor_data_format': 'qrb_ros/transport/type/Image',
        }],
        remappings=[('output', '/playback_image')],
    )

    container = ComposableNodeContainer(
        name='container',
        namespace=TestQrbNode.generate_namespace(),
        package='rclcpp_components',
        executable='component_container_mt',
        prefix=container_prefix,
        sigterm_timeout=container_sigterm_timeout,
        composable_node_descriptions=[
            data_loader_node,
            playback_node,
            monitor_node,
        ],
        output='screen',
    )
    return [container]

def generate_test_description():
    return TestQrbNode.generate_test_description_with_nsys(launch_setup)

class TestQrbNode(ROS2BenchmarkTest):
    config = ROS2BenchmarkConfig(
        benchmark_name='QRB Image Transport Benchmark',
        input_data_path='/path/to/rosbag',
        publisher_upper_frequency=100.0,
        publisher_lower_frequency=100.0,
        playback_message_buffer_size=10,
        test_iterations=3,
    )

    def test_benchmark(self):
        self.run_benchmark()
EOF
```

</NewCodeBlock>

关键参数说明：

- `input_data_path`：指向测试 rosbag 的路径
- `publisher_upper_frequency` / `publisher_lower_frequency`：搜索窗口上限/下限
- `test_iterations`：迭代次数，建议至少 3 次以避免统计边界 bug

### 步骤 3：生成测试 rosbag

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "
from ros2_benchmark import RosbagGenerator
RosbagGenerator.generate_fixed_messages(
    output_path='image_bag',
    topic_name='/data_loader_image',
    msg_type='sensor_msgs/msg/Image',
    resolution=(320, 240),
    encoding='rgb8',
    message_count=10,
)"
```

</NewCodeBlock>

### 步骤 4：运行基准测试

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
launch_test image_benchmark.launch.py input_data_path:=image_bag
```

</NewCodeBlock>

## 源码构建

### 步骤 1：克隆仓库

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/qrb_ros_ws/src && cd ~/qrb_ros_ws/src
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_benchmark.git
git clone https://github.com/qualcomm-qrb-ros/ros2_benchmark.git
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_transport.git
git clone https://github.com/qualcomm-qrb-ros/lib_mem_dmabuf.git
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_imu.git
git clone https://github.com/qualcomm-qrb-ros/dmabuf_transport.git
```

</NewCodeBlock>

### 步骤 2：构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws
source /opt/ros/jazzy/setup.bash
colcon build
```

</NewCodeBlock>

### 步骤 3：运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source ~/qrb_ros_ws/install/setup.bash
launch_test image_benchmark.launch.py input_data_path:=image_bag
```

</NewCodeBlock>

## 预期输出

```text
预测可持续频率:       99.375 Hz
实际平均接收速率:     99.867 FPS
发送帧数:             198
丢帧:                 0
平均帧间抖动:         0.312 ms
平均 CPU:             2.074%
Ran 1 test
OK
```

> APT 1.0.0 版在测试完成后卸载组件时可能发生段错误（不影响已生成的 benchmark 数据），源码版已修复。
