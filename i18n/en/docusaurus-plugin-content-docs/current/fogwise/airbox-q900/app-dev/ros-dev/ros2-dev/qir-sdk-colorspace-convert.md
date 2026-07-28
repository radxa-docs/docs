---
sidebar_position: 9
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# Color Space Conversion

Convert between NV12 and RGB888 color space formats. Qualcomm smart devices use NV12 as the default format, while RGB888 is the common image processing format. This sample supports DMA-BUF input/output and QRB ROS Transport zero-copy transfer, with both GPU (OpenGL ES) and CPU (OpenCV) backends.

The verification below uses the CPU/OpenCV backend, which requires no display or GPU.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)

## Build from Source

### Step 1: Clone the Repository

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_color_space_convert.git
```

</NewCodeBlock>

### Step 2: Build (CPU/OpenCV Backend)

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd qrb_ros_color_space_convert
source /opt/ros/jazzy/setup.bash
colcon build --packages-up-to qrb_ros_colorspace_convert \
  --cmake-args -DUSE_OPENCV_BACKEND=ON -DBUILD_TESTING=OFF
```

</NewCodeBlock>

> The GPU backend uses OpenGL ES and requires `qcom-adreno-dev`, `weston`, and a connected display. Use `-DUSE_OPENCV_BACKEND=OFF` instead.

## Run

A custom ROS node is needed to publish test images to `/image_raw`. The example below uses a Python test script.

**Terminal 1** — Start the conversion node:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd qrb_ros_color_space_convert
source /opt/ros/jazzy/setup.bash
source install/setup.bash
ros2 launch qrb_ros_colorspace_convert colorspace_convert.launch.py \
  conversion_type:=nv12_to_rgb8 latency_fps_test:=False
```

</NewCodeBlock>

**Terminal 2** — Run the test script:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd qrb_ros_color_space_convert
source /opt/ros/jazzy/setup.bash
source install/setup.bash
python3 test/colorspace_ros_test.py nv12_to_rgb8 \
  --output artifacts/data/nv12_to_rgb8.raw
```

</NewCodeBlock>

The test script publishes a 64×48 known pattern to `/image_raw`, subscribes to `/image`, and compares the result byte-for-byte against an independent OpenCV reference.

For the reverse direction (RGB8 → NV12), change `conversion_type` and the script argument to `rgb8_to_nv12`.

## Expected Output

```text
mode=nv12_to_rgb8
input=nv12
output=rgb8
width=64
height=48
max_error=0
mean_error=0.000000
result=PASS
```

`max_error=0` indicates the effective pixel data is byte-identical to the reference.
