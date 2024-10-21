---
sidebar_position: 30
---

import SDK_EXAMPLE from "../../../common/dev/\_pico-sdk-example.mdx";
import GPIO from "../../../common/dev/\_pico-gpio.mdx";
import PWM from "../../../common/dev/\_pico-pwm.mdx";
import I2C from "../../../common/dev/\_pico-i2c.mdx";
import FAN from "../../../common/dev/\_pico-fan.mdx";
import RELATION from "./\_relation.mdx"
import UART from "../../../common/dev/\_pico-uart.mdx";

# 40-PIN 使用指南

## Intel J4125 与 RP2040 和 40-PIN GPIO 的关系介绍

<RELATION />

## 40-PIN 使用

为了操作 RP2040 上的 IO 资源， 我们需要一套完善的软件环境，如 MicroPython 或者 C/C++ SDK，在这里我们主要介绍一套 C/C++ SDK，即 pico-sdk 和 pico-example。 pico-sdk 主要是提供了一些操作 RP2040 的 API， 而 pico-examples 则为我们提供了一套程序编译框架，我们可以根据 pico-examples 提供的编译框架来添加我们自己的程序。

<SDK_EXAMPLE flash_url="./flash" product_name="Radxa X2L" />

### 示例

#### RP2040 单独控制 40-PIN GPIO

<GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X2L"  led_pin="PIN_5" />

<I2C flash_url="./flash" product_name="Radxa X2L"  scl_pin="PIN_5" sda_pin="PIN_3" />

<PWM flash_url="./flash" product_name="Radxa X2L" led_pin="PIN_5" />

<UART flash_url="./flash" tty_num="ttyS0"/>

#### CPU 通过 UART 来控制 RP2040 的 40-PIN GPIO

<FAN flash_url="./flash" product_name="Radxa X2L" />
