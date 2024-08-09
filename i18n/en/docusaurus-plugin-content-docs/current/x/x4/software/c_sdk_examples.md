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
import UART from "../../../common/dev/\_pico-uart.mdx";

# 40-PIN Usage

## OverView

<RELATION />

## Tools Introduction

In order to operate the IO resources on RP2040, we need a complete software environment, here we mainly introduce a set of C/C++ SDKs, namely pico-sdk and pico-examples. pico-sdk mainly provides some APIs to operate the RP2040, while pico-examples provides a compilation framework for us to add our own programs according to the compilation framework provided by pico-examples. pico-sdk provides some APIs to operate the RP2040, while pico-examples provides a compilation framework for us to add our own programs according to the compilation framework provided by pico-examples.

<SDK_EXAMPLE flash_url="./flash" product_name="Radxa X4" />

## Examples

### RP2040 Control the 40-PIN

<Tabs queryString="type">
    <TabItem value="GPIO">
       <GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X4"  led_pin="PIN_5" />
    </TabItem>
    <TabItem value="I2C">
        <I2C flash_url="./flash" product_name="Radxa X4"  scl_pin="PIN_5" sda_pin="PIN_3" />
    </TabItem>
     <TabItem value="PWM">
       <PWM flash_url="./flash" product_name="Radxa X4" led_pin="PIN_5" />
    </TabItem>
     <TabItem value="PoE FAN">
       <PoE flash_url="./flash" product_name="Radxa X4" poe_name="Radxa 25W PoE+ HAT for X4" poe_img="/img/x/x4/25w_poe_plus_for_x4_04.webp" />
    </TabItem>
     <TabItem value="UART">
      <UART />
    </TabItem>
</Tabs>

### Intel CPU Controls RP2040 via Uart

<INTEL_UART product_name="Radxa X4" led_pin="PIN_3" uart_id="uart0" uart_tx_pin="0" uart_rx_pin="1" gpio_num="29" uart_dev="/dev/ttyS4" />
