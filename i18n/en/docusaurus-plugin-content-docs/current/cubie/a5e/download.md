---
sidebar_position: 8
---

# Resource Downloads

## System Images

:::tip Beginner's Recommendation
We strongly recommend that beginners download GPT format Radxa OS official images and use the [Balena Etcher](./getting-started/quickly-started#install-system-image) tool to install them to MicroSD cards. This is the simplest and fastest way to get started.

**Image Type Description**

- GPT System Images (Recommended for beginners):

  - Suitable for MicroSD cards or NVMe SSDs
  - Use Balena Etcher graphical tool, simple operation
  - Support `dd` command line flashing
  - Radxa recommended image type, best compatibility

- FEL System Images:
  - Flash via FEL mode and Phoenix tools
  - Mainly used for onboard eMMC storage installation
  - Suitable for device repair and mass production
  - Requires some technical knowledge

:::

### Debian Linux

#### GPT System Images (Recommended)

- [Radxa OS - Debian 11 Bullseye KDE](https://github.com/radxa-build/radxa-cubie-a5e/releases/download/rsdk-b1/radxa-cubie-a5e_bullseye_kde_b1.output_512.img.xz)
- [Tina Linux - Debian 11 Bullseye XFCE](https://mega.nz/file/g7AWVBZJ#xkDOIJYHvgUngdKUgW7D_aSaVPifyYZDOG0fUOtgAMk)

#### FEL System Images

- [Tina Linux - Debian 11 XFCE](https://mega.nz/file/g7AWVBZJ#xkDOIJYHvgUngdKUgW7D_aSaVPifyYZDOG0fUOtgAMk)

### Android

#### FEL System Images

- [Android 13](https://mega.nz/file/NjxmXBbT#EaY4bTCNCKTWp8e9r9q2da9EijEovJdlJx_7_xXP-akk)

## Flashing Tools

- **[Balena Etcher](https://etcher.balena.io/)** (Windows / Linux / macOS)

  - Suitable for GPT system images
  - User-friendly interface, simple operation
  - Automatic image integrity verification
  - Best for installing systems to MicroSD cards or NVMe SSDs

- **[PhoenixSuit (Windows)](https://dl.radxa.com/tools/windows/PhoenixSuit_V2.0.4.zip)** / **[LiveSuit (Linux)](https://dl.radxa.com/tools/linux/LiveSuit_Linux_V3.0.8.zip)**

  - Suitable for FEL system images
  - Connect via USB-C data cable
  - Can flash directly to eMMC storage
  - Requires some technical knowledge

- **[PhoenixCard](https://dl.radxa.com/tools/windows/PhoenixCard_V4.3.1.zip)** (Windows)
  - Supports creating bootable MicroSD cards with FEL firmware
  - Can be used for mass production scenarios

## Hardware Design

- [Schematic V1.20](https://dl.radxa.com/cubie/a5e/docs/hw/v1.2/radxa_cubie_a5e_schematic_v1.2_20250113.pdf)
- [Component Placement Map V1.20](https://dl.radxa.com/cubie/a5e/docs/hw/v1.2/radxa_cubie_a5e_components_placement_map_v1.2_20250113.pdf)
- [3D Files V1.20](https://dl.radxa.com/cubie/a5e/docs/hw/v1.2/radxa_cubie_a5e_pcba_3d_v1.2_stp_20250224.zip)
