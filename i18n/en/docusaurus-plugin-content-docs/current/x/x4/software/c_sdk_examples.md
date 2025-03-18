---
sidebar_position: 4
---

import SDK_EXAMPLE from "../../../common/dev/\_pico-sdk-example.mdx";
import GPIO from "../../../common/dev/\_pico-gpio.mdx";
import PWM from "../../../common/dev/\_pico-pwm.mdx";
import I2C from "../../../common/dev/\_pico-i2c.mdx";
import PoE from "../../../common/dev/\_pico-poe-fan.mdx";
import FAN from "../../../common/dev/\_pico-fan.mdx";
import RELATION from "./\_relation.mdx"
import UART from "../../../common/dev/\_pico-uart.mdx";
import INTEL_UART from "../../../common/dev/\_pico-gpio-controlled-by-intel.mdx";
import MCP2515 from "../../../common/dev/\_pico-mcp2515.mdx";

# Control RP2040 on Linux

## OverView

## Relation introduction between J4215 and 40-PIN GPIO

<RELATION />

## Tools Introduction

In order to operate the IO resources on RP2040, we need a complete software environment, here we mainly introduce a set of C/C++ SDKs, namely pico-sdk and pico-examples. pico-sdk mainly provides some APIs to operate the RP2040, while pico-examples provides a compilation framework for us to add our own programs according to the compilation framework provided by pico-examples. pico-sdk provides some APIs to operate the RP2040, while pico-examples provides a compilation framework for us to add our own programs according to the compilation framework provided by pico-examples.

<SDK_EXAMPLE flash_url="./flash" product_name="Radxa X4" />

## Examples

### RP2040 Control the 40-PIN

<Tabs queryString="type">
    <TabItem value="GPIO">
       <GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X4"  led_pin="PIN_5" platform="Linux" />
    </TabItem>
    <TabItem value="I2C">
        <I2C flash_url="./flash" product_name="Radxa X4"  scl_pin="PIN_5" sda_pin="PIN_3" platform="Linux" />
    </TabItem>
    <TabItem value="MCP2515">
        <MCP2515 flash_url="./flash" product_name="Radxa X4"  spi_sck="PIN_13" spi_rx="PIN_7" spi_tx="PIN_15" spi_cs="PIN_11" platform="Linux" />
    </TabItem>
     <TabItem value="PWM">
       <PWM flash_url="./flash" product_name="Radxa X4" led_pin="PIN_5" platform="Linux"/>
    </TabItem>
     <TabItem value="PoE FAN">
       <PoE flash_url="./flash" product_name="Radxa X4" poe_name="Radxa 25W PoE+ HAT for X4" poe_img="/img/x/x4/25w_poe_plus_for_x4_04.webp" platform="Linux"/>
    </TabItem>
     <TabItem value="UART">
      <UART flash_url="./flash" tty_num="ttyS4" platform="Linux"/>
    </TabItem>
</Tabs>

### Intel CPU Controls RP2040 via Uart

<Tabs queryString="type">
     <TabItem value="PWM">
       <FAN product_name="Radxa X4" flash_url="./flash" platform="Linux" />
    </TabItem>
     <TabItem value="UART">
      <INTEL_UART product_name="Radxa X4" led_pin="PIN_3" uart_id="uart0" uart_tx_pin="0" uart_rx_pin="1" gpio_num="29" uart_dev="/dev/ttyS4" platform="Linux" />
    </TabItem>
</Tabs>
