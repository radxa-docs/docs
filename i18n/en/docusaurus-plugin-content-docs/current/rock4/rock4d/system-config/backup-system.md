---
sidebar_position: 9
---

# System Backup

This guide introduces two methods for backing up your system: online script backup and offline backup (using the `dd` command), allowing users to choose the most suitable method based on their needs.

The final backup file will be in `img` format.

:::caution
Before proceeding, ensure you have backed up all important data.
The script backup has only been tested on official Radxa systems and does not support Android.
:::

## Online System Backup

Online system backup refers to backing up a running system directly on the development board.

:::tip
The script backup only supports Linux systems and is the recommended method for backing up Debian and Ubuntu systems.
:::

### Download the Script

Use the `curl` command on the development board to download the script.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
curl -sL https://rock.sh/rockpi-backup -o rockpi-backup.sh
```
</NewCodeBlock>

### Add Execute Permission

Make the script executable.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
chmod +x rockpi-backup.sh
```
</NewCodeBlock>

You can use the `-h` parameter to view the script's help information.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo ./rockpi-backup.sh -h
```
</NewCodeBlock>

Example terminal output:

```
Usage:
  sudo ./rockpi-backup.sh [-o path|-e pattern|-u|-m path]
    -o Specify output position, default is $PWD.
    -e Exclude files matching pattern for rsync.
    -u Unattended, no need to confirm in the backup process.
    -m Back up the root mount point, and support backups from other disks as well.
```

### Backup the System

Run the script with root privileges. You'll need to manually confirm dependency installation and backup operations during the process.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo ./rockpi-backup.sh
```
</NewCodeBlock>

:::tip
The script performs the following operations:

1. Checks for root privileges
2. Checks and installs dependencies
3. Reads the running system kernel name and sets the filename accordingly
4. Checks partition details
5. Sets the root mount point to /
6. Finds other partitions on the same disk as the root path
7. Installs auto-resize script to the root partition
8. Creates a disk file based on the filename
9. Clones non-root partitions
10. Uses rsync to synchronize root partition contents, excluding currently output files
11. Cleans up and completes

:::

After the backup is complete, the script will display the path to the backup file!

Example terminal output:

```
Backup done, the file is /home/radxa/rock-4d-s16-backup-250612-0930.img
```

## Offline System Backup

Offline system backup involves connecting the development board's system disk to a PC as a removable device for backup.

:::tip
Offline system backup requires converting the system boot disk to a removable medium before connecting it to a PC for backup.

Converting different boot media to removable media:

- MicroSD Card
  Convert the MicroSD card to a removable device using a card reader.

- Non-onboard eMMC Module
  Convert the eMMC module to a removable device using an eMMC reader.

- Non-onboard UFS Module
  Convert the UFS module to a removable device using a UFS reader.

- M.2 NVMe SSD
  Convert the M.2 NVMe SSD to a removable device using an M.2 SSD enclosure.

:::

### Connect to PC

After converting the development board's system boot disk to a removable device, connect it to a PC for backup (recommended to perform the backup on an Ubuntu system).

### Confirm the Disk

Use the `lsblk` command to confirm the removable disk information.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
lsblk
```
</NewCodeBlock>

Example terminal output (in this example, `sda` is the development board's system disk). You can identify the correct device by safely removing and reconnecting the removable media.

```
sda           8:0    1    58G  0 disk
├─sda1        8:1    1    16M  0 part /media/wml/config
├─sda2        8:2    1   300M  0 part
└─sda3        8:3    1  57.6G  0 part
nvme0n1     259:0    0 953.9G  0 disk
├─nvme0n1p1 259:1    0 952.8G  0 part /var/snap/firefox/common/host-hunspell
│                                     /
└─nvme0n1p2 259:2    0     1G  0 part /boot/efi
```

### Backup the System

On your PC, open a terminal and use the `dd` command to back up the system. Adjust the parameters as needed.

<NewCodeBlock tip="PC-Host$" type="host">
```
sudo dd if=/dev/sda of=rock-4d-spi-backup.img bs=4M status=progress
```
</NewCodeBlock>

- `/dev/sda`: The disk corresponding to the development board
- `rock-4d-spi-backup.img`: Specifies the output filename
- `bs=4M`: Block size
- `status=progress`: Shows backup progress and speed

The backup process will display the progress and speed. When complete, it will show the path to the backup file.

Example terminal output:

```
62205722624 bytes (62 GB, 58 GiB) copied, 1609 s, 38.7 MB/s
14839+0 records in
14839+0 records out
62239277056 bytes (62 GB, 58 GiB) copied, 1609.85 s, 38.7 MB/s
```

## System Restoration

To restore a system from a `*.img` file created using the above methods, please refer to the [System Installation](../getting-started/install-system/) guide.
