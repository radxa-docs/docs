---
sidebar_position: 10
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# 视频编解码

使用 Q900 的 VPU 硬件进行 H.264/H.265 视频编解码。通过 DMA-BUF 传输图像帧，编码器将原始 NV12 帧压缩为 MP4，解码器从压缩流还原原始帧。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- 确认 VPU 设备可用：`ls /dev/video32 /dev/video33`

## 开箱即用

### 步骤 1：安装

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-jazzy-qrb-ros-video ros-jazzy-qrb-ros-video-test
```

</NewCodeBlock>

### 步骤 2：准备测试数据

官方 launch 文件预期以下文件名，请确保测试数据按此命名：

- 编码输入：`/data/1920_1080_nv12.yuv`（NV12 原始帧，1920×1080）
- 解码输入：`/data/1920_1080.mp4`

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p /data && sudo chmod 777 /data
# 将准备好的测试文件按上述路径和文件名放入 /data
```

</NewCodeBlock>

### 步骤 3：编码

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 launch qrb_ros_video encoder_launch.py
```

</NewCodeBlock>

编码器读取 `/data/1920_1080_nv12.yuv`，输出 `/data/1920_1080_nv12.mp4`。

### 步骤 4：解码

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 launch qrb_ros_video decoder_launch.py
```

</NewCodeBlock>

解码器读取 `/data/1920_1080.mp4`，解码后的原始帧输出到 `/dev/null`（不显示画面）。

## 源码构建

### 步骤 1：安装依赖

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y build-essential cmake pkg-config \
  libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
  ros-jazzy-qrb-ros-transport-image-type
```

</NewCodeBlock>

> 官方文档中 `libgstreamer-plugins-base1.0-devs` 为笔误，正确包名为 `libgstreamer-plugins-base1.0-dev`。

### 步骤 2：克隆仓库

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_video
cd qrb_ros_video
```

</NewCodeBlock>

### 步骤 3：构建

仓库包含两个包（`qrb_video_v4l2_lib` 和 `qrb_ros_video`），需一起构建。文件 I/O 组件需要 `BUILD_TESTING=ON`：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
colcon build --cmake-args -DBUILD_TESTING=ON
```

</NewCodeBlock>

### 步骤 4：运行

编码和解码命令与开箱即用相同，通过 `source install/setup.bash` 加载源码构建版本。

## 注意

- 如需修改输入输出路径或分辨率，编辑 launch 文件中的 `input_file` / `output_file` 及 `width` / `height` 参数。
- 参数 `rate_control` 在官方文档表格中写法与实际代码中的 `rate-control` 不同，以 launch 文件中的写法为准。
- APT 0.1.2 版解码器在 Ctrl+C 退出时可能发生段错误（不影响已完成的解码结果），源码 0.1.7 版已修复。
