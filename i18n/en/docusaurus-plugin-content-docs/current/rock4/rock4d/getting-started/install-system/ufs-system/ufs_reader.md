---
sidebar_position: 1
---

# Using Radxa eMMC/UFS Combo Module Reader

This tutorial is for users who have a Radxa eMMC/UFS combo module reader. It explains how to install the system on a UFS module using the Radxa eMMC/UFS combo module reader.

## Hardware Preparation

When using the Radxa eMMC/UFS combo module reader to install the system, there's no need to rely on a MicroSD card. Simply insert the UFS module into the eMMC/UFS module reader and use the Etcher software to install the system to the UFS module.

**You will need the following hardware:**

- Development board: Radxa ROCK 4D
- [UFS Module](https://radxa.com/products/accessories/ufs-module)
- [Radxa eMMC/UFS Combo Module Reader](https://radxa.com/products/accessories/emmc-ufs-module-reader)
- Power adapter: Type-C power adapter (with PD protocol support, 5V input, 3A or higher recommended)

:::tip
The ROCK 4D mainboard only supports 5V power input. A minimum of 3A is recommended to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C power adapter (5V input, with PD protocol support, 3A or higher recommended)
  :::

## Installing the System

Installing the system will format the UFS module. Please back up any important data before proceeding.

### Download System Image

On your PC, visit the [Downloads Summary](../../../download) page and locate the system image for the UFS module.

After downloading, extract the system image file. The resulting `*.img` file is the system image that will be written to the UFS module.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be installed on the UFS module using the image burning software. Writing the compressed file directly to the UFS module may result in installation failure or system boot failure.
:::

### Hardware Connection

Insert the UFS module into the Radxa eMMC/UFS combo module reader, then connect the reader to a USB port on your PC.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/write-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} alt="UFS module in reader" />
</div>

:::caution

UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the reader's interface
2. Align the connector on the bottom of the UFS module with the interface on the Radxa eMMC/UFS combo module reader
3. Gently press down on one end of the UFS module until you hear a click, then repeat for the other end to ensure secure installation
   :::

### Installing the System Image

Use the open-source image burning tool Etcher to write the system image to the UFS module.

#### Downloading Etcher

Visit the official Balena Etcher website to download the software for your platform: [balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Balena Etcher download page" />
</div>

Download the appropriate installation package for your operating system and architecture.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Balena Etcher download options" />
</div>

#### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- **Windows**

  The downloaded file is an `*.exe` installer. Double-click to run the program.

- **Linux**

  Download the `*.zip` archive, extract it, then double-click the program to run it.

- **macOS**

  Download the appropriate `*.dmg` file for your system architecture. Double-click to open it, then drag the application to your Applications folder to install. After installation, double-click the application icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Balena Etcher interface" />
</div>

#### Installing the System Image

1. **Select Image File**

   Click the `Flash from file` button and select the extracted system image file you downloaded earlier.

   <div style={{textAlign: 'center'}}>
     <img src="/en/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Etcher select file" />
   </div>

2. **Select Target Device**

   Click the `Select target` button and choose the storage device where you want to install the system image.

   :::danger
   Be extremely careful to select the correct storage device! Selecting the wrong device will result in data loss as Etcher will format the selected device.

   You can verify the correct device by unplugging and replugging your storage device and observing which device appears/disappears from the list.
   :::

   <div style={{textAlign: 'center'}}>
     <img src="/en/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Etcher select target" />
   </div>

   ① : Select the storage device for the system image

   ② : Click `Select 1` to confirm your device selection

   <div style={{textAlign: 'center'}}>
     <img src="/en/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Etcher confirm selection" />
   </div>

3. **Flash the System Image**

   Click the `Flash` button and wait for the software to automatically install and verify the system image.

   <div style={{textAlign: 'center'}}>
     <img src="/en/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Etcher flash button" />
   </div>

   <div style={{textAlign: 'center'}}>
     Waiting for system installation to complete...
     <img src="/en/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Etcher flashing in progress" />
   </div>

   <div style={{textAlign: 'center'}}>
     Verifying the installation...
     <img src="/en/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Etcher verification complete" />
     After successfully installing the system image, close the Etcher software!
   </div>

## System Information

When using our provided system image for the first time, you'll need to log in with the default username and password we've set up.

- **Debian Linux**
  - Username: `radxa`
  - Password: `radxa`

## Booting the System

After completing the system image installation:

1. Remove the UFS module from the Radxa eMMC/UFS combo module reader
2. Remove any MicroSD card from the ROCK 4D
3. Install the UFS module into the eMMC/UFS module interface on the ROCK 4D
4. Connect power to the ROCK 4D
5. Wait for the system to boot from the UFS module

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/boot-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} alt="ROCK 4D with UFS module" />
</div>

:::caution

UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the eMMC/UFS module interface on the ROCK 4D
2. Align the connector on the bottom of the UFS module with the eMMC/UFS module interface on the ROCK 4D
3. Gently press down on one end of the UFS module until you hear a click, then repeat for the other end to ensure secure installation
   :::

When the system boots, both the blue and green LED indicators will light up. After a few seconds, the green LED will stay solid and the blue LED will blink, indicating that the system has successfully booted.

## Verifying the System

After the system boots, you can check the partition information using the `lsblk` command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo lsblk
```
</NewCodeBlock>

If you see `/dev/sda3` mounted as the root directory `/`, it means the system has successfully booted from the UFS module.

```text
NAME      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda         8:0    0 119.1G  0 disk
├─sda1      8:1    0   128M  0 part /config
├─sda2      8:2    0   2.3G  0 part /boot/efi
└─sda3      8:3    0 116.6G  0 part /
mtdblock0  31:0    0    16M  0 disk
zram0     253:0    0   1.9G  0 disk [SWAP]
```

:::tip

If you encounter issues during the boot process, try the following solutions:

- **System fails to boot**:

  - Try reinstalling the UFS module and restarting the system
  - Try [downloading and flashing the latest SPI boot firmware](../boot_start)
  - Try reinstalling the system on the UFS module

- **System boots but cannot log in**:
  - Default username: `radxa`, password: `radxa`
  - If the password is incorrect, redownload the system image and reinstall the system on the UFS module
    :::
