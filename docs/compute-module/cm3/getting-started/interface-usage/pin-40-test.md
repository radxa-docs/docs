---
sidebar_position: 10
description: "测试 40-PIN GPIO"
---

import GPIO from '../../../../common/dev/\_gpio.mdx';
import I2C from '../../../../common/dev/\_i2c.mdx';
import PWM from '../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../common/dev/\_spi.mdx';
import W1 from '../../../../common/dev/\_w1.mdx';
import LCD35 from '../../../../common/accessories/\_waveshare-35-display.mdx';

# 40-PIN 功能测试

## GPIO

<GPIO product_name="Radxa CM3 IO" model="radxa-cm3-io" gpio_pin="3" chip="0" line="14" gpio_connection="/img/cm3/cm3_io_pwm_connection.webp" />

## I2C

<I2C product_name="Radxa CM3 IO" model="radxa-cm3-io" i2c_overlay_name="I2C2" sda_pin="PIN_3" scl_pin="PIN_5" i2c_connection="/img/cm3/cm3_io_i2c-connection.webp" />

## One Wire

<W1 product_name="Radxa CM3 IO Board" w1_overlay_name="Enable 1-Wire on GPIO3_D1" w1_pin="PIN_40" w1_connection="/img/cm3/cm3_io_w1_connection.webp" />

## PWM

<PWM product_name="Radxa CM3 IO" model="radxa-cm3-io" pwm_name="PWM1-M0" pwm_pin="15" chip="1" pwm_connection="/img/cm3/cm3_io_pwm_connection.webp" />

## SPI

<SPI product_name="Radxa CM3 IO" model="radxa-cm3-io" spi_overlay_name="spidev on SPI3-M1 over CS0" spidev="/dev/spidev0.0" spi_mosi="19" spi_miso="21" spi_connection="/img/cm3/cm3_io_spi_connection.webp" />

## 微雪 3.5 inch SPI TFT LCD 屏幕

<LCD35 waveshare_lcd="/img/cm3/cm3_io_waveshare35_spi_display.webp" rsetup_path="../../radxa-os/rsetup" overlays_title="Enable Waveshare 3.5inch RPi LCD (C) on SPI3" fbdev="fb0" />
