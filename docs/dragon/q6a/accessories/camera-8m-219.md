---
sidebar_position: 1
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# 瑞莎 8M 219 摄像头

<Camera8M219 product='瑞莎 Dragon Q6A' interface='15-Pin 1.0 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin' pitch='0.3mm 间距' orientation='同面' board='dragon-q6a' />

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

### 修改配置文件

进入 `libcamera` 目录，修改 `libcamera/src/ipa/simple/data/imx219.yaml`文件。

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
cd libcamera
sudo nano src/ipa/simple/data/imx219.yaml
```

</NewCodeBlock>

将下面内容复制到 `src/ipa/simple/data/imx219.yaml`文件。

```bash
# SPDX-License-Identifier: CC0-1.0
%YAML 1.1
---
version: 1
algorithms:
  - BlackLevel:
  - Awb:
      # 手动引导白平衡（非常重要）
      gains:
        red: 1.8
        green: 1.0
        blue: 1.4
  - Ccm:
      ccms:
        - ct: 6500
          ccm: [
            1.35, -0.25, -0.10,
           -0.10,  0.80, -0.10,
           -0.05, -0.30,  1.35
          ]
  - Agc:
      # 防止自动曝光拉灰
      target: 0.55
      speed: 0.2
...
```

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
./qcam --stream pixelformat=YUYV,width=1920,height=1080
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
