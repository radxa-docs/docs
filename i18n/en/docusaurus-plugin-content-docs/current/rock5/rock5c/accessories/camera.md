---
sidebar_position: 4
---

# Cameras

The following cameras are currently supported.

<table>
  <tr>
    <th>Camera Name</th>
    <th>Sensor Type</th>
    <th>Resolution</th>
  </tr>
  <tr>
    <td>OKDO 5MP Camera</td>
    <td>OV5647</td>
    <td>5 megapixels</td>
  </tr>
  <tr>
    <td>Radxa Camera 4K</td>
    <td>IMX415</td>
    <td>8.29 megapixels</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera V2</td>
    <td>IMX219</td>
    <td>8 megapixels</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera v1.3</td>
    <td>OV5647</td>
    <td>5 megapixels</td>
  </tr>
</table>

## Configuration

Take the Radxa Camera 4K camera for example:

<!-- ![Camera-4K setup-01](/img/rock5c/accessories/camera/rock5c-with-4k-camera-FPC.webp)
![Camera-4K setup-02](/img/rock5c/accessories/camera/rock5c-4k-camera-connected.webp)
![Camera-4K setup-03](/img/rock5c/accessories/camera/rock5c-4k-camera.webp) -->

- Prepare the Radxa Camera 4K and connect it to the ROCK 5C via the FPC cable.

- Open the Kconsole terminal via the Application Launcher in the lower left corner and run the `rsetup` command.

```bash
radxa@rock-5c:~$ rsetup
```

Via [Device Tree Configuration](../os-config/rsetup#overlays) to enable Overlay for the Radxa 4K camera.

:::caution [note]

1. Please enable the `[] Enable Radxa Camera 4K` item Overlay.
2. Quit and reboot after `[*] Enable Radxa Camera 4K` is successfully displayed for the configuration to take effect.

:::

## Image Preview

You can also open the camera preview using the terminal command.

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

## Purchase Links

[Radxa Camera 4K](https://radxa.com/products/accessories/camera4k)
