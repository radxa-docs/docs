---
sidebar_position: 4
---

# Webcam

<img src="/img/rock5itx/rock5itx-cam1.webp" alt="rock5itx cam1 connection" width= "300" /> Prepare the Radxa Camera 4K and connect it to the ROCK 5ITX via the FPC cable.

- Prepare the Radxa Camera 4K and connect it to the ROCK 5ITX via the FPC cable.

- Open the Kconsole terminal via the Application Launcher in the lower left corner and run the `rsetup` command:

Command
radxa@rock-5itx:~$ rsetup

````

- Pass the [Device Tree Configuration](../os-config/rsetup#overlays) to enable overlay for the Rxa 4K camera.

Attention.

1. enable the `[] Enable Radxa Camera 4K ` item overlay on CAM1.
2. Quit and reboot after enabling successfully displaying `[*] Enable Radxa Camera 4K on CAM1` for the configuration to take effect.

:::

## Testing Radxa Camera 4K

You can also open the camera preview using the terminal command:

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
````

Take a picture using the following command:

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
```

Take a video using the following command:

```bash
v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```
