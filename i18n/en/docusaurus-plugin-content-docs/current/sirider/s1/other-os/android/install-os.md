---
sidebar_position: 2
---

# Install System On eMMC/UFS

## Resource Download

For image and flashing tool, please refer to [download](../../download).

## Enter Flash mode

Connect the Type-C data cable to the debug port and the PC. This will display four serial port devices on the PC.
Open the last one in the sequence (Baud rate is 115200). Hold the FastBoot button and power on the board to enter flashing mode.
At this point, data will output on the serial port. Run the `fastboot devices` command to detect the device.

```bash
name@your-pc:$ fastboot devices
14007211532C0033        fastboot
```

## Image Installation

For Windows users:

Download the Windows platform flashing tool [siengine_downloadtool](https://gitlab.com/siengine-ubuntu-sdk/tools/-/blob/test/siengine_downloader/siengine_downloadtool_V7.6.3.rar?ref_type=heads).

For more details, please refer to the document [UG_SE1000_Download_Tool_User_Guide.pdf](https://dl.radxa.com/sirider/s1/siengine_downloadtool_V7.5/UG_SE1000_Download_Tool_User_Guide.pdf)
