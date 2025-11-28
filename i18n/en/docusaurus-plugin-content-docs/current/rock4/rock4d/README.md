---
sidebar_position: 11
sidebar_label: ROCK 4D
---

# ROCK 4D - Industrial-Grade AI Single Board Computer

## Product Overview

The Radxa ROCK 4D is a compact single-board computer (SBC) featuring numerous top-tier functions, features, and expansion options.

Equipped with the Rockchip RK3576 or RK3576J SoC, the ROCK 4D boasts an octa-core CPU (4x Cortex-A72 + 4x Cortex-A53), Mali-G52 GPU, and a powerful 6 TOPS NPU, making it ideal for AI and multimedia tasks.

The ROCK 4D is perfect for makers, IoT enthusiasts, hobbyists, gamers, PC users, OEMs, industrial applications, and anyone in need of a high-performance, reliable platform.

Two versions are available: the commercial-grade ROCK 4D based on RK3576, and the industrial-grade ROCK 4D based on RK3576J.

## Product Appearance

<Tabs queryString="versions">
    <TabItem value="ROCK 4D">
        ROCK 4D Font View
        <img src="/img/rock4/4d/rock4d-top.webp" alt="ROCK 4D top" width="800" />
        ROCK 4D Rear View
        <img src="/img/rock4/4d/rock4d-bottom.webp" alt="ROCK 4D bottom" width="800" />
    </TabItem>
    <TabItem value="ROCK 4D v1.12">
        ROCK 4D v1.12 Font View
        <img src="/img/rock4/4d/rock4d-v1.12-top.webp" alt="ROC 4D v1.12 top" width="800" />
        ROCK 4D v1.12 Rear View
        <img src="/img/rock4/4d/rock4d-v1.12-bottom.webp" alt="ROC 4D v1.12 bottom" width="800" />
    </TabItem>
</Tabs>

## Specifications

| Category     | Specification                                                                                                                                                                                                       |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Processor    | System on Chip (SoC): Rockchip RK3576 / RK3576J <br/> CPU: 4x Cortex-A72 + 4x Cortex-A53 <br/> GPU: Arm Mali-G52 MC3 <br/> Neural Processing Unit (NPU): 6 TOPS (supports INT4 / INT8 / INT16 / FP16 / BF16 / TF32) |
| Memory (RAM) | LPDDR5, options: 2GB / 4GB / 8GB / 16GB                                                                                                                                                                             |
| Storage      | Boot: 16MB SPI NOR Flash <br/> Expandable: eMMC / UFS module interface, MicroSD card slot                                                                                                                           |
| Networking   | Wired: 1x Gigabit Ethernet (PoE supported with external HAT) <br/> Wireless: Wi-Fi 6, Bluetooth 5.4, external antenna interface                                                                                     |
| Video Output | HDMI: 1× HDMI 2.1, up to 4K@120fps <br/> MIPI DSI: 1× 4-lane MIPI DSI                                                                                                                                               |
| Camera Input | MIPI CSI: 1× 4-lane (configurable as 2× 2-lane) + 1× 2-lane CSI                                                                                                                                                     |
| Audio        | Audio Jack: 3.5mm 4-pole headphone jack with mic input <br/> Audio Output: Supports stereo output, can drive 32Ω headphones directly                                                                                |
| USB Ports    | USB 3.0: 1× Type-A HOST, 1× Type-A OTG/HOST <br/> USB 2.0: 2× Type-A HOST                                                                                                                                           |
| Expansion    | GPIO Header: Supports UART, SPI, I2C, I2S, PWM, CAN, ADC, etc. <br/> PCIe Slot: PCIe 2.1 x1 via FPC interface <br/> Fan Connector: 1× 2-pin 1.25mm PWM controlled fan header                                        |
| Power Input  | Power Supply: USB Type-C or via GPIO header                                                                                                                                                                         |
| OS Support   | Operating Systems: Debian Linux, Android 14, Yocto, Buildroot                                                                                                                                                       |
| Temperature  | Commercial: 0°C ~ 60°C (RK3576) <br/> Industrial: -40°C ~ 85°C (RK3576J)                                                                                                                                            |

