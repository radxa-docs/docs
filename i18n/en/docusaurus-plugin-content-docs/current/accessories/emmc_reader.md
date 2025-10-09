---
sidebar_position: 3
---

# Radxa eMMC Reader

Radxa eMMC USB3 reader is a real emmc card reader with USB3.0 performance. Based on GL3227E Chip design. The GL3227E is an USB 3.1 Gen1 eMMC controller, it provides single LUN (Logic Unit Number) which can support eMMC v5.0, 1/4/8bit data bus, High Speed SDR / High Speed DDR / HS200 / HS400 mode.

![eMMC Reader](/img/accessories/emmc-reader.webp)

## Features

- High speed USB3.1 Gen2 GL3227E controller
- Support eMMC HS400 mode
- Dual mount for eMMC module
- Support ROCK eMMC modules up to 128GB
- Compatible with Odroid/PINE64 eMMC module
- Support Linux/Windows/MacOS
- Support GPT partition table and firmware

:::tip eMMC Boot Partition Limitation

When using the Radxa eMMC Reader to connect an eMMC module via USB, only the User Data Area is exposed to the host computer.
This behavior is determined by the USB-to-eMMC bridge firmware used in the reader.

 Supported:

 - User Data Area (normal eMMC storage visible as a USB drive)

 Not Supported:

 - Boot0 partition
 - Boot1 partition
 - RPMB (Replay Protected Memory Block)

If your workflow requires access to Boot0 or Boot1 (for example, flashing bootloaders or device firmware), please connect the eMMC module directly to the development board’s native eMMC interface (via SDIO or soldered socket).

💡 Background

The USB bridge controller used in the Radxa eMMC Reader does not implement commands to switch to the boot partitions (CMD8/CMD49), which are required for low-level eMMC access. This is a common limitation among most USB eMMC readers on the market.

:::

## Dimension

- Size: 55 x 20 x 5 mm

[**Buy Now**](https://radxa.com/products/accessories/emmc-usb3-reader#buy)
