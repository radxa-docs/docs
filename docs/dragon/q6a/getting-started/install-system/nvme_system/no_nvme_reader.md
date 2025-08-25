---
sidebar_position: 2
---

# 不使用 M.2 M Key NVMe 固态硬盘盒

主要介绍在没有 M.2 M Key NVMe 固态硬盘盒的情况下，使用 `dd` 命令将系统镜像烧录到 M.2 M Key 2230 NVMe SSD 上。

:::warning
安装系统会格式化 NVMe SSD，如果有重要数据请提前备份！
:::

## 使用前提

您需要提前准备以下硬件设备：

- 主板：瑞莎 Dragon Q6A
- 系统启动介质：MicroSD 卡
- 系统待启动介质：M.2 M Key 2230 NVMe SSD
- 电源适配器：12V Type-C 电源适配器（兼容 PD 协议）

说明：我们需要基于 MicroSD 卡正常启动主板，然后通过 `dd` 命令将系统镜像安装到 NVMe SSD 上。

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
- 标准 12V Type-C 电源适配器，建议电流 2A 以上
  :::

## 硬件连接

将 M.2 M Key 2230 NVMe SSD 安装到主板的 NVMe SSD 接口上。

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_nvme_boot.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

## 下载系统镜像

您可以在主板上访问 [资源汇总下载](../../../download) 页面下载系统镜像文件。

:::tip 下载建议
我们提供以下方式下载系统镜像文件到主板上，您可以根据自己的实际情况选择合适的方式：

- 使用 `wget` 命令下载

您可以复制 [资源汇总下载](../../../download) 页面的系统镜像文件链接，然后在主板上使用 `wget` 命令下载。

```
sudo apt install wget
wget [url]
```

参数解释：其中 `[url]` 需要替换成实际的系统镜像文件下载链接。

- PC 下载

您可以在 PC 上访问 [资源汇总下载](../../../download) 页面下载系统镜像文件，然后通过 U 盘 、FTP 、SCP 等方式将系统镜像文件传输到主板上。

:::

## 解压系统镜像

:::tip 说明
下载的系统镜像文件是压缩包，需要解压后才能使用。
:::

使用 `unxz` 命令解压系统镜像文件。

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo apt install xz-utils
unxz [image_path]
```

</NewCodeBlock>
参数解释：其中 `[image_path]` 需要替换成实际的系统镜像文件路径。

## 安装系统镜像

使用 `dd` 命令安装系统镜像到 NVMe SSD 上。

### 写入系统镜像

:::danger
使用 `dd` 命令时，请确保选择正确的设备文件，否则会格式化错误的设备，造成数据丢失！
:::

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo dd if=[image_path] of=/dev/*** bs=4M status=progress
```

</NewCodeBlock>
参数说明：
- `if`：指定写入文件，将 `[image_path]` 替换为解压后的系统镜像文件路径
- `of`：指定写入设备，将 `/dev/***` 替换为系统待启动介质对应的设备(请根据实际设备修改)
- `bs`：块大小，建议 4M 参数 - `status=progress`：显示写入状态

:::tip 确定系统待启动介质设备文件

对于不同的系统待启动介质，对应的设备文件名称有所不同，以下是常见的系统待启动介质设备文件名称：

- eMMC 模块：`/dev/mmcblk*`
- UFS 模块：`/dev/sda*`
- NVMe SSD：`/dev/nvme*n*`

最有效的方法:你可以使用 `lsblk` 命令对比安装系统待启动介质和没有安装系统待启动介质时的设备列表变化，从而确定系统待启动介质对应的设备文件名称。

**注意：安装和拆卸系统待启动介质时（如 UFS 模块、NVMe SSD 等），需要将主板断电后进行操作，避免热插拔导致数据或硬件损坏。**
:::

### 验证系统镜像

写入系统镜像完成后，您可以使用 `fdisk` 命令查看系统待启动介质的分区信息，从而确定系统镜像是否写入成功。

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo fdisk -l /dev/***
```

</NewCodeBlock>

若系统成功写入，终端会输出类似以下信息：

```
Disk /dev/\*\*\*: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 \* 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/**_ 32768 65535 32768 128M Linux filesystem
/dev/_** 65536 679935 614400 2.3G EFI System
/dev/\*\*\* 679936 31234014 30554079 116.6G EFI System
```

## 修改 grub 设置

:::tip

参考 [修改系统启动盘引导选项](../boot_option) 中 NVMe 启动部分

:::

## 上电开机
