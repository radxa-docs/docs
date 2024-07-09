---
sidebar_position: 7
---

import CAMERA from "../../../../common/accessories/\_camera-usage.mdx";

# MIPI CSI Interface

## Interface differences

- The ROCK 5B has one four-lane(can be split into 2x two-lane) MIPI CSI Camera connector.
- The ROCK 5B+ is equipped with two four-channel MIPI CSI camera connectors connector.

## Support List

<Tabs queryString="versions">
    <TabItem value="ROCK 5B">
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
    </TabItem>
    <TabItem value="ROCK 5B+">
      <table>
        <tr>
          <th>Camera Name</th>
          <th>Sensor Model</th>
          <th>Resolution</th>
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
      </table>
    </TabItem>
</Tabs>

## Accessory usage

:::tip

Only these two are given as examples. Apart from possible differences in wiring and overlay, the operational steps for other cameras are similar.

:::

### Radxa Camera 4K

<CAMERA product="ROCK 5B" camera_connection_img="/img/rock5b/rock5b-4k-camera-connected.webp" model="rock-5b" rsetup_path="../../radxa-os/rsetup#overlays" camera="Radxa 4K Camera" overlays_title="Enable Radxa Camera 4K" video_dev="/dev/video11" />

### Raspberry Pi Camera V2

<CAMERA product="ROCK 5B+" camera_connection_img="/img/rock5b/rock5bp-rpi-cam-v2.webp" model="rock-5b-plus" rsetup_path="../../radxa-os/rsetup#overlays" camera="Raspberry Pi Camera V2" overlays_title="Enable Raspberry Pi Camera V2" video_dev="/dev/video11" />
