---
sidebar_position: 1
---

# Armbian

Armbian is a lightweight Linux distribution for ARM motherboards, known for its stability, high performance, and excellent hardware support. It provides Debian and Ubuntu-based systems optimized for various ARM single-board computers.

The Radxa Dragon Q8B is based on the Qualcomm Snapdragon 8cx Gen 3 (Qualcomm SC8280XP) compute platform and supports running Armbian.

## System Image Downloads

Armbian provides multiple system images for the Radxa Dragon Q8B, offering two kernel lines: **vendor 7.0.11** (stable) and **edge 7.1.8** (rolling):

### Stable Release Images

Official Armbian images that are hand-selected and well-tested (Stable):

- **Armbian 26.8.1 - Ubuntu 26.04 (Gnome Desktop)**: Based on the vendor 7.0.11 kernel, full desktop environment for daily use
- **Armbian 26.8.1 - Debian 13 (Minimal)**: Based on the vendor 7.0.11 kernel, lightweight system for IoT applications

### Other Images

In addition to the stable releases, Armbian also provides:

- **Desktop**: Ubuntu 26.04 with Cinnamon / Gnome / KDE Plasma desktop environments
- **Minimal**: Ubuntu 26.04 / Debian 13 minimal systems (including versions supporting UFS storage)
- **Dedicated applications**: Kali Linux, Home Assistant, OpenMediaVault, and more

:::tip
- It is recommended to use [Armbian Imager](https://www.armbian.com/imager/) to download and flash images.
- Rolling releases (edge kernel) are only suitable for experienced Linux users and not recommended for production environments.
:::

Download: [Armbian Radxa Dragon Q8B Download Page](https://armbian.com/boards/radxa-dragon-q8b)

## Flashing the System

The Armbian images are flashed in the same way as Radxa OS. Please refer to the following pages:

- [Install system to microSD card](../getting-started/install-system/sd-system)
- [Install system to UFS](../getting-started/install-system/ufs-system/)
- [Install system to NVMe](../getting-started/install-system/nvme-system/)

## First Boot Configuration

On first boot, the system will guide you through basic configuration:

1. Set root password
2. Create a regular user account
3. Confirm language settings
4. (Optional) Transfer system to internal storage

You can also use the `armbian-config` tool for system configuration, including:

- Network settings (static/dynamic IP, hotspot)
- Change login shell (ZSH)
- Enable SSH two-factor authentication
- Install common software
- System optimization, etc.

## Related Resources

- [Official Documentation](https://docs.armbian.com/)
- [Technical Support Forum](https://forum.armbian.com/)
- [Bug Reports](https://www.armbian.com/bugs/)
- [FAQ](https://docs.armbian.com/User-Guide_FAQ/)
