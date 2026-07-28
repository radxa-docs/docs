---
sidebar_position: 11
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# ROS Component Performance Benchmark

Evaluate the performance of ROS components on Q900, supporting standard ROS message types and QRB Transport DMA-BUF zero-copy types.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)

## Out-of-the-Box

### Step 1: Install

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-jazzy-qrb-ros-benchmark
```

</NewCodeBlock>

### Step 2: Create Benchmark Template

The following template tests QRB Transport Image type (DMA-BUF zero-copy) with corrected topic remappings:

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

Key parameters:

- `input_data_path`: path to the test rosbag
- `publisher_upper_frequency` / `publisher_lower_frequency`: search window bounds
- `test_iterations`: number of iterations; use at least 3 to avoid a statistical boundary bug

### Step 3: Generate Test Rosbag

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

### Step 4: Run Benchmark

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
launch_test image_benchmark.launch.py input_data_path:=image_bag
```

</NewCodeBlock>

## Build from Source

### Step 1: Clone Repositories

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

### Step 2: Build

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws
source /opt/ros/jazzy/setup.bash
colcon build
```

</NewCodeBlock>

### Step 3: Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source ~/qrb_ros_ws/install/setup.bash
launch_test image_benchmark.launch.py input_data_path:=image_bag
```

</NewCodeBlock>

## Expected Output

```text
Predicted sustainable frequency:  99.375 Hz
Actual average receive rate:      99.867 FPS
Frames sent:                      198
Dropped frames:                   0
Average frame jitter:             0.312 ms
Average CPU:                      2.074%
Ran 1 test
OK
```

> APT version 1.0.0 may segfault during component unload after the test completes (benchmark data is unaffected). The source-built version has resolved this.
