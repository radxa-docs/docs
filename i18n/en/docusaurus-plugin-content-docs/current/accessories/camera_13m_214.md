---
sidebar_position: 4
---

# Radxa 13M 214 Camera

## Product Overview

The Radxa 13M 214 Camera is a high-performance camera module specifically designed for Radxa products. It features a 13-megapixel Sony IMX214 image sensor with autofocus, HDR imaging, and 4K ultra-high-definition video output capabilities.

This camera is suitable for the following applications:

- High-quality image capture
- Embedded vision systems
- AI edge computing (image recognition, video analysis, etc.)
- Robotic vision perception

## Product Specifications

### IMX214 Sensor

- Sensor Size: 5.867mm diagonal (1/3.06 inch)
- Total Pixels: 4224 (H) x 3200 (V)
- Active Pixels: 4208 (H) x 3120 (V)
- Imaging Performance:
  - Full resolution @30fps (Normal/HDR mode)
  - 4K2K @30fps (Normal/HDR mode)
  - 1080P @60fps (Normal/HDR mode)
- Supports single-frame HDR technology with equivalent full-pixel output

### Lens Specifications

- FOV:
  - Vertical: 51.6°
  - Horizontal: 66.2°
  - Diagonal: 78.4°
- EFL: 3.57mm
- F-Number: 2.0 ± 5% (at INFINITE focus)
- TV Distortion (Traditional×2): < 1.5%

### Compatible boards

FPC Cable: Standard 31p 0.3mm pitch cable, 150mm length

- Radxa NIO 12L
- Radxa ROCK 4D
- Radxa CM4 IO Board

## Mechanical Dimensions

<div style={{textAlign: 'center'}}>
    <img src="/en/img/accessories/camera_13m_214_dimension.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## User Guide

### Prerequisites

- Standard 31p 0.3mm pitch FPC cable
- Radxa 13M 214 Camera
- Compatible board

### Hardware Connection

Connect the camera to the board using an FPC cable. Using ROCK 4D as an example:

① : Connect to the board's MIPI CSI interface with the golden fingers (metal contacts) facing the board

② : Connect to the camera's MIPI CSI interface with the golden fingers (metal contacts) facing the camera

<div style={{textAlign: 'center'}}>
    <img src="/en/img/accessories/rock4d-camera-13m-214.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Software Enablement

Enter the `rsetup` command in the terminal to configure display options using the Rsetup tool.

<NewCodeBlock tip="radxa@device$" type="device">

```
rsetup
```

</NewCodeBlock>

1. Use the arrow keys to select the "Overlays" option, then press Enter to confirm.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/rsetup-overlays.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

2. Use the arrow keys to select "Manage overlays" option, then press Enter to confirm.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/rsetup-overlays-manage.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

3. Use the arrow keys to select the corresponding Camera option, press Space to enable (indicated by `*`), then press Enter to confirm.

- Camera 13M 214 → Select `Enable Radxa Camera 13M 214` option

4. Reboot the system for the changes to take effect.

## Test the Camera

You can use the following commands to test if the camera is working properly.

- Camera Preview Command

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
```

- Take Photo Command

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
```

- Record Video Command

```bash
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```

## Pin Definition

| Pin | Signal | Pin | Signal | Pin | Signal    | Pin | Signal     |
| --- | ------ | --- | ------ | --- | --------- | --- | ---------- |
| 1   | DGND   | 9   | NC     | 17  | MCN       | 25  | SDA        |
| 2   | MDN3   | 10  | DGND   | 18  | MCP       | 26  | NC         |
| 3   | MDP3   | 11  | MDN1   | 19  | DGND      | 27  | RESET      |
| 4   | DGND   | 12  | MDP1   | 20  | MCLK      | 28  | VCC3.3V    |
| 5   | MDN2   | 13  | DGND   | 21  | DGND      | 29  | VCC3.3V    |
| 6   | MDP2   | 14  | MDN0   | 22  | NC        | 30  | VCC5V / NC |
| 7   | DGND   | 15  | MDP0   | 23  | PWDN / NC | 31  | VCC5V / NC |
| 8   | NC     | 16  | DGND   | 24  | SCL       | 32  | ~          |

:::tip Note

In the Radxa 13M 214 camera module, Pin 23 / 30 / 31 are not connected.

:::
