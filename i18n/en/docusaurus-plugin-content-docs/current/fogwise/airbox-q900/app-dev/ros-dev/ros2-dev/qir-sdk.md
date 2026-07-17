---
sidebar_position: 3
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-09
---

# QIR SDK Development Guide

The Qualcomm Intelligent Robotics SDK (QIR SDK) is a collection of ROS 2 development components for Qualcomm robotics platforms. It provides zero-copy transport, platform sensor drivers, robot simulation environments, and AI inference samples, helping developers quickly build robotics applications on Ubuntu.

QIR SDK is distributed as two meta-packages: `qirp-sdk` (server) and `qirp-sdk-desktop` (desktop). Installation automatically pulls in ROS 2 Jazzy and 70+ Qualcomm robotics packages.

## Relationship with QAIRT / QIM SDK

| Layer             | Contents                                                       | Status on Q900                   |
| ----------------- | -------------------------------------------------------------- | -------------------------------- |
| **QAIRT Runtime** | QNN / SNPE / LiteRT runtime libraries                          | Installed via apt (`qairt-libs`) |
| **QIM SDK**       | GStreamer ML inference plugins and CLI tools                   | Installed via apt                |
| **QIR SDK**       | ROS 2 robotics framework, sensor drivers, simulation & samples | Installed via apt                |

QIR SDK depends on QAIRT and QIM SDK, stacked in the order above. Lower-layer dependencies are installed automatically when installing QIR SDK.

## Prerequisites

- Radxa AIRbox Q900
- Ubuntu 24.04 with network connectivity

## Installation

### Step 1: Configure apt repositories

Add ROS 2 and Qualcomm official PPAs:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# Add ROS 2 repository
sudo apt update && sudo apt install -y software-properties-common
sudo add-apt-repository -y universe
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
    http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | \
    sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Add Qualcomm PPAs
sudo add-apt-repository -y ppa:ubuntu-qcom-iot/qcom-ppa
sudo add-apt-repository -y ppa:ubuntu-qcom-iot/qirp

sudo apt update
```

</NewCodeBlock>

### Step 2: Install QIR SDK

- **Radxa OS**:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y qirp-sdk-desktop
```

</NewCodeBlock>

<details>
<summary>Server (headless)</summary>

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y qirp-sdk
```

</NewCodeBlock>

</details>

Installation takes approximately 5-10 minutes, automatically installing ROS 2 Jazzy base and all Qualcomm robotics packages.

### Step 3: Fix and run post-install setup script

The official QIR SDK package hardcodes the user directory as `/home/ubuntu`, while the Radxa official image uses the `radxa` user. Modify the script before running:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo sed -i 's|DIR=/home/ubuntu|DIR=/home/radxa|' /usr/share/qirp-setup.sh
bash /usr/share/qirp-setup.sh
```

</NewCodeBlock>

This script performs the following:

- Installs Python dependencies (`typing_extensions`, `pytesseract`)
- Auto-detects USB camera device path
- Configures ROS 2 environment variables

