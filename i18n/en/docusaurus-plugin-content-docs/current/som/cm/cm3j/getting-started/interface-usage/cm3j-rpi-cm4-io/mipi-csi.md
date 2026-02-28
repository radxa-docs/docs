---
sidebar_position: 5
---

# MIPI CSI

## Supported List

<table>
  <tr>
    <th>Camera Name</th>
    <th>Sensor Model</th>
    <th>Resolution</th>
  </tr>
  <tr>
    <td>Radxa Camera 8M 219</td>
    <td>IMX219</td>
    <td>8 million pixels</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera V2</td>
    <td>IMX219</td>
    <td>8 million pixels</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera v1.3</td>
    <td>OV5647</td>
    <td>5 million pixels</td>
  </tr>
</table>

## Usage Instructions

The Raspberry Pi Compute Module 4 IO Board has two CSI interfaces: CAM0 and CAM1.

:::tip
When using CAM0 or DISP0, you need to short-circuit the location on the board as shown in the image below.
:::

![JUMP](/img/cm3j/jump.webp)

### Radxa Camera 8M 219

- Connect

  - Connect to the Raspberry Pi Compute Module 4 IO Board using an FPC cable, as shown in the image below:
    ![8M 219](/img/cm3j/8m-219.webp)

- Use `rsetup` to open the corresponding overlay.

  - Use the Ctrl + T shortcut to open the terminal, then run the `rsetup` command:

    ```text
    radxa@radxa-cm3j-rpi-cm4-io:~$ rsetup
    ```

  - Enable the Radxa Camera 8M 219 Overlay through the [overlays](../../../os-config/rsetup#overlays) device tree configuration.

    :::tip
    Please enable the "Enable Radxa Camera 8M on CAM0/CAM1" overlay.<br/>
    After successfully enabling "[*] Enable Radxa Camera 8M on CAM0/CAM1", exit and reboot to apply the configuration.
    :::

### Raspberry Pi Camera V2

- Connect

  - Connect to the Raspberry Pi Compute Module 4 IO Board using an FPC cable, as shown in the image below:
    ![V2](/img/cm3j/v2.webp)

- Use `rsetup` to open the corresponding overlay.

  - Use the Ctrl + T shortcut to open the terminal, then run the `rsetup` command:

    ```text
    radxa@radxa-cm3j-rpi-cm4-io:~$ rsetup
    ```

  - Enable the Raspberry Pi Camera V2 Overlay through the [overlays](../../../os-config/rsetup#overlays) device tree configuration.

    :::tip
    Please enable the "[] Enable Raspberry Pi Camera V2 on CAM0/CAM1" overlay.<br/>
    After successfully enabling "[*] Enable Raspberry Pi Camera V2 on CAM0/CAM1", exit and reboot to apply the configuration.
    :::

### Raspberry Pi Camera v1.3

- Connect

  - Connect to the Raspberry Pi Compute Module 4 IO Board using an FPC cable, as shown in the image below:
    ![V1.3](/img/cm3j/V1-3.webp)

- Use `rsetup` to open the corresponding overlay.

  - Use the Ctrl + T shortcut to open the terminal, then run the `rsetup` command:

    ```text
    radxa@radxa-cm3j-rpi-cm4-io:~$ rsetup
    ```

  - Enable the Raspberry Pi Camera v1.3 Overlay through the [overlays](../../../os-config/rsetup#overlays) device tree configuration.

    :::tip
    Please enable the "[] Enable Raspberry Pi Camera v1.3 on CAM0/CAM1" overlay.<br/>
    After successfully enabling "[*] Enable Raspberry Pi Camera v1.3 on CAM0/CAM1", exit and reboot to apply the configuration.
    :::

### Test

- Preview

  - Open the terminal and enter the following command to open the camera preview:

    <pre style={{ whiteSpace: "nowrap" }}>
      <!-- prettier-ignore -->
      gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
    </pre>

- Take Photo

  - Open the terminal and enter the following command to take a photo using the camera:

    <pre style={{ whiteSpace: "nowrap" }}>
      <!-- prettier-ignore -->
      gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
    </pre>

- Record video

  - Open the terminal and enter the following command to start recording a video with the camera:

    <pre style={{ whiteSpace: "nowrap" }}>
      <!-- prettier-ignore -->
      gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
    </pre>
