---
sidebar_position: 4
---

import CAMERA from "../../../../common/accessories/\_camera-usage.mdx";

# MIPI CSI 接口

## 支持列表

<table>
  <tr>
    <th>Camera Name</th>
    <th>Sensor 型号</th>
    <th>分辨率</th>
  </tr>
  <tr>
    <td>OKDO 5MP Camera</td>
    <td>OV5647</td>
    <td>500 万 像素</td>
  </tr>
  <tr>
    <td>Radxa Camera 8M 219</td>
    <td>IMX219</td>
    <td>800 万 像素</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera v2</td>
    <td>IMX219</td>
    <td>800 万 像素</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera v1.3</td>
    <td>OV5647</td>
    <td>500 万 像素</td>
  </tr>
</table>

## 配件的使用

:::tip

以下仅为两个示例，其他摄像头操作方式类似。

:::

### Radxa Camera 8M 219

<CAMERA product="Radxa CM3 IO" camera_connection_img="/img/cm3/cm3-io-radxa-8m-219.webp" model="radxa-cm3-io" rsetup_path="../../radxa-os/rsetup#overlays" camera="Radxa Camera 8M 219" overlays_title="Enable Radxa Camera 8M 219 on CM3 IO v1.34+ CAM1" video_dev="/dev/video0" />

### Raspberry Pi Camera V2

<CAMERA product="Radxa CM3 IO" camera_connection_img="/img/cm3/cm3-io-rpi-cam-v2.webp" model="radxa-cm3-io" rsetup_path="../../radxa-os/rsetup#overlays" camera="Raspberry Pi Camera V2" overlays_title="Enable Raspberry Pi Camera v2 on CM3 IO v1.34+ CAM1" video_dev="/dev/video0" />
