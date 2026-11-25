---
sidebar_position: 4
---

# Armbian

Armbian is a lightweight Linux distribution for ARM motherboards, known for its stability, high performance, and excellent hardware support. It provides Debian and Ubuntu-based systems optimized for various ARM single-board computers.

:::tip
Radxa Dragon Q6A requires the latest UEFI firmware to run Armbian. Firmware download: [Dragon Q6A Firmware Snapshot](https://forum.radxa.com/t/radxa-dragon-q6a-firmware-snapshot/)
:::

## System Image Downloads

Armbian 26.11 now officially supports the Radxa Dragon Q6A, with Debian and Ubuntu-based images. The mainline kernel for this release is Linux 7.3 (edge kernel 7.3.1 on Q6A), and a vendor kernel 7.0.11 is also available:

### Recommended Images

Tested and stable images hand-selected by the Armbian team (Armbian 26.11.2, built on Nov 20, 2026):

- **Ubuntu 26.04 (Resolute) - Gnome Desktop**: Full desktop environment for daily use
- **Debian 13 (Trixie) - Minimal**: Lightweight system for IoT applications

### Desktop Images

- **Ubuntu 26.04 (Resolute) - Gnome / KDE Plasma**: edge mainline kernel 7.3.1 or vendor kernel 7.0.11
- **Debian 14 (Forky) - Hyprland**: edge mainline kernel 7.3.1

### Minimal / IoT Images

- **Ubuntu 26.04 (Resolute) - Minimal**: edge mainline kernel 7.3.1 or vendor kernel 7.0.11
- **Debian 13 (Trixie) - Minimal**: edge mainline kernel 7.3.1 or vendor kernel 7.0.11

### Dedicated Application Images

- **Home Assistant** (Debian 13)
- **OpenMediaVault** (Debian 13)

:::note
Armbian provides weekly security updates with CVE backports. Qualcomm hardware enablement is ongoing, and some features may become available in later releases. Refer to the download page for the current list of images.
:::

Download: [Armbian Dragon Q6A Download Page](https://www.armbian.com/boards/radxa-dragon-q6a)

## Flashing to UFS Storage

To flash the Armbian image to UFS storage, you can use the same `edl-ng` tool used for flashing firmware:

```bash
./edl-ng --loader prog_firehose_ddr.elf --memory UFS write-sector 0 *.img
```

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
