---
sidebar_position: 3
description: "Boot from SSD"
---

# Boot from SSD

## Install System

- Use an external hard drive enclosure to flash the system onto the SSD. For flashing instructions, refer to the [Install System](./boot_from_sd_card.md).

## Flash the Bootloader to the SPI Flash.

There are two ways to flash the Bootloader into the SPI Flash:

- Operation on the board:

  - If the system on the board is running properly, you can use the built-in `rsetup` tool to perform the operation.

- Operation on the PC:

  - If the board cannot boot properly or if you prefer not to operate directly on the board, you can connect the PC and the board via a USB cable, and use tools on the PC to perform the flashing.

### Operation on the board

- Open the terminal and execute `rsetup`.

- Select "System" and press Enter.

<img src="/img/cm3j/rsetup/main-menu.webp" alt="main menu" style={{ width: "80%" }} />

- Then select "Bootloader Management" and press Enter.

<img src="/img/cm3j/rsetup/bootloader-management.webp" alt="bootloader management" style={{ width: "80%" }} />

- Next, select "Update SPI Bootloader," press Enter, then choose "yes" and press Enter again.

<img src="/img/cm3j/rsetup/update-spi.webp" alt="rsetup spi" style={{ width: "80%" }} />
<img src="/img/cm3j/rsetup/yes.webp" alt="rsetup yes" style={{ width: "80%" }} />

- Finally, use the spacebar to select the "radxa-cm3j-rpi-cm4-io" option, press Enter, and the flashing process to the SPI Flash will begin.

<img src="/img/cm3j/rsetup/rsetup-radxa-cm3j-rpi-cm4-io.webp" alt="rsetup radxa cm3j" style={{ width: "80%" }} />

### Operation on the PC

On the PC side, you need to flash the Bootloader to the SPI Flash via USB. This process also requires entering Maskrom mode and using the RKdevtools tool for flashing.

The steps to enter Maskrom mode are similar to those for [Installing the System to eMMC](./maskrom/), with the following modifications:

- When powering on, you need to press the SPI Flash Button.

  ![spi flash](/img/cm3j/radxa-cm3j-spi-flash-1.webp)

- In the RKdevtools tool, change the "image" option to use the SPI Image from the [Resource Download Summary](../../download.md).

  ![spi flash](/img/cm3j/radxa-cm3j-spi-flash-2.webp)
