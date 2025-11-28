---
sidebar_position: 150
---

# 资源汇总下载

本页按照使用场景整理了瑞莎星睿 Orion O6 / O6N 的下载资源。请先根据你的用途（更新 BIOS / 安装系统 / 硬件设计）选择对应章节，再按具体型号下载文件。

:::info 快速导航

- [BIOS 固件](#bios-固件)
- [系统镜像（Radxa OS / Android / OpenHarmony / Fedora）](#系统镜像)
- [硬件设计资料](#硬件设计)

:::

## BIOS 固件

瑞莎星睿 O6 和 O6N 使用不同的 BIOS 固件。

<Tabs queryString="versions">
    <TabItem value="星睿 O6">
#### 瑞莎星睿 O6
        | 下载平台                                                                            | 文件格式 | 获取方式                                                                                            |
        | :---------------------------------------------------------------------------------- | :------- | :-------------------------------------------------------------------------------------------------- |
        | [**Radxa DL**](https://dl.radxa.com/orion/o6/images/bios/orion-o6-bios-1.0.0-3.zip) | `.zip`   | 固件位于压缩包内                                                                                    |
        | [**GitHub Release**](https://github.com/radxa-pkg/edk2-cix/releases)                | `.deb`   | 固件位于 `edk2-cix_***_all.deb` 包中的 `edk2-cix_***_all\data.tar\data\usr\share\edk2\radxa` 目录下 |
    </TabItem>
    <TabItem value="星睿 O6N">
#### 瑞莎星睿 O6N
        | 下载平台                                                             | 文件格式 | 获取方式                                                                                            |
        | :------------------------------------------------------------------- | :------- | :-------------------------------------------------------------------------------------------------- |
        | [**Radxa DL**](https://dl.radxa.com/orion/o6n/)                      | `.zip`   | 固件位于压缩包内                                                                                    |
        | [**GitHub Release**](https://github.com/radxa-pkg/edk2-cix/releases) | `.deb`   | 固件位于 `edk2-cix_***_all.deb` 包中的 `edk2-cix_***_all\data.tar\data\usr\share\edk2\radxa` 目录下 |
    </TabItem>
</Tabs>

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

- **适用型号**：瑞莎星睿 O6 / O6N
- **推荐场景**：经过瑞莎团队充分定制和测试过的桌面系统，适合日常使用，作为默认系统。

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

瑞莎星睿 O6 和 O6N 提供不同的 BIOS 固件和 Android 系统镜像，请根据主板型号选择对应的镜像文件。

- **适用场景**：需要 Android 应用生态或影音娱乐的用户。

<Tabs queryString="versions">
    <TabItem value="星睿 O6">
#### 瑞莎星睿 O6
        | 类型     | 版本 / 描述                      | 下载链接                                                                                                                                                                                                                             | 备注                           |
        | :------- | :------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------- |
        | BIOS     | Android BIOS 0.0.1 版本          | [下载](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6-android14-rc2-20250903/orion-o6-bios-android-0.0.1.zip)                                                                                       | 用于 Android 系统的 BIOS 固件 |
        | 系统镜像 | Android 14 RC2 20250903 系统镜像 | [下载](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6-android14-rc2-20250903/Radxa_Orion_O6_Android14_RC2_20250903_images.zip)                                                                     | Android 14 RC2 系统镜像        |
    </TabItem>
    <TabItem value="星睿 O6N">
#### 瑞莎星睿 O6N
        | 类型     | 版本 / 描述 | 下载链接 | 备注               |
        | :------- | :---------- | :------- | :----------------- |
        | BIOS     | Android BIOS 1.0.0 版本 | [下载](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6n-android14-rc3.4-20251124/O6N-BIOS-V1.0.0.zip) | 用于 Android 系统的 BIOS 固件 |
        | 系统镜像 | Android 14 RC3.4 20250903 系统镜像 | [下载](https://github.com/radxa/cix-android-manifests/releases/download/radxa-orion-o6n-android14-rc3.4-20251124/Radxa_orion_o6n-Andrid14-r3.4-20251124-gpt.zip) | Android 14 RC3.4 系统镜像        |
    </TabItem>
</Tabs>

### Openharmony

瑞莎星睿 O6 和 O6N 提供不同的 OpenHarmony 系统镜像，请根据主板型号选择对应的镜像文件。

- **适用场景**：评估或开发 OpenHarmony 相关应用。
- **注意**：当前仅提供 O6 镜像，O6N 正在适配中。

<Tabs queryString="versions">
    <TabItem value="星睿 O6">
#### 瑞莎星睿 O6
        | 类型     | 版本 / 描述                   | 下载链接                                                                                                                                                                                                                         | 备注                         |
        | :------- | :---------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------- |
        | BIOS     | OpenHarmony BIOS v1.0 版本    | [下载](https://github.com/radxa/cix-openharmony-manifests/releases/download/radxa-orion-o6-Harmony-20251016-v1.0/ohos_bios.zip)                                                                                                  | 用于 OpenHarmony BIOS 固件 |
        | 系统镜像 | OpenHarmony 20251016 系统镜像 | [下载](https://github.com/radxa/cix-openharmony-manifests/releases/download/radxa-orion-o6-Harmony-20251016-v1.0/ohos_images.zip)                                                                                                | OpenHarmony 系统镜像         |
    </TabItem>
    <TabItem value="星睿 O6N">
#### 瑞莎星睿 O6N
        | 类型     | 版本 / 描述 | 下载链接 | 备注             |
        | :------- | :---------- | :------- | :--------------- |
        | 系统镜像 | -           | -        | 目前正在适配中 |
    </TabItem>
</Tabs>

### Fedora

Fedora 为社区发行版，适合熟悉 Fedora / RPM 生态的高级用户，目前仅提供瑞莎星睿 O6 镜像。

<Tabs queryString="versions">
    <TabItem value="星睿 O6">
#### 瑞莎星睿 O6
        | 文件名                                                       | 下载链接                                                                                                                                                          | 说明                         |
        | :----------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------- |
        | `fedora-disk-gnome-workstation_radxa_orion-o6_202501041239` | [下载](https://openkoji.iscas.ac.cn/pub/dist-repos/dl/Radxa/Orion-O6/images/fedora-disk-gnome-workstation_radxa_orion-o6_202501041239.raw.gz)                    | Fedora GNOME Workstation 镜像 |
    </TabItem>
    <TabItem value="星睿 O6N">
#### 瑞莎星睿 O6N
        | 文件名 | 下载链接 | 说明                         |
        | :----- | :------- | :--------------------------- |
        | -      | -        | 当前暂不提供 Fedora 系统镜像 |
    </TabItem>
</Tabs>

Fedora 系统的默认凭据如下：

| 项目   | 内容      |
| :----- | :-------- |
| 用户名 | `root`    |
| 密码   | `aarch64` |

## 硬件设计

以下为硬件开发和二次开发所需的原理图、位号图和 3D 文件，请根据具体产品型号选择下载。

<Tabs queryString="versions">
    <TabItem value="星睿 O6">
### 瑞莎星睿 O6
        | 资料类型       | 文件名                                          | 格式 | 下载链接                                                                                                                                                                                                                                                |
        | :------------- | :---------------------------------------------- | :--- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
        | 原理图         | `radxa_orion_o6_schematic_v1.20`               | PDF  | [下载](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_schematic.pdf)                                                                                                                                                                             |
        | 位号图（顶层） | `radxa_orion_o6_components_placement_map_top_v1.20` | PDF  | [下载](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_top.pdf)                                                                                                                                                          |
        | 位号图（底层） | `radxa_orion_o6_components_placement_map_bot_v1.20` | PDF  | [下载](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_bot.pdf)                                                                                                                                                          |
        | 3D 文件        | `radxa_orion_o6_io_shield_3d`                  | STP  | [下载](https://dl.radxa.com/orion/o6/hw/RADXA_ROCK_Orion_O6_IO_shield_3D.zip)                                                                                                                                                                           |
    </TabItem>
    <TabItem value="星睿 O6N">
### 瑞莎星睿 O6N
        | 资料类型       | 文件名 | 格式 | 下载链接 |
        | :------------- | :----- | :--- | :------ |
        | 原理图         | -      | PDF  | 待提供 |
        | 位号图（顶层） | -      | PDF  | 待提供 |
        | 位号图（底层） | -      | PDF  | 待提供 |
        | 3D 文件        | -      | STP  | 待提供 |
    </TabItem>
</Tabs>
