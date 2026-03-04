---
sidebar_position: 6

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_gpio.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_i2c.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_pwm.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_spi.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_uart.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/accessories/_waveshare-35-display.mdx
---

import GPIO from '../../../../common/dev/\_gpio.mdx';
import I2C from '../../../../common/dev/\_i2c.mdx';
import PWM from '../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../common/dev/\_spi.mdx';
import UART from '../../../../common/dev/\_uart.mdx';
import LCD35 from '../../../../common/accessories/\_waveshare-35-display.mdx';

# 40-PIN GPIO Headers

## GPIO

<GPIO product_name="ROCK 4A/4B/4A+/4B+/4SE" model="rock-4se" gpio_pin="11" chip="4" line="18" gpio_connection="/img/rock4/rock4-led-pin11.webp" />

## I2C

<I2C product_name="ROCK 4A/4B/4A+/4B+/4SE" model="rock-4se" i2c_overlay_name="I2C2" sda_pin="PIN_27" scl_pin="PIN_28" i2c_connection="/img/rock4/rock4_i2c-connection.webp" />

## PWM

<PWM product_name="ROCK 4A/4B/4A+/4B+/4SE" model="rock-4se" pwm_name="PWM1-M0" pwm_pin="15" chip="1" pwm_connection="/img/rock4/rock4-led-pin11.webp" />

## SPI

<SPI product_name="ROCK 4A/4B/4A+/4B+/4SE" model="rock-4se" spi_overlay_name="Enable spidev on SPI1" spidev="/dev/spidev0.0" spi_mosi="19" spi_miso="21" spi_connection="/img/rock4/rock4-spi-connection.webp" />

## UART

<UART product_name="ROCK 4A/4B/4A+/4B+/4SE" model="rock-4se" uart1_name="UART4" uart_dev1="ttyS4" tx1_pin="PIN_19" rx1_pin="PIN_21" uart2_name="UART2-M0" uart_dev2="ttyS2" tx2_pin="PIN_8" rx2_pin="PIN_10" uart_connection="/img/rock4/rock4-uart-loop.webp" two_uart_connection="/img/rock4/rock4-two-uart-connection.webp" />

## Waveshare 3.5 inch SPI TFT LCD Display

<LCD35 waveshare_lcd="/img/rock4/rock4-waveshare35-spi-display.webp" rsetup_path="../../radxa-os/rsetup" overlays_title="Enable Waveshare 3.5inch RPi LCD (B) on SPI1 (No Touch Support)" fbdev="fb0" />
