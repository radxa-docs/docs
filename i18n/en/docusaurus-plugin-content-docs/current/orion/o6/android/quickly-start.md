---
sidebar_position: 1
---

# Quick Start

This guide introduces how to flash the Android BIOS and install the Android system.

## Prerequisites

- **Mainboard**: Radxa Orion O6
- **USB Drive**: For updating BIOS
- **Boot Drive**: NVMe SSD
- **Cable**: USB Type-C cable
- **Display**: For showing BIOS setup interface
- **Power Adapter**: USB-C 20V power adapter (PD compatible)
- **PC Host**: Windows/Linux/macOS with fastboot tools installed
- **Optional**: Serial console cable

Note: The optional serial console cable is used for flashing BIOS. You can flash BIOS either through the serial console or display.

:::tip Recommended Accessories

- [Radxa 65W PD Power Adapter](https://radxa.com/products/accessories/power-pd-65w)

:::

## Flashing Android BIOS

Before starting, please ensure you have completed all the preparations.

### Preparations

#### 1. Install Required Tools

You need to install adb and fastboot tools on your host PC.

:::tip System Environment
Ubuntu is recommended for system installation.
:::

<NewCodeBlock tip="Ubuntu-PC$" type="device">

```
sudo apt update
sudo apt install android-tools-adb android-tools-fastboot
```

</NewCodeBlock>

#### 2. Create BIOS USB Drive

Visit the [Downloads](../download.md#android) page, download the latest Android BIOS files, and extract them to the root directory of your USB drive.

### Hardware Connection

:::tip Port Description
The Orion O6 mainboard has two USB Type-C ports:

- **Data Port**: Near the USB-A port, used for connecting to PC for data transfer.
- **Power Port**: Near the power button, used for connecting the power adapter.
  :::

① Install the NVMe SSD onto the mainboard.

② Insert the prepared BIOS USB drive into the mainboard's USB-A port.

③ Connect the mainboard's **data port** to your PC using a USB Type-C cable.

④ (Optional) If you need to view logs through the serial console, connect a serial debug cable to the mainboard's UART2 interface.

⑤ Connect a display to the mainboard's HDMI or DP port.

⑥ Power the mainboard by connecting a USB-C power adapter to the **power port**.

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/android/android-install-system.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

### Operation Steps

#### 1. Enter BIOS Setup

After powering on the mainboard, when you see the Radxa logo or the serial console shows `Press ESCAPE for boot options`, immediately press the `Esc` key on your keyboard to enter the BIOS setup interface.

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

In the BIOS interface, navigate to `Boot Manager` -> `EFI Shell`. The system will automatically detect and run the `startup.nsh` script on your USB drive to complete the BIOS flashing process.

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

_Automatically running the flashing script_

#### 3. Confirm Entry into Fastboot Mode

After the BIOS flashing is complete, the mainboard will automatically reboot and enter Fastboot mode.

<div style={{textAlign: 'center'}}>
    <img src="/en/img/o6/android/burn-bios-fastboot.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## Installing Android System

After the BIOS is flashed, the mainboard will be in Fastboot mode, and we can proceed to install the Android system.

### 1. Download and Extract System Image

Visit the [Downloads](../download.md#android) page, download the latest Android system image, and extract it to your local PC.

### 2. Flash the System Image

Open a terminal on your PC, navigate to the extracted Android system image directory, and run the `android_flush_images.sh` script.

<NewCodeBlock tip="Ubuntu-PC$" type="device">

```
./android_flush_images.sh
```

</NewCodeBlock>

The script will automatically complete the system flashing. After successful flashing, the mainboard will automatically reboot into the Android system.
