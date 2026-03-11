---
sidebar_position: 1
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# Radxa Camera 8M 219

<Camera8M219 product='Radxa Dragon Q6A' interface='15-pin 1.0 mm pitch SMD Horizontal FPC connector' connect='Flip type, bottom contact' pins='31-Pin' pitch='0.3mm pitch' orientation='same side' board='dragon-q6a' />

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

### Build and install libcamera

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

### Modify configuration file

Enter the `libcamera` directory and edit `libcamera/src/ipa/simple/data/imx219.yaml`.

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
cd libcamera
sudo nano src/ipa/simple/data/imx219.yaml
```

</NewCodeBlock>

Copy the following content into `src/ipa/simple/data/imx219.yaml`.

```bash
# SPDX-License-Identifier: CC0-1.0
%YAML 1.1
---
version: 1
algorithms:
  - BlackLevel:
  - Awb:
      # Manual white balance guidance (important)
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
      # Prevent grayish auto exposure
      target: 0.55
      speed: 0.2
...
```

### Set permissions

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo chmod 666 /dev/dma_heap/*
```

</NewCodeBlock>

### Start the camera

Open the system desktop terminal, go to the libcamera build directory, and start qcam.

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
cd libcamera/build/src/apps/qcam/
./qcam --stream pixelformat=YUYV,width=1920,height=1080
```

</NewCodeBlock>

## Troubleshooting

### Check if the camera is recognized

Use the following command to check if the camera is recognized by the system:

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo dmesg | grep imx
```

</NewCodeBlock>

If the terminal outputs the following information, the camera is recognized properly:

```text
[    5.949209] imx219 18-0010: supply VANA not found, using dummy regulator
[    5.951349] imx219 18-0010: supply VDIG not found, using dummy regulator
[    5.951506] imx219 18-0010: supply VDDL not found, using dummy regulator
```

If the terminal outputs the following information, the camera is not recognized by the system, and you need to check if the camera cable is properly installed:

```text
[    5.949209] imx219 18-0010: supply VANA not found, using dummy regulator
[    5.951349] imx219 18-0010: supply VDIG not found, using dummy regulator
[    5.951506] imx219 18-0010: supply VDDL not found, using dummy regulator
[    5.958515] imx219 18-0010: Error reading reg 0x0000: -6
[    5.958522] imx219 18-0010: error -ENXIO: failed to read chip id 219
```
