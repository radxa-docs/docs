---
sidebar_position: 8
---

# Downloads

## System Images

:::tip For Beginners
We strongly recommend that new users download the official Radxa OS GPT image and use the [Balena Etcher](./getting-started/install-system/sd_system.md) tool to install it onto a MicroSD card. This is the simplest and quickest way to get started.

**Image Type Descriptions**

- GPT System Image (Recommended for Beginners):

  - Compatible with MicroSD cards or NVMe SSDs
  - Uses the user-friendly Balena Etcher graphical tool
  - Supports `dd` command line flashing
  - Radxa's recommended image type with best compatibility

- FEL System Image:
  - For flashing via FEL mode and Phoenix tools
  - Primarily used for onboard eMMC storage installation
  - Suitable for device recovery and mass production
  - Requires some technical knowledge

:::

### Debian Linux

#### GPT System Image (Recommended)

:::info Latest System Image Releases

- [Radxa Cubie A7Z](https://github.com/radxa-build/radxa-cubie-a7z/releases)

This page publishes the latest official and beta system images. Beta versions start with `t`, while official releases start with `r` (older official releases start with `b`).

:::

Supports booting from MicroSD cards and onboard UFS.

- [Radxa Cubie A7Z Debian 11](https://github.com/radxa-build/radxa-cubie-a7z/releases/download/rsdk-b1/radxa-cubie-a7z_bullseye_kde_b1.output_512.img.xz) (MicroSD Card)

- [Radxa Cubie A7Z Debian 12](https://github.com/radxa-build/radxa-cubie-a7z/releases/download/rsdk-b2/radxa-cubie-a7z_bullseye_kde_b2.output_4096.img.xz) (UFS)

:::tip A733 Unified System Image

Compatible with all A733 SoC products, such as Cubie A7Z, Cubie A7A, etc. Currently in beta version, we recommend using the stable version above.

If needed, please visit our [latest system image release page](https://github.com/radxa-build/radxa-a733/releases) to get the latest image.

:::

### Android

Compatible with MicroSD cards / UFS modules.

#### FEL System Image

- [Radxa Cubie A7Z Android 13](https://github.com/radxa/allwinner-android-manifests/releases/download/A733-Android13-20250917/a733_android13_radxa_a7z_20250917_uart0.zip)

## Flashing Tools

SD Card Boot Disk Creation Tool:

[PhoenixCard](https://dl.radxa.com/tools/windows/PhoenixCard_V4.3.1.zip)

System Flashing Tools:

[PhoenixSuit](https://dl.radxa.com/tools/windows/PhoenixSuit_V2.0.4.zip) (Windows)

[LiveSuit](https://dl.radxa.com/tools/linux/LiveSuit_Linux_V3.0.8.zip) (Linux)

## Hardware Design

- [Schematic V1.10](https://dl.radxa.com/cubie/a7z/docs/hw/radxa_Cubie_A7Z_v1100__schematic.pdf)
- [Component Placement Map V1.10](https://dl.radxa.com/cubie/a7z/docs/hw/radxa_Cubie_A7Z_v1100_Components_Placement_map.pdf)

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
