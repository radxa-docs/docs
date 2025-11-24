---
sidebar_position: 150
---

# 资源汇总下载

## BIOS 固件

瑞莎星睿 O6 和 O6N 使用不同的 BIOS 固件。

- 瑞莎星睿 O6

| 下载平台                                                                            | 文件格式 | 获取方式                                                                                            |
| :---------------------------------------------------------------------------------- | :------- | :-------------------------------------------------------------------------------------------------- |
| [**Radxa DL**](https://dl.radxa.com/orion/o6/images/bios/orion-o6-bios-1.0.0-3.zip) | `.zip`   | 固件位于压缩包内                                                                                    |
| [**GitHub Release**](https://github.com/radxa-pkg/edk2-cix/releases)                | `.deb`   | 固件位于 `edk2-cix_***_all.deb` 包中的 `edk2-cix_***_all\data.tar\data\usr\share\edk2\radxa` 目录下 |

- 瑞莎星睿 O6N

| 下载平台                                                             | 文件格式 | 获取方式                                                                                            |
| :------------------------------------------------------------------- | :------- | :-------------------------------------------------------------------------------------------------- |
| [**Radxa DL**](https://dl.radxa.com/orion/o6n/)                      | `.zip`   | 固件位于压缩包内                                                                                    |
| [**GitHub Release**](https://github.com/radxa-pkg/edk2-cix/releases) | `.deb`   | 固件位于 `edk2-cix_***_all.deb` 包中的 `edk2-cix_***_all\data.tar\data\usr\share\edk2\radxa` 目录下 |

:::tip \*.deb 文件解压说明

- **Windows**: 可以使用 `7-Zip` 软件解压 `.deb` 文件
- **Linux**: 可以使用 `KDE Ark` 软件解压 `.deb` 文件
- **macOS**: 可以使用 `ar -x` 命令解压 `.deb` 文件

:::

## 系统镜像

:::info 版本说明

- **测试版本**: 以 `t` 开头（如 t1、t2）
- **正式版本**: 以 `r` 开头（如 r1、r2）

最新 Radxa OS 发布页面：[**GitHub Releases**](https://github.com/radxa-build/orion-o6/releases)
:::

### Radxa OS

瑞莎星睿 O6 和 O6N 使用相同的系统镜像，请根据对应的系统启动介质选择合适的镜像文件。

| 镜像文件                                        | 适用介质             | 下载链接                                                                                                                | 说明                                      |
| :---------------------------------------------- | :------------------- | :---------------------------------------------------------------------------------------------------------------------- | :---------------------------------------- |
| `orion-o6_bookworm_gnome_t2.output_512.img.xz`  | U 盘 / NVMe 固态硬盘 | [下载](https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_512.img.xz)  | - Debian 12 Bookworm<br/>- GNOME 桌面环境 |
| `orion-o6_bookworm_gnome_t2.output_4096.img.xz` | UFS 模块             | [下载](https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_4096.img.xz) | - Debian 12 Bookworm<br/>- GNOME 桌面环境 |

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

### Android

瑞莎星睿 O6 和 O6N 提供不同的 Android 系统镜像，请根据主板型号选择对应的镜像文件。

- 瑞莎星睿 O6

  - [Android BIOS 0.0.1 版本](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6-android14-rc2-20250903/orion-o6-bios-android-0.0.1.zip)
  - [Android 14 RC2 20250903 系统镜像](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6-android14-rc2-20250903/Radxa_Orion_O6_Android14_RC2_20250903_images.zip)

- 瑞莎星睿 O6N
  - 目前正在适配中

### Openharmony

瑞莎星睿 O6 和 O6N 提供不同的 OpenHarmony 系统镜像，请根据主板型号选择对应的镜像文件。

- 瑞莎星睿 O6

  - [Openharmony BIOS v1.0 版本](https://github.com/radxa/cix-openharmony-manifests/releases/download/radxa-orion-o6-Harmony-20251016-v1.0/ohos_bios.zip)
  - [Openharmony 20251016 系统镜像](https://github.com/radxa/cix-openharmony-manifests/releases/download/radxa-orion-o6-Harmony-20251016-v1.0/ohos_images.zip)

- 瑞莎星睿 O6N
  - 目前正在适配中

### Fedora

- 瑞莎星睿 O6
  - [fedora-disk-gnome-workstation_radxa_orion-o6_202501041239](https://openkoji.iscas.ac.cn/pub/dist-repos/dl/Radxa/Orion-O6/images/fedora-disk-gnome-workstation_radxa_orion-o6_202501041239.raw.gz)

Fedora 系统的默认凭据如下：

| 项目   | 内容      |
| :----- | :-------- |
| 用户名 | `root`    |
| 密码   | `aarch64` |

## 硬件设计

| 产品         | 文件类型                        | 格式                  | 下载链接                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| :----------- | :------------------------------ | :-------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 瑞莎星睿 O6  | 原理图<br />位号图<br />3D 文件 | PDF<br />PDF<br />STP | [radxa_orion_o6_schematic_v1.20](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_schematic.pdf) <br />[radxa_orion_o6_components_placement_map_top_v1.20](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_top.pdf) <br />[radxa_orion_o6_components_placement_map_bot_v1.20](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_bot.pdf)<br />[radxa_orion_o6_io_shield_3d](https://dl.radxa.com/orion/o6/hw/RADXA_ROCK_Orion_O6_IO_shield_3D.zip) |
| 瑞莎星睿 O6N | 原理图<br />位号图<br />3D 文件 | PDF<br />PDF<br />STP | 待提供                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
