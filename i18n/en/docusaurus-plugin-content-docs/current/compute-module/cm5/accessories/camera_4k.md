---
sidebar_position: 4
---

# Radxa Camera 4K

![Camera-4K installation](/img/cm5/cm5io-4k-camera-connected.webp)  

- Prepare the Radxa Camera 4K and connect it to the Camera 1 connector of the Radxa CM5 IO board via the FPC cable.

- Open the Kconsole terminal via the Application Launcher in the lower left corner and run the `rsetup` command:

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- Via [device tree configuration](../radxa-os/sys-config/rsetup#overlays) to enable Overlay for the Renesas 4K camera.

:::caution [Note]

1. Please enable the `[] Enable Radxa Camera 4K` item Overlay.
2. Exit reboot after `[*] Enable Radxa Camera 4K` is successfully displayed for the configuration to take effect.

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