## Interface Description

Click on the interface names for tutorials on connecting external devices.

<Tabs queryString="versions">
    <TabItem value="ROCK 4D">
        <img src="/en/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />

|  #  | Description                                         | Qty |  #  | Description                                                                                                     | Qty |  #  | Description                                                   | Qty |
| :-: | :-------------------------------------------------- | :-: | :-: | :-------------------------------------------------------------------------------------------------------------- | :-: | :-: | :------------------------------------------------------------ | :-: |
|  ①  | [USB Type-C Port](./hardware-use/usb-type-c.md)     |  1  |  ⑩  | [PoE Port](./hardware-use/gigabit-ethernet.md)                                                                  |  1  |  ⑲  | [MIPI CSI Interface](./hardware-use/mipi-csi.md)              |  1  |
|  ②  | User LED                                            |  1  |  ⑪  | [Maskrom Button](./hardware-use/maskrom.md)                                                                     |  1  |  ⑳  | [HDMI 2.1 Port](./hardware-use/hdmi.md)                       |  1  |
|  ③  | Power LED                                           |  1  |  ⑫  | [USB 2.0 Type-A Ports](./hardware-use/usb-type-a.md)                                                            |  2  | ㉑  | [Recovery Pins](./hardware-use/recovery.md)                   |  1  |
|  ④  | Power Button                                        |  1  |  ⑬  | Rockchip RK3576(J)                                                                                              |  1  | ㉒  | [UFS Module Interface](./hardware-use/emmc-ufs-connector.md)  |  1  |
|  ⑤  | [FPC Connector](./hardware-use/fpc-connector.md)    |  1  |  ⑭  | [USB 3.0 Type-A Ports](./hardware-use/usb-type-a.md)<br />Up：USB 3.0 Type-A OTG<br />Down：USB 3.0 Type-A HOST |  2  | ㉓  | [RTC Interface](./hardware-use/rtc.md)                        |  1  |
|  ⑥  | [WiFi 6 & Bluetooth 5.4](./hardware-use/ante.md)    |  1  |  ⑮  | SPI NOR Flash                                                                                                   |  1  | ㉔  | [eMMC Module Interface](./hardware-use/emmc-ufs-connector.md) |  1  |
|  ⑦  | [Antenna Connector](./hardware-use/ante.md)         |  1  |  ⑯  | [Gigabit Ethernet (PoE)](./hardware-use/gigabit-ethernet.md)                                                    |  1  | ㉕  | [MIPI CSI Interface](./hardware-use/mipi-csi.md)              |  1  |
|  ⑧  | [40-Pin GPIO Header](./hardware-use/40-pin-gpio.md) |  1  |  ⑰  | [Fan Connector](./hardware-use/fan.md)                                                                          |  1  | ㉖  | [MicroSD Card Slot](./hardware-use/microsd.md)                |  1  |
|  ⑨  | LPDDR5 RAM                                          |  1  |  ⑱  | [Headphone Jack](./hardware-use/headphone.md)                                                                   |  1  | ㉗  | [MIPI DSI Interface](./hardware-use/mipi-dsi.md)              |  1  |

    </TabItem>
    <TabItem value="ROCK 4D v1.12">
        <img src="/en/img/rock4/4d/rock4d-v1.12-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />

