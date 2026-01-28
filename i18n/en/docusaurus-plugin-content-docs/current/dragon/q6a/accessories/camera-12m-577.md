---
sidebar_position: 1
---

import Camera12M577 from '../../../common/accessories/\_camera-12m-577.mdx';

# Radxa Camera 12M 577

<Camera12M577 product='Radxa Dragon Q6A' interface='31-pin 0.3 mm pitch SMD Horizontal FPC connector' connect='Flip type, bottom contact' pins='31-pin connector' board='dragon-q6a' />

## Preview the camera

Use libcamera to preview the camera image.

### Install dependencies

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```
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

### Build and install libcamera

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```
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

### Set permissions

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```
sudo chmod 666 /dev/dma_heap/*
```

</NewCodeBlock>

### Start the camera

Open the system desktop terminal, go to the libcamera build directory, and start qcam.

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```
cd libcamera/build/src/apps/qcam/
./qcam --renderer=gles --stream pixelformat=YUYV,width=1920,height=1080
```

</NewCodeBlock>
