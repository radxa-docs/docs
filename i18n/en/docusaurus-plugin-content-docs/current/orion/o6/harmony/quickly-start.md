---
sidebar_position: 1
---

# Quick Start

This guide covers downloading the OpenHarmony SDK, flashing the BIOS, and installing the OpenHarmony operating system.

## Prerequisites

- **Board**: Radxa Orion O6
- **USB Drive**: For updating BIOS
- **Boot Drive**: NVMe SSD
- **Cable**: USB Type-C cable
- **Display**: For accessing BIOS setup interface
- **Power Adapter**: USB-C 20V power adapter (PD protocol compatible)
- **Host PC**: Windows / Linux / MacOS with fastboot tools installed
- **Optional**: Serial console cable

Note: The optional serial console cable is used for flashing BIOS. You can perform BIOS flashing through either the serial console or display.

:::tip Recommended Accessories

- [Radxa PD 65W Power Adapter](https://radxa.com/products/accessories/power-pd-65w)

:::

## HarmonyOS SDK Download

- [SDK GitHub Link](https://github.com/radxa/cix-openharmony-manifests)

The GitHub repository contains a `README.md` file with environment setup and compilation instructions, as shown below:

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/harmony/readme-harmony-0.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/harmony/readme-harmony-1.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## Flashing HarmonyOS BIOS

Before starting, please ensure you have completed all preparations.

### Preparations

#### 1. Install Required Tools

We need to install the fastboot tool on your host PC.

:::tip System Environment
Ubuntu is recommended for system installation.
:::

<NewCodeBlock tip="Ubuntu-PC$" type="device">

```
sudo apt update
sudo apt install android-tools-fastboot
```

</NewCodeBlock>

#### 2. Prepare BIOS USB Drive

Visit the [Resource Download](../download.md#openharmony) page, download the latest HarmonyOS BIOS file, and extract it to the root directory of your USB drive.

### Hardware Connections

:::tip Port Description
The Orion O6 board features two USB Type-C ports:

- **Data Port**: Located near the USB-A port, used for connecting to a PC for data transfer.
- **Power Port**: Located near the power button, used for connecting the power adapter.
  :::

①. Install the NVMe SSD onto the board.

②. Insert the prepared BIOS USB drive into the board's USB-A port.

③. Connect the board's **Data Port** to your PC using a USB Type-C cable.

④. (Optional) For serial console output, connect a serial debug cable to the board's UART2 interface.

⑤. Connect a display to the board's HDMI or DP port.

⑥. Power the board by connecting a USB-C power adapter to the **Power Port**.

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/android/android-install-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Operation Steps

#### 1. Enter BIOS Setup

After powering on the board, when you see the Radxa logo or the serial output `Press ESCAPE for boot options`, immediately press the `Esc` key to enter the BIOS setup interface.

- **Via Display**

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/android/burn-bios-go.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

- **Via Serial Console**

```
Tianocore/EDK2 firmware version 0.3.0-1
Press ESCAPE for boot options
```

#### 2. Run BIOS Flashing Script

In the BIOS interface, navigate to `Boot Manager` -> `EFI Shell`. The system will automatically detect and run the `startup.nsh` script from the USB drive to complete the BIOS flashing process.

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/android/burn-bios-manager.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

_Entering Boot Manager_

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/android/burn-bios-efi.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

_Selecting EFI Shell_

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/android/burn-bios-sh.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

_Automatic Script Execution_

#### 3. Confirm Fastboot Mode

After the BIOS flashing is complete, the board will automatically enter Fastboot mode.

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/harmony/burn-harmony-bios.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## Installing OpenHarmony OS

After the BIOS is successfully flashed and the board is in Fastboot mode, you can proceed with installing the OpenHarmony operating system.

### 1. Download and Extract System Image

Visit the [Resource Download](../download.md#openharmony) page, download the latest OpenHarmony system image, and extract it to your local PC.

### 2. Flash the System Image

Open a terminal on your PC, navigate to the extracted OpenHarmony system image directory, and run the `fastboot.sh` script.

<NewCodeBlock tip="Ubuntu-PC$" type="device">

```
sudo ./fastboot.sh
```

</NewCodeBlock>

After successful flashing, you'll see the following output:

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/harmony/burn-harmony-img.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

The script will automatically complete the system flashing. After successful flashing, power cycle the board to boot into the OpenHarmony system.
