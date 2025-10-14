---
sidebar_position: 10
---

# Upgrade the BIOS

## Download the BIOS file Package

**Radxa X4 BIOS**

- X4 With Onboard eMMC:[Radxa X4 Standard BIOS V007: improve eMMC boot stability](https://dl.radxa.com/x/x4/Radxa_X4_BIOS_V007.zip)

- X4 Without Onboard eMMC:[Radxa X4 Standard BIOS V004: support ASM2806/1806, added secure boot option](https://dl.radxa.com/x/x4/Radxa_X4_BIOS_V004.zip)

<details>
<summary>Old version BIOS</summary>

- [Radxa X4 custom BIOS V003: PCIE Bifurcation ver (only 4 x1)](https://dl.radxa.com/x/x4/Radxa_X4_BIOS_V003.zip)

- [Radxa X4 custom BIOS V002 T: supports IBECC option and hidden option enablement](https://dl.radxa.com/x/x4/Radxa_X4_BIOS_V002_t.zip)

- [Radxa X4 Standard BIOS V002: adds 16GB RAM support](https://rock.sh/x4-bios-update)

</details>

:::warning

- Flashing a custom BIOS may void the warranty, so please proceed with caution.
- Usage: Extract the downloaded BIOS compressed file to a FAT32-formatted USB flash drive, ensuring that the root directory of the USB flash drive contains an EFI folder. Insert the USB flash drive into the X4 and select to boot from the USB device. The system will automatically refresh the BIOS.
- Warning: Do not turn off the computer during the BIOS upgrade!

:::

## Preparation for the Update

- Radxa X4 SBC
- USB Flash Drive with at least 8 GB
- BIOS file Package

## BIOS Update Procedure

- Format the USB flash drive in FAT32. Unzip the downloaded EFI package and place it into the USB flash drive.

- Insert the USB flash drive into the Radxa X4 SBC, preferably in a USB 3.0 port.

- Power on the system, and press F7 to access the BIOS page.

![BIOS_update_01](/img/x/x4/bios_update_01.webp)

- Choose to boot in UEFI mode from the USB flash drive, and the BIOS will automatically refresh. Wait for the process to complete.

![BIOS_update_02](/img/x/x4/bios_update_02.webp)

![BIOS_update_03](/img/x/x4/bios_update_03.webp)
