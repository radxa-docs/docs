---
sidebar_position: 3
---

# CSI

## Introduction

The camera interface is used to connect the camera module to the main control board for transferring picture/video data and control signals.

## Support List

The ROCK 5 ITX comes with two 4-lane CSI interfaces. The following is the list of currently supported cameras:

<table>
  <tr>
    <th>Camera Name</th>
    <th>Sensor Model</th>
    <th>Resolution</th>
  </tr>
  <tr>
    <td>OKDO 5MP Camera</td>
    <td>OV5647</td>
    <td>5 Megapixel</td>
  </tr>
  <tr>
    <td>Radxa Camera 4K</td>
    <td>IMX415</td>
    <td>8.29 Million Pixels</td>
  </tr>
  <tr>
    <td>Radxa Camera 8M 219</td>
    <td>IMX219</td>
    <td>8.0 Megapixel</td>
  </tr>
</table>

## Accessories

### Radxa Camera 4K

! [Radxa Camera 4K](/img/accessories/camera-4k.webp)

#### Overview

The Radxa Camera 4K is a high resolution camera module for Radxa products featuring a Sony IMX415 image sensor with 8.29 megapixels and up to 4K resolution. The Radxa Camera 4K Module can be used for the following applications:

- Surveillance cameras
- FA cameras
- Industrial cameras

#### Specifications

- Sensor:
  - SONY IMX415
  - Diagonal 6.43 mm ( 1/2.8 type )
  - 8.29 megapixels
  - Unit cell size: 1.45 µm (H) × 1.45 µm (V)
- Output: MIPI CSI-2
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
| -------------------------------------------- | --- |
| D=88.2±5° H=75±3° V=59±2°                    | 15° |

- Default ribbon cable length: 150 mm

#### Datasheet

- [Radxa Camera 4K](https://dl.radxa.com/accessories/camera-4k/radxa_camera_4k_product_brief_Revision_1.0.pdf)
- [SONY IMX415](https://dl.radxa.com/accessories/camera-4k/IMX415-AAQR-C_Datasheet_E19504.pdf)

#### Physical Specifications

! [Radxa Display 8 HD](/img/accessories/camera-4k-spec-1.webp)
! [Radxa Display 8 HD](/img/accessories/camera-4k-spec-2.webp)

## Interface Test Methodology

The following tutorial describes how to test the camera CSI interface using the Radxa Camera 4K as an example.

### Connections

Connect the ROCK 5 ITX via FPC cable as shown in the picture:

<img src="/img/rock5itx/rock5itx-cam1.webp" alt="rock5itx cam1 connection" width="300" />

### Enabling Overlay

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the `rsetup` command:

```bash
radxa@rock-5itx:~$ rsetup
```

- Pass the [device tree configuration](../os-config/rsetup#overlays) to enable Overlay for the Rxa 4K camera.

:::tip

1. Please enable the `[] Enable Radxa Camera 4K on CAM1` item Overlay. 2.
2. Quit and reboot after `[*] Enable Radxa Camera 4K on CAM1` has been successfully enabled for the configuration to take effect.

:::

### Test

Open a terminal and enter the following command to open the camera preview.

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink; !
```

Take a picture with the following command.

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg; !
```

Take a video with the following command: ``bash

```bash
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```
