---
sidebar_position: 0
---

# Hardware Information

## Chip Block Diagram

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/hardware-rk3576.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## System Block Diagram

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/hardware-rk3576-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Interface Information

For interfaces that support external devices, click on the interface description to view the usage tutorial.

<Tabs queryString="versions">
    <TabItem value="ROCK 4D">
        <img src="/en/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />

|  #  | Description                      | Qty |  #  | Description                                                                                     | Qty |  #  | Description                                   | Qty |
| :-: | :------------------------------- | :-: | :-: | :---------------------------------------------------------------------------------------------- | :-: | :-: | :-------------------------------------------- | :-: |
|  ①  | [USB Type-C Port](./usb-type-c)  |  1  |  ⑩  | [PoE Port](./gigabit-ethernet)                                                                  |  1  |  ⑲  | [MIPI CSI Interface](./mipi-csi)              |  1  |
|  ②  | User LED                         |  1  |  ⑪  | [Maskrom Button](./maskrom)                                                                     |  1  |  ⑳  | [HDMI 2.1 Port](./hdmi)                       |  1  |
|  ③  | Power LED                        |  1  |  ⑫  | [USB 2.0 Type-A Ports](./usb-type-a)                                                            |  2  | ㉑  | [Recovery Pins](./recovery)                   |  1  |
|  ④  | Power Button                     |  1  |  ⑬  | Rockchip RK3576(J)                                                                              |  1  | ㉒  | [UFS Module Interface](./emmc-ufs-connector)  |  1  |
|  ⑤  | [FPC Connector](./fpc-connector) |  1  |  ⑭  | [USB 3.0 Type-A Ports](./usb-type-a)<br />Up：USB 3.0 Type-A OTG<br />Down：USB 3.0 Type-A HOST |  2  | ㉓  | [RTC Interface](./rtc)                        |  1  |
|  ⑥  | [WiFi 6 & Bluetooth 5.4](./ante) |  1  |  ⑮  | SPI NOR Flash                                                                                   |  1  | ㉔  | [eMMC Module Interface](./emmc-ufs-connector) |  1  |
|  ⑦  | [Antenna Connector](./ante)      |  1  |  ⑯  | [Gigabit Ethernet (PoE)](./gigabit-ethernet)                                                    |  1  | ㉕  | [MIPI CSI Interface](./mipi-csi)              |  1  |
|  ⑧  | [40-Pin GPIO Header](./pin-gpio) |  1  |  ⑰  | [Fan Connector](./fan)                                                                          |  1  | ㉖  | [MicroSD Card Slot](./microsd)                |  1  |
|  ⑨  | LPDDR5 RAM                       |  1  |  ⑱  | [Headphone Jack](./headphone)                                                                   |  1  | ㉗  | [MIPI DSI Interface](./mipi-dsi)              |  1  |

    </TabItem>
    <TabItem value="ROCK 4D v1.12">
        <img src="/en/img/rock4/4d/rock4d-v1.12-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />

|  #  |           Description            | Qty |  #  |                                           Description                                           | Qty |  #  |                  Description                  | Qty |
| :-: | :------------------------------: | :-: | :-: | :---------------------------------------------------------------------------------------------: | :-: | :-: | :-------------------------------------------: | :-: |
|  ①  | [USB Type-C Port ](./usb-type-c) |  1  |  ⑪  |                                   [Maskrom Button](./maskrom)                                   |  1  | ㉑  |              [HDMI 2.1](./hdmi)               |  1  |
|  ②  |             User LED             |  1  |  ⑫  |                              [USB 2.0 Type-A Ports](./usb-type-a)                               |  2  | ㉒  |    [Power Input Interface](./power_header)    |  1  |
|  ③  |            Power LED             |  1  |  ⑬  |                                      Rockchip RK3576（J）                                       |  1  | ㉓  |      [Maskrom Reserved Pads](./maskrom)       |  1  |
|  ④  |           Power Button           |  1  |  ⑭  | [USB 3.0 Type-A Ports](./usb-type-a)<br />Up：USB 3.0 Type-A OTG<br />Down：USB 3.0 Type-A HOST |  2  | ㉔  | [UFS Module Interface](./emmc-ufs-connector)  |  1  |
|  ⑤  | [FPC Connector](./fpc-connector) |  1  |  ⑮  |                                          SPI NOR Flash                                          |  1  | ㉕  |            [RTC Interface](./rtc)             |  1  |
|  ⑥  | [WiFi6 & Bluetooth 5.4](./ante)  |  1  |  ⑯  |                          [Gigabit Ethernet (PoE)](./gigabit-ethernet)                           |  1  | ㉖  | [eMMC Module Interface](./emmc-ufs-connector) |  1  |
|  ⑦  |   [Antenna Connector](./ante)    |  1  |  ⑰  |                                     [Fan Connector](./fan)                                      |  1  | ㉗  |       [MIPI CSI Interface](./mipi-csi)        |  1  |
|  ⑧  | [40 Pin GPIO Header](./pin-gpio) |  1  |  ⑱  |                                  [Headphone Jack](./headphone)                                  |  1  | ㉘  |        [MicroSD Card Slot](./microsd)         |  1  |
|  ⑨  |            LPDDR5 RAM            |  1  |  ⑲  |                                [MIPI CSI Interface](./mipi-csi)                                 |  1  | ㉙  |       [MIPI DSI Interface](./mipi-dsi)        |  1  |
|  ⑩  |  [PoE Port](./gigabit-ethernet)  |  1  |  ⑳  |                                      Speaker Reserved Pads                                      |  1  |     |                                               |     |

    </TabItem>

</Tabs>

- **User LED**

The user LED will blink when the system is booting up normally.

- **Power LED**

The power LED will light up when the system is powered on and functioning correctly.

- **Power Button**

Short press to power on or access power menu options; long press to power off.

- **LPDDR5 RAM**

Available in 2GB / 4GB / 8GB / 16GB capacity options.

- **Rockchip RK3576(J)**

The Radxa ROCK 4D is available in two SoC versions: Commercial-grade ROCK 4D based on RK3576 and Industrial-grade ROCK 4D based on RK3576J.
