---
sidebar_position: 7
---

import CANBUS from '../../../../common/dev/\_canbus.mdx';
import GPIO from '../../../../common/dev/\_gpio.mdx';
import I2C from '../../../../common/dev/\_i2c.mdx';
import PWM from '../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../common/dev/\_spi.mdx';
import UART from '../../../../common/dev/\_uart.mdx';

# 40-PIN 功能测试

## CANBUS

<CANBUS />

## GPIO

<GPIO product_name="Radxa ROCK 5A" model="rock-5a" gpio_pin="3" gpio_connection="/img/rock5c/led_connection.webp" />

## I2C

<I2C product_name="Radxa ROCK 5A" model="rock-5a" i2c_overlay_name="I2C8-M2" sda_pin="PIN_3" scl_pin="PIN_5" i2c_connection="/img/rock5a/rock-5a-i2c-connection.webp" />

## PWM

<PWM product_name="Radxa ROCK 5A" model="rock-5a" pwm_name="PWM0_M2" pwm_pin="23" chip="0" pwm_connection="/img/rock5c/pwm_connection.webp" />

## SPI

<SPI product_name="Radxa ROCK 5A" model="rock-5a" spi_overlay_name="spidev on SPI0-M2 over CS0" spidev="/dev/spidev0.0" spi_mosi="29" spi_miso="31" spi_connection="/img/rock5c/spi_connection.webp" />

## UART

<UART product_name="Radxa ROCK 5A" model="rock-5a" uart1_name="UART4-M2" uart_dev1="ttyS4" tx1_pin="PIN_7" rx1_pin="PIN_29" uart2_name="UART6-M1" uart_dev2="ttyS6" tx2_pin="PIN_19" rx2_pin="PIN_21" uart_connection="/img/rock5a/rock5a-uart-loop.webp" two_uart_connection="/img/rock5a/rock5a-two-uart-connection.webp" />
