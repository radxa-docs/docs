---
sidebar_position: 5
---

import PICO_SDK_WINDOWS from "../../../common/dev/\_pico-sdk-windows.mdx";
import GPIO from "../../../common/dev/\_pico-gpio.mdx";
import PWM from "../../../common/dev/\_pico-pwm.mdx";
import I2C from "../../../common/dev/\_pico-i2c.mdx";
import UART from "../../../common/dev/\_pico-uart.mdx";
import RELATION from "./\_relation.mdx"

# 在 Windows 下控制 RP2040

## Intel J4125 与 RP2040 和 40-PIN GPIO 的关系介绍

<RELATION />

## 40-PIN 使用

为了操作 RP2040 上的 IO 资源， 我们需要一套完善的软件环境，如 MicroPython 或者 C/C++ SDK，在这里我们主要介绍一套 C/C++ SDK，即 pico-sdk 和 pico-example。 pico-sdk 主要是提供了一些操作 RP2040 的 API， 而 pico-examples 则为我们提供了一套程序编译框架，我们可以根据 pico-examples 提供的编译框架来添加我们自己的程序。

<PICO_SDK_WINDOWS />

### 烧录

按下 BOOTSEL 键后， 会弹出一个 USB 设备。将编译后产生的 .uf2 文件拷贝到 RP2040 的 USB 设备中， 待该 USB 设备消失后， 程序开始执行。

### 示例

<Tabs queryString="type">
     <TabItem value="GPIO">
       <GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X2L"  led_pin="PIN_5" platform="Windows"/>
    </TabItem>
     <TabItem value="I2C">
      <I2C flash_url="./flash" product_name="Radxa X2L"  scl_pin="PIN_5" sda_pin="PIN_3" platform="Windows" />
    </TabItem>
     <TabItem value="PWM">
      <PWM flash_url="./flash" product_name="Radxa X2L" led_pin="PIN_5" platform="Windows"/>
    </TabItem>
     <TabItem value="UART">
      <UART flash_url="./flash" tty_num="ttyS0" platform="Windows" />
    </TabItem>
</Tabs>
