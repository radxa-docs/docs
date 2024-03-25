---
sidebar_position: 4
---

# Camera

The following 3 camera products are currently supported:

1. OKDO 5MP Camera (ov5647)
2. Raspberry Camera v1.3 (ov5647)
3. Raspberry Camera v2 (imx219)

The following is a demonstration of the operation of 'Raspberry Camera v2', and other cameras are similar.

## Configuration

- Prepare the raspberry camera v2 and connect it to the NX5 IO via the FPC cable.

- Open console and run `sudo rsetup` command.

```bash
radxa@radxa-nx5-io:~$ sudo rsetup
```

- Pass the [device tree configuration](../radxa-os/sys-config/rsetup#overlays) to enable overlay for the camera.

:::caution [Caution]

1. Please enable the `[] Enable Raspberry Pi Camera v2 on CAM0` item overlay.
2. Quit and reboot after enabling successfully displaying `[*] Enable Raspberry Pi Camera v2 on CAM0` for the configuration to take effect.
3. For other products, please enable the appropriate overlay according to the description.

:::

## Image Preview

The live preview of the camera is recommended to use cheese, run the following command to install cheese:

```sh
sudo apt update
sudo apt install cheese
```

After entering the desktop, open the terminal and execute the following commands to start the implementation of the preview camera:

```sh
sudo cheese
```

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
