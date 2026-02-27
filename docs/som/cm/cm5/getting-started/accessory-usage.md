---
sidebar_position: 4
---

# 配件使用说明

这个章节主要介绍瑞莎 CM5 载板支持的常见配件以及如何使用。

## 接口总览

<img src="/img/cm5/cm5-block-diagram.webp" width="700" alt="Radxa-CM5-IO interfaces overview" />

## 摄像头

瑞莎 CM5 载板自带有一个 MIPI CSI 摄像头接口（4 lane, 31-pin）和一个 MIPI CSI 摄像头接口（2 lane, 15-pin）。以下是目前支持的摄像头列表：

<table>
  <tr>
    <th>摄像头名称</th>
    <th>传感器型号</th>
    <th>分辨率</th>
    <th>接口</th>
  </tr>
  <tr>
    <td>OKDO 5MP 摄像头</td>
    <td>OV5647</td>
    <td>500 万像素</td>
    <td>MIPI CSI 接口(15-pin)</td>
  </tr>
  <tr>
    <td>瑞莎 8M 摄像头</td>
    <td>IMX219</td>
    <td>800 万像素</td>
    <td>MIPI CSI 接口(31-pin)</td>
  </tr>
  <tr>
    <td>瑞莎 4K 摄像头</td>
    <td>IMX415</td>
    <td>829 万像素</td>
    <td>MIPI CSI 接口(31-pin)</td>
  </tr>
  <tr>
    <td>树莓派 V2 摄像头</td>
    <td>IMX219</td>
    <td>800 万像素</td>
    <td>MIPI CSI 接口(15-pin)</td>
  </tr>
  <tr>
    <td>树莓派 V1.3 摄像头</td>
    <td>OV5647</td>
    <td>500 万像素</td>
    <td>MIPI CSI 接口(15-pin)</td>
  </tr>
</table>

MIPI CSI 摄像头接口（4 lane, 31-pin）连接摄像头使用，可以参考 [瑞莎 4K 摄像头使用教程](../accessories/camera/camera-4k)  
MIPI CSI 摄像头接口（2 lane, 15-pin）连接摄像头使用，可以参考 [瑞莎 8M 摄像头使用教程](../accessories/camera/camera-8m-219)

## 屏幕

瑞莎 CM5 载板带有一个 MIPI DSI 显示接口（4 lane, 39-pin）和有一个 MIPI DSI 显示接口（2 lane, 15-pin）。以下是目前支持的屏幕列表：

<table>
  <tr>
    <th>屏幕名称</th>
    <th>分辨率</th>
    <th>接口</th>
  </tr>
  <tr>
    <td>ALLNET 5 寸显示屏</td>
    <td>800 ×3(RGB) ×480 像素</td>
    <td>MIPI DSI 接口(40-pin)</td>
  </tr>
  <tr>
    <td>瑞莎 8 寸显示屏</td>
    <td>1280x800 像素</td>
    <td>MIPI DSI 接口(40-pin)</td>
  </tr>
  <tr>
    <td>瑞莎 10 寸显示屏</td>
    <td>1200x1920 像素 </td>
    <td>MIPI DSI 接口(40-pin)</td>
  </tr>
  <tr>
    <td>树莓派 7 寸显示屏</td>
    <td>800 x 480 像素</td>
    <td>MIPI DSI 接口(15-pin)</td>
  </tr>
</table>

MIPI DSI 接口（4 lane, 39-pin）连接屏幕使用，可以参考 [瑞莎 8 寸显示屏使用教程](../accessories/8hd-display_use)  
MIPI DSI 接口（2 lane, 15-pin）连接屏幕使用，可以参考 [树莓派 7 寸显示屏使用教程](../accessories/rpi-7inch-display)

## WIFI & BT 支持模块列表

| NO. | 模块名称                 | 芯片        | WiFi          | 蓝牙 | WIFI 传输速率                        | 备注 |
| --- | ------------------------ | ----------- | ------------- | ---- | ------------------------------------ | ---- |
| 1   | 瑞莎 A8 模块             | RTL8852BE   | 2.4G&5G&WIFI6 | 5.0  | up:600 Mbits/sec down: 900 Mbits/sec |      |
| 2   | Intel 0MHK36 (PCIE+USB)  | Intel 3165  | 2.4G&5G       | 4.2  | up:283 Mbits/sec down: 334 Mbits/sec |      |
| 3   | Intel 7265NGW (PCIE+USB) | Intel 7265  | 2.4G&5G       | 4.2  | up:363 Mbits/sec down: 619 Mbits/sec |      |
| 4   | Intel AX210 (PCIE+USB)   | Intel AX210 | WiFi 6        | 5.2  | up:859 Mbits/sec down: 813 Mbits/sec |      |

- 瑞莎 CM5 搭配瑞莎 CM5 载板，没有板载WiFi/BT模块，需要外接模块。以上是支持并测试过的 WITI/BT 卡。
  无线模块使用请参见[WIFI/BT教程](../accessories/wifi_bt_access)

更多配件信息可参考 [配件列表](../accessories)
