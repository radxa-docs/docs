---
sidebar_position: 2
---

# Install OS to NVMe

## Overview

To boot Radxa E54C from NVMe, you first need to boot the system from a MicroSD card or eMMC, then flash the SPI Flash using either the `rsetup` tool or `RKDevTool`, and finally write the system image to the NVMe device using the `dd` command.

This tutorial demonstrates the process using a MicroSD card. The installation process is identical for eMMC systems.

## Boot the System

Refer to the [Quick Start](../quick-start) guide to boot the system from a MicroSD card.

After confirming that the Radxa E54C system has successfully booted, shut it down and disconnect the power. Then insert the NVMe drive into the M.2 slot on the Radxa E54C motherboard.

:::tip
The MicroSD card functions similarly to a boot disk in an x86 system. Its purpose is to provide a Linux environment for system installation, obtain the SPI Flash image file (`spi.img`), and then flash `spi.img` to the SPI Flash using the `rsetup` tool.
:::

## Flash SPI Flash

There are two methods to flash the SPI Flash: using the `rsetup` tool or the `RKDevTool`. Choose the one that best suits your needs.

### Using Rsetup

Use the system configuration tool `rsetup` to flash `spi.img` to the SPI Flash.

#### Update Rsetup

:::tip
Rsetup Tool Guide: Interface may vary slightly between versions. Please refer to your actual interface.

- Confirm selection: Press `Enter`
- Cancel selection: Press `ESC`
- Toggle options: Use arrow keys
- Multi-selection interface: Press `Space` to select, then `Enter` to confirm
  :::

Open the system command line and run the `rsetup` tool to update.

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
rsetup
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  rsetup Main Interface
  <img src="/en/img/e/e54c/rsetup-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

1. Update System
Navigate to `System` → `System Update`:
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Select `yes` to continue, then follow the on-screen instructions to complete the remaining steps:
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Restart the system after completing all operations.

#### Enable SPI Flash Device

To prevent accidental writes to the bootloader stored in the SPI Flash during normal use, the SPI Flash device is disabled by default. Enable it using the following method.

Navigate to `Overlays` → `Manage Overlays`:

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
  <img src="/en/img/e/e54c/rsetup-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Select the `Enable SPI Flash` option. Press `Space` to see a `*` symbol, which indicates that SPI Flash is enabled, then press `Enter` to confirm:

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Follow the on-screen instructions to complete the remaining steps:
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Restart the system after completing all operations.

#### Flash SPI Flash

After rebooting, open the system configuration tool `rsetup` again.

Navigate to `System` → `Bootloader Management` → `Update SPI Bootloader`:

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-10.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-11.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-12.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Select the Bootloader file to install. If there are multiple options, prioritize the one with the `spi` suffix:
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-13.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Follow the on-screen instructions to complete the remaining steps:
<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-14.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Restart the system after completing all operations.

### Using RKDevTool

RKDevTool is a software developed by Rockchip for USB burning on Windows/Linux/MacOS platforms, designed to simplify and accelerate the development and debugging process for Rockchip series chips.

#### Install RKDevTool

<Tabs queryString="rkdevtool">

<TabItem value="Windows">

- Install Driver

Download and extract the [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip) file.

Locate the `DriverInstall.exe` file and run it as administrator:

To install the driver: Click the `Install Driver` option

To uninstall the driver: Click the `Uninstall Driver` option

:::tip
If you have installed other versions of the driver before, please uninstall them first before installing the new one.
:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rkddevtool.webp" style={{width: '50%', maxWidth: '700'}} />
</div>

- Download RKDevTool

Download the [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar) tool, then extract the downloaded file. The executable program is `RKDevTool.exe`, which you can open and use by double-clicking.

</TabItem>

<TabItem value="Linux">

- Install rkdeveloptool

Open the system terminal or command line and run the following commands to install.

<NewCodeBlock tip="Linux-host$" type="host">
```bash
sudo apt-get update
sudo apt-get install -y libudev-dev libusb-1.0-0-dev dh-autoreconf pkg-config libusb-1.0 build-essential git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make -j $(nproc)
sudo cp rkdeveloptool /usr/local/sbin/
```
</NewCodeBlock>

- Verify Version

After installing RKDevTool, you can check the version using the following command:

<NewCodeBlock tip="PC - Host$" type="host">
```bash
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

<TabItem value="MacOS">

- Install HomeBrew

[HomeBrew](https://brew.sh/) is a free and open-source package manager that simplifies software installation for macOS users.

If you don't have HomeBrew installed, you can install it with the following command:

<NewCodeBlock tip="MacOS-host$" type="host">
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
</NewCodeBlock>

- Install rkdeveloptool

Open the system terminal or command line and run the following commands to install.

<NewCodeBlock tip="MacOS-host$" type="host">
```bash
brew install automake autoconf libusb pkg-config git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make -j $(nproc)
cp rkdeveloptool /opt/local/sbin/
```
</NewCodeBlock>

- Verify Version

After installing RKDevTool, you can check the version using the following command:

<NewCodeBlock tip="MacOS-host$" type="host">
```bash
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

</Tabs>

## Flashing SPI Flash using RKDevTool

<Tabs queryString="platform">

<TabItem value="Windows">

①. Ensure E54C is in Maskrom mode

②. Select the Loader file corresponding to E54C. You can download the Loader file from the [Resource Download](../../download) page.

③. Select the storage device. Here we choose the `SPINOR` option.

④. Select the `spi.img` file you want to flash to the SPI Flash.

