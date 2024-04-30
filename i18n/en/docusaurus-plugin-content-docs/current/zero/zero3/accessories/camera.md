---
sidebar_position: 2
---

# Camera

## CSI Interface Definition

The ZERO 3 has a 22 PIN CSI interface defined as follows.

![zero3w csi1](/img/zero/zero3/zero3w-csi1.webp)

![zero3w csi](/img/zero/zero3/zero3w-csi.webp)

Currently supported cameras are:

- Raspberry Pi Camera V1.3 (OV5647)
- Raspberry Pi Camera V2 (IMX219)
- Radxa Camera 8M (IMX219)

## Usage

### System Configuration

- Enable camera overlay, select the corresponding overlay
- Here we are using Raspberry Pi Camera V1.3, if you are using other cameras, please select the corresponding overlay for the camera model

```bash
sudo rsetup
```

![zero3w camera1](/img/zero/zero3/zero3w-camera1.webp)

Confirm and reboot to take effect.

### Hardware Connections

Hardware connections are as follows:

:::tip
Please pay attention to the direction of the interface of the camera cable!
:::

![zero3w camera2](/img/zero/zero3/zero3w-camera2.webp)

### Image Preview

Cheese is recommended for live camera previews.

```bash
sudo apt update
sudo apt install cheese
```

Once on the desktop, open a terminal and run

```bash
sudo cheese
```

You can start implementing the preview camera:

![zero3w camera3](/img/zero/zero3/zero3w-camera3.webp)

You can also take a picture using the command:

```bash
gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=/home/radxa/test.jpg
```

![zero3w camera4](/img/zero/zero3/zero3w-camera4.webp)

Execute the command and press `Ctrl+c` to take a picture, the path to the photo is `/home/radxa/test.jpg`

### Troubleshooting

- Capture prompt cannot open /dev/video0 device

```bash
radxa@radxa-zero3:~$ gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=/home/radxa/test.jpg
Setting pipeline to PAUSED ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Cannot identify device '/dev/video0'.
Additional debug info:
../sys/v4l2/v4l2_calls.c(608): gst_v4l2_open (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
system error: No such file or directory
ERROR: pipeline doesn't want to preroll.
Failed to set pipeline to PAUSED.
Setting pipeline to NULL ...
Freeing pipeline ...
```

This problem may be caused by overlay is not successfully enabled, re-execute rsetup operation, check /boot/extlinux/extlinux.conf file to see if overlay has been added, if it has been added successfully, there will be the following:

```bash
...
fdtoverlays  /boot/dtbo/radxa-zero3-rpi-camera-v1.3.dtbo
...
```
