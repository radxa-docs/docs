---
sidebar_position: 1
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# 瑞莎 8M 219 摄像头

<Camera8M219 product='瑞莎 Dragon Q6A' interface='15-Pin 1.0 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='15-Pin' pitch='1.0mm 间距' orientation='异面' board='dragon-q6a' />

## 使用摄像头

使用 GStreamer 或 libcamera 的 qcam 工具预览或录制摄像头画面。以下预览命令请在系统桌面终端中运行。

### 系统更新

进入 `Rsetup -> System -> System Update` 更新系统。

### 使用 GStreamer

#### 安装依赖

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo apt install -y \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad
```

</NewCodeBlock>

#### 预览摄像头

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
gst-launch-1.0 libcamerasrc ! video/x-raw,width=1920,height=1080,framerate=30/1 ! queue ! videoconvert ! queue ! autovideosink
```

</NewCodeBlock>

#### 录制视频

软件编码（x264enc）— 1080p：

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
gst-launch-1.0 -e libcamerasrc \
    ! videoconvert ! video/x-raw,format=I420,width=1920,height=1080,framerate=30/1 \
    ! x264enc bitrate=8000 speed-preset=fast \
    ! mp4mux ! filesink location=/tmp/camera-x264.mp4
```

</NewCodeBlock>

硬件编码 H264（Venus）— 1080p：

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
gst-launch-1.0 -e libcamerasrc \
    ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 \
    ! v4l2h264enc ! h264parse ! mp4mux \
    ! filesink location=/tmp/camera-h264.mp4
```

</NewCodeBlock>

硬件编码 H265（Venus）— 1080p：

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
gst-launch-1.0 -e libcamerasrc \
    ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 \
    ! v4l2h265enc ! h265parse ! mp4mux \
    ! filesink location=/tmp/camera-h265.mp4
```

</NewCodeBlock>

### 使用 libcamera

#### 安装依赖

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo apt install -y libcamera-tools gstreamer1.0-libcamera libcamera-ipa
```

</NewCodeBlock>

#### 预览摄像头

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
qcam --stream pixelformat=YUYV,width=1920,height=1080
```

</NewCodeBlock>

## 排查指南

### 检查摄像头是否被识别

使用以下命令检查摄像头是否被系统识别：

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo dmesg | grep imx
```

</NewCodeBlock>

若终端输出以下信息，说明摄像头被正常识别：

```text
[    5.949209] imx219 18-0010: supply VANA not found, using dummy regulator
[    5.951349] imx219 18-0010: supply VDIG not found, using dummy regulator
[    5.951506] imx219 18-0010: supply VDDL not found, using dummy regulator
```

若终端输出以下信息，说明摄像头未被系统识别，需要检查摄像头排线是否安装到位：

```text
[    5.949209] imx219 18-0010: supply VANA not found, using dummy regulator
[    5.951349] imx219 18-0010: supply VDIG not found, using dummy regulator
[    5.951506] imx219 18-0010: supply VDDL not found, using dummy regulator
[    5.958515] imx219 18-0010: Error reading reg 0x0000: -6
[    5.958522] imx219 18-0010: error -ENXIO: failed to read chip id 219
```
