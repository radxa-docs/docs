---
sidebar_position: 7
---

import CAMERA from "../../../../common/accessories/\_camera-usage.mdx";

# MIPI CSI Interface

## Interface differences

- The ROCK 5T is equipped with two four-channel MIPI CSI camera connectors connector.

## Support List

  <table>
        <tr>
          <th>Camera Name</th>
          <th>Sensor Model</th>
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
          <td>Radxa Camera 8M</td>
          <td>IMX219</td>
          <td>8 megapixels</td>
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

## Accessory usage

:::tip

Only these two are given as examples. Apart from possible differences in wiring and overlay, the operational steps for other cameras are similar.

:::

### Radxa Camera 4K

<CAMERA product="ROCK 5T" camera_connection_img="/img/rock5t/rock5t-4k-camera-connected.webp" model="rock-5t" rsetup_path="../../radxa-os/rsetup#overlays" camera="Radxa 4K Camera" overlays_title="Enable Radxa Camera 4K on CAM0" video_dev="/dev/video11" />

### Radxa Camera 8M

<CAMERA product="ROCK 5T" camera_connection_img="/img/rock5t/rock5t-8m-camera-connected.webp" model="rock-5t" rsetup_path="../../radxa-os/rsetup#overlays" camera="Radxa 8M Camera" overlays_title="Enable Radxa Camera 8M on CAM0" video_dev="/dev/video11" />
