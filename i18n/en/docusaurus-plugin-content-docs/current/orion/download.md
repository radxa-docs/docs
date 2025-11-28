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
        | [**GitHub Release**](https://github.com/radxa-pkg/edk2-cix/releases)                   | `.deb` | Firmware is located in `edk2-cix_***_all.deb` package under `edk2-cix_***_all\data.tar\data\usr\share\edk2\radxa` directory |
    </TabItem>
    <TabItem value="Orion O6N">
#### Radxa Orion O6N
        | Download Platform                                                             | Format | How to Access                                                                                            |
        | :------------------------------------------------------------------- | :------- | :-------------------------------------------------------------------------------------------------- |
        | [**Radxa DL**](https://dl.radxa.com/orion/o6n/)                      | `.zip`   | Firmware is inside the zip file                                                                                    |
        | [**GitHub Release**](https://github.com/radxa-pkg/edk2-cix/releases) | `.deb`   | Firmware is located in `edk2-cix_***_all.deb` package under `edk2-cix_***_all\data.tar\data\usr\share\edk2\radxa` directory |
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

Latest Radxa OS Releases: [**GitHub Releases**](https://github.com/radxa-build/orion-o6/releases)
:::

### Radxa OS

Radxa Orion O6 and O6N use the same system images. Please select the appropriate image file based on your boot media.

- **Compatible Models**: Radxa Orion O6 / O6N
- **Recommended For**: A desktop system fully customized and tested by the Radxa team, suitable for daily use as the default system.

| Image File                                      | Media Type           | Download Link                                                                                                               | Description                                          |
| :---------------------------------------------- | :------------------- | :-------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------- |
| `orion-o6_bookworm_gnome_t2.output_512.img.xz`  | USB Drive / NVMe SSD | [Download](https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_512.img.xz)  | - Debian 12 Bookworm<br/>- GNOME Desktop Environment |
| `orion-o6_bookworm_gnome_t2.output_4096.img.xz` | UFS Module           | [Download](https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_4096.img.xz) | - Debian 12 Bookworm<br/>- GNOME Desktop Environment |

After first boot, you'll need to log in with the default credentials.

Default Radxa OS credentials:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

### Android

Radxa Orion O6 and O6N provide different Android system images. Please select the image file according to your motherboard model.

- **Use Case**: For users who need Android app ecosystem or multimedia entertainment.
- **Note**: O6N version is under adaptation, currently only O6 is available.

<Tabs queryString="versions">
    <TabItem value="Orion O6">
#### Radxa Orion O6
        | Type     | Version / Description               | Download Link                                                                                                                                                                                                 | Notes                         |
        | :------- | :---------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------- |
        | BIOS     | Android BIOS 0.0.1 Version         | [Download](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6-android14-rc2-20250903/orion-o6-bios-android-0.0.1.zip)                                                         | BIOS for Android system      |
        | Image    | Android 14 RC2 20250903 System Image | [Download](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6-android14-rc2-20250903/Radxa_Orion_O6_Android14_RC2_20250903_images.zip)                                       | Android 14 RC2 System Image  |
    </TabItem>
    <TabItem value="Orion O6N">
#### Radxa Orion O6N
        | Type     | Version / Description | Download | Notes               |
        | :------- | :------------------- | :------- | :----------------- |
        | BIOS     | Android BIOS 1.0.0 | [Download](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6n-android14-rc3.4-20251124/O6N-BIOS-V1.0.0.zip) | BIOS firmware for Android system |
        | System Image | Android 14 RC3.4 20250903 | [Download](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6n-android14-rc3.4-20251124/Radxa_orion_o6n-Andrid14-r3.4-20251124-gpt.zip) | Android 14 RC3.4 System Image        |
    </TabItem>
</Tabs>

### OpenHarmony

Radxa Orion O6 and O6N provide different OpenHarmony system images. Please select the image file according to your motherboard model.

- **Use Case**: For evaluating or developing OpenHarmony related applications.
- **Note**: Currently only O6 image is available, O6N is under adaptation.

<Tabs queryString="versions">
    <TabItem value="Orion O6">
#### Radxa Orion O6
        | Type     | Version / Description             | Download Link                                                                                                                                                                           | Notes                       |
        | :------- | :-------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------- |
        | BIOS     | OpenHarmony BIOS v1.0 Version    | [Download](https://github.com/radxa/cix-openharmony-manifests/releases/download/radxa-orion-o6-Harmony-20251016-v1.0/ohos_bios.zip)                                                  | BIOS for OpenHarmony       |
        | Image    | OpenHarmony 20251016 System Image | [Download](https://github.com/radxa/cix-openharmony-manifests/releases/download/radxa-orion-o6-Harmony-20251016-v1.0/ohos_images.zip)                                                | OpenHarmony System Image    |
    </TabItem>
    <TabItem value="Orion O6N">
#### Radxa Orion O6N
        | Type     | Version / Description | Download Link | Notes             |
        | :------- | :------------------- | :----------- | :--------------- |
        | Image    | -                    | -            | Under adaptation |
    </TabItem>
</Tabs>

### Fedora

Fedora is a community distribution suitable for advanced users familiar with Fedora/RPM ecosystem. Currently, only Radxa Orion O6 image is available.

<Tabs queryString="versions">
    <TabItem value="Orion O6">
#### Radxa Orion O6
        | Filename                                                   | Download Link                                                                                                                                               | Description                 |
        | :---------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------- |
        | `fedora-disk-gnome-workstation_radxa_orion-o6_202501041239` | [Download](https://openkoji.iscas.ac.cn/pub/dist-repos/dl/Radxa/Orion-O6/images/fedora-disk-gnome-workstation_radxa_orion-o6_202501041239.raw.gz)         | Fedora GNOME Workstation Image |
    </TabItem>
    <TabItem value="Orion O6N">
#### Radxa Orion O6N
        | Filename | Download Link | Description                 |
        | :------- | :----------- | :--------------------------- |
        | -        | -            | Fedora image not yet available |
    </TabItem>
</Tabs>

Default Fedora credentials:

| Item     | Value     |
| :------- | :-------- |
| Username | `root`    |
| Password | `aarch64` |

## Hardware Design

The following are schematics, component placement diagrams, and 3D files required for hardware development and secondary development. Please select the appropriate files according to your specific product model.

<Tabs queryString="versions">
    <TabItem value="Orion O6">
### Radxa Orion O6
        | Resource Type     | Filename                                          | Format | Download Link                                                                                                                                                                                                 |
        | :---------------- | :------------------------------------------------ | :----- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
        | Schematic         | `radxa_orion_o6_schematic_v1.20`                 | PDF    | [Download](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_schematic.pdf)                                                                                                                              |
        | Components Placement Map（Top）  | `radxa_orion_o6_components_placement_map_top_v1.20` | PDF    | [Download](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_top.pdf)                                                                                                          |
        | Components Placement Map（Bottom）| `radxa_orion_o6_components_placement_map_bot_v1.20` | PDF    | [Download](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_bot.pdf)                                                                                                          |
        | 3D Model         | `radxa_orion_o6_io_shield_3d`                    | STP    | [Download](https://dl.radxa.com/orion/o6/hw/RADXA_ROCK_Orion_O6_IO_shield_3D.zip)                                                                                                                           |
    </TabItem>
    <TabItem value="Orion O6N">
### Radxa Orion O6N
        | Resource Type     | Filename | Format | Download Link |
        | :---------------- | :------- | :----- | :------------ |
        | Schematic         | -        | PDF    | Coming Soon   |
        | Components Placement Map  | -        | PDF    | Coming Soon   |
        | 3D Model          | -        | STP    | Coming Soon   |
    </TabItem>
</Tabs>
