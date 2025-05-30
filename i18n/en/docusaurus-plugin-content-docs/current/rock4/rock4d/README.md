---
sidebar_position: 11
sidebar_label: ROCK 4D
---

# ROCK 4D - Industrial Grade AI Single Board Computer

## Product Overview

Radxa ROCK 4D is a compact single board computer (SBC) with numerous top-tier features, characteristics, and expansion options.

ROCK 4D is equipped with Rockchip RK3576 or RK3576J SoC, featuring an octa-core CPU (4 Cortex-A72 + 4 Cortex-A53 cores), Mali-G52 GPU, and powerful 6 TOPS NPU, making it ideal for AI and multimedia tasks.

ROCK 4D is perfect for makers, IoT enthusiasts, hobbyists, gamers, PC users, OEM manufacturers, industrial applications, and all users who need high-performance and high-reliability platforms.

Radxa ROCK 4D comes in two versions: Commercial-grade ROCK 4D based on RK3576 and Industrial-grade ROCK 4D based on RK3576J.

## Product Appearance

<div style={{textAlign: 'center'}}>
   Radxa ROCK 4D Front
   <img src="/img/rock4/4d/rock4d-top.webp" style={{width: '100%', maxWidth: '800px'}} />
   Radxa ROCK 4D Back
    <img src="/img/rock4/4d/rock4d-bottom.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

## Product Specifications

| Category              | Specifications                                                                                                                                                                                                                                                                   |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Processor             | System-on-Chip (SoC): Rockchip RK3576 / RK3576J <br/> Central Processing Unit (CPU): 4-core Cortex-A72 + 4-core Cortex-A53 <br/> Graphics Processing Unit (GPU): Arm Mali-G52 MC3 <br/> Neural Processing Unit (NPU): 6 TOPS (Supports INT4 / INT8 / INT16 / FP16 / BF16 / TF32) |
| Memory (RAM)          | LPDDR5, Options: 2GB / 4GB / 8GB / 16GB                                                                                                                                                                                                                                          |
| Storage               | Boot Storage: 16MB SPI NOR Flash <br/> Expansion Storage: eMMC / UFS Module Interface, MicroSD Card Slot                                                                                                                                                                         |
| Network               | Wired Connection: 1 Gigabit Ethernet Port (Supports PoE, requires external HAT) <br/> Wireless Connection: Wi-Fi 6, Bluetooth 5.4, External Antenna Interface                                                                                                                    |
| Video Output          | HDMI Interface: 1× HDMI 2.1, Supports up to 4K@120fps <br/> MIPI DSI Interface: 1× 4-lane MIPI DSI                                                                                                                                                                               |
| Camera Interface      | MIPI CSI Interface: 1× 4-lane (can be split into 2× 2-lane) + 1× 2-lane CSI                                                                                                                                                                                                      |
| Audio                 | Audio Interface: 3.5mm 4-pole Headphone Jack, Supports Microphone Input <br/> Audio Output: Supports Stereo Output, Can Directly Drive 32Ω Headphones                                                                                                                            |
| USB Ports             | USB 3.0: 1× Type-A HOST, 1× Type-A OTG/HOST <br/> USB 2.0: 2× Type-A HOST                                                                                                                                                                                                        |
| Expansion Interfaces  | GPIO Pin Headers: Supports UART, SPI, I2C, I2S, PWM, CAN, ADC, etc. <br/> PCIe Slot: Provides PCIe 2.1 x1 Channel via FPC Interface <br/> Fan Connector: 1× 2-pin 1.25mm PWM Fan Control Interface                                                                               |
| Power Interface       | Supports USB Type-C and GPIO Pin Power Supply                                                                                                                                                                                                                                    |
| Operating System      | Supports Debian Linux, Android 14, Yocto, Buildroot                                                                                                                                                                                                                              |
| Operating Temperature | Operating Temperature (Commercial Grade): 0°C ~ 60°C (RK3576) <br/> Operating Temperature (Industrial Grade): -40°C ~ 85°C (RK3576J)                                                                                                                                             |

## Interface Description

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

| Number | Description                          | Quantity |
| :----: | :----------------------------------- | :------: |
|   ①    | USB Type-C Power Port                |    1     |
|   ②    | User LED                             |    1     |
|   ③    | Power LED                            |    1     |
|   ④    | Power Button                         |    1     |
|   ⑤    | FPC Interface                        |    1     |
|   ⑥    | WiFi6 and Bluetooth 5.4              |    1     |
|   ⑦    | External Antenna Port                |    1     |
|   ⑧    | 40 Pin GPIO                          |    1     |
|   ⑨    | LPDDR5 Memory                        |    1     |
|   ⑩    | PoE Interface                        |    1     |
|   ⑪    | Maskrom Button                       |    1     |
|   ⑫    | USB 2.0 Type-A                       |    2     |
|   ⑬    | Rockchip RK3576（J）                 |    1     |
|   ⑭    | USB 3.0 Type-A                       |    2     |
|   ⑮    | SPI NOR Flash                        |    1     |
|   ⑯    | Gigabit Ethernet Port (Supports PoE) |    1     |
|   ⑰    | Fan Connector                        |    1     |
|   ⑱    | Headphone Jack                       |    1     |
|   ⑲    | MIPI CSI Interface                   |    1     |
|   ⑳    | HDMI 2.1 Interface                   |    1     |
|   ㉑   | Recovery Interface                   |    1     |
|   ㉒   | UFS Module Interface                 |    1     |
|   ㉓   | RTC Interface                        |    1     |
|   ㉔   | eMMC Module Interface                |    1     |
|   ㉕   | MIPI CSI Interface                   |    1     |
|   ㉖   | MicroSD Card Slot                    |    1     |
|   ㉗   | MIPI DSI Interface                   |    1     |

## Application Scenarios

### Linux Beginners

As a Linux-based single board computer, ROCK 4D can be used for Linux beginners to learn Linux, develop low-level and application-layer development.

### Robot Development

As the main controller for robot development, it offers excellent performance and rich hardware interfaces, making it convenient for users to develop robot applications.

### Embedded Development

It provides rich GPIO interfaces, supporting UART, SPI, I2C, I2S communication methods, making it convenient for users to drive various hardware.

### AI Development

Equipped with a powerful 6 TOPS neural network accelerator, suitable for AI inference and training.

## System Platform

ROCK 4D is based on RK3576 or RK3576J chipset, supporting ArmV8 instruction set and multiple operating systems.

- Debian Linux
- Yocto Linux
- Buildroot
- Android 14
