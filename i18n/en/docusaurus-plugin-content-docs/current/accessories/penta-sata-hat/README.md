---
sidebar_position: 1
---

# Radxa Penta SATA HAT

Radxa ROCK Penta SATA HAT is an addon HAT designed for ROCK Series. It utilizes the high speed PCIe buses on ROCK Series and provides a complete NAS solution based on ROCK Series.

![Radxa Penta SATA HAT](/img/accessories/penta-sata-hat-01.webp)

Currently supported Radxa ROCK Series products:

- ROCK 2A
- ROCK 2F
- ROCK 3A
- ROCK 3C
- ROCK 4A / 4B
- ROCK 4A+ / 4B+
- ROCK 4SE
- ROCK 5A
- ROCK 5C

Currently supported Raspberry Pi models:

- Raspberry Pi 5

## Feature

- Up to 5x HDD/SSD, support 2.5inch or 3.5inch SSD, up to 100T Storage
- 4x SATA + 1x eSATA with power
- Utilize PCIe buses on ROCK Series and Raspberry Pi
- External standard ATX power supply support for HDDs and SBC itself
- 12V DC power input for 2.5/3.5 HDD power and SBC itself (polarity: center positive)
- Support HDD suspend mode
- Support software RAID 0/1/5
- Optional PWM control fan for HDD heat dispatching
- Optional OLED display for IP/Storage info

:::tip
If you use large capacity 3.5-inch mechanical hard drives on the Penta SATA HAT, you need to check the hard drive specification to determine the peak current of the hard drive. We recommend using a hard drive with a peak current less than 1.7A.
:::

## Package List

- Radxa ROCK Penta SATA HAT
- Copper Pillar for fixing
- Adapter Board
- IPEX Cable

- **Penta SATA HAT Kit with ROCK 5A support**

  ![Radxa M.2 Extension Board](/img/accessories/penta-sata-hat-02.webp)

- **Penta SATA HAT with ROCK 3A / 4A / 4B / 4A+ / 4B+ / 4SE support**

  ![Radxa M.2 Extension Board](/img/accessories/penta-sata-hat-03.webp)

- **Penta SATA HAT with ROCK 3C support**

  ![Radxa M.2 Extension Board](/img/accessories/penta-sata-hat-04.webp)

## 40Pin Pinout

| Description   | Function | Pin# | Pin# | Function | Description |
| ------------- | -------- | ---- | ---- | -------- | ----------- |
|               |          | 1    | 2    | VCC      |             |
| OLED I2C      | I2C_SDA  | 3    | 4    | VCC      |             |
| OLED I2C      | I2C_SCL  | 5    | 6    | GND      |             |
|               |          | 7    | 8    |          |             |
|               | GND      | 9    | 10   |          |             |
| top board key | GPIO     | 11   | 12   |          |             |
|               |          | 13   | 14   | GND      |             |
|               |          | 15   | 16   | GPIO     | reset OLED  |
|               |          | 17   | 18   |          |             |
|               |          | 19   | 20   | GND      |             |
|               |          | 21   | 22   |          |             |
|               |          | 23   | 24   |          |             |
|               | GND      | 25   | 26   |          |             |
|               |          | 27   | 28   |          |             |
|               |          | 29   | 30   | GND      |             |
|               |          | 31   | 32   |          |             |
| tb-fan speed  | PWM      | 33   | 34   | GND      |             |
|               |          | 35   | 36   |          |             |
|               |          | 37   | 38   |          |             |
|               | GND      | 39   | 40   |          |             |

## User Guide

<DocCardList />
