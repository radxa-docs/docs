---
sidebar_position: 3
---

# 不使用瑞莎 eMMC/UFS 二合一模块读卡器

主要介绍如何在不使用 eMMC/UFS 二合一模块读卡器的情况下，安装系统到 UFS 模块中。

我们需要在 MicroSD 卡正常启动 Cubie A7A 的情况下，使用 `dd` 命令将系统镜像安装到 UFS 模块中。

:::warning
安装系统会格式化 UFS 模块，如果有重要数据请提前备份！
:::

## 硬件准备

您需要提前准备以下硬件：

- 主板：瑞莎 Cubie A7A
- 系统启动介质：MicroSD 卡
- 系统待安装介质：UFS 模块
- 电源适配器：5V Type-C 电源适配器

Cubie A7A 主板兼容 PD 协议的 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

:::tip 推荐配件

- [瑞莎 UFS 模块](https://radxa.com/products/accessories/ufs-module)
- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 硬件连接

确认 Cubie A7A 的 MicroSD 卡正常启动系统后，将 UFS 模块安装到 Cubie A7A 的 eMMC/UFS 模块二合一接口中。

:::caution

UFS 模块安装步骤：

1. 确保 UFS 模块的缺角和 Cubie A7A 的 eMMC/UFS 模块二合一接口方向一致
2. 确保 UFS 模块底部卡槽接口和 Cubie A7A 的 eMMC/UFS 模块二合一接口对齐
3. 轻微用力按压 UFS 模块一端的接口，听到"滴"的声音说明安装成功，同样的方法按压另一端的接口，确保 UFS 模块安装成功。
   :::

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-ufs-write-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 安装系统

使用 `dd` 命令将系统镜像安装到 UFS 模块中。

### 下载系统镜像

进入 [资源汇总下载](../../../download) 页面下载并解压系统镜像文件到 Cubie A7A 上。

:::info 下载方式
推荐以下几种方式下载系统镜像文件到 Cubie A7A 上：

- 浏览器下载

在 Cubie A7A 的浏览器访问 [资源汇总下载](../../../download) 页面下载系统镜像文件。

- `wget` 命令下载

复制 [资源汇总下载](../../../download) 页面的系统镜像文件下载地址，然后在 Cubie A7A 上使用 `wget` 命令下载系统镜像文件。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```bash
sudo apt install wget
wget [url]
```

</NewCodeBlock>
其中 `[url]` 需要替换成实际下载的网址。

- 其它方式

在 PC 上下载系统镜像，然后使用U盘、FTP、SCP 等方式将系统镜像文件传输到 Cubie A7A 上。
:::

### 安装系统镜像

使用 `dd` 命令将解压好的系统镜像安装到 UFS 模块中。

### 写入系统镜像

:::danger
使用 `dd` 命令时，请确保选择正确的设备文件，否则会格式化错误的设备，造成数据丢失！
:::

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```bash
sudo dd if=[image_path] of=/dev/sda bs=4M status=progress
```
</NewCodeBlock>
参数说明：
- `if`：输入文件，将 `[image_path]` 替换为解压的系统镜像文件路径
- `of`：输出文件，将 `/dev/sda` 替换为 UFS 模块对应的设备文件(根据实际设备文件修改)
- `bs`：块大小，建议 4M 参数
- `status`：状态显示，progress 参数

### 验证写入结果

使用 `fdisk` 命令查看 UFS 模块的分区信息。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```bash
sudo fdisk -l /dev/sda
```
</NewCodeBlock>

写入成功后，终端会输出类似以下的分区信息：

```text
Disk /dev/sda: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 \* 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/sda1 32768 65535 32768 128M Linux filesystem
/dev/sda2 65536 679935 614400 2.3G EFI System
/dev/sda3 679936 31234014 30554079 116.6G EFI System
```

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- radxa

用户账号：radxa

用户密码：radxa
