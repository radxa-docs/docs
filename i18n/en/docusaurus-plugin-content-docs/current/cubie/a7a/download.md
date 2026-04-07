---
sidebar_position: 150
---

# Resource Summary Download

## System Images

:::tip For Beginners
We strongly recommend that new users download the official Radxa OS GPT image and use the [Balena Etcher](./getting-started/install-system/sd-system.md) tool to install it onto a MicroSD card. This is the simplest and quickest way to get started.

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

:::tip A733 Unified System Image

- [Latest system image release page](https://github.com/radxa-build/radxa-a733/releases)

Suitable for all A733 SoC products, such as Cubie A7Z, Cubie A7A, etc. Beta versions start with `t`, while official releases start with `r`.

:::

Currently supports booting from MicroSD cards, eMMC modules, and UFS modules. NVMe/SSD boot requires flashing the SPI Nor Flash firmware.

- [Radxa Cubie A7A Debian 11 KDE R2](https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_kde_r2.output_512.img.xz) (SD / eMMC)

- [Radxa Cubie A7A Debian 11 KDE R2](https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_kde_r2.output_4096.img.xz) (UFS)

:::tip Cubie A7A Legacy Images

- [Radxa Cubie A7A](https://github.com/radxa-build/radxa-cubie-a7a/releases)

This page contains legacy system images for Cubie A7A and is no longer updated.

:::

### Android

Compatible with MicroSD cards, eMMC modules, and UFS modules.

#### FEL System Image

:::tip Differentiate audio codec versions

You can refer to the [Headphone Jack](./hardware-use/headphone.md) guide to identify which audio codec version your board uses.

:::

- [Radxa Cubie A7A Android 13 20250814](https://github.com/radxa/allwinner-android-manifests/releases/download/A733-Android13-20250814/a733_android13_radxa_a7a_20250814_uart0.zip): for Cubie A7A with AC101 audio codec

- [Radxa Cubie A7A Android 13 20260206](https://github.com/radxa/allwinner-android-manifests/releases/download/A733-Android13-20260205/a733_android13_radxa_a7a_20260206_uart0.zip): for Cubie A7A with AC101B audio codec

## Flashing Tools

SD Card Boot Disk Creation Tool:

[PhoenixCard V4.3.2](https://dl.radxa.com/tools/windows/PhoenixCard_V4.3.2_20250331_1604_Release.zip)

System Flashing Tools:

[PhoenixSuit](https://dl.radxa.com/tools/windows/PhoenixSuit_V2.0.4.zip) (Windows)

[LiveSuit](https://dl.radxa.com/tools/linux/LiveSuit_Linux_V3.0.8.zip) (Linux)

## Hardware Design

- [Schematic V1.10](https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_schematic.pdf)
- [Component Placement Map V1.10](https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_Components_Placement_map.pdf)

## Download Frequently Asked Questions

### Q: The download fails halfway through, showing "Failed to download, an issue occurred"
A: This is usually caused by:

1. **Unstable network connection**
   - Try using wired connection instead of WiFi
   - Restart router or change network environment
   - Use download manager tools (e.g., IDM, FDM) that support resume capability

2. **Browser cache issues**
   - Clear browser cache and cookies
   - Try private/incognito mode
   - Switch to other browsers (Chrome, Firefox, Edge)

3. **GitHub Releases download issues**
   - GitHub downloads may interrupt due to network restrictions
   - Try using command-line tools `wget` or `curl`:
     ```bash
     # Using wget (supports resume)
     wget -c https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_kde_r2.output_512.img.xz
     
     # Using curl
     curl -L -O -C - https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_kde_r2.output_512.img.xz

     ```

4. **Baidu Netdisk download issues**
   - Ensure you are logged into Baidu Netdisk account
   - Check if Baidu Netdisk client is installed (large files usually require client)
   - Try using mobile Baidu Netdisk App

5. **Antivirus software interference**
   - Temporarily disable antivirus or firewall
   - Add download tools to antivirus whitelist

6. **Insufficient disk space**
   - Ensure enough disk space (image file requires extra space after decompression)
   - Reserve at least 2 times the image file size

### Q: Download speed is very slow, what to do?
A:
- Try downloading during off-peak hours (e.g., midnight)
- Use download accelerator or VPN
- For GitHub downloads, try using mirror sites
- For Baidu Netdisk, consider purchasing membership for speed boost

### Q: Downloaded file is corrupted or verification fails?
A:
1. **Verify file integrity**
   - Compare MD5/SHA256 checksums if available
   - Use `md5sum` or `sha256sum` commands to verify

2. **Re-download**
   - Delete corrupted downloaded file
   - Re-download entire file (avoid resume)

3. **Use officially recommended tool**
   - Use [Balena Etcher](https://www.balena.io/etcher/) to write image directly, it automatically verifies file integrity

### Q: Are there other download options?
A:
- Try visiting [Radxa official mirror server](https://dl.radxa.com/) for alternative download sources
- Ask other users in community forums or Discord for backup download links
- Follow [Radxa official announcements](https://forum.radxa.com/) for latest download information

If none of the above solutions work, please report the specific problem in [GitHub Issues](https://github.com/radxa-docs/docs/issues). We'll do our best to help resolve it.

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

  Offers reusable design templates and specifications, including reference schematics, motherboard/prototype schematics, PCB reference designs, design guidelines, and hardware checklists. Also includes IBIS models and PMIC selection guides to directly support hardware development.

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
