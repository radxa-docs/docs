---
sidebar_position: 1
---

import Camera4K from '../../../common/accessories/\_camera-4k.mdx';

# Radxa Camera 4K

<Camera4K product='Radxa Dragon Q6A' interface='31-pin 0.3 mm pitch SMD Horizontal FPC connector' connect='Flip type, bottom contact' pins='31-Pin' pitch='0.3mm pitch' orientation='opposite side' board='dragon-q6a' />

## Preview the camera

Use libcamera to preview the camera image.

### Install dependencies

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

### Build and install libcamera using Debian official packaging repository

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
# Install build dependencies
sudo apt update
sudo apt install -y devscripts build-essential debhelper dh-make quilt git

# Clone Debian official libcamera repository
git clone https://salsa.debian.org/multimedia-team/libcamera.git
cd libcamera

# Switch to debian/0.4.0-7 branch
git checkout debian/0.4.0-7

# Install build dependencies
sudo mk-build-deps --install --remove debian/control

# Build deb packages
dpkg-buildpackage -us -uc -b

# Install built deb packages
cd ..
sudo dpkg -i libcamera*.deb libcamera-dev*.deb libcamera-tools*.deb || sudo apt-get install -f -y
```

</NewCodeBlock>

### Set permissions

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo chmod 666 /dev/dma_heap/*
```

</NewCodeBlock>

### Start the camera (using GStreamer)

Start the camera using GStreamer pipeline with libcamera element -> autovideosink element:

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
# Install GStreamer packages
sudo apt install -y gstreamer1.0-tools gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly

# Start camera preview
gst-launch-1.0 libcamerasrc ! autovideosink
```

</NewCodeBlock>

To specify camera parameters, you can use:

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
# Specify resolution, framerate, etc.
gst-launch-1.0 libcamerasrc ! video/x-raw,width=1920,height=1080,framerate=30/1 ! autovideosink
```

</NewCodeBlock>
