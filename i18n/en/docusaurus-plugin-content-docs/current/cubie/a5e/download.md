---
sidebar_position: 150
---

# Resource Downloads

## System Images

:::tip Beginner's Recommendation
We strongly recommend that beginners download GPT format Radxa OS official images and use the [Balena Etcher](./getting-started/quickly-start#install-system-image) tool to install them to MicroSD cards. This is the simplest and fastest way to get started.

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

## References Documentation

### [Tina5.0 AIoT Documentation](https://gitlab.com/tina5.0_aiot/product/docs/)

:::tip

Note: The [Tina5.0 AIoT Documentation](https://gitlab.com/tina5.0_aiot/product/docs/) is primarily available in Chinese.

:::

This documentation system provides comprehensive technical support for Allwinner A-series (A527, A733, etc.) and T-series (T527, etc.) chips. Deeply integrated with Tina5.0 AIoT documentation, it covers the entire product lifecycle from "Hardware Design → Software Development → Tool Adaptation → Mass Production." The primary target users include:

1. **Hardware Engineers**: Supporting hardware solution design and implementation
2. **Linux/AIoT Software Developers**: Adapting drivers and applications for Tina5.0 SDK
3. **Production Line Technicians**: Addressing practical issues in mass production
4. **Compliance and Procurement Personnel**: Accessing material compatibility and environmental certification information

#### Hardware Documentation

- **Bill of Materials (BOM)**

  Defines the core material compatibility range, including supported components such as camera modules, LCD/eDP displays, Wi-Fi/BT modules, input sensors, DRAM, eMMC/NAND storage, etc. Provides selection guidance to ensure component compatibility.

- **Hardware Design Resources**

  Offers reusable design templates and specifications, including reference schematics, development board/prototype schematics, PCB reference designs, design guidelines, and hardware checklists. Also includes IBIS models and PMIC selection guides to directly support hardware development.

- **Chip Manuals**

  Provides core technical parameters, including datasheets, pinout definitions, user manuals, product briefs, and supplementary PMIC manuals for specific chips.

#### Software Documentation

- **SDK Module Development Guide**

  Focuses on hardware interface driver development, featuring documentation for 20+ core modules including display, audio/video, storage and communication, high-performance modules, and system fundamentals. Helps developers quickly complete driver adaptation.

- **Basic Component Development Guide**

  Simplifies application and system configuration, covering system deployment, multimedia and graphics, testing and tools, security, and heterogeneous computing to meet diverse AIoT scenario requirements.

#### Tools Documentation

Centered on "improving development efficiency and lowering the barrier to mass production," provides a tool ecosystem and practical guidelines.

#### Mass Production Documentation

Offers end-to-end solutions for common production line challenges.

- **Pre-Production Verification Guide**: Includes material verification processes and pilot production stability checklists to help users preemptively address material compatibility and solution stability risks.

- **Production Line Troubleshooting Guide**: Covers fault diagnosis steps for critical scenarios such as bootloader programming, MMC/eMMC storage, I/O interfaces, display, and security. Includes typical case studies and solutions to enhance production line issue resolution efficiency.

- **Mass Production Process Standards**: Provides production guidelines for Allwinner T-series chips, ESD (Electrostatic Discharge) operation specifications, and defective product analysis procedures. Defines standard operations and compliance requirements for each production stage to ensure consistency and product yield.
