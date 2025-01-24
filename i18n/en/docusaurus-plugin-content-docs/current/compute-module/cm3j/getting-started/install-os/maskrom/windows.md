---
sidebar_position: 1
description: "Flashing the firmware via USB on Windows"
---

import Maskrom from "./\_maskrom.mdx"

# Windows

## File Download.

Please visit the [Resource Download](../../../download) to download the corresponding Loader and image files.

## Install RKDevTool

RKDevTool is software developed by Rockchip for USB flashing on the Windows platform. If RKDevTool is not installed on your Windows host, please follow the steps below to install it.

Please download and unzip the following file to install RKDevTool:

- [RKDevTool_Release_v2.86](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.86.zip)

- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

## Install Drivers

Download and unzip DriverAssistant, then run DriverInstall.exe and click the Install Driver button to install the drivers. If you have previously installed other versions of the drivers, please click Uninstall Driver to remove the existing drivers before reinstalling.

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

### Install RKDevTool

After unzipping RKDevTool_Release_v2.86.zip, simply click on RKDevTool.exe to use the software.

## Enter Maskrom Mode

<Maskrom/>

## Flash the System to eMMC.

- Select Loader

![flash emmc](/img/cm3j/rkdevtools-emmc-1.webp)

- Right-click to add an option and rename it to "Image"

![flash emmc](/img/cm3j/rkdevtools-emmc-2.webp)

- Select the system image you want to flash. (When flashing, make sure to unzip the downloaded image into .img format.)

![flash emmc](/img/cm3j/rkdevtools-emmc-3.webp)

- Click "run" to begin the flashing process.

![flash emmc](/img/cm3j/rkdevtools-emmc-4.webp)

- The flashing is complete when it appears as shown in the image below.

![flash emmc](/img/cm3j/rkdevtools-emmc-5.webp)
