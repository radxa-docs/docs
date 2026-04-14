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
- You have manually installed **Debian 13 (trixie)** and have working network access
- Your current user has `sudo` privileges

:::warning Required BIOS Setting

After flashing the BIOS, enter BIOS Setup and enable the option below. Otherwise, some drivers may fail to load under the `7.0` kernel:

`Device Manager` -> `Platform Configuration` -> `Compliance Configuration` -> `Enable ACPI SCMI`

:::

## Quick Start

### 1. Enable backports and install required packages

The open-source driver stack depends on newer firmware from Debian 13 backports:

```bash
echo "deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install firmware-misc-nonfree libgl1-mesa-dri -t trixie-backports
```

:::tip Local mirrors
If a regional Debian mirror works better in your network environment, you can replace `deb.debian.org` with that mirror.
:::

### 2. Run the CIX setup script

```bash
curl -fsSL https://archive.cixtech.com/cix-repo-community.sh | sudo sh
```

When prompted, enter `2` to install the open-source driver option.

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

```bash
sudo apt update
sudo apt upgrade
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
curl -fsSL https://archive.cixtech.com/cix-repo-community.sh | sudo sh
```

The script removes the open-source kernel packages, CIX-related configuration, and attempts to restore the system to its previous state.

## References

- [CIX PPA User Manual (Open-Source Driver Edition)](https://github.com/cixtech/cix-developer-docs/wiki/CIX%20PPA%20%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C%EF%BC%88%E5%BC%80%E6%BA%90%E9%A9%B1%E5%8A%A8%E7%89%88%EF%BC%89)
- [CIX SoC Mainline Support](https://github.com/cixtech/linux-mainline/wiki)
