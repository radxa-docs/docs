---
sidebar_position: 10
description: "Test 40-PIN GPIO"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_gpio.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_i2c.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_pwm.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_spi.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_w1.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/accessories/_waveshare-35-display.mdx
---

import GPIO from '../../../../../common/dev/\_gpio.mdx';
import I2C from '../../../../../common/dev/\_i2c.mdx';
import PWM from '../../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../../common/dev/\_spi.mdx';
import W1 from '../../../../../common/dev/\_w1.mdx';
import LCD35 from '../../../../../common/accessories/\_waveshare-35-display.mdx';

# 40-PIN Functional Testing

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
