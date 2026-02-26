---
sidebar_position: 3
---

# Install System

The latest SPI image currently supports booting both Android and Linux. Please download the latest SPI image from the [Resource Downloads](../../download.md) page.

The steps to boot the system from a microSD card or NVMe SSD are different from booting from a UFS module. Please follow the instructions below.

## microSD Card

Install/boot the Android system using a microSD card.

1. Make sure the ROCK 4D has the latest SPI image flashed
2. Refer to the Linux tutorial [Install System to microSD Card](../../getting-started/install-system/boot_sd.md) to flash the Android system image to the microSD card
3. Insert the microSD card into the ROCK 4D and boot the system

## NVMe SSD

Install/boot the Android system using an NVMe SSD.

1. Make sure the ROCK 4D has the latest SPI image flashed
2. Refer to the Linux tutorial [Install System to NVMe](../../getting-started/install-system/nvme-system) to flash the Android system image to the NVMe SSD
3. Insert the NVMe SSD into the ROCK 4D and boot the system

## UFS Module

Install/boot the Android system using a UFS module.

Note: To boot Android from the UFS module, you must first flash the Android [update.img system image](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20251014/Rock4d-Android14-rk6-gms-ufs-20251014-update.zip) to the UFS module. After flashing is complete, you can then follow the Linux tutorial [Install System to UFS](../../getting-started/install-system/ufs-system) to flash the latest Android GPT system image to the UFS module.

1. Make sure the ROCK 4D has the latest SPI image flashed
2. In a Linux system, use [upgrade_tool_v2.30](https://dl.radxa.com/tools/linux/upgrade_tool_v2.30_for_linux.zip) to flash the Android [update.img system image](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20251014/Rock4d-Android14-rk6-gms-ufs-20251014-update.zip) to the UFS module

:::tip

Please extract the downloaded `update.img` system image before use.

:::

<NewCodeBlock tip="Linux$" type="host">
```bash
sudo ./upgrade_tool uf <xx-update.img-path>
```
</NewCodeBlock>

3. Insert the UFS module into the ROCK 4D and boot the system
4. If you want to use the latest Android system, refer to the [Install System](../../getting-started/install-system/ufs-system/) tutorial to flash the latest Android GPT system image to the UFS module.
