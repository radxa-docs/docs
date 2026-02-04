---
sidebar_position: 8
---

# Downloads and resources

## System images

:::tip Recommended for beginners
We strongly recommend that new users download the GPT-format Radxa OS official image and flash it to a microSD card with [Balena Etcher](./getting-started/install-system/microsd). This is the simplest and fastest way to get started.

**Image type notes**

- GPT system image (recommended for beginners):

  - Works with microSD cards or NVMe SSDs
  - Easy to flash with Balena Etcher (GUI)
  - Can also be flashed with the `dd` command
  - The recommended format for best compatibility

- FEL system image:
  - Flashed via FEL mode with the Phoenix tool
  - Mainly used for installing to onboard eMMC
  - Useful for device recovery and mass production
  - Requires some technical experience

:::

### Debian Linux

#### GPT system image (recommended)

:::info A733 SoC image release page

- [Radxa Cubie A7S](https://github.com/radxa-build/radxa-a733/releases)

This page publishes the latest stable and test images. Test versions start with `t`, stable versions start with `r` (older stable versions start with `b`).

:::

- Radxa OS

[radxa-a733-bullseye-kde-r2](https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_kde_r2.output_512.img.xz): supports booting from microSD and onboard eMMC.

- Radxa OS Lite

:::tip

Radxa OS Lite does not include a graphical desktop environment.

If you need a monitor UI or graphical applications, use the full Radxa OS image.

:::

[radxa-a733-bullseye-cli-r2](https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_cli_r2.output_512.img.xz): supports booting from microSD and onboard eMMC.

## Hardware design

- [Schematic V1.10](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_schematic_v1.10.pdf)
- [Component Placement Map V1.10](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_components_placement_map_v1.10.pdf)
- [2D Dimensions](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_2d_dimensions_v1.10.pdf)
- [2D Files](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_2d_v1.10.zip)
- [3D Files](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_3d_stp_v1.10.zip)

## References

### [Tina 5.0 AIoT documentation](https://gitlab.com/tina5.0_aiot/product/docs/)

:::tip

The [Tina5.0 AIoT documentation](https://gitlab.com/tina5.0_aiot/product/docs/) is primarily available in Chinese.

:::

This documentation is the companion technical support system for Allwinner A-series (A527, A733, etc.) and T-series (T527, etc.) chips, covering the full lifecycle from “hardware design → software development → tooling adaptation → mass production”. The main audience includes:

1. Hardware engineers: design and bring-up support

2. Linux/AIoT developers: drivers and application development based on Tina5.0 SDK

3. Manufacturing engineers: practical troubleshooting during production

4. Compliance/procurement: BOM compatibility and certification information

#### Hardware documents

- Hardware BOM list

Defines the compatible core components and selection guidance, including camera modules, LCD/eDP panels, Wi‑Fi/BT modules, input sensors, DRAM, and eMMC/NAND storage.

- Hardware design resources

Provides reusable templates and design guidelines such as reference schematics, dev board/prototype schematics, PCB reference templates, design guides, and hardware checklists, plus IBIS models and PMIC selection notes.

- Chip manuals

Includes datasheets, pinouts, user manuals, product briefs, and (for some chips) related PMIC manuals.

#### Software documents

- SDK module development guide

Focused on driver development for hardware interfaces, with 20+ core modules (display, audio/video, storage & connectivity, performance modules, and system basics) to speed up bring-up.

- Base component development guide

Covers system deployment, multimedia/graphics, testing/tools, security, and heterogeneous computing to reduce the barrier for application and system configuration.

#### Tooling documents

Practical guides and tooling ecosystem information aimed at improving development efficiency and easing production.

#### Mass production documents

End-to-end troubleshooting guidance for common production issues.

- Pre-production validation guide: BOM validation process and pilot-run stability checklist to mitigate compatibility and stability risks early.

- Production troubleshooting guide: steps for isolating issues in flashing/boot, MMC/eMMC storage, I/O, display, security, etc., plus examples and solutions.

- Production process specification: Allwinner T-series production guidance, ESD handling, failure analysis processes, and standard operating/compliance requirements to improve consistency and yield.
