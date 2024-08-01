---
sidebar_position: 2
---

import SDK_EXAMPLE from "../../../common/dev/\_pico-sdk-example.mdx";
import GPIO from "../../../common/dev/\_pico-gpio.mdx";
import PWM from "../../../common/dev/\_pico-pwm.mdx";
import I2C from "../../../common/dev/\_pico-i2c.mdx";
import FAN from "../../../common/dev/\_pico-fan.mdx";
import RELATION from "./\_relation.mdx"

# 40-PIN Usage

## Introduction to Intel N100 and RP2040 and 40-PIN GPIO Relationships

<RELATION />

## 40-PIN Usage

### Tools Introduction

In order to operate the IO resources on RP2040, we need a complete software environment, such as MicroPython or C/C++ SDK, here we mainly introduce a set of C/C++ SDKs, namely pico-sdk and pico-examples. pico-sdk mainly provides some APIs to operate the RP2040, while pico-examples provides a compilation framework for us to add our own programs according to the compilation framework provided by pico-examples. pico-sdk provides some APIs to operate the RP2040, while pico-examples provides a compilation framework for us to add our own programs according to the compilation framework provided by pico-examples.

<SDK_EXAMPLE flash_url="./flash" product_name="Radxa X4" />

### Examples

#### RP2040 Individually control the 40-PIN GPIO

<GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X4"  led_pin="PIN_5" />

<I2C flash_url="./flash" product_name="Radxa X4"  scl_pin="PIN_5" sda_pin="PIN_3" />

<PWM flash_url="./flash" product_name="Radxa X4" led_pin="PIN_5" />

#### CPU controls the RP2040's 40-PIN GPIO via UART

<FAN flash_url="./flash" product_name="Radxa X4" />
