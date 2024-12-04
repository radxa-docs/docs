---
sidebar_position: 5
---

import PICO_SDK_WINDOWS from "../../../common/dev/\_pico-sdk-windows.mdx";
import GPIO from "../../../common/dev/\_pico-gpio.mdx";
import PWM from "../../../common/dev/\_pico-pwm.mdx";
import I2C from "../../../common/dev/\_pico-i2c.mdx";
import PoE from "../../../common/dev/\_pico-poe-fan.mdx";
import FAN from "../../../common/dev/\_pico-fan.mdx";
import RELATION from "./\_relation.mdx"
import UART from "../../../common/dev/\_pico-uart.mdx";

# Control RP2040 on Windows

## Relation introduction between J4215 and 40-PIN GPIO

<RELATION />

<PICO_SDK_WINDOWS />

## Flash

Press the BOOTSEL key and a USB device will pop up. Copy the compiled .uf2 file to the USB device of RP2040 and wait until the USB device disappears, then the programme will start to execute.

## Examples

### RP2040 Control the 40-PIN

<Tabs queryString="type">
    <TabItem value="GPIO">
       <GPIO flash_url="./flash" gpio_definition="./gpio" product_name="Radxa X4"  led_pin="PIN_5" platform="Windows" />
    </TabItem>
    <TabItem value="I2C">
        <I2C flash_url="./flash" product_name="Radxa X4"  scl_pin="PIN_5" sda_pin="PIN_3" platform="Windows" />
    </TabItem>
     <TabItem value="PWM">
       <PWM flash_url="./flash" product_name="Radxa X4" led_pin="PIN_5" platform="Windows" />
    </TabItem>
     <TabItem value="PoE FAN">
       <PoE flash_url="./flash" product_name="Radxa X4" poe_name="Radxa 25W PoE+ HAT for X4" poe_img="/img/x/x4/25w_poe_plus_for_x4_04.webp" platform="Windows" />
    </TabItem>
     <TabItem value="UART">
      <UART flash_url="./flash" tty_num="ttyS4" platform="Windows" />
    </TabItem>
</Tabs>
