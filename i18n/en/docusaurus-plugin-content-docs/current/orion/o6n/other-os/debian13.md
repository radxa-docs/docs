---
sidebar_position: 1
---

# Debian 13

This document explains how to use **Debian 13 (trixie)** on **Radxa Orion O6 / Orion O6N** and install the open-source driver stack through the CIX community repository.

:::warning Scope

- This document only applies to **Debian 13 (trixie)**
- This stack is intended for kernel development, driver validation, and early community testing
- For stable daily use or production deployment, prefer the official Radxa system images; for the stable CIX driver stack, refer to the closed-source branch based on kernel 6.6

:::

## Overview

The CIX open-source driver solution is based on a mainline development kernel and mainly installs:

- `linux-image-7.0.0-rc5-generic`
- `linux-headers-7.0.0-rc5-generic`
- `cix-npu-driver-dkms`
- `cix-vpu-driver-dkms`

Compared with flashing a full DD image, this method is easier to install, update, and remove through `apt`, so it is better suited to development and validation work.

## Prerequisites

Before you begin, make sure:

- Your device BIOS is already updated:
  - Orion O6: see [Orion O6 BIOS Update](../../o6/low-level-dev/bios.md)
  - Orion O6N: see [BIOS Update](../low-level-dev/bios.md)
- You have prepared a USB flash drive with at least 8GB capacity
- You have a computer available to download the image and write it to the USB drive
- Your current user has `sudo` privileges

:::warning Required BIOS Setting

After flashing the BIOS, enter BIOS Setup and enable the option below. Otherwise, some drivers may fail to load under the `7.0` kernel:

`Device Manager` -> `Platform Configuration` -> `Compliance Configuration` -> `Enable ACPI SCMI`

:::

## Install Debian 13

### 1. Download the Debian 13 installation image

Download a **Debian 13 arm64** installation image. If you want a desktop system directly, choose an installer image with GNOME. If you use `netinst`, you can also select the GNOME desktop environment during installation.

You can use one of these mirror directories:

- Debian official: <https://cdimage.debian.org/debian-cd/current/arm64/>
- Tsinghua University: <https://mirrors.tuna.tsinghua.edu.cn/debian-cd/current/arm64/>
- USTC: <https://mirrors.ustc.edu.cn/debian-cd/current/arm64/>
- Aliyun: <https://mirrors.aliyun.com/debian-cd/current/arm64/>

### 2. Write the image to a USB drive

Write the downloaded Debian 13 installation image to a USB drive. You can use any of the following tools:

- Balena Etcher
- Rufus
- `dd`

### 3. Boot from the USB drive and install the system

Insert the USB drive into the device, select USB boot from the BIOS boot menu, and complete the installation by following the Debian installer.

Recommended target media:

- Orion O6: install to an NVMe SSD
- Orion O6N: install to an NVMe SSD or UFS module

### 4. First boot into the system

After installation, boot into Debian 13 and confirm:

- the system has working network access
- the current user has `sudo` privileges

Then continue with the next section to configure the CIX PPA and install the open-source drivers.

## Configure the CIX PPA and Install the Open-Source Driver Stack

### 1. Enable backports and install required packages

The open-source driver stack depends on newer firmware from Debian 13 backports:

```bash
echo "deb https://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list.d/debian-trixie-backports.list
sudo apt update
sudo apt install firmware-misc-nonfree libgl1-mesa-dri -t trixie-backports
```

:::tip Local mirrors
If a regional Debian mirror works better in your network environment, you can replace `deb.debian.org` with that mirror while still using a dedicated `.list` file.
:::

### 2. Run the CIX setup script

```bash
curl -fsSL -o cix-repo-community.sh https://archive.cixtech.com/cix-repo-community.sh
sudo sh ./cix-repo-community.sh
```

The script prompts you to choose an action. The common options are:

- `1`: install the closed-source driver stack
- `2`: install the open-source driver stack
- `3`: remove the installed CIX driver stack

If you want to install the open-source driver stack described in this document, enter `2`.

:::warning Review the script before execution
Download the script locally and review it before running `sudo sh`, instead of piping remote content directly into a root shell.
:::

### 3. Reboot

```bash
sudo reboot
```

## Verify the Installation

After rebooting, run:

```bash
uname -r
dpkg -l | grep firmware-misc-nonfree
dpkg -l | grep cix
```

Under normal conditions, `uname -r` should report `7.0.0-rc5-generic`.

## Repository and Important Paths

The CIX setup script automatically:

- imports the repository GPG key
- writes the CIX APT source entry
- installs the open-source kernel and DKMS drivers
- updates the default GRUB boot target

Related paths:

- APT source: `/etc/apt/sources.list.d/cix-deb-repo.list`
- GPG key: `/usr/share/keyrings/cix-deb-repo.gpg`
- GRUB config: `/etc/cix/grub-config.env`

## Maintenance

### Update the system

Use the following command sequence as the recommended update path:

```bash
sudo apt update
sudo apt full-upgrade
```

### List installed CIX packages

```bash
dpkg -l | grep cix
apt list --installed | grep cix
```

### Search available packages

```bash
apt search cix-
```

## Remove the Open-Source Driver Stack

Run the script again and choose option `3`:

```bash
curl -fsSL -o cix-repo-community.sh https://archive.cixtech.com/cix-repo-community.sh
sudo sh ./cix-repo-community.sh
```

The script removes the open-source kernel packages, CIX-related configuration, and attempts to restore the system to its previous state.

## References

- [CIX PPA User Manual (Open-Source Driver Edition)](https://github.com/cixtech/cix-developer-docs/wiki/CIX%20PPA%20User%20Manual%20%28Open%E2%80%90Source%20Driver%20Edition%29)
- [CIX SoC Mainline Support](https://github.com/cixtech/linux-mainline/wiki)
