---
sidebar_position: 2
---

# 资源下载汇总

## 硬件设计

Orion O6 V1.2 版本

[V1.2 2D dxf](https://dl.radxa.com)

[V1.2 原理图 pdf](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_schematic.pdf)

[V1.2 位号图 BOT pdf](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_bot.pdf)

[V1.2 位号图 TOP pdf](https://dl.radxa.com/orion/o6/hw/radxa_orion_o6_v1.20_Components_Placement_map_top.pdf)

## 刷机工具

## BIOS

[O6 BIOS](https://dl.radxa.com/orion/o6/images/bios/)

## Debian 12 预装版系统镜像

### Debian12 Desktop b3

|                                 orion-o6-debian12-preinstalled-desktop-b3.img                                 |
| :-----------------------------------------------------------------------------------------------------------: |
| [Radxa DL 链接](https://dl.radxa.com/orion/o6/images/debian/orion-o6-debian12-preinstalled-desktop-b3.img.gz) |
|                   [百度网盘链接](https://pan.baidu.com/s/1HzxxBGpHq_CBjzX5SWuzJw?pwd=j6ck)                    |
|            [Mega 链接](https://mega.nz/file/Q2oUVJSS#JBV7U-9miON4_L2Ljw8-4t5lzxJe4tC6PRAtZfIvgPo)             |

说明：

- 用于 NVME 和 USB 启动。
- 用户可通过主机上的 balenaEtcher 将该镜像烧写到 U盘或 NVME SSD 中。

| 用户名 | 密码  |
| :----: | :---: |
| radxa  | radxa |

### Debian12 Desktop b3（镜像名带有 usb-install，USB 启动盘用）

|                                orion-o6-usb-install-sdebian12-preinstalled-desktop-b3.img                                 |
| :-----------------------------------------------------------------------------------------------------------------------: |
| [Radxa DL 链接](https://dl.radxa.com/orion/o6/images/debian/orion-o6-usb-install-debian12-preinstalled-desktop-b3.img.gz) |
|                         [百度网盘链接](https://pan.baidu.com/s/1usQ8CoBnPHF8sISZT0nfRA?pwd=s2tn)                          |
|                  [Mega 链接](https://mega.nz/file/1mIEBICb#d-gk8iBij8uUNv1-oQeqytxCDn7cO7mLubdmoAG6TvQ)                   |

说明：

- 该镜像名带 “usb-install” 字符串，镜像的目录 `/home/radxa` 有 b3 镜像文件。用于 USB 启动盘。
- 用户可通过主机上的 balenaEtcher 将该镜像烧写到 U盘中。
- O6 从 U盘启动后，用户可在 O6 系统中，将 `/home/radxa` 的 b3 镜像，烧写到 NVME SSD 中。见 [快速上手](./getting-started/quick-start.md)。

| 用户名 | 密码  |
| :----: | :---: |
| radxa  | radxa |

## Fedora

[Fedora 41 Gnome](https://openkoji.iscas.ac.cn/pub/dist-repos/dl/Radxa/Orion-O6/images/fedora-disk-gnome-workstation_radxa_orion-o6_202501041239.raw.gz)

| 用户名 |  密码   |
| :----: | :-----: |
|  root  | aarch64 |

## 质量认证

## 参考文档
