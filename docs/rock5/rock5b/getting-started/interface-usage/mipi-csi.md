---
sidebar_position: 7
---

import CAMERA from "../../../../common/accessories/\_camera-usage.mdx";

# MIPI CSI 接口

## 接口差异

- ROCK 5B 有一个四通道（可分为 2x 双通道）MIPI CSI 摄像头连接器。
- ROCK 5B+ 配备了两个四通道 MIPI CSI 摄像头连接器。

## 支持列表

<Tabs queryString="versions">
    <TabItem value="ROCK 5B">
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
          <td>Radxa Camera 4K</td>
          <td>IMX415</td>
          <td>829 万 像素</td>
        </tr>
        <tr>
          <td>Raspberry Pi Camera V2</td>
          <td>IMX219</td>
          <td>800 万 像素</td>
        </tr>
        <tr>
          <td>Raspberry Pi Camera v1.3</td>
          <td>OV5647</td>
          <td>500 万 像素</td>
        </tr>
      </table>
    </TabItem>
    <TabItem value="ROCK 5B+">
      <table>
        <tr>
          <th>Camera Name</th>
          <th>Sensor 型号</th>
          <th>分辨率</th>
        </tr>
        <tr>
          <td>Radxa Camera 4K</td>
          <td>IMX415</td>
          <td>829 万 像素</td>
        </tr>
        <tr>
          <td>Raspberry Pi Camera V2</td>
          <td>IMX219</td>
          <td>800 万 像素</td>
        </tr>
      </table>
    </TabItem>
</Tabs>

## 配件的使用

:::tip

以下两个仅作为示例，除了可能的排线和 Overlay 不同外，其他摄像头的操作步骤类似。

:::

### Radxa Camera 4K

<CAMERA product="ROCK 5B" camera_connection_img="/img/rock5b/rock5b-4k-camera-connected.webp" model="rock-5b" rsetup_path="../../radxa-os/rsetup#overlays" camera="瑞莎 4K 摄像头" overlays_title="Enable Radxa Camera 4K" video_dev="/dev/video11" />

### Raspberry Pi Camera V2

<CAMERA product="ROCK 5B+" camera_connection_img="/img/rock5b/rock5bp-rpi-cam-v2.webp" model="rock-5b-plus" rsetup_path="../../radxa-os/rsetup#overlays" camera="Raspberry Pi Camera V2" overlays_title="Enable Raspberry Pi Camera V2" video_dev="/dev/video11" />
