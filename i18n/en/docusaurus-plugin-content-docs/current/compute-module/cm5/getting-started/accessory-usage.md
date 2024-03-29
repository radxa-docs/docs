---
sidebar_position: 4
---

# Accessory Usage Instructions

This section describes the common accessories supported by the Radxa-CM5-IO and how to use them.

## Interface Overview

<img src="/img/cm5/cm5-block-diagram.webp" width="700" alt="Radxa-CM5-IO interfaces overview" />

## Camera

The Radxa-CM5-IO comes with one 4-lane CSI interface and one 2-lane CSI interface. Below is the list of currently supported cameras:

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
    <td>Radxa Camera 8M</td>
    <td>IMX219</td>
    <td>8 megapixels</td>
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

For 4lane camera usage, please see [Camera usage tutorial](../accessories/camera_4k)  
For the 2lane camera, see [Camera Tutorial](../accessories/camera_8m)

## Display

The Radxa-CM5-IO comes with a 4-lane DSI interface and has a 2-lane DSI interface. The following is a list of currently supported screens:

<table>
  <tr>
    <th>Screen Name</th>
    <th>Resolution</th>
  </tr>
  <tr>
    <td>ALLNET 5 inch DSI Display</td>
    <td>800 ×3(RGB) ×480 pixel</td>
  </tr>
  <tr>
    <td>Radxa Display 8 HD</td>
    <td>1280x800 pixel</td>
  </tr>
  <tr>
    <td>Radxa Display 10FHD</td>
    <td>1200x1920 pixel </td>
  </tr>
  <tr>
    <td>Raspberry Pi 7 inch Touchscreen</td>
    <td>800 x 480 pixels</td>
  </tr>
</table>

For 4lane Radxa 8" screen use see [Screen Usage](../accessories/8hd-display_use)  
For 2lane Raspberry Pi 7 inch screen use please refer to [Screen Usage](../accessories/rpi-7inch-display)

## WIFI & BT Support Module List

| NO. | Model                    | Chip        | WiFi          | BT  | WIFI Throughput                      | Remark |
| --- | ------------------------ | ----------- | ------------- | --- | ------------------------------------ | ------ |
| 1   | Radxa wireless A8        | RTL8852BE   | 2.4G&5G&WIFI6 | 5.0 | up:600 Mbits/sec down: 900 Mbits/sec |        |
| 2   | Intel 0MHK36 (PCIE+USB)  | Intel 3165  | 2.4G&5G       | 4.2 | up:283 Mbits/sec down: 334 Mbits/sec |        |
| 3   | Intel 7265NGW (PCIE+USB) | Intel 7265  | 2.4G&5G       | 4.2 | up:363 Mbits/sec down: 619 Mbits/sec |        |
| 4   | Intel AX210 (PCIE+USB)   | Intel AX210 | WiFi 6        | 5.2 | up:859 Mbits/sec down: 813 Mbits/sec |        |

- Radxa CM5 with Radxa CM5 IO board does not have an on-board WiFi/BT module and requires an external module. The above are supported and tested WITI/BT cards.
  For wireless module usage, please refer to [WIFI/BT Usage](../accessories/wifi_bt_access.md)

For more information on accessories see [Accessories List](../accessories)
