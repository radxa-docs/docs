---
sidebar_position: 4
---

# Armbian

Armbian is a lightweight Linux distribution for ARM development boards, known for its stability, high performance, and excellent hardware support. It provides Debian and Ubuntu-based systems optimized for various ARM single-board computers.

:::tip
Radxa Dragon Q6A requires the latest UEFI firmware to run Armbian. Firmware download: [Dragon Q6A Firmware Snapshot](https://forum.radxa.com/t/radxa-dragon-q6a-firmware-snapshot/)
:::

## System Image Downloads

Armbian provides multiple system images for Radxa Dragon Q6A:

### Stable Release Images

Based on Linux kernel 6.18, providing a stable user experience:

- **Ubuntu 24.04 (Noble) - Gnome Desktop**: Full desktop environment for daily use
- **Ubuntu 24.04 (Noble) - Minimal**: Lightweight system for IoT applications

### Rolling Release Images

For Linux enthusiasts who want cutting-edge packages:

- **Debian 14 (Forky) - Minimal**
- **Ubuntu 25.04 (Plucky) - Minimal**

:::warning
Rolling releases are only suitable for experienced Linux users and not recommended for production environments.
:::

Download: [Armbian Dragon Q6A Download Page](https://www.armbian.com/radxa-dragon-q6a/)

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
