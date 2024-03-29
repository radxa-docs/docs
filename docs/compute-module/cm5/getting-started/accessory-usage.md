---
sidebar_position: 4
---

# 配件使用说明

这个章节主要介绍 Radxa-CM5-IO 支持的常见配件以及如何使用。

## 接口总览

<img src="/img/cm5/cm5-block-diagram.webp" width="700" alt="Radxa-CM5-IO interfaces overview" />

## 摄像头

Radxa-CM5-IO 带有一个 4-lane 的 CSI 接口和一个 2-lane 的 CSI 接口。以下是目前支持的摄像头列表：

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
    <td>Radxa Camera 8M</td>
    <td>IMX219</td>
    <td>800 万 像素</td>
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

4lane 摄像头使用请参见[摄像头使用教程](../accessories/camera_4k)  
2lane 摄像头使用请参见[摄像头使用教程](../accessories/camera_8m)

## 屏幕

Radxa-CM5-IO 带有一个 4-lane 的 DSI 接口和有一个 2-lane 的 DSI 接口。以下是目前支持的屏幕列表：

<table>
  <tr>
    <th>Screen Name</th>
    <th>分辨率</th>
  </tr>
  <tr>
    <td>ALLNET 5 inch DSI Display</td>
    <td>800 ×3(RGB) ×480 像素</td>
  </tr>
  <tr>
    <td>Radxa Display 8 HD</td>
    <td>1280x800 像素</td>
  </tr>
  <tr>
    <td>Radxa Display 10FHD</td>
    <td>1200x1920 像素 </td>
  </tr>
  <tr>
    <td>Raspberry Pi 7 inch Touchscreen</td>
    <td>800 x 480 像素</td>
  </tr>
</table>

4lane Radxa8寸屏使用请参见[屏幕使用教程](../accessories/8hd-display_use)  
2lane 树莓派7寸屏使用请参见[屏幕使用教程](../accessories/rpi-7inch-display)

## WIFI & BT 支持模块列表

| NO. | Model                    | Chip        | WiFi          | BT  | WIFI Throughput                      | Remark |
| --- | ------------------------ | ----------- | ------------- | --- | ------------------------------------ | ------ |
| 1   | Radxa wireless A8        | RTL8852BE   | 2.4G&5G&WIFI6 | 5.0 | up:600 Mbits/sec down: 900 Mbits/sec |        |
| 2   | Intel 0MHK36 (PCIE+USB)  | Intel 3165  | 2.4G&5G       | 4.2 | up:283 Mbits/sec down: 334 Mbits/sec |        |
| 3   | Intel 7265NGW (PCIE+USB) | Intel 7265  | 2.4G&5G       | 4.2 | up:363 Mbits/sec down: 619 Mbits/sec |        |
| 4   | Intel AX210 (PCIE+USB)   | Intel AX210 | WiFi 6        | 5.2 | up:859 Mbits/sec down: 813 Mbits/sec |        |

- Radxa CM5 搭配 Radxa CM5 IO 板，没有板载WiFi/BT模块，需要外接模块。以上是支持并测试过的 WITI/BT 卡。
  无线模块使用请参见[WIFI/BT教程](../accessories/wifi_bt_access.md)

更多配件信息可参考 [配件列表](../accessories)
