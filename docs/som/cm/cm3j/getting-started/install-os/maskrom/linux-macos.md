---
sidebar_position: 2
description: "Linux 下通过 USB 刷机"
---

import Maskrom from "./\_maskrom.mdx"

# Linux/MacOS主机

## 文件下载

请到 [资源下载汇总](../../../download.md) 下载对应的 Loader 和 镜像文件

## 安装 rkdeveloptool

rkdeveloptool 是 Rockchip 为 Linux/macOS 平台下进行 USB 烧录所开发的软件。

rkdeveloptool 可以被认为是[开源版本](https://opensource.rock-chips.com/wiki_Rkdeveloptool)的 upgrade_tool。

如果你的操作系统没有提供 rkdeveloptool，则需要从源代码编译安装。

## 进入 Maskrom

<Maskrom/>

## 使用 rkdeveloptool

### 写入文件

:::tip
写入文件时，rkdeveloptool 不会自动对压缩文件进行解压缩。

请首先将使用到的文件进行解压缩，并在 rkdeveloptool 中指定解压缩后的文件。
:::

:::tip
rkdeveloptool 不支持选择 Maskrom 设备，也无法选择待写入的存储介质。
通常使用 rkdeveloptool 时，只会硬件连接一部设备和一个存储介质。这一步无法用软件控制。

如果需要同时写入多个设备，请使用 upgrade_tool。
:::

1. 解压镜像文件 (镜像文件详见[资源下载汇总](../../../download.md)部分， 此处以 radxa-cm3j-rpi-cm4-io_bullseye_xfce_b1.output.img.xz 为例)

   ```bash
   xz -d radxa-cm3j-rpi-cm4-io_bullseye_xfce_b1.output.img.xz (如果是 gz 格式，请使用 `gunzip -d <image>.gz` 命令)
   ```

2. 烧录 Loader (实际文件详见[资源下载汇总](../../../download.md)部分，这里以 rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin 为例)

   ```bash
   sudo rkdeveloptool db rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin
   ```

3. 烧录镜像 (以下镜像名只是示例，实际镜像文件是步骤1解压后的文件)

   ```bash
   sudo rkdeveloptool wl 0 radxa-cm3j-rpi-cm4-io_bullseye_xfce_b1.output.img
   ```

## 重启设备

```bash
sudo rkdeveloptool rd
```
