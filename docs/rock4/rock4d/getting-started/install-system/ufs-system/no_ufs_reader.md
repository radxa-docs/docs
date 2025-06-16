---
sidebar_position: 2
---

# 不使用瑞莎 eMMC / UFS 二合一模块读卡器

本节教程适用于没有瑞莎 eMMC / UFS 二合一模块读卡器的用户，主要介绍如何在 MicroSD 卡启动系统的基础上将系统安装到 UFS 模块中。

## 硬件准备

在没有瑞莎 eMMC / UFS 二合一模块读卡器的情况下安装系统到 UFS 模块，需要瑞莎 ROCK 4D 通过 MicroSD 卡能正常启动系统。

我们会在 MicroSD 卡上的系统进行操作，使用 `dd` 命令将系统安装到 UFS 模块中。

注意： 若 MicroSD 卡启动异常，可以参考 [安装系统到 MicroSD 卡](../boot_sd)教程，先安装系统到 MicroSD 卡上。

**您需要准备以下硬件：**

- 开发板： 瑞莎 ROCK 4D
- [UFS 模块](https://radxa.com/products/accessories/ufs-module)
- 正常启动系统的 MicroSD 卡
- 电源适配器：Type-C 电源适配器( 支持 PD 协议，5V 电源输入，建议电流 3A 以上)

:::tip
ROCK 4D 主板仅支持 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

参考电源：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

- 标准 Type-C 电源适配器( 5V 电源输入，支持 PD 协议，建议电流 3A 以上)
  :::

## 安装系统

安装系统会格式化 UFS 模块，如果有重要数据请提前备份。

### 下载系统镜像

下载 ROCK 4D 的系统镜像文件到 ROCK 4D 上：可以直接使用 `wget` 命令下载文件到当前目录，其中网址链接可以进入 [资源汇总下载](../../../download) 复制。

:::tip
您也可以通过其他方式将系统镜像文件复制到 ROCK 4D 上，比如通过 FTP、SCP 等方式
:::

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
# 安装 wget
sudo apt-get install wget
# 下载系统镜像文件
wget [URL]
```
</NewCodeBlock>
- wget : 下载文件，将 [URL] 替换成实际下载链接。

### 硬件连接

将 UFS 模块安装到主板的 eMMC/UFS 模块接口中，然后使用 5V Type-C 电源适配器启动系统。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-ufs-sd.webp" style={{width: '60%', maxWidth: '1200px'}} />
</div>

:::caution

UFS 模块安装步骤：

1. 确保 UFS 模块的缺角和 ROCK 4D 的 eMMC / UFS 模块接口方向一致
2. 确保 UFS 模块底部卡槽接口和 ROCK 4D 的 eMMC / UFS 模块接口对齐
3. 轻微用力按压 UFS 模块一端的接口，听到滴的声音说明安装成功，同样的方法按压另一端的接口，确保 UFS 模块安装成功。
   :::

### 安装系统镜像

#### 写入系统镜像到 UFS 模块

使用命令将压缩的系统镜像解压并直接写入到 UFS 模块，请根据实际下载的系统镜像文件名进行修改。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo xzcat ~/radxa-rk3576_bookworm_kde_b1.output_4096.img.xz | sudo dd of=/dev/sda bs=1M status=progress
```
</NewCodeBlock>

- xzcat : 解压 xz 格式的系统镜像文件
- dd : 复制并写入到 UFS 模块（⚠️注意：使用dd命令时请确认设备名称，错误的设备名可能导致数据丢失）
- of=/dev/sda : 指定写入的设备为 sda（可以根据实际情况修改）
- bs=1M : 指定写入的块大小为 1M，提高写入速度
- status=progress : 显示写入进度，让您了解写入状态

#### 验证写入结果

写入完成后，您可以验证 UFS 模块中的分区表是否正确创建：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo fdisk -l /dev/sda
```
</NewCodeBlock>

正确写入后，应该会看到类似以下的分区信息：

```
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

- Debian Linux

用户账号：radxa

用户密码：radxa

## 启动系统

完成系统镜像的安装后：

1. 关闭系统：`sudo shutdown -h now`
2. 断开 ROCK 4D 的电源
3. 移除 MicroSD 卡
4. 重新连接电源
5. 等待系统从 UFS 模块启动

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::caution

UFS 模块安装步骤：

1. 确保 UFS 模块的缺角和 ROCK 4D 的 eMMC / UFS 模块接口方向一致
2. 确保 UFS 模块底部卡槽接口和 ROCK 4D 的 eMMC / UFS 模块接口对齐
3. 轻微用力按压 UFS 模块一端的接口，听到滴的声音说明安装成功，同样的方法按压另一端的接口，确保 UFS 模块安装成功。
   :::

启动系统后，蓝色和绿色 LED 灯会同时亮起，大概过几秒左右，绿灯常亮、蓝色指示灯会闪烁，一般表示系统启动成功。

## 验证系统

系统启动后，您可以使用 `lsblk` 命令查看系统分区信息：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo lsblk
```
</NewCodeBlock>

如果您看到 `/dev/sda3` 被挂载为根目录 `/`，则表示系统已成功从 UFS 模块启动。

```
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
sda 8:0 0 119.1G 0 disk
├─sda1 8:1 0 128M 0 part /config
├─sda2 8:2 0 2.3G 0 part /boot/efi
└─sda3 8:3 0 116.6G 0 part /
mtdblock0 31:0 0 16M 0 disk
zram0 253:0 0 1.9G 0 disk [SWAP]
```

:::tip

如果在启动过程中遇到问题，请尝试以下解决方案：

- 系统无法启动：

  - 尝试重新安装 UFS 模块，启动系统
  - 尝试 [下载并烧录最新 SPI 启动固件](../boot_start)
  - 尝试重新安装系统到 UFS 模块

- 系统可以启动但无法登录：
  - 默认用户名：radxa，密码：radxa
  - 如密码错误，重新下载系统镜像和安装系统到 UFS 模块
    :::
