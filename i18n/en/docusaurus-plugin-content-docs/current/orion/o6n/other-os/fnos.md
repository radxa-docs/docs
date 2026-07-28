---
sidebar_position: 2
---

# FnNAS fnOS

This document explains how to install **FnNAS fnOS** (ARM public beta) on **Radxa Orion O6N** (CIX P1 SoC) and points to the upstream FnNAS install guide and help center.

:::warning Scope and Current Status

- This document only applies to **Radxa Orion O6N** (CIX P1 SoC)
- FnNAS support on Orion O6N is **community-validated**, not an officially maintained Radxa distribution
- The **ARM build of FnNAS fnOS is currently in public beta** and may include instability, data loss, or functional issues. Test only on non-critical environments and back up important data beforehand
- Read the [FnNAS ARM Public Beta Disclaimer](https://help.fnnas.com/articles/v1/contact/disclaimers.md) before installing

:::

## Prerequisites

Before you begin, make sure:

- The device BIOS is updated to a recent version. Orion O6N and Orion O6 share the BIOS update flow; see [Orion O6 BIOS Update](../../o6/low-level-dev/bios.md)
- You have a USB flash drive with at least 16 GB capacity (USB 3.0 recommended)
- You have a system disk for fnOS, either an NVMe SSD or a UFS module (recommended ≥ 64 GB)
- You have a display, keyboard, mouse, and an Ethernet cable (wired network is recommended; pure Wi-Fi support is still unstable in the public beta)
- You have read the [FnNAS ARM Public Beta Disclaimer](https://help.fnnas.com/articles/v1/contact/disclaimers.md)

## 1. Download the FnNAS Image for CIX P1

Open the FnNAS fnOS ARM download page: [FnNAS fnOS ARM Download Page](https://www.fnnas.com/download-arm).

Find the image that supports **CIX P1** in the device support list:

- Image category: **UEFI ARM Installation Image ISO** (file tag `armsr`)
- That category explicitly lists **CIX P1** as supported (along with Apple M-series virtualization, Phytium, and Huawei Kunpeng on UEFI ARM platforms)

After locating the image on the page, follow the on-page prompt to download the latest version yourself. Specific version and build numbers change with each public beta release; always trust the FnNAS ARM download page.

:::tip Verify the Image
After download, verify the MD5 hash published on the FnNAS page before writing it to the install media to avoid using a corrupted image.
:::

## 2. Follow the Upstream FnNAS Tutorial to Install and Initialize

Write the `armsr` ISO to a USB flash drive using any of the following tools:

- Balena Etcher
- Rufus (recommended on Windows)
- `dd` (Linux / macOS)

Then follow the upstream FnNAS tutorial to complete the rest:

- FnNAS upstream tutorial: [How to install and initialize FnNAS fnOS](https://help.fnnas.com/articles/v1/start/install-os)

High-level steps:

1. Plug the USB drive into Orion O6N and select the USB drive from the BIOS boot menu
2. Choose `Graphical Install` in the installer menu
3. Select the NVMe SSD or UFS module used as the fnOS system disk and complete partitioning and Swap settings (system partition ≥ 64 GB recommended)
4. Confirm the format prompt and start the installation
5. Configure networking when prompted (wired + DHCP recommended)
6. Remove the boot USB drive and reboot. Note the IP address assigned
7. Open the IP address in a browser and complete device name, admin account, storage space, and other initialization steps

:::tip Differences From the Upstream Tutorial

- The upstream FnNAS tutorial uses an x86 image for examples. This document uses the ARM public beta `armsr` ISO; follow the steps on this page
- If the installer prompts you to disable Secure Boot, see [Install Troubleshooting](https://help.fnnas.com/articles/fnosV1/start/install-os-fail.md)
- After disabling Secure Boot, return to BIOS `Device Manager` → `Platform Configuration` → `Compliance Configuration` and confirm `Enable ACPI SCMI` is still enabled

:::

## 3. Day-to-Day Use and Maintenance

Day-to-day use, backup, remote access, file sharing, and App installation follow the same flow as the x86 version of fnOS. See the FnNAS help center:

- [FnNAS Help Center](https://help.fnnas.com/)
- [How to Create Storage Space](https://help.fnnas.com/articles/fnosV1/volume/create.md)
- [How to Remotely Access FnNAS](https://help.fnnas.com/articles/v1/access/how-access)
- [How to Install FnNAS Apps](https://help.fnnas.com/articles/fnosV1/start/install-app.md)

## 4. Public Beta Issue Reports

If you hit issues on the ARM public beta, please file them in the [FnNAS Community ARM Section](https://club.fnnas.com/forum.php?mod=forumdisplay&fid=35) and include:

- Device model (Radxa Orion O6N) and BIOS version
- fnOS image version and build number
- Full reproduction steps and relevant logs

## References

- [FnNAS fnOS ARM Download Page](https://www.fnnas.com/download-arm)
- [FnNAS fnOS Install and Initialize Tutorial](https://help.fnnas.com/articles/v1/start/install-os)
- [FnNAS ARM Public Beta Disclaimer](https://help.fnnas.com/articles/v1/contact/disclaimers.md)
- [FnNAS Community ARM Section](https://club.fnnas.com/forum.php?mod=forumdisplay&fid=35)