---
sidebar_position: 2
---

# Linux/macOS Host

## 1. File Download

### 1.1 Loader Download

Visit the [Resource Download Summary](../../../download) page to download the corresponding Loader file.

### 1.2 System Image Download

Visit the [Resource Download Summary](../../../download) page to download the corresponding operating system image compression package. After downloading, decompress the system image compression package to obtain the `*.img` file with the suffix, which is the file needed to install the system image later.

:::tip
The downloaded system image is a compressed file that needs to be decompressed before it can be written to the eMMC through the image burning software.
:::

## 2. Hardware Connection

### 2.1 Required Devices

- A USB Type-A to USB Type-C data cable
- A pin or a toothpick
- A 12V/2A DC power adapter (DC5525)

### 2.2 Entering MaskROM Mode

:::tip
MaskROM mode is the "hardware emergency box" of embedded devices, which realizes device repair by directly operating the chip's underlying interface.

MaskROM mode is the built-in low-level recovery mode of Rockchip chips. When the device cannot load an effective boot program from any boot medium (eMMC, SD card, etc.), it automatically enters this mode.

This mode allows the device firmware to be re-burned through the RockUSB protocol.
:::

Radxa E24C has a dedicated MaskROM button. During the system startup process, if this button is pressed, the system will automatically enter MaskROM mode!

1. Connect Radxa E24C's USB Type-C port to your computer's USB port using a USB data cable.

2. Use a pin or a toothpick to press the MaskROM button.

3. Plug in the 12V/2A DC power adapter.

4. Release the MaskROM button.

Under normal circumstances, the power indicator light will be on when entering MaskROM mode. If the phenomenon does not match, you can repeat the steps to enter MaskROM mode!

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '80%', maxWidth: '700'}} />
</div>

## 3. Installing System to eMMC

### 3.1 MaskROM Device Recognition

:::tip
For RKDevTool tool usage, refer to [RKDevTool Usage](./rkdevtool)

- If MaskROM device is detected, proceed to the next step
- If MaskROM device is not detected, repeat the MaskROM mode entry operation
:::

Open the system terminal or command line and run the following command to check if the MaskROM device is recognized.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

Normal output content: Recognized one device

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
DevNo=1	Vid=0x2207,Pid=0x350c,LocationID=101 Maskrom
```
</NewCodeBlock>

### 3.2 System Installation

Open the system terminal or command line and execute the following operations.

- Burn Loader

Replace `xxx.bin` with the actual downloaded Loader file name.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool db xxx.bin
```
</NewCodeBlock>

- Burn system image

Replace `xxx.img` with the actual downloaded system image file name.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool wl 0 xxx.img
```
</NewCodeBlock>

- Restart device

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

### 3.3 Using the System

Refer to the [Quick Start](../../introduction) tutorial for system login operations!
