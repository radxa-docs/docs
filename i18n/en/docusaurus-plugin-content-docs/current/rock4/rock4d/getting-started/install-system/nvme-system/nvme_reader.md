---
sidebar_position: 1
---

# Using an M.2 NVMe SSD Enclosure

This tutorial is for users who have an M.2 NVMe SSD enclosure. It explains how to install the system on an M.2 NVMe SSD using the enclosure.

:::tip
An M.2 NVMe SSD is a solid-state drive that supports the M.2 interface and NVMe protocol.
:::

## Hardware Preparation

Installing the system on an M.2 NVMe SSD using an enclosure doesn't require a MicroSD card. Simply insert the M.2 NVMe SSD into the enclosure and use the Etcher software to install the system onto the SSD.

**Note: Booting from an M.2 NVMe SSD requires using it with a PCIe to M.2 M Key HAT.**

You'll need the following hardware:

- Development Board: Radxa ROCK 4D
- M.2 NVMe SSD: Purchase separately
- M.2 NVMe SSD Enclosure: Purchase separately
- PCIe to M.2 M Key HAT: Purchase separately
- Power Adapter: Type-C power adapter (PD protocol supported, 5V input, recommended 3A or higher)

:::tip
The ROCK 4D mainboard only supports 5V power input. A power adapter with 3A or higher current is recommended to ensure stable operation of all peripherals.

Recommended power adapters:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C power adapter (5V input, PD protocol supported, recommended 3A or higher)
  :::

## Reinstalling the System

Reinstalling the system will format the M.2 NVMe SSD. Please back up any important data before proceeding.

### Download System Image

On your PC, visit the [Resource Download Center](../../../download) page, find the system image file corresponding to the M.2 NVMe SSD, and download and extract it.

After downloading, you will get a `*.img` file, which is the system image file to be written to the M.2 NVMe SSD.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be installed on the M.2 NVMe SSD using the image writing software. If you try to write the compressed file directly to the M.2 NVMe SSD without extracting it first, the system installation may fail or the system may fail to boot.
:::

### Hardware Connection

Insert the M.2 NVMe SSD into the SSD enclosure, then connect the enclosure to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/write-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Install System Image

Use the open-source image writing tool Etcher to write the system image file to the M.2 NVMe SSD.

#### Download Etcher

Visit the official Balena Etcher website to download the software for your system platform: balenaEtcher.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Download the software package corresponding to your system platform and architecture.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- Windows

The downloaded file is an `*.exe` installer. Double-click the program to run it.

- Linux

It is recommended to download the `*.zip` archive. After extracting, double-click the program to run it.

- MacOS

Download the `*.dmg` file corresponding to your system architecture. After opening it, drag the application to the Applications folder to install it. Then double-click the application icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Install System Image

1. Select Image File

Click the `Flash from file` option and select the system image file you have downloaded and extracted in advance.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Select Storage Device

Click the `Select target` option and choose the storage device where you want to install the system image.

:::danger
Be careful not to select the wrong storage device, as Etcher will format the selected device, which may result in data loss!

You can plug and unplug the storage device to observe the changes in the available storage devices, which can help you identify the correct device.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

①: Select the storage device where you want to install the system image

②: Click the `Select 1` option to confirm device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Install System Image

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

When using our provided system image for the first time, you will need to log in with the following default credentials:

- Debian Linux

Username: radxa

Password: radxa

## Booting the System

After completing the system image installation:

1. Remove the M.2 NVMe SSD from the M.2 SSD enclosure
2. Remove the MicroSD card from the ROCK 4D
3. Install the M.2 NVMe SSD into the PCIe to M.2 M Key HAT
4. Install the PCIe to M.2 M Key HAT onto the ROCK 4D
5. Connect the power supply to the ROCK 4D
6. Wait for the system to boot from the M.2 NVMe SSD

After the system starts, both the blue and green LED lights will turn on simultaneously. After a few seconds, the green light will stay on while the blue indicator light will blink, which generally indicates that the system has successfully booted.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Verifying the System

After the system boots, you can use the `lsblk` command to view the system partition information:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo lsblk
```
</NewCodeBlock>

If you see `/dev/nvme0n1p3` mounted as the root directory `/`, it means the system has successfully booted from the M.2 NVMe SSD.

```text
mtdblock0    31:0    0    16M  0 disk
zram0       253:0    0   1.9G  0 disk [SWAP]
nvme0n1     259:0    0 465.8G  0 disk
├─nvme0n1p1 259:1    0    16M  0 part /config
├─nvme0n1p2 259:2    0   300M  0 part /boot/efi
└─nvme0n1p3 259:3    0 465.4G  0 part /
```

:::tip

If you encounter any issues during the boot process, try the following solutions:

- If the system fails to boot:

  - Try reinstalling the M.2 NVMe SSD and booting the system
  - Try [downloading and flashing the latest SPI boot firmware](../boot_start)
  - Try reinstalling the system on the M.2 NVMe SSD

- If the system boots but you cannot log in:
  - Default username: radxa, password: radxa
  - If the password is incorrect, redownload the system image and reinstall the system on the M.2 NVMe SSD
    :::
