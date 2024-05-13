---
sidebar_position: 4
---

# Radxa 4K camera

! [Radxa Camera 4K](/img/accessories/camera-4k.webp)

## Overview

The Radxa Camera 4K is a high-resolution camera module for Radxa products, utilizing the Sony IMX415 image sensor with 8.29 megapixels and up to 4K resolution. The Radxa Camera 4K Module can be used for the following applications:

- Surveillance cameras
- FA cameras
- Industrial cameras

## Specifications

- Sensor:
  - SONY IMX415
  - Diagonal 6.43 mm ( 1/2.8 type )
  - 8.29 megapixels
  - Unit cell size: 1.45 µm (H) × 1.45 µm (V)
- Output.
  - MIPI CSI-2 4-channel serial data outputs
  - RAW10 / RAW12 output
- Lens Specifications.
  - Interface Type: M12XP0.5
  - Focal Length (EFL): 2.95±5%mm
  - Back Focal Length: 4.64mm
  - Mirror distance: 4.00mm
  - Operating Temperature: -40°C ~ +85°C
  - FOV

| Field of View (Diagonal/Horizontal/Vertical) | CRA |
| ------------------------- | --- |
| D=88.2±5° H=75±3° V=59±2° | 15° |

- Default ribbon cable length: 150 mm

## Datasheet

- [Radxa Camera 4K](https://dl.radxa.com/accessories/camera-4k/radxa_camera_4k_product_brief_Revision_1.0.pdf)
- [SONY IMX415](https://dl.radxa.com/accessories/camera-4k/IMX415-AAQR-C_Datasheet_E19504.pdf)

## Physical Specifications

! [Radxa Display 8 HD](/img/accessories/camera-4k-spec-1.webp)
! [Radxa Display 8 HD](/img/accessories/camera-4k-spec-2.webp)

## Tutorial

### Connections

Connect the ROCK 5 ITX via FPC cable as shown in the picture:

<img src="/img/rock5itx/rock5itx-cam1.webp" alt="rock5itx cam1 connection" width="300" />

### Enabling Overlay

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the ``rsetup`` command:

```bash
radxa@rock-5itx:~$ rsetup
```

- Enable Overlay for the Radxa 4K camera via the [device tree configuration](../os-config/rsetup#overlays).

:::tip

1. Please enable the `[] Enable Radxa Camera 4K on CAM1` item Overlay. 2.
2. Quit and reboot after `[*] Enable Radxa Camera 4K on CAM1` has been successfully enabled for the configuration to take effect.

:::

### Test

Open a terminal and enter the following command to open the camera preview.

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
```

Take a picture with the following command.

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
```

Take a video with the following command: 

```bash
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```
