---
sidebar_position: 1
---

import Camera13M214 from '../../../common/accessories/\_camera-13m-214.mdx';

# 瑞莎 13M 214 摄像头

<Camera13M214 product='瑞莎 Dragon Q6A' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin' pitch='0.3mm 间距' orientation='异面' board='dragon-q6a'/>

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
    libgles2-mesa-dev \
    qml-module-qtquick2 -y
```

</NewCodeBlock>

### 使用 Debian 官方打包仓库自打包安装 libcamera

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
# 安装打包工具和依赖
sudo apt install -y devscripts
sudo apt build-dep libcamera

# 获取 Debian 官方打包仓库的 0.4.0-7 分支
git clone https://salsa.debian.org/multimedia-team/libcamera.git
cd libcamera
git checkout debian/0.4.0-7

# 编译打包 libcamera
debuild --no-lintian --no-sign -b

# 安装生成的 deb 包，包括 gstreamer 插件
sudo apt-get install ./../libcamera*.deb ./../libcamera-dev*.deb ./../libcamera-tools*.deb
sudo apt-get install ./../gstreamer1.0-libcamera*.deb
```

</NewCodeBlock>

### 设置权限

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo chmod 666 /dev/dma_heap/*
```

</NewCodeBlock>

### 启动摄像头

使用 gstreamer 的 libcamera 元素预览摄像头画面：

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
# 使用 libcamera 元素连接到 autovideosink
gst-launch-1.0 libcamerasrc ! autovideosink
```

</NewCodeBlock>

或者指定具体的分辨率和格式：

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
# 指定分辨率和格式
gst-launch-1.0 libcamerasrc ! video/x-raw,width=1920,height=1080,format=YUYV ! autovideosink
```

</NewCodeBlock>
