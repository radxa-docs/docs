---
sidebar_position: 2
description: "Flashing the firmware via USB on Linux"
---

import Maskrom from "./\_maskrom.mdx"

# Linux/MacOS

## File Download

Please visit the [Resource Download](../../../download.md) to download the corresponding Loader and image files.

## Install rkdeveloptool

rkdeveloptool is software developed by Rockchip for USB flashing on Linux/macOS platforms.

rkdeveloptool can be considered the [open-source version](https://opensource.rock-chips.com/wiki_Rkdeveloptool) of the upgrade_tool.

If your operating system does not provide rkdeveloptool, you will need to compile and install it from the source code.

## Enter Maskrom

<Maskrom/>

## Use rkdeveloptool

### Write the file

:::tip
When writing the file, rkdeveloptool will not automatically decompress compressed files.

Please first decompress the files you will be using and specify the decompressed files in rkdeveloptool.
:::

:::tip
rkdeveloptool does not support selecting the Maskrom device or the storage medium to write to.
Typically, when using rkdeveloptool, only one device and one storage medium are hardware-connected. This step cannot be controlled by software.

If you need to write to multiple devices simultaneously, please use upgrade_tool.
:::

1. Decompress the image file (for the image file details, refer to the [Resource Download](../../../download.md) section. Here, we take radxa-cm3j-rpi-cm4-io_bullseye_xfce_b1.output.img.xz as an example).

   ```bash
   xz -d radxa-cm3j-rpi-cm4-io_bullseye_xfce_b1.output.img.xz (If it's in gz format, use the command `gunzip -d xxx.gz`)
   ```

2. Flash the Loader (for the actual file details, refer to the [Resource Download](../../../download.md) section. Here, we take rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin as an example).

   ```bash
   sudo rkdeveloptool db rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin
   ```

3. Flash the image (the following image name is just an example; the actual image file is the one decompressed in step 1).

   ```bash
   sudo rkdeveloptool wl 0 radxa-cm3j-rpi-cm4-io_bullseye_xfce_b1.output.img
   ```

## Restart the device

```bash
sudo rkdeveloptool rd
```
