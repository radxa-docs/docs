---
sidebar_position: 150
---

# 资源汇总下载

## BIOS 固件

| 下载平台           | 文件格式 | 获取方式                                                                                                                                                                    |
| :----------------- | :------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Radxa DL**       | `.zip`   | [瑞莎文档下载](https://dl.radxa.com/orion/o6n/) - 固件位于压缩包内                                                                                                          |
| **GitHub Release** | `.deb`   | [GitHub 发布页面](https://github.com/radxa-pkg/edk2-cix/releases) - 固件位于 `edk2-cix_***_all.deb` 包中的 `edk2-cix_1.0.0-2_all\data.tar\data\usr\share\edk2\radxa` 目录下 |

:::tip \*.deb 文件解压说明

- **Windows**: 可以使用 `7-Zip` 软件解压 `.deb` 文件
- **Linux**: 可以使用 `KDE Ark` 软件解压 `.deb` 文件
- **macOS**: 可以使用 `ar -x` 命令解压 `.deb` 文件

:::

## 系统镜像

:::info 版本说明

- **测试版本**: 以 `t` 开头（如 t1、t2）
- **正式版本**: 以 `r` 开头（如 r1、r2）

最新 Radxa OS 发布页面：[GitHub Releases](https://github.com/radxa-build/orion-o6/releases)
:::

### Radxa OS

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

## 硬件设计

| 文件类型         | 格式 | 下载链接                                |
| :--------------- | :--- | :-------------------------------------- |
| **位号图**       | PDF  | [下载](https://dl.radxa.com/orion/o6n/) |
| **原理图**       | PDF  | [下载](https://dl.radxa.com/orion/o6n/) |
| **尺寸标注图**   | PDF  | [下载](https://dl.radxa.com/orion/o6n/) |
| **2D DXF 文件**  | DXF  | [下载](https://dl.radxa.com/orion/o6n/) |
| **3D STEP 文件** | STEP | [下载](https://dl.radxa.com/orion/o6n/) |
