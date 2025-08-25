---
sidebar_position: 3
---

# USB Type-C Port

The Radxa ROCK 4D supports both USB Type-C and GPIO power input. We recommend using the USB Type-C port for power supply, which supports 5V input only. A minimum current of 3A is recommended to ensure stable operation of all peripherals.

We recommend using a standard 5V Type-C power adapter that supports the PD (Power Delivery) protocol.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-typec.webp" style={{width: '100%', maxWidth: '1200px'}} alt="ROCK 4D USB Type-C Port" />
</div>

:::tip
Recommended Power Adapters:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C Power Adapter (5V input, supports PD protocol, 3A or higher recommended)
  :::

## User Guide

You can verify successful power supply by checking the onboard LED indicator on the ROCK 4D. The LED will light up when power is properly connected.

## Interface Specifications

:::tip
For detailed interface specifications, please refer to the [Hardware Design: Schematics](../download) in the download section.
:::

| Pin# | Name | Pin#  | Name    | Pin# | Name | Pin# | Name |
| :--: | :--- | :---: | :------ | :--: | :--- | :--: | :--- |
|  1   | GND  |   7   | NC      |  A5  | GND  |  A7  | NC   |
|  2   | GND  | A1B12 | GND     |  B5  | GND  |  B7  | NC   |
|  3   | GND  | B1A12 | GND     |  A6  | NC   |  A8  | NC   |
|  4   | GND  | A4B9  | DCIN_5V |  B6  | NC   |  B8  | NC   |
|  6   | NC   | B4A9  | DCIN_5V |      |      |      |      |