|  #  |                     Description                     | Qty |  #  |                                                   Description                                                   | Qty |  #  |                          Description                          | Qty |
| :-: | :-------------------------------------------------: | :-: | :-: | :-------------------------------------------------------------------------------------------------------------: | :-: | :-: | :-----------------------------------------------------------: | :-: |
|  ①  |  [USB Type-C Port ](./hardware-use/usb-type-c.md)   |  1  |  ⑪  |                                   [Maskrom Button](./hardware-use/maskrom.md)                                   |  1  | ㉑  |              [HDMI 2.1](./hardware-use/hdmi.md)               |  1  |
|  ②  |                      User LED                       |  1  |  ⑫  |                              [USB 2.0 Type-A Ports](./hardware-use/usb-type-a.md)                               |  2  | ㉒  |    [Power Input Interface](./hardware-use/power_header.md)    |  1  |
|  ③  |                      Power LED                      |  1  |  ⑬  |                                              Rockchip RK3576（J）                                               |  1  | ㉓  |      [Maskrom Reserved Pads](./hardware-use/maskrom.md)       |  1  |
|  ④  |                    Power Button                     |  1  |  ⑭  | [USB 3.0 Type-A Ports](./hardware-use/usb-type-a.md)<br />Up：USB 3.0 Type-A OTG<br />Down：USB 3.0 Type-A HOST |  2  | ㉔  | [UFS Module Interface](./hardware-use/emmc-ufs-connector.md)  |  1  |
|  ⑤  |  [FPC Connector](./hardware-use/hfpc-connector.md)  |  1  |  ⑮  |                                                  SPI NOR Flash                                                  |  1  | ㉕  |            [RTC Interface](./hardware-use/rtc.md)             |  1  |
|  ⑥  |   [WiFi6 & Bluetooth 5.4](./hardware-use/ante.md)   |  1  |  ⑯  |                          [Gigabit Ethernet (PoE)](./hardware-use/gigabit-ethernet.md)                           |  1  | ㉖  | [eMMC Module Interface](./hardware-use/emmc-ufs-connector.md) |  1  |
|  ⑦  |     [Antenna Connector](./hardware-use/ante.md)     |  1  |  ⑰  |                                     [Fan Connector](./hardware-use/fan.md)                                      |  1  | ㉗  |       [MIPI CSI Interface](./hardware-use/mipi-csi.md)        |  1  |
|  ⑧  | [40 Pin GPIO Header](./hardware-use/40-pin-gpio.md) |  1  |  ⑱  |                                  [Headphone Jack](./hardware-use/headphone.md)                                  |  1  | ㉘  |        [MicroSD Card Slot](./hardware-use/microsd.md)         |  1  |
|  ⑨  |                     LPDDR5 RAM                      |  1  |  ⑲  |                                [MIPI CSI Interface](./hardware-use/mipi-csi.md)                                 |  1  | ㉙  |       [MIPI DSI Interface](./hardware-use/mipi-dsi.md)        |  1  |
|  ⑩  |   [PoE Port](./hardware-use/gigabit-ethernet.md)    |  1  |  ⑳  |                                              Speaker Reserved Pads                                              |  1  |     |                                                               |     |

    </TabItem>

</Tabs>

- User LED

Blinks when the system is booting normally.

- Power LED

Lights up when the system is powered on.

- Power Button

Short press to power on or access power menu; long press to power off.

- LPDDR5 Memory

Available in 2GB / 4GB / 8GB / 16GB capacities.

- Rockchip RK3576(J)

Two SoC versions available: commercial-grade ROCK 4D with RK3576 and industrial-grade ROCK 4D with RK3576J.

## Application Scenarios

### Linux Beginners

As a Linux-based single-board computer, the ROCK 4D is perfect for learning Linux, as well as low-level and application development.

### Robotics Development

Serves as a main controller for robotics development, offering excellent performance and rich hardware interfaces for developing robotic applications.

### Embedded Development

Features extensive GPIO interfaces supporting UART, SPI, I2C, I2S, and other communication protocols, making it easy to drive various hardware components.

### AI Development

Equipped with a powerful 6 TOPS NPU for AI inference and training.

## System Platform

The ROCK 4D, based on the RK3576 or RK3576J chipset, supports the ArmV8 instruction set and multiple operating systems.

- Debian Linux
- Yocto Linux
- Buildroot
- Android 14
