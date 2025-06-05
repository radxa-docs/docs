---
sidebar_position: 1
---

# Using an M.2 NVMe SSD Enclosure

This tutorial is for users who have an M.2 NVMe SSD enclosure. It explains how to install the system on an M.2 NVMe SSD using the enclosure.

:::tip
An M.2 NVMe SSD refers to a solid-state drive that supports the M.2 interface and NVMe protocol.
:::

## Hardware Requirements

Using an SSD enclosure to install the system on an M.2 NVMe SSD doesn't require a MicroSD card. Simply insert the M.2 NVMe SSD into the enclosure and use the Etcher software to install the system.

**Note: Booting from an M.2 NVMe SSD requires a PCIe to M.2 M Key HAT.**

You will need the following hardware:

- Development board: Radxa ROCK 4D
- M.2 NVMe SSD: Purchase separately
- M.2 NVMe SSD Enclosure: Purchase separately
- PCIe to M.2 M Key HAT: Purchase separately
- Power adapter: Type-C power adapter (PD protocol supported, 5V input, 3A or higher current recommended)

:::tip
The Radxa ROCK 4D motherboard only supports 5V power input. A current of 3A or higher is recommended to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C power adapter (5V input, PD protocol supported, 3A or higher current recommended)
  :::

## Reinstalling the System

Reinstalling the system will format the M.2 NVMe SSD. Please back up any important data in advance.

### Download System Image

On your PC, visit the [Resource Downloads](../../../download) page, find the system image file for M.2 NVMe SSD, download and extract it.

After downloading, you'll get a `*.img` file, which is the system image file to be written to the M.2 NVMe SSD.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be installed to the M.2 NVMe SSD using the image burning software. If you try to burn the compressed file directly to the M.2 NVMe SSD, the system installation or boot may fail.
:::

### Hardware Connection

Insert the M.2 NVMe SSD into the SSD enclosure, then connect the enclosure to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/write-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Installing the System Image

Use the open-source image burning tool Etcher to write the system image file to the M.2 NVMe SSD.

#### Downloading Etcher

Go to the official Balena Etcher website and download the software for your platform: balenaEtcher.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Download the appropriate software package for your system platform and architecture.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- Windows

The downloaded file is an `*.exe` installer. Double-click to run the program.

- Linux

It's recommended to download the `*.zip` archive. After extraction, double-click the program to run it.

- macOS

Download the appropriate `*.dmg` file for your system architecture. Double-click to open it, then drag the application to the Applications folder to install. After installation, double-click the application icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Installing the System Image

1. Select the Image File

Click the `Flash from file` option and select the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Select the Target Device

Click the `Select target` option and choose the storage device where you want to install the system image.

:::danger
Be careful not to select the wrong storage device, as Etcher will format the selected device, which could result in data loss!

You can plug and unplug storage devices to observe changes in the available devices to help identify the correct target device.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the storage device where you want to install the system image

② : Click the `Select 1` option to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Install the System Image

Click the `Flash` option and wait for the software to automatically install and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system installation to complete
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system verification to complete
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
  After successfully installing the system image, close the Etcher software!
</div>

## System Information

When using our provided system image, you'll need to log in with the following default credentials on first boot:

- Debian Linux

Username: radxa

Password: radxa

## Booting the System

After completing the system image installation:

1. Remove the M.2 NVMe SSD from the M.2 SSD enclosure
2. Remove any MicroSD card from the Radxa ROCK 4D
3. Install the M.2 NVMe SSD onto the PCIe to M.2 M Key HAT
4. Install the PCIe to M.2 M Key HAT onto the Radxa ROCK 4D
5. Connect power to the Radxa ROCK 4D
6. Wait for the system to boot from the M.2 NVMe SSD

When the system boots, both the blue and green LEDs will light up simultaneously. After a few seconds, the green LED will stay lit while the blue LED will blink, indicating that the system has successfully booted.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Verifying the System

After the system boots, you can check the system partition information using the `lsblk` command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo lsblk
```
</NewCodeBlock>

If you see `/dev/nvme0n1p3` mounted as the root directory `/`, it means the system has successfully booted from the M.2 NVMe SSD.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
mtdblock0    31:0    0    16M  0 disk
zram0       253:0    0   1.9G  0 disk [SWAP]
nvme0n1     259:0    0 465.8G  0 disk
├─nvme0n1p1 259:1    0    16M  0 part /config
├─nvme0n1p2 259:2    0   300M  0 part /boot/efi
└─nvme0n1p3 259:3    0 465.4G  0 part /
```
</NewCodeBlock>

:::tip

If you encounter issues during the boot process, try the following solutions:

- System fails to boot:

  - Try reinstalling the M.2 NVMe SSD and boot again
  - Try [downloading and flashing the latest SPI boot firmware](../boot_start)
  - Try reinstalling the system to the M.2 NVMe SSD

- System boots but cannot log in:
  - Default username: radxa, password: radxa
  - If the password is incorrect, redownload the system image and reinstall to the M.2 NVMe SSD
    :::
