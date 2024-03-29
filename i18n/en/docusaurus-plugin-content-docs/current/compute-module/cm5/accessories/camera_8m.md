---
sidebar_position: 5
---

# Radxa Camera 8M
Radxa CM5 IO Camera0 interface, using reverse 15pin cable, compatible cameras are:   
Radxa Camera 8M, OKDO 5MP, RPI Camera V13, RPI Camera V2.

## Take connecting Radxa Camera 8M as an example:
![Camera-8M installation](/img/cm5/cm5io-8m-camera-connected.webp)  

- Prepare the Radxa Camera 8M and connect it to the Camera 0 connector of the Radxa CM5 IO board via the FPC cable.

- Open the Kconsole terminal via the Application Launcher in the lower left corner and run the `rsetup` command:

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- Via [device tree configuration](../radxa-os/sys-config/rsetup#overlays) to enable Overlay for the Renesas 8M camera.

:::caution [Note].

1. Please enable the `[] Enable Radxa Camera 8M 219 on CSI0` item Overlay.
2. Exit reboot after `[*] Enable Radxa Camera 8M 219 on CSI0` is successfully displayed for the configuration to take effect.

:::

## Testing the Radxa Camera 8M

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
