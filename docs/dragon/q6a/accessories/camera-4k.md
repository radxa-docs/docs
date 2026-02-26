---
sidebar_position: 1
---

import Camera4K from '../../../common/accessories/\_camera-4k.mdx';

# 瑞莎 4K 摄像头

<Camera4K product='瑞莎 Dragon Q6A' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin 接口' board='dragon-q6a'/>

## 预览摄像头

使用 libcamera 预览摄像头画面。

### 安装依赖

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo apt update
sudo apt install build-essential git pkg-config -y
sudo apt install meson ninja-build -y
sudo apt install python3-pip python3-yaml python3-jinja2 python3-ply python3-pyparsing -y
sudo apt install libyaml-dev libevent-dev -y
sudo apt install libudev-dev libgnutls28-dev openssl libexpat1-dev -y
sudo apt install libdrm-dev -y
sudo apt install libjpeg-dev -y
sudo apt install libglib2.0-dev -y
sudo apt install qt6-base-dev qt6-base-dev-tools qt6-wayland-dev -y
sudo apt install \
    qtbase5-dev \
    qtbase5-dev-tools \
    qtchooser \
    qt5-qmake \
    qttools5-dev \
    qtdeclarative5-dev \
    libqt5opengl5-dev \
    qml-module-qtquick-controls \
    qml-module-qtquick2 -y
```

</NewCodeBlock>

### 编译安装 libcamera

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
git clone https://git.linuxtv.org/libcamera.git
cd libcamera
meson setup build --wipe \
    -Dpipelines=simple \
    -Dcam=enabled \
    -Dgstreamer=disabled \
    -Dv4l2=enabled \
    -Dlc-compliance=disabled \
    -Dqcam=enabled
ninja -C build -j$(nproc)
sudo ninja -C build install
sudo ldconfig
```

</NewCodeBlock>

### 设置权限

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo chmod 666 /dev/dma_heap/*
```

</NewCodeBlock>

### 启动摄像头

打开系统桌面终端，进入 libcamera 的 build 目录，启动 qcam。

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
cd libcamera/build/src/apps/qcam/
./qcam --renderer=gles --stream pixelformat=YUYV,width=1920,height=1080
```

</NewCodeBlock>
