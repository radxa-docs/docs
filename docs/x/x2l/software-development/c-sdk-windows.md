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

<PICO_SDK_WINDOWS />

## 烧录

按下 BOOTSEL 键后， 会弹出一个 USB 设备。将编译后产生的 .uf2 文件拷贝到 RP2040 的 USB 设备中， 待该 USB 设备消失后， 程序开始执行。

## 示例

<GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X2L"  led_pin="PIN_5" platform="Windows"/>

<I2C flash_url="./flash" product_name="Radxa X2L"  scl_pin="PIN_5" sda_pin="PIN_3" platform="Windows" />

<PWM flash_url="./flash" product_name="Radxa X2L" led_pin="PIN_5" platform="Windows"/>

<UART flash_url="./flash" tty_num="ttyS0" platform="Windows" />
