---
sidebar_position: 4
description: "Clear SPI  Flash"
---

# Erase SPI Flash manually

There are two ways to clear the data in SPI Flash.

- On Board:

  If the board can boot up success, we can erase through the rsetup tool after system up.

- On PC:

  If the board can't boot up or you don't want to erase on board, you can erase via usb port.

## On Board

- Open a terminal and run rsetup

- Select "System Maintenance"

<img src="/img/common/rsetup/main_menu.webp" alt="main menu" style={{ width: "80%" }} />

- Select "Erase SPI Bootloader"

<img src="/img/common/rsetup/system-maintenance.webp" alt="System Maintenance" style={{ width: "80%" }} />

- After selecting "OK", press the space bar and select "radxa-cm3i-io"

<img src="/img/common/nvme/rsetup-select-bootloader-radxa-cm3i-io.webp" alt="rsetup radxa cm3i io" style={{ width: "80%" }} />

## On PC

Refer to [Erase eMMC or SPI Flash](../../low-level-dev/maskrom/erase)
