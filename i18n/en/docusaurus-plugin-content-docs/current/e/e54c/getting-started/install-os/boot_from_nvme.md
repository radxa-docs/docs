---
sidebar_position: 2
---

# Installing System to NVMe

## Overview

To boot the Radxa E54C system from NVMe, you first need to boot the system using a MicroSD card or eMMC, then flash the SPI Flash using the `rsetup` tool, and finally write the system image to the NVMe device using the `dd` command.

This tutorial demonstrates booting the system from a MicroSD card. The installation process is the same for eMMC systems.

## Booting the System

Refer to the [Quick Start](../quick-start) guide to boot the system from a MicroSD card.

After confirming that the Radxa E54C system has successfully booted, shut it down and disconnect the power. Then, insert the NVMe drive into the M.2 slot on the Radxa E54C motherboard.

:::tip
The MicroSD card serves as a boot disk similar to an x86 system. Its purpose is to provide a Linux environment for system installation, obtain the SPI Flash image file (`spi.img`), and then flash `spi.img` to the SPI Flash using the `rsetup` tool.
:::

## Flashing the SPI Flash

Use the system configuration tool `rsetup` to flash `spi.img` to the SPI Flash.

### Updating rsetup

:::tip
rsetup Tool Guide: Interface may vary slightly between versions. Please refer to the actual interface.

- Confirm selection: Press `Enter`
- Cancel selection: Press `ESC`
- Toggle options: Use arrow keys
- Multi-selection interface: Press `Space` to select, then `Enter` to confirm
  :::

Open the system command line and run the `rsetup` tool to update.

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```
rsetup
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  rsetup Main Interface
  <img src="/img/e/e54c/rsetup-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

1. Update the system
Navigate to `System` → `System Update`:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Select `yes` to continue, then follow the on-screen instructions to complete the remaining steps:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Restart the system after completing all operations.

### Enabling the SPI Flash Device

To prevent accidental writes to the bootloader stored in the SPI Flash during normal use, the SPI Flash device is disabled by default. Enable it as follows:

Select `Overlays` → `Manage Overlays`:

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
  <img src="/img/e/e54c/rsetup-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Select the `Enable SPI Flash` option, press the spacebar to display a `*` indicating the SPI Flash is enabled, then press `Enter` to confirm:

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Follow the on-screen instructions to complete the remaining steps:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Restart the system after completing all operations.

### Flashing the SPI Flash

After rebooting, open the `rsetup` configuration tool again.

Select `System` → `Bootloader Management` → `Update SPI Bootloader`:

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-10.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-11.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-12.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Select the Bootloader file to install. If there are multiple options, prioritize the one with the 'spi' suffix:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-13.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Follow the on-screen instructions to complete the remaining steps:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-14.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
Restart the system after completing all operations.

## Writing the System Image to NVMe

After successfully flashing the SPI Flash, verify that the system recognizes both the SPI Flash and NVMe devices.

### Checking Devices

Open the system command line and use the `lsblk` command to check if the NVMe device is recognized.

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```
lsblk
```
</NewCodeBlock>

- If the Linux system recognizes the SPI Flash device, it will typically appear as `mtdblock*`
- If the Linux system recognizes the NVMe device, it will typically appear as `nvme*n*`

Example output of `lsblk`:
<NewCodeBlock tip="radxa@radxa-e54c$" type="host">

```
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

</NewCodeBlock>

### Downloading the System Image

Download the Radxa E54C system image file locally using the `wget` command. You can copy the download link from the [Downloads](../../download) page.

:::tip
You can also download the system image from the [Resource Summary Download](../../download) page, and then copy the system image file to the Radxa E54C via a USB flash drive or online transfer (such as FTP, SCP, etc.)
:::

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```
# Install wget if not already installed
sudo apt-get install wget

# Download the system image file

wget https://github.com/radxa-build/radxa-e54c/releases/download/rsdk-b2/radxa-e54c_bookworm_cli_b2.output.img.xz

```
</NewCodeBlock>

- wget: Downloads files. Add the download link after the command.

### Writing the System Image to NVMe

Use the following command to extract and write the compressed system image directly to the NVMe device.

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo xzcat ~/radxa-e54c_bookworm_cli_b2.output.img.xz | sudo dd of=/dev/nvme0n1 bs=1M status=progress

```
</NewCodeBlock>

- xzcat: Extracts the xz-compressed system image file
- dd: Copies and writes to the NVMe device (⚠️ Caution: Verify the device name when using the dd command. An incorrect device name may result in data loss)
- of=/dev/nvme0n1: Specifies the target device as nvme0n1
- bs=1M: Sets the block size to 1M for faster writing
- status=progress: Displays the write progress

### Verifying the Write Operation

After writing is complete, verify that the partition table in the NVMe was created correctly:

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo fdisk -l /dev/nvme0n1

```
</NewCodeBlock>

If successful, you should see partition information similar to the following:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-16.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Booting from NVMe

### Preparing to Reboot

After completing the above steps, follow these instructions:

1. Shut down the system: `sudo shutdown -h now`
2. Disconnect power from the Radxa E54C
3. Remove the MicroSD card
4. Reconnect the power
5. Wait for the system to boot from NVMe

### Verifying NVMe Boot

After the system boots, verify that it successfully booted from NVMe using the following commands:

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

lsblk
df -h

```
</NewCodeBlock>

If you see `/dev/nvme0n1p3` mounted as the root directory `/`, the system has successfully booted from NVMe.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-15.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Common Issues and Solutions

:::tip
If you encounter issues during boot, try the following solutions:

- **System fails to boot**:
  - Reinsert the MicroSD card and boot the system
  - Try a different Bootloader file option for the SPI Flash (preferably the latest version)
  - Check the M.2 connection and try reseating the NVMe drive

- **System boots but cannot log in**:
  - Default username: `radxa`, password: `radxa`
  - If the password is incorrect, boot using the MicroSD card again and re-download/write the system image
:::

## Next Steps

After successfully booting from NVMe, you can perform the following actions:

### System Update

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo apt update && sudo apt upgrade

```
</NewCodeBlock>

### System Backup

Regularly back up important data using `dd` or `rsync` commands.

### Performance Testing

- Test read speed

Test read speed (1GB of data):

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo dd if=/dev/nvme0n1 of=/dev/null bs=1M count=1024 iflag=direct

```
</NewCodeBlock>

- Check NVMe temperature

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

# Install nvme-cli

sudo apt install nvme-cli

# Check temperature

sudo nvme smart-log /dev/nvme0n1 | grep "temperature"

```
</NewCodeBlock>

- View detailed information and health status of the NVMe device

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo nvme list

```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-17.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
```
