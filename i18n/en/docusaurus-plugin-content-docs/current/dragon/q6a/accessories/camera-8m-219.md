---
sidebar_position: 1
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# Radxa Camera 8M 219

<Camera8M219 product='Radxa Dragon Q6A' interface='15-pin 1.0 mm pitch SMD Horizontal FPC connector' connect='Flip type, bottom contact' pins='15-Pin' pitch='1.0mm pitch' orientation='opposite sides' board='dragon-q6a' />

## Using the camera

Use GStreamer or the libcamera qcam tool to preview or record the camera image. Run the following preview commands in the system desktop terminal.

### System update

Go to `Rsetup -> System -> System Update` to update the system.

### Using GStreamer

#### Install dependencies

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo apt install -y \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad
```

</NewCodeBlock>

#### Preview the camera

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
gst-launch-1.0 libcamerasrc ! video/x-raw,width=1920,height=1080,framerate=30/1 ! queue ! videoconvert ! queue ! autovideosink
```

</NewCodeBlock>

#### Record video

Software encoding (x264enc) - 1080p:

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
gst-launch-1.0 -e libcamerasrc \
    ! videoconvert ! video/x-raw,format=I420,width=1920,height=1080,framerate=30/1 \
    ! x264enc bitrate=8000 speed-preset=fast \
    ! mp4mux ! filesink location=/tmp/camera-x264.mp4
```

</NewCodeBlock>

Hardware encoding H264 (Venus) - 1080p:

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
gst-launch-1.0 -e libcamerasrc \
    ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 \
    ! v4l2h264enc ! h264parse ! mp4mux \
    ! filesink location=/tmp/camera-h264.mp4
```

</NewCodeBlock>

Hardware encoding H265 (Venus) - 1080p:

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
gst-launch-1.0 -e libcamerasrc \
    ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 \
    ! v4l2h265enc ! h265parse ! mp4mux \
    ! filesink location=/tmp/camera-h265.mp4
```

</NewCodeBlock>

### Using libcamera

#### Install dependencies

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
sudo apt install -y libcamera-tools gstreamer1.0-libcamera libcamera-ipa
```

</NewCodeBlock>

#### Preview the camera

<NewCodeBlock tip='radxa@dragon-q6a$' type="device">

```bash
qcam --stream pixelformat=YUYV,width=1920,height=1080
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
