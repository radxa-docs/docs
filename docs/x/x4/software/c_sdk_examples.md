---
sidebar_position: 2
---

import SDK_EXAMPLE from "../../../common/dev/\_pico-sdk-example.mdx";
import GPIO from "../../../common/dev/\_pico-gpio.mdx";
import PWM from "../../../common/dev/\_pico-pwm.mdx";
import I2C from "../../../common/dev/\_pico-i2c.mdx";
import PoE from "../../../common/dev/\_pico-poe-fan.mdx";
import FAN from "../../../common/dev/\_pico-fan.mdx";
import RELATION from "./\_relation.mdx"

# 40-PIN 使用指南

## 40-PIN 与 Intel N100 及 RP2040 的关系介绍

<RELATION />

## 40-PIN 使用

### 工具介绍

为了操作 RP2040 上的 IO 资源， 我们需要一套完善的软件环境，如 MicroPython 或者 C/C++ SDK，在这里我们主要介绍一套 C/C++ SDK，即 pico-sdk 和 pico-example。 pico-sdk 主要是提供了一些操作 RP2040 的 API， 而 pico-examples 则为我们提供了一套程序编译框架，我们可以根据 pico-examples 提供的编译框架来添加我们自己的程序。

<SDK_EXAMPLE flash_url="./flash" product_name="Radxa X4" />

### 示例

#### RP2040 控制 40-PIN

<GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X4"  led_pin="PIN_5" />

<I2C flash_url="./flash" product_name="Radxa X4"  scl_pin="PIN_5" sda_pin="PIN_3" />

<PWM flash_url="./flash" product_name="Radxa X4" led_pin="PIN_5" />

<div id="1"> </div>

<PoE flash_url="./flash" product_name="Radxa X4" poe_name="瑞莎 25W PoE+ HAT X4 专用款" poe_img="/img/x/x4/25w_poe_plus_for_x4_04.webp" />
