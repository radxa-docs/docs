---
sidebar_position: 10
---

import GPIO from '../../../../common/dev/\_gpio.mdx';
import I2C from '../../../../common/dev/\_i2c.mdx';
import PWM from '../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../common/dev/\_spi.mdx';
import UART from '../../../../common/dev/\_uart.mdx';

# 40-PIN Functional Testing

## GPIO

<GPIO product_name="Radxa ROCK 5B+" model="rock-5b-plus" gpio_pin="27" chip="4" line="22" gpio_connection="/img/rock5b/rock-5bp-pwm_connection.webp" />

## I2C

<I2C product_name="Radxa ROCK 5B+" model="rock-5b-plus" i2c_overlay_name="I2C8-M2" sda_pin="PIN_3" scl_pin="PIN_5" i2c_connection="/img/rock5b/rock5bp-i2c-connection.webp" />

## PWM

<PWM product_name="Radxa ROCK 5B+" model="rock-5b-plus" pwm_name="PWM7_IR_M3" chip="7" pwm_pin="27" chip="7" pwm_connection="/img/rock5b/rock-5bp-pwm_connection.webp" />

## SPI

<SPI product_name="Radxa ROCK 5B+" model="rock-5b-plus" spi_overlay_name="spidev on SPI0-M2 over CS0" spidev="/dev/spidev0.0" spi_mosi="19" spi_miso="21" spi_connection="/img/rock5b/rock-5bp-spi-connection.webp" />

## UART

<UART product_name="Radxa ROCK 5B+" model="rock-5b-plus" uart1_name="UART4-M2" uart_dev1="ttyS4" tx1_pin="PIN_23" rx1_pin="PIN_19" uart2_name="UART7-M1" uart_dev2="ttyS7" tx2_pin="PIN_15" rx2_pin="PIN_11" uart_connection="/img/rock5b/rock5b-uart-loop.webp" two_uart_connection="/img/rock5b/rock5bp-two-uart-connection.webp" />
