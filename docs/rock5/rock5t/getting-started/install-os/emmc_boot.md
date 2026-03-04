---
sidebar_position: 3
---

# 安装系统到 eMMC

若您的瑞莎 ROCK 5T 板载 eMMC，您可以在 MicroSD 卡启动主板的情况下，使用 `dd` 命令将系统镜像写入 eMMC。

:::tip 注意事项
安装系统会格式化 eMMC，如果有重要数据请提前备份！

若您的系统目前还无法通过 MicroSD 卡启动，可以参考 [安装系统到 MicroSD 卡](./boot_from_sd_card.md) 教程。
:::

## 使用前提

您需要准备以下硬件设备：

- 主板：瑞莎 ROCK 5T
- 系统启动介质：MicroSD 卡
- 电源适配器：标准 DC 12V/2A 电源适配器（DC-5525 接口）

我们需要基于 MicroSD 卡启动主板系统，进入主板系统后下载系统镜像文件，然后使用 `dd` 命令将系统镜像写入 eMMC。

:::tip 推荐配件
瑞莎 ROCK 5T 仅支持 12V 电源输入，建议电流 2A 及以上，以确保所有外设稳定运行。

- [瑞莎 DC12 36W电源适配器](https://radxa.com/products/accessories/power-dc12-36w)(推荐使用)
- [瑞莎 DC12 60W电源适配器](https://radxa.com/products/accessories/power-dc12-60w)
- 标准12V/2A DC电源适配器(DC5525接口)
  :::

## 下载系统

您可以在主板上访问 [资源汇总下载](../../download) 页面下载系统镜像文件。

:::tip 下载建议
我们提供以下方式下载系统镜像文件到主板上，您可以根据自己的实际情况选择合适的方式：

- 使用 `wget` 命令下载

您可以复制 [资源汇总下载](../../download) 页面的系统镜像文件链接，然后在主板上使用 `wget` 命令下载。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo apt install wget
wget [url]
# 示例
wget https://github.com/radxa-build/rock-5t/releases/download/rsdk-b2/rock-5t_bookworm_kde_b2.output.img.xz
```
</NewCodeBlock>
参数解释：其中 `[url]` 需要替换成实际的系统镜像文件下载链接。

- PC 下载

您可以在 PC 上访问 [资源汇总下载](../../download) 页面下载系统镜像文件，然后通过 U 盘 、FTP 、SCP 等方式将系统镜像文件传输到主板上。

:::

## 安装系统

使用 `dd` 命令安装系统镜像到 eMMC。

:::tip 说明
下载的系统镜像文件是压缩包，需要解压后才能使用。
:::

### 解压系统镜像

使用 `unxz` 命令解压系统镜像文件。

<NewCodeBlock tip="radxa@device$" type="device">

```bash
sudo apt install xz-utils
unxz [image_path]
# 示例
unxz ~/rock-5t_bookworm_kde_b2.output.img.xz
```

</NewCodeBlock>
参数解释：其中 `[image_path]` 需要替换成实际的系统镜像文件路径。

### 写入系统镜像

将解压的系统镜像文件使用 `dd` 命令写入 eMMC。

:::danger
使用 `dd` 命令时，请确保选择正确的设备文件，否则会格式化错误的设备，造成数据丢失！
:::

<NewCodeBlock tip="radxa@device$" type="device">

```bash
sudo dd if=[image_path] of=/dev/mmcblk0 bs=4M status=progress

# 示例

sudo dd if=~/rock-5t_bookworm_kde_b2.output.img of=/dev/mmcblk0 bs=4M status=progress
```

</NewCodeBlock>
参数说明：
- `if`：指定写入文件，将 `[image_path]` 替换为解压后的系统镜像文件路径
- `of`：指定写入设备，将 `/dev/mmcblk0` 替换为 eMMC 对应的设备文件(请根据实际设备修改)
- `bs`：块大小，建议 4M
- `status=progress`：显示写入状态

### 验证系统镜像

写入系统镜像完成后，您可以使用 `fdisk` 命令查看系统待启动介质的分区信息，从而确定系统镜像是否写入成功。

<NewCodeBlock tip="radxa@device$" type="device">

```bash

sudo fdisk -l /dev/mmcblk0

```

</NewCodeBlock>

若系统成功写入，终端会输出类似以下的分区信息：

```text

Disk /dev/mmcblk0: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 \* 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/mmcblk0p1 32768 65535 32768 128M Linux filesystem
/dev/mmcblk0p2 65536 679935 614400 2.3G EFI System
/dev/mmcblk0p3 679936 31234014 30554079 116.6G EFI System

```

## 启动系统

完成系统的安装后，将主板关机并断电，然后拔下 MicroSD 卡，重新插上电源适配器，系统会自动从 eMMC 启动。

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Debian Linux

用户账号：radxa

用户密码：radxa