⑤. Check the `Write by Address` option.

⑥. Click the `RUN` button to execute all operations.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rk-down-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux / MacOS">

1. Ensure E54C is in Maskrom mode.

2. Verify Maskrom Mode

Use the `rkdeveloptool ld` command to view the recognized device information:

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
rkdeveloptool ld
```
</NewCodeBlock>

Output similar to the following indicates a Maskrom device is recognized:

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. Run the Loader File

Replace `demo.bin` with the Loader file corresponding to E54C. You can download the Loader file from the [Resource Download](../../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool db  demo.bin
```
</NewCodeBlock>

4. Flash the SPI Boot Firmware

Replace `spi.img` with the SPI boot firmware corresponding to E54C. You can download the SPI boot firmware from the [Resource Download](../../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool wl 0 spi.img
```
</NewCodeBlock>

5. Reboot the system to make the SPI Flash flashing take effect

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>

## Write System Image to NVMe

After completing the SPI Flash flashing operation, we can check if the system recognizes the SPI Flash and NVMe devices.

### Check Devices

Open the system command line and use the `lsblk` command to check if the system recognizes the NVMe device.

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
lsblk
```
</NewCodeBlock>

- If the Linux system recognizes the SPI Flash device, it will typically be identified as `mtdblock*`

- If the Linux system recognizes the NVMe device, it will typically be identified as `nvme*n*`

Example output from `lsblk`:

```text
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
mtdblock0    31:0    0    16M  0 disk
mmcblk1     179:0    0    58G  0 disk
├─mmcblk1p1 179:1    0    16M  0 part
├─mmcblk1p2 179:2    0   300M  0 part
└─mmcblk1p3 179:3    0  57.6G  0 part /
zram0       253:0    0   3.9G  0 disk [SWAP]
nvme0n1     259:0    0 119.2G  0 disk
├─nvme0n1p1 259:1    0    16M  0 part /config
├─nvme0n1p2 259:2    0   300M  0 part /boot/efi
└─nvme0n1p3 259:3    0 118.9G  0 part
```

### Download System Image

Download the Radxa E54C system image file to your local machine: You can use the `wget` command to download the file to the current directory. The download link can be copied from the [Resource Download](../../download) page.

:::tip
You can also download the system image from the [Resource Download](../../download) page and transfer it to the Radxa E54C using a USB drive or online transfer methods (such as FTP, SCP, etc.).
:::

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
# Install wget
sudo apt-get install wget
# Download system image file
wget https://github.com/radxa-build/radxa-e54c/releases/download/rsdk-b2/radxa-e54c_bookworm_cli_b2.output.img.xz
```
</NewCodeBlock>

- wget: Download file, followed by the download link

### Write System Image to NVMe

Use the following command to extract and write the compressed system image directly to the NVMe device.

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
sudo xzcat ~/radxa-e54c_bookworm_cli_b2.output.img.xz | sudo dd of=/dev/nvme0n1 bs=1M status=progress
```
</NewCodeBlock>

- xzcat: Extract the xz-format system image file
- dd: Copy and write to the NVMe device (⚠️Note: When using the dd command, please confirm the device name, as an incorrect device name may result in data loss)
- of=/dev/nvme0n1: Specify the target device as nvme0n1
- bs=1M: Set the block size to 1M to improve write speed
- status=progress: Display write progress to monitor the writing status

### Verify Write Result

After writing is complete, you can verify if the partition table in NVMe was created correctly:

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
sudo fdisk -l /dev/nvme0n1
```
</NewCodeBlock>

If written correctly, you should see partition information similar to the following:

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-16.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Booting from NVMe

### Restart Preparation

After completing the above operations, please follow these steps:

1. Shut down the system: `sudo shutdown -h now`
2. Disconnect power from the Radxa E54C
3. Remove the MicroSD card
4. Reconnect the power
5. Wait for the system to boot from NVMe

### Verify NVMe Boot

After the system boots, you can verify if the system has successfully booted from NVMe by:

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
lsblk
df -h
```
</NewCodeBlock>

If you see `/dev/nvme0n1p3` mounted as the root directory `/`, it means the system has successfully booted from NVMe.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-15.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Common Issues and Solutions

:::tip
If you encounter issues during the boot process, try the following solutions:

- **System Fails to Boot**:

  - Reinsert the MicroSD card and boot the system
  - Try changing the Bootloader file option for the SPI Flash (prioritize the latest version)
  - Check if the M.2 interface is properly connected; try reseating the NVMe drive

- **System Boots But Cannot Log In**:
  - Default username: `radxa`, password: `radxa`
  - If the password is incorrect, you can boot using the MicroSD card again, then re-download and rewrite the system image
    :::

## Next Steps

After successfully booting from NVMe, you can perform the following operations:

### System Update

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
sudo apt update && sudo apt upgrade
```
</NewCodeBlock>

### System Backup

Regularly back up important data using the `dd` or `rsync` command.

### Performance Testing

- Test Read Speed

Test read speed (1GB of data).

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
sudo dd if=/dev/nvme0n1 of=/dev/null bs=1M count=1024 iflag=direct
```
</NewCodeBlock>

- Check NVMe Temperature

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
# Install nvme-cli
sudo apt install nvme-cli
# Check temperature
sudo nvme smart-log /dev/nvme0n1 | grep "temperature"
```
</NewCodeBlock>

- View NVMe Device Details and Health Status

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```bash
sudo nvme list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e54c/rsetup-17.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
