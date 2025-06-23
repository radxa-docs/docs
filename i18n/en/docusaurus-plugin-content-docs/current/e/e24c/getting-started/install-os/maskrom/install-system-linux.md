---
sidebar_position: 2
---

# Linux/macOS Host

## File Downloads

### Download Loader

Go to the [Downloads Summary](../../../download) page to download the corresponding Loader file.

### Download System Image

Go to the [Downloads Summary](../../../download) page to download the operating system image archive. After downloading, extract the archive to get the `*.img` file needed for system installation.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be written to eMMC using imaging software.
:::

## Hardware Connection

### Required Equipment

- One USB Type-A to Type-C cable
- A pin or toothpick
- 12V/2A DC power adapter (DC5525)

### Entering Maskrom Mode

:::tip
Maskrom mode is the "hardware first-aid kit" for embedded devices, enabling device recovery by directly interfacing with the chip's low-level hardware.

Maskrom mode is a built-in low-level recovery mode in Rockchip chips, which is automatically entered when the device cannot load a valid bootloader from any boot medium (eMMC, SD card, etc.).

This mode allows rewriting the device firmware via the RockUSB protocol.
:::

Radxa E24C has a dedicated Maskrom button. If this button is detected as pressed during system startup, the system will automatically enter Maskrom mode!

1. Connect Radxa E24C to your PC using a USB Type-C to Type-A cable

2. Press and hold the Maskrom button using a pin or toothpick

3. Connect the 12V/2A DC power adapter

4. Release the Maskrom button

Normally, the power indicator will stay lit when in Maskrom mode. If this doesn't happen, you can repeat the steps above.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '80%', maxWidth: '700'}} />
</div>

## Installing the System to eMMC

### Maskrom Device Detection

:::tip
For information on using the RKDevTool, refer to [RKDevTool Usage](./rkdevtool)

- If a Maskrom device is detected, you can proceed to the next step
- If no Maskrom device is detected, you can repeat the steps to enter Maskrom mode
  :::

Open your system terminal or command line and run the following command to check if the Maskrom device is detected.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

Expected output: One device detected

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
DevNo=1	Vid=0x2207,Pid=0x350c,LocationID=101	Maskrom
```
</NewCodeBlock>

### Installing the System

Open your system terminal or command line and perform the following operations.

- Flash the Loader

Replace `xxx.bin` with the actual Loader filename you downloaded.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool db xxx.bin
```
</NewCodeBlock>

- Flash the System Image

Replace `xxx.img` with the actual system image filename you downloaded.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool wl 0 xxx.img
```
</NewCodeBlock>

- Reboot the Device

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

### Using the System

Refer to the [Quick Start](../../introduction) guide for system login instructions!
