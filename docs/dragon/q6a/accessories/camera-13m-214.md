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
# 安装构建依赖
sudo apt update
sudo apt install -y devscripts build-essential debhelper dh-make quilt git

# 克隆 Debian 官方 libcamera 仓库
git clone https://salsa.debian.org/multimedia-team/libcamera.git
cd libcamera

# 切换到 debian/0.4.0-7 分支
git checkout debian/0.4.0-7

# 安装构建依赖
sudo mk-build-deps --install --remove debian/control

# 构建 deb 包
dpkg-buildpackage -us -uc -b

# 安装构建的 deb 包
cd ..
sudo dpkg -i libcamera*.deb libcamera-dev*.deb libcamera-tools*.deb || sudo apt-get install -f -y
```

</NewCodeBlock>

### 设置权限

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo chmod 666 /dev/dma_heap/*
```

</NewCodeBlock>

### 启动摄像头（使用 GStreamer）

使用 GStreamer 管道启动摄像头，使用 libcamera 元素 -> autovideosink 元素：

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
# 安装 GStreamer 相关包
sudo apt install -y gstreamer1.0-tools gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly

# 启动摄像头预览
gst-launch-1.0 libcamerasrc ! autovideosink
```

</NewCodeBlock>

如果要指定摄像头参数，可以使用：

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
# 指定分辨率、帧率等参数
gst-launch-1.0 libcamerasrc ! video/x-raw,width=1920,height=1080,framerate=30/1 ! autovideosink
```

</NewCodeBlock>
