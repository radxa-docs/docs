---
sidebar_position: 7
---

import GPIO from '../../../../common/dev/\_gpio.mdx';
import I2C from '../../../../common/dev/\_i2c.mdx';
import PWM from '../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../common/dev/\_spi.mdx';
import UART from '../../../../common/dev/\_uart.mdx';

# 40-PIN 功能测试

## GPIO

<GPIO product_name="Radxa ROCK 2A" model="rock-2a" gpio_pin="3" chip="4" line="0" gpio_connection="/img/rock2a/led_connection.webp" />

## I2C

<I2C product_name="Radxa ROCK 2A" model="rock-2a" i2c_overlay_name="I2C0-M1" sda_pin="PIN_3" scl_pin="PIN_5" i2c_connection="/img/rock2a/rock-2a-i2c-connection.webp" />

## PWM

<PWM product_name="Radxa ROCK 2A" model="rock-2a" pwm_name="PWM0_M0" pwm_pin="PIN_32" chip="0" pwm_connection="/img/rock2a/pwm_connection.webp" />

## SPI

<SPI product_name="Radxa ROCK 2A" model="rock-2a" spi_overlay_name="Enable spidev on SPI0 over CS1" spidev="/dev/spidev0.0" spi_mosi="PIN_19" spi_miso="PIN_21" spi_connection="/img/rock2a/spi_connection.webp" />

## UART

<UART product_name="Radxa ROCK 2A" model="rock-2a" uart1_name="UART1-M0" uart_dev1="ttyS1" tx1_pin="PIN_7" rx1_pin="PIN_40" uart2_name="UART3-M0" uart_dev2="ttyS3" tx2_pin="PIN_18" rx2_pin="PIN_16" uart_connection="/img/rock2a/rock2a-uart-loop.webp" two_uart_connection="/img/rock2a/rock2a-two-uart-connection.webp" />
