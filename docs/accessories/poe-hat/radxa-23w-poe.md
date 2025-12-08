---
sidebar_position: 33
---

# 瑞莎 23W PoE 扩展板

![Radxa 23W PoE HAT](/img/accessories/poe-hat/23w-poe.webp)

Radxa 23W PoE 扩展板是一款专为树莓派、Radxa ROCK 3/4 系列和 Jetson Nano 设计的扩展板，支持通过以太网供电（PoE）技术，使用单根网线同时实现数据通信和电力传输。使用前请确保您的网络环境配备兼容的 PoE 交换机。

## 硬件介绍

### 产品支持

|  型号  | 支持的产品                                                                        |
| :----: | --------------------------------------------------------------------------------- |
| F3/F3L | Raspberry Pi 3B+，Raspberry Pi 4，ROCK X，ROCK 3A，ROCK 3C，ROCK 4C+，Jetson Nano |
| F4/F4L | ROCK 4A，ROCK 4B，ROCK 4A+，ROCK 4B+，ROCK 4SE                                    |

F3 和 F4 的区别在于：

- F3 和 F4 使用不同的 GPIO 引脚控制风扇。
- F3 使用 DS18B20 进行温度检测，F4 使用 SoC ADC 进行温度检测 。
- F3 和 F4 的 PoE 接口物理位置不同：
  ![Difference between F3 and F4](/img/accessories/poe-hat/23w-poe-f3f4.webp)

L版本额外提供了 40 针引脚，可以在使用 HAT 的同时连接其他外设：  
![Fx and FxL](/img/accessories/poe-hat/23w-poe-l.webp)

### 特性

- 支持 802.3at 协议，最高电源输出可达 23W（5V/4.6A）
- PWM 风扇
- 温度传感器 DS18B20
- 可选支持 40 PIN GPIO 接口的型号
- 与 Radxa ROCK、Raspberry Pi 3B+ 和 Raspberry Pi 4 兼容
- 设计简洁，将风扇和大变压器隐藏在内部
- 用于识别 HAT 的 EEPROM

## 硬件信息

<Tabs queryString="model">
<TabItem value="f3" label="F3/F3L Pinout">

用于 Raspberry Pi 3B+/4/Jetson Nano ROCK 3A 3C 和 4C+ 的 PoE HAT。

<div className='gpio_style'>

| Description                          | Function | Pin# | Pin# | Function | Description                                |
| ------------------------------------ | -------- | ---- | ---- | -------- | ------------------------------------------ |
|                                      |          | 1    | 2    |          |                                            |
|                                      |          | 3    | 4    |          |                                            |
|                                      |          | 5    | 6    |          |                                            |
| get data from DS18B20                | BCM4     | 7    | 8    |          |                                            |
|                                      |          | 9    | 10   |          |                                            |
|                                      |          | 11   | 12   |          |                                            |
|                                      |          | 13   | 14   |          |                                            |
| enable/disable fan motor driver chip | BCM22    | 15   | 16   |          |                                            |
|                                      |          | 17   | 18   |          |                                            |
|                                      |          | 19   | 20   |          |                                            |
|                                      |          | 21   | 22   |          |                                            |
|                                      |          | 23   | 24   |          |                                            |
|                                      |          | 25   | 26   | ADC_IN0  | Get ADC value to get the temperature value |
| connect to EEPROM SDA pin            | I2C0_SDA | 27   | 28   | I2C0_SCL | connect to EEPROM SCL pin                  |
|                                      |          | 29   | 30   |          |                                            |
|                                      |          | 31   | 32   |          |                                            |
| control fan speed                    | PWM1     | 33   | 34   |          |                                            |
|                                      |          | 35   | 36   |          |                                            |
|                                      |          | 37   | 38   |          |                                            |
|                                      |          | 39   | 40   |          |                                            |

</div>

</TabItem>

<TabItem value="f4" label="F4/F4L Pinout">

用于 ROCK 4 系列的 PoE HAT。

<div className='gpio_style'>

| Description               | Function | Pin# | Pin# | Function | Description                                |
| ------------------------- | -------- | ---- | ---- | -------- | ------------------------------------------ |
|                           |          | 1    | 2    |          |                                            |
|                           |          | 3    | 4    |          |                                            |
|                           |          | 5    | 6    |          |                                            |
|                           | GPIO2_B3 | 7    | 8    |          |                                            |
|                           |          | 9    | 10   |          |                                            |
|                           |          | 11   | 12   |          |                                            |
| control fan speed         | PWM1     | 13   | 14   |          |                                            |
|                           | GPIO4_C5 | 15   | 16   | GPIO4_D2 | enable/disable fan motor driver            |
|                           |          | 17   | 18   |          |                                            |
|                           |          | 19   | 20   |          |                                            |
|                           |          | 21   | 22   |          |                                            |
|                           |          | 23   | 24   |          |                                            |
|                           |          | 25   | 26   | ADC_IN0  | Get ADC value to get the temperature value |
| connect to EEPROM SDA pin | I2C2_SDA | 27   | 28   | I2C2_SCL | connect to EEPROM SCL pin                  |
|                           |          | 29   | 30   |          |                                            |
|                           |          | 31   | 32   |          |                                            |
|                           |          | 33   | 34   |          |                                            |
|                           |          | 35   | 36   |          |                                            |
|                           |          | 37   | 38   |          |                                            |
|                           |          | 39   | 40   |          |                                            |

</div>

</TabItem>
</Tabs>

### 2D 文件

您可以在 [Radxa 23W PoE HAT 2D 文件](https://dl.radxa.com/accessories/poe-hat/rockpi_poe_hat_V1.2_20190521.dwg) 上下载 2D 文件（.dwg 格式）。