### Step 4: Verify installation

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 pkg list | grep -E 'qrb|sample|simulation' | sort
```

</NewCodeBlock>

Expected output includes at least the following packages:

```text
qrb_amr_manager
qrb_inference_manager
qrb_ros_imu
qrb_ros_camera
rplidar_ros
sample_depth_estimation
sample_face_detection
sample_hand_detection
sample_object_detection
simulation_sample_amr_simple_motion
simulation_sample_pick_and_place
...
```

## Package Categories

QIR SDK provides the following ROS 2 packages by category:

### Platform Samples

| Package                            | Description                   |
| ---------------------------------- | ----------------------------- |
| `ros-jazzy-ocr-service`            | OCR text recognition service  |
| `ros-jazzy-rplidar-ros`            | RPLIDAR LiDAR driver          |
| `ros-jazzy-orbbec-camera`          | Orbbec depth camera driver    |
| `ros-jazzy-qrb-ros-imu`            | IMU inertial measurement      |
| `ros-jazzy-qrb-ros-battery`        | Battery status monitoring     |
| `ros-jazzy-qrb-ros-camera`         | Camera capture and publishing |
| `ros-jazzy-qrb-ros-video`          | Video encoding/decoding       |
| `ros-jazzy-qrb-ros-system-monitor` | System resource monitoring    |
| `ros-jazzy-ros2-benchmark`         | ROS 2 performance benchmark   |

### Robotics Samples

| Package                                         | Description                  |
| ----------------------------------------------- | ---------------------------- |
| `ros-jazzy-simulation-sample-amr-simple-motion` | AMR simple motion simulation |
| `ros-jazzy-simulation-sample-pick-and-place`    | Pick and place simulation    |
| `ros-jazzy-simulation-remote-assistant`         | Remote assistant simulation  |
| `ros-jazzy-qrb-amr-manager`                     | AMR manager                  |
| `ros-jazzy-qrb-follow-path-manager`             | Path following manager       |
| `ros-jazzy-follow-me`                           | Person following             |
| `ros-jazzy-qcom-cartographer-ros`               | Cartographer SLAM            |

### AI Samples

| Package                                  | Description                | Inference Backend |
| ---------------------------------------- | -------------------------- | ----------------- |
| `ros-jazzy-sample-hand-detection`        | Hand detection             | DSP               |
| `ros-jazzy-sample-face-detection`        | Face detection             | DSP               |
| `ros-jazzy-sample-object-detection`      | Object detection           | DSP               |
| `ros-jazzy-sample-hrnet-pose-estimation` | HRNet pose estimation      | DSP               |
| `ros-jazzy-sample-object-segmentation`   | Semantic segmentation      | DSP               |
| `ros-jazzy-sample-depth-estimation`      | Monocular depth estimation | DSP               |
| `ros-jazzy-sample-resnet101`             | ResNet-101 classification  | DSP               |
| `ros-jazzy-sample-apriltag`              | AprilTag detection         | DSP               |

### Infrastructure

| Package                                         | Description                             |
| ----------------------------------------------- | --------------------------------------- |
| `ros-jazzy-dmabuf-transport`                    | DMA-BUF zero-copy ROS message transport |
| `ros-jazzy-qrb-ros-transport-image-type`        | Image type zero-copy transport          |
| `ros-jazzy-qrb-ros-transport-imu-type`          | IMU type zero-copy transport            |
| `ros-jazzy-qrb-ros-transport-point-cloud2-type` | Point cloud type zero-copy transport    |
| `ros-jazzy-qrb-inference-manager`               | AI inference manager                    |
| `ros-jazzy-qrb-ros-nn-inference`                | Neural network inference node           |
| `ros-jazzy-qrb-ros-yolo-process`                | YOLO object detection processing        |
| `ros-jazzy-qrb-ros-audio-service`               | Audio service                           |

> For a complete package list, refer to the official Qualcomm document _Qualcomm Intelligent Robotics SDK for Ubuntu User Guide_ (80-90441-2).

## Verified Samples

The following samples have been verified on Q900:

### Platform Samples

- [Basic OCR](qir-sdk-ocr.md) — Optical character recognition service
- [System Resource Monitor](qir-sdk-system-monitor.md) — Multi-dimensional monitoring of CPU, memory, temperature, etc.
- [Interface Communication](qir-sdk-interfaces.md) — ROS 2 custom message interface verification
- [Message Zero-Copy Transport](qir-sdk-transport.md) — DMA-BUF zero-copy transport verification
- [Model Inference](qir-sdk-nn-inference.md) — DSP model inference (YOLOv8)
- [Color Space Conversion](qir-sdk-colorspace-convert.md) — NV12 to RGB888 and back
- [Video Codec](qir-sdk-video.md) — VPU hardware H.264/H.265 encode/decode
- [Performance Benchmark](qir-sdk-benchmark.md) — ROS component performance evaluation

### Robotics Samples

- [AMR Simple Motion Control](qir-sdk-amr-simple-motion.md) — Interactive keyboard-controlled simulation
- [Pick and Place](qir-sdk-pick-and-place.md) — RML-63 MoveIt2 simulation
- [Simulated Remote Assistant](qir-sdk-remote-assistant.md) — Office AMR navigation and detection
- [2D LiDAR SLAM](qir-sdk-slam.md) — Cartographer mapping and relocalization
- [Follow Me](qir-sdk-follow-me.md) — FastestDet person detection and depth tracking

### AI Samples

- [Hand Detection](qir-sdk-hand-detection.md) — Static image palm detection and 21-point landmark recognition
- [Monocular Depth Estimation](qir-sdk-depth-estimation.md) — Depth Anything V2 relative-depth estimation from a static image
- [HRNet Human Pose Estimation](qir-sdk-hrnet-pose-estimation.md) — 17-point human keypoint detection from a static image
- [ResNet101 Image Classification](qir-sdk-resnet101.md) — ImageNet 1000-class classification from a static image
- [YOLOv8 Object Detection](qir-sdk-object-detection.md) — Object classes and bounding boxes from a static image
- [YOLOv8 Object Segmentation](qir-sdk-object-segmentation.md) — Object classes, bounding boxes, and instance masks from a static image

> For samples requiring external hardware (RPLIDAR, Orbbec camera, USB camera, etc.), refer to Chapter 3 of the official Qualcomm user guide.

## Troubleshooting

### `ros2` command not found

ROS 2 environment not sourced:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
```

</NewCodeBlock>

Add to `~/.bashrc` for automatic sourcing:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
```

</NewCodeBlock>

### No display output after launching sample

Check if Weston is running:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ps aux | grep weston
```

</NewCodeBlock>

If Weston is not running, ensure you are using a desktop image and have logged into the desktop session.

### DSP inference fails

Verify FastRPC device nodes exist:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls /dev/fastrpc-cdsp*
```

</NewCodeBlock>

If no output, refer to [Enable NPU on board](../../../ai-dev/fastrpc-setup.md).

### USB camera not detected

Check camera devices:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
v4l2-ctl --list-devices
```

</NewCodeBlock>

## References

- [ROS 2 Development](ros2-install.md) — Set up ROS 2 independently
- [QIM SDK Development Guide](../../../ai-dev/qim-sdk/README.md) — GStreamer ML inference applications
- [Qualcomm Official User Guide](https://docs.qualcomm.com/doc/80-90441-2) — Complete QIR SDK reference
