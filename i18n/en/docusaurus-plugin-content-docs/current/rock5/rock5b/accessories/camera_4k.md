---
sidebar_position: 4
---

# Radxa Camera 4K

![Camera-4K Installation-01](/img/rock5b/rock5b-with-4k-camera-FPC.webp)  
![Camera-4K install-02](/img/rock5b/rock5b-4k-camera-connected.webp)  
![Camera-4K installation-03](/img/rock5b/rock5b-4k-camera.webp)

- Prepare the Radxa Camera 4K and connect it to the ROCK 5B via the FPC cable.

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the `rsetup` command:

```bash
radxa@rock-5b:~$ rsetup
```

- Pass the [device tree configuration](../os-config/rsetup#overlays) to enable Overlay for the Radxa 4K camera.

:::caution [Caution]

1. Please enable the `[] Enable Radxa Camera 4K` item Overlay. 2.
2. Quit and reboot after enabling successfully displaying `[*] Enable Radxa Camera 4K` for the configuration to take effect.

:::

## Testing Radxa Camera 4K

You can also open the camera preview using the terminal command.

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink
```

Take a picture with the following command.

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg
```

Take a video with the following command:

```bash
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```

[** Buy Now **](https://radxa.com/products/accessories/camera4k#buy)
