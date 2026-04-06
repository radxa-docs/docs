---
sidebar_position: 5
---

import IMAGER_INSTALL_SYSTEM from '../../../../../common/raspberry-pi/\_imager-install-system.mdx';

# Install System to eMMC

This guide introduces how to install the system to the eMMC of the Raspberry Pi CM5 using the Taco.

## Prerequisites

- Raspberry Pi CM5 (with onboard eMMC)
- Radxa Taco
- Host computer (Linux or macOS)
- USB-A to USB-C data cable

Note: Linux recommended to be Debian or Ubuntu.

## RPIBOOT

RPIBOOT is a USB boot and device flashing tool provided by Raspberry Pi. It can deploy system images to the target device's storage medium via USB without relying on an SD card for system flashing or updating.

## Install RPIBOOT

<Tabs queryString="Platform">

<TabItem value="Debian/Ubuntu">

- Install dependencies

Use the following command to install the tools required to compile RPIBOOT.

<NewCodeBlock tip="Debian/Ubuntu$" type="host">

```
sudo apt update
sudo apt install git libusb-1.0-0-dev pkg-config build-essential -y
```

</NewCodeBlock>

- Pull / Compile

Use the following command to pull and compile the `usbboot` source code.

<NewCodeBlock tip="Debian/Ubuntu$" type="host">

```
git clone --recurse-submodules --shallow-submodules --depth=1 https://github.com/raspberrypi/usbboot
cd usbboot
sudo make install
```

</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

<NewCodeBlock tip="macOS$" type="host">

```
git clone --recurse-submodules --shallow-submodules --depth=1 https://github.com/raspberrypi/usbboot
cd usbboot
sudo make install
```

</NewCodeBlock>

</TabItem>

</Tabs>

## RPIBOOT Mode

When the target device enters USB boot mode, the host can recognize and access the target storage via USB, allowing the system image to be written to the onboard eMMC.

Steps to enter RPIBOOT mode:

1. Press and hold the RPIBOOT button on the Taco.
2. Connect to the host using a data cable. USB-C to Taco, USB-A to host.
3. Release the RPIBOOT button.

:::tip RPIBOOT Mode

Connect the Taco and host using the data cable alone. Do not connect SATA hard drives or high-power consumption peripherals to avoid affecting power supply stability.

If the board is connected to SATA hard drives or high-power consumption peripherals, please follow these steps to enter RPIBOOT mode:

1. Press and hold the RPIBOOT button on the Taco.
2. Power the board with the 12V power adapter.
3. Release the RPIBOOT button.
4. Connect to the host using a data cable. USB-C to Taco, USB-A to host.

:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/accessories/taco/enter-rpiboot-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Using RPIBOOT

<NewCodeBlock tip="PC (Debian/Ubuntu/macOS)" type="host">

```
sudo rpiboot -d mass-storage-gadget
```

</NewCodeBlock>

The system will automatically recognize the device and start the boot process. The terminal will normally display similar information:

```
RPIBOOT: build-date 2026/03/27 pkg-version local 101f2d00

Please fit the EMMC_DISABLE / nRPIBOOT jumper before connecting the power and USB cables to the target device.
If the device fails to connect then please see https://rpltd.co/rpiboot for debugging tips.

Loading: mass-storage-gadget/bootfiles.bin
Using mass-storage-gadget/bootfiles.bin
Waiting for BCM2835/6/7/2711/2712...

Sending bootcode.bin
Successful read 4 bytes
Waiting for BCM2835/6/7/2711/2712...

Second stage boot server
File read: mcb.bin
File read: memsys00.bin
File read: memsys01.bin
File read: rp1c0fw1.bin
File read: memsys02.bin
File read: memsys03.bin
File read: bootmain
Loading: mass-storage-gadget/config.txt
File read: config.txt
Loading: mass-storage-gadget/boot.img
File read: boot.img
Second stage boot server done
```

The system will appear as a removable device. At this point, you can use Raspberry Pi Imager to install the system image to the eMMC of the Raspberry Pi CM5.

## Install System

<IMAGER_INSTALL_SYSTEM />
