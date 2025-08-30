---
sidebar_position: 4
---

# Manually Erase SPI Flash

:::tip
This tutorial is only applicable to systems with kernel >= 5.10
:::

## If Linux Can Boot

- Open a terminal and run `rsetup`

- Select "System Maintenance"

<img src="/img/common/rsetup/main_menu.webp" alt="main menu" style={{ width: "80%" }} />

- Select "Erase SPI Bootloader"

<img src="/img/common/rsetup/system-maintenance.webp" alt="System Maintenance" style={{ width: "80%" }} />

- After selecting "OK", press the spacebar to select "rock-4a", "rock-4b", "rock-4a+", "rock-4b+", and "rock-4se"

<img src="/img/common/nvme/rsetup-select-bootloader-rock-4b-plus.webp" alt="rsetup rock4ab-se" style={{ width: "80%" }} />

## If System Won't Boot

[Refer to USB Flashing Guide](/rock4/rock4ab-se/low-level-dev/maskrom)
