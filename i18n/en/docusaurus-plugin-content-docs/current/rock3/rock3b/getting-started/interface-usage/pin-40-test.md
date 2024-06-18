---
sidebar_position: 10
---

import CANBUS from '../../../../common/dev/\_canbus.mdx';
import GPIO from '../../../../common/dev/\_gpio.mdx';
import I2C from '../../../../common/dev/\_i2c.mdx';
import PWM from '../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../common/dev/\_spi.mdx';
import UART from '../../../../common/dev/\_uart.mdx';
import LCD35 from '../../../../common/accessories/\_waveshare-35-display.mdx';

# 40-PIN Functional Test

## CANBUS

<CANBUS />

## GPIO

<GPIO product_name="Radxa ROCK 3B" model="rock-3b" gpio_pin="3" gpio_connection="/img/rock3/3b/rock3b_led_connection.webp" />

## I2C

<I2C product_name="Radxa ROCK 3B" model="rock-3b" i2c_overlay_name="I2C1" sda_pin="PIN_27" scl_pin="PIN_28" i2c_connection="/img/rock3/3b/rock3b_i2c-connection.webp" />

## PWM

<PWM product_name="Radxa ROCK 3B" model="rock-3b" pwm_name="PWM1-M0" pwm_pin="15" chip="1" pwm_connection="/img/rock3/3b/rock3b_pwm_connection.webp" />

## SPI

<SPI product_name="Radxa ROCK 3B" model="rock-3b" spi_overlay_name="spidev on SPI3-M1 over CS0" spidev="/dev/spidev0.0" spi_mosi="19" spi_miso="21" spi_connection="/img/rock3/3b/rock3b_spi_connection.webp" />

## UART

<UART product_name="Radxa ROCK 3B" model="rock-3b" uart1_name="UART0" uart_dev1="ttyS0" tx1_pin="PIN_22" rx1_pin="PIN_15" uart2_name="UART3-M0" uart_dev2="ttyS3" tx2_pin="PIN_5" rx2_pin="PIN_3" uart_connection="/img/rock3/3b/rock3b-uart-loop.webp" two_uart_connection="/img/rock3/3b/rock3b_two_uart_connection.webp" />

## Waveshare 3.5 inch SPI TFT LCD Screen

<LCD35 waveshare_lcd="/img/rock3/3b/rock3b_waveshare35_spi_display.webp" rsetup_path="../../radxa-os/rsetup" overlays_title="Enable Waveshare 3.5inch RPi LCD (B) on SPI3-M1" fbdev="fb0" />
