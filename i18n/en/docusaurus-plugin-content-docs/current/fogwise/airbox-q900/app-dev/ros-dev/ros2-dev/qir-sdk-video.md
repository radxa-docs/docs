---
sidebar_position: 10
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# Video Codec

Uses Q900's VPU for hardware H.264/H.265 video encoding and decoding. Transfers frames via DMA-BUF: the encoder compresses raw NV12 frames into MP4, and the decoder reconstructs raw frames from the compressed stream.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)
- Verify VPU devices: `ls /dev/video32 /dev/video33`

## Out-of-the-Box

### Step 1: Install

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-jazzy-qrb-ros-video ros-jazzy-qrb-ros-video-test
```

</NewCodeBlock>

### Step 2: Prepare Test Data

The official launch files expect the following filenames. Ensure your test data is named accordingly:

- Encode input: `/data/1920_1080_nv12.yuv` (NV12 raw frames, 1920×1080)
- Decode input: `/data/1920_1080.mp4`

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p /data && sudo chmod 777 /data
# Place your test files at the paths and names shown above
```

</NewCodeBlock>

### Step 3: Encode

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 launch qrb_ros_video encoder_launch.py
```

</NewCodeBlock>

The encoder reads `/data/1920_1080_nv12.yuv` and writes `/data/1920_1080_nv12.mp4`.

### Step 4: Decode

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 launch qrb_ros_video decoder_launch.py
```

</NewCodeBlock>

The decoder reads `/data/1920_1080.mp4` and writes decoded frames to `/dev/null` (no display output).

## Build from Source

### Step 1: Install Dependencies

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y build-essential cmake pkg-config \
  libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
  ros-jazzy-qrb-ros-transport-image-type
```

</NewCodeBlock>

> The official document uses `libgstreamer-plugins-base1.0-devs` which is a typo; the correct package is `libgstreamer-plugins-base1.0-dev`.

### Step 2: Clone the Repository

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_video
cd qrb_ros_video
```

</NewCodeBlock>

### Step 3: Build

The repository contains two packages (`qrb_video_v4l2_lib` and `qrb_ros_video`) which must be built together. File I/O components require `BUILD_TESTING=ON`:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
colcon build --cmake-args -DBUILD_TESTING=ON
```

</NewCodeBlock>

### Step 4: Run

The encode and decode commands are identical to the out-of-the-box method. Source `install/setup.bash` before running to use the source-built version.

## Notes

- To change input/output paths or resolution, edit the `input_file` / `output_file` and `width` / `height` parameters in the launch files.
- The parameter `rate_control` in the official document table differs from `rate-control` used in the actual code. Use the spelling found in the launch files.
- APT version 0.1.2 may segfault on Ctrl+C during decoder cleanup (decoded results are unaffected). Source version 0.1.7 has resolved this.
