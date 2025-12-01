---
sidebar_position: 150
---

# Download Resources

This page organizes the download resources for Radxa Orion O6 / O6N by use case. Please select the appropriate section based on your needs (update BIOS / install OS / hardware design), then download the files according to your specific model.

:::info Quick Navigation

- [BIOS Firmware](#bios-firmware)
- [System Images (Radxa OS / Android / OpenHarmony / Fedora)](#system-images)
- [Hardware Design Resources](#hardware-design)

:::

## BIOS Firmware

Radxa Orion O6 and O6N use different BIOS firmware.

<Tabs queryString="versions">
    <TabItem value="Orion O6">
#### Radxa Orion O6
        | Download Platform                                                                     | Format | How to Access                                                                                          |
        | :------------------------------------------------------------------------------------ | :----- | :---------------------------------------------------------------------------------------------------- |
        | [**Radxa DL**](https://dl.radxa.com/orion/o6/images/bios/orion-o6-bios-1.0.0-3.zip)    | `.zip` | Firmware is inside the zip file                                                                       |
        | [**GitHub Release**](https://github.com/radxa-pkg/edk2-cix/releases)                   | `.deb` | Firmware is located in `edk2-cix_***_all.deb` package under `edk2-cix_***_all\data.tar\data\usr\share\edk2\radxa\orion-o6` directory |
    </TabItem>
    <TabItem value="Orion O6N">
#### Radxa Orion O6N
        | Download Platform                                                             | Format | How to Access                                                                                            |
        | :------------------------------------------------------------------- | :------- | :-------------------------------------------------------------------------------------------------- |
        | [**Radxa DL**](https://dl.radxa.com/orion/o6n/images/bios/orion-o6n-bios-1.0.0-5.zip)                      | `.zip`   | Firmware is inside the zip file                                                                                    |
        | [**GitHub Release**](https://github.com/radxa-pkg/edk2-cix/releases) | `.deb`   | Firmware is located in `edk2-cix_***_all.deb` package under `edk2-cix_***_all\data.tar\data\usr\share\edk2\radxa\orion-o6n` directory |
    </TabItem>
</Tabs>

:::tip Extracting \*.deb Files

- **Windows**: Use `7-Zip` to extract `.deb` files
- **Linux**: Use `KDE Ark` to extract `.deb` files
- **macOS**: Use `ar -x` command to extract `.deb` files

:::

## System Images

:::info Version Information

- **Test Versions**: Start with `t` (e.g., t1, t2)
- **Release Versions**: Start with `r` (e.g., r1, r2)

Latest Radxa OS releases: [**GitHub Releases**](https://github.com/radxa-build/orion-o6/releases)
:::

### Radxa OS

Radxa Orion O6 and O6N use the same system images. Please select the appropriate image file based on your boot medium.

- **Compatible Models**: Radxa Orion O6 / O6N
- **Recommended Use Case**: A desktop system fully customized and tested by the Radxa team, suitable for daily use as the default system.

| Image File                                      | Boot Medium          | Download Link                                                                                                               | Description                              |
| :---------------------------------------------- | :------------------- | :-------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| `orion-o6_bookworm_gnome_t2.output_512.img.xz`  | USB Drive / NVMe SSD | [Download](https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_512.img.xz)  | - Debian 12 Bookworm<br/>- GNOME Desktop |
| `orion-o6_bookworm_gnome_t2.output_4096.img.xz` | UFS Module           | [Download](https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_4096.img.xz) | - Debian 12 Bookworm<br/>- GNOME Desktop |

When you first boot the system, you'll need to log in with the default username and password.

Default Radxa OS credentials:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

### Android

Radxa Orion O6 and O6N provide different BIOS firmware and Android system images. Please select the appropriate image file based on your motherboard model.

- **Use Case**: For users who need Android app ecosystem or multimedia entertainment.

<Tabs queryString="versions">
    <TabItem value="Orion O6">
#### Radxa Orion O6
        | Type     | Version / Description                | Download Link                                                                                                                                                                                                                             | Remarks                        |
        | :------- | :----------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------- |
        | BIOS     | Android BIOS 0.0.1 Version          | [Download](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6-android14-rc2-20250903/orion-o6-bios-android-0.0.1.zip)                                                                                       | BIOS Firmware for Android OS   |
        | System Image | Android 14 RC2 20250903 | [Download](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6-android14-rc2-20250903/Radxa_Orion_O6_Android14_RC2_20250903_images.zip)                                                                     | Android 14 RC2 System Image    |
    </TabItem>
    <TabItem value="Orion O6N">
#### Radxa Orion O6N
        | Type     | Version / Description | Download Link | Remarks               |
        | :------- | :------------------- | :------------ | :------------------- |
        | BIOS     | Android BIOS 1.0.0 Version | [Download](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6n-android14-rc3.4-20251124/O6N-BIOS-V1.0.0.zip) | BIOS Firmware for Android OS   |
        | System Image | Android 14 RC3.4 20250903 | [Download](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6n-android14-rc3.4-20251124/Radxa_orion_o6n-Andrid14-r3.4-20251124-gpt.zip) | Android 14 RC3.4 System Image |
    </TabItem>
</Tabs>

### OpenHarmony

Currently, only Radxa Orion O6 images are available.

#### Radxa Orion O6

        | Type     | Version / Description                | Download Link                                                                                                                                                                                                                         | Remarks                      |
        | :------- | :----------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------- |
        | BIOS     | OpenHarmony BIOS v1.0 Version        | [Download](https://github.com/radxa/cix-openharmony-manifests/releases/download/radxa-orion-o6-Harmony-20251016-v1.0/ohos_bios.zip)                                                                                                  | BIOS Firmware for OpenHarmony |
        | System Image | OpenHarmony 20251016 System Image | [Download](https://github.com/radxa/cix-openharmony-manifests/releases/download/radxa-orion-o6-Harmony-20251016-v1.0/ohos_images.zip)                                                                                                | OpenHarmony System Image     |

### Fedora

Fedora is a community distribution suitable for advanced users familiar with the Fedora/RPM ecosystem. Currently, only Radxa Orion O6 images are available.

#### Radxa Orion O6

        | Filename                                                       | Download Link                                                                                                                                                          | Description                 |
        | :----------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------- |
        | `fedora-disk-gnome-workstation_radxa_orion-o6_202501041239` | [Download](https://openkoji.iscas.ac.cn/pub/dist-repos/dl/Radxa/Orion-O6/images/fedora-disk-gnome-workstation_radxa_orion-o6_202501041239.raw.gz)                    | Fedora GNOME Workstation Image |

Default Fedora system credentials:

| Item     | Value     |
| :------- | :-------- |
| Username | `root`    |
| Password | `aarch64` |

## Hardware Design

Below are the schematics, component placement diagrams, and 3D files required for hardware development and secondary development. Please select the appropriate files based on your specific product model.

<Tabs queryString="versions">
    <TabItem value="Orion O6">
### Radxa Orion O6
        | Resource Type           | Filename                                          | Format | Download Link                                                                                                                                                                                                                                                |
        | :---------------------- | :------------------------------------------------ | :----- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
        | Schematic              | `radxa_orion_o6_schematic_v1.20`                 | PDF    | [Download](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_schematic.pdf)                                                                                                                                                                             |
        | Component Placement (Top) | `radxa_orion_o6_components_placement_map_top_v1.20` | PDF    | [Download](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_top.pdf)                                                                                                                                                          |
        | Component Placement (Bottom) | `radxa_orion_o6_components_placement_map_bot_v1.20` | PDF    | [Download](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_bot.pdf)                                                                                                                                                          |
        | 3D Model               | `radxa_orion_o6_io_shield_3d`                    | STP    | [Download](https://dl.radxa.com/orion/o6/hw/RADXA_ROCK_Orion_O6_IO_shield_3D.zip)                                                                                                                                                                           |
    </TabItem>
    <TabItem value="Orion O6N">
### Radxa Orion O6N
        | Resource Type   | Filename | Format | Download Link |
        | :-------------- | :------- | :----- | :------------ |
        | Schematic       | `radxa_orion_o6n_schematic_v1.11` | PDF  | [Download](https://dl.radxa.com/orion/o6n/docs/hw/radxa_orion_o6n_schematic_v1.11.pdf) |
        | Component Placement | `radxa_orion_o6n_components_placement_map_v1.11` | PDF  | [Download](https://dl.radxa.com/orion/o6n/docs/hw/radxa_orion_o6n_components_placement_map_v1.11.pdf) |
    </TabItem>
</Tabs>
