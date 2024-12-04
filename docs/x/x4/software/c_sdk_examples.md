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

# 在 Linux 下控制 RP2040

## 概述

<RELATION />

## 工具介绍

为了操作 RP2040 上的 IO 资源， 我们需要一套完善的软件环境，在这里我们主要介绍一套 C/C++ SDK，即 pico-sdk 和 pico-example。 pico-sdk 主要是提供了一些操作 RP2040 的 API， 而 pico-examples 则为我们提供了一套程序编译框架，我们可以根据 pico-examples 提供的编译框架来添加我们自己的程序。

<SDK_EXAMPLE flash_url="./flash" product_name="Radxa X4" />

## 示例

### RP2040 控制 40-PIN

<Tabs queryString="type">
    <TabItem value="GPIO">
       <GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X4"  led_pin="PIN_5" cmd= "cd pico-examples/build
       rm -rf *
       cmake -G ''Ninja'' ..
       ninja" />
    </TabItem>
    <TabItem value="I2C">
        <I2C flash_url="./flash" product_name="Radxa X4"  scl_pin="PIN_5" sda_pin="PIN_3" platform="Linux" />
    </TabItem>
     <TabItem value="PWM">
       <PWM flash_url="./flash" product_name="Radxa X4" led_pin="PIN_5" platform="Linux"/>
    </TabItem>
     <TabItem value="PoE FAN">
       <PoE flash_url="./flash" product_name="Radxa X4" poe_name="瑞莎 25W PoE+ HAT X4 专用款" poe_img="/img/x/x4/25w_poe_plus_for_x4_04.webp" platform="Linux"/>
    </TabItem>
     <TabItem value="UART">
      <UART flash_url="./flash" tty_num="ttyS4" platform="Linux"/>
    </TabItem>
</Tabs>

### Intel CPU 通过 Uart 控制 RP2040

<Tabs queryString="type">
     <TabItem value="PWM">
       <FAN product_name="Radxa X4" flash_url="./flash" platform="Linux" />
    </TabItem>
     <TabItem value="UART">
      <INTEL_UART product_name="Radxa X4" led_pin="PIN_3" uart_id="uart0" uart_tx_pin="0" uart_rx_pin="1" gpio_num="29" uart_dev="/dev/ttyS4" platform="Linux" />
    </TabItem>
</Tabs>
