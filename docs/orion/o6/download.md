---
sidebar_position: 2
---

# 资源下载汇总

## 硬件设计

Orion O6 V1.2 版本

[V1.2 原理图 pdf](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_schematic.pdf)

[V1.2 位号图 BOT pdf](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_bot.pdf)

[V1.2 位号图 TOP pdf](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_top.pdf)

## BIOS

| 下载链接                                                                                  | 格式 | 说明                                                                                                                                                                                      |
| ----------------------------------------------------------------------------------------- | ---- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Radxa DL](https://dl.radxa.com/orion/o6/images/bios/orion-o6-bios-0.3.0-1.zip)           | zip  | Version 0.3.0                                                                                                                                                                             |
| [Github Release](https://github.com/radxa-pkg/edk2-cix/releases/latest)                   | deb  | BIOS 内容处于 `edk2-cix_*_all.deb` 软件包当中。该文件在 Windows 下可使用 7-Zip 打开，Linux 下可使用 KDE Ark 打开。软件包内，BIOS 文件路径为 `data.tar.xz/usr/share/edk2/radxa/orion-o6`。 |
| [Radxa DL](https://dl.radxa.com/orion/o6/images/bios/SystemReady/latest/orion-o6-bios.7z) | 7z   | Version 9.0.0, Arm SystemReady Certification BIOS                                                                                                                                         |

## Debian 12 预装版系统镜像

### Debian12 Desktop b6

|                                 orion-o6-debian12-preinstalled-desktop-b6.img                                 |
| :-----------------------------------------------------------------------------------------------------------: |
| [Radxa DL 链接](https://dl.radxa.com/orion/o6/images/debian/orion-o6-debian12-preinstalled-desktop-b6.img.gz) |
|                   [百度网盘链接](https://pan.baidu.com/s/1BKqR3Q67c580ZgjnllL7Ow?pwd=w2ex)                    |
|            [Mega 链接](https://mega.nz/file/x34WzQQC#UOyVPHcdMMYdSdYUsYQb2K-fWE8Zsa13QbTiLVvkIJ4)             |

说明：

- 用于 NVME SSD 和 USB 启动。
- 用户可通过主机上的 balenaEtcher 将该镜像烧写到 U盘或 NVME SSD 中。

| 用户名 | 密码  |
| :----: | :---: |
| radxa  | radxa |

### Debian12 Desktop ISO b6

|                                 orion-o6-debian12-desktop-arm64-b6.iso                                 |
| :----------------------------------------------------------------------------------------------------: |
| [Radxa DL 链接](https://dl.radxa.com/orion/o6/images/debian/orion-o6-debian12-desktop-arm64-b6.iso.gz) |
|                [百度网盘链接](https://pan.baidu.com/s/1WSrdcqFUXlkkAsvbQtVh6A?pwd=nnyi)                |
|         [Mega 链接](https://mega.nz/file/kyoHkRRT#86E73AN0-bGb01mkC-U30hPBhZMabJa7Dbgcf5U2a5w)         |

说明：

- 该镜像用于 USB 启动盘。用户通过该 USB 启动盘安装系统到 NVME SSD。
- 用户可通过主机上的 balenaEtcher 将该镜像烧写到 U盘中。
- 请记录安装过程中设置的 root 用户和普通用户的密码。

### RadxaOS

:::info
RadxaOS 目前仍处于测试阶段。相比于上面的系统可能在部分功能上有所缺失。

T1 已知问题：

1. Chromium 首次开机无法启动：Debian 问题 [#1035061](https://bugs-devel.debian.org/cgi-bin/bugreport.cgi?bug=1035061)
2. 系统目前未预装 NPU 用户层软件，且不兼容 CIX EBP 25Q1 NPU 驱动包。
3. 5GbE 吞吐量较低。
4. 休眠唤醒工作不正常。

:::

[下载链接](https://github.com/radxa-build/orion-o6/releases/download/rsdk-t1/orion-o6_bookworm_gnome_t1.output.img.xz)

## Fedora

[Fedora 41 Gnome](https://openkoji.iscas.ac.cn/pub/dist-repos/dl/Radxa/Orion-O6/images/fedora-disk-gnome-workstation_radxa_orion-o6_202501041239.raw.gz)

| 用户名 |  密码   |
| :----: | :-----: |
|  root  | aarch64 |
