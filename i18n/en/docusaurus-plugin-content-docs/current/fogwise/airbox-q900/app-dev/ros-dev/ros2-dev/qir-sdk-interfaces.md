---
sidebar_position: 6
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# ROS 2 Interface Communication Verification

Verifies custom message, service, and action type communication interfaces within the QRB ROS ecosystem.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)

## Pre-installed Version

The interfaces bundled with QIR SDK can be inspected directly:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 interface package qrb_ros_tensor_list_msgs
```

</NewCodeBlock>

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 interface show qrb_ros_tensor_list_msgs/msg/Tensor
```

</NewCodeBlock>

Expected output: Tensor message definition (`name`, `data_type`, `shape`, `data` fields).

## Build from Source

The source repository contains updated interface definitions with additional data types (`uint16`, `float16`, `uint32`, `uint64`, `int32`) and DMA-BUF zero-copy fields not present in the pre-installed version.

### Step 1: Install Build Dependencies

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-dev-tools colcon
```

</NewCodeBlock>

### Step 2: Clone the Source

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/qrb_ros_ws/src && cd ~/qrb_ros_ws/src
source /opt/ros/jazzy/setup.bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_interfaces.git
```

</NewCodeBlock>

### Step 3: Initialize rosdep

Required for first-time use (skip if already done):

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo rosdep init
sudo rosdep update
```

</NewCodeBlock>

### Step 4: Install Dependencies and Build

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws
source /opt/ros/jazzy/setup.bash
sudo rosdep install -i --from-path src --rosdistro jazzy -y
colcon build
```

</NewCodeBlock>

### Step 5: Verify

Open a new terminal and source the build artifacts:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws
source install/setup.bash
ros2 interface package qrb_ros_tensor_list_msgs
ros2 interface show qrb_ros_tensor_list_msgs/msg/Tensor
```

</NewCodeBlock>

The source-built version outputs a more complete Tensor message definition, including 9 `data_type` values (0-8) and DMA-BUF related fields (`dmabuf_fd`, `dmabuf_size`, `dmabuf_offset`, `dmabuf_ptr`).
