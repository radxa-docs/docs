---
sidebar_position: 2
---

# 无 M.2 NVMe 固态硬盘盒

本节教程适用于无 M.2 NVMe 固态硬盘盒的用户，主要介绍如何在 MicroSD 卡启动系统的基础上将系统安装到 M.2 NVMe SSD 中。

:::tip
M.2 NVMe SSD 是指支持 M.2 接口和 NVMe 协议的固态硬盘。
:::

## 1. 硬件准备

无 M.2 NVMe 固态硬盘盒安装系统，需要 Radxa ROCK 4D 通过 MicroSD 卡启动系统正常。

**注意： 若 MicroSD 卡启动异常，可以参考 [安装系统到 MicroSD 卡](../boot_sd)教程，先安装系统到 MicroSD 卡上。**

我们会在 MicroSD 卡上的系统进行操作，使用 `dd` 命令将系统安装到 M.2 NVMe SSD 中。

**注意：使用 M.2 NVMe SSD 启动系统都需要搭配 PCIe 转 M.2 M Key 转接板，然后使用 Radxa ROCK 4D 的 FPC 接口转 PCIe 连接转接板。**

我们的教程使用 [Radxa 双 2.5G 拓展板](https://radxa.com/products/accessories/dual-2-5g-router-hat) 作为演示。

使用 Radxa 双 2.5G 拓展板就不需要使用 Radxa ROCK 4D 自带的电源适配器, 直接通过 Radxa 双 2.5G 拓展板的电源接口给开发板供电即可。

:::tip
参考电源：

Radxa 双 2.5G 拓展板仅支持 12V 电源输入，建议电流 2A 及以上，以确保所有外设稳定运行。

- [瑞莎 DC12 36W电源适配器](https://radxa.com/products/accessories/power-dc12-36w)(推荐使用)
- [瑞莎 DC12 60W电源适配器](https://radxa.com/products/accessories/power-dc12-60w)
- 标准12V/2A DC电源适配器(DC5525接口)
  :::

您需要准备以下硬件：

- 开发板：Radxa ROCK 4D
- M.2 NVMe SSD: 自行购买
- FPC 接口转 PCIe 连接线: 自行购买
- PCIe 转 M.2 M Key 转接板: 自行购买
- 电源适配器：12V/2A DC电源适配器(DC5525接口)

## 2. 重装系统

重装系统会格式化 M.2 NVMe 固态硬盘，如果有重要数据请提前备份。

### 2.1 下载系统镜像

下载 Radxa ROCK 4D 的系统镜像文件到 Radxa ROCK 4D 上：可以直接使用 `wget` 命令下载文件到当前目录，其中网址链接可以进入 [资源汇总下载](../../../download) 复制。

:::tip
你也可以通过其他方式将系统镜像文件复制到 Radxa ROCK 4D 上，比如通过 FTP、SCP 等方式
:::

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
# 安装 wget
sudo apt-get install wget
# 下载系统镜像文件
wget [URL]
```
</NewCodeBlock>
- wget : 下载文件，将 [URL] 替换成实际下载链接。

### 2.2 硬件连接

将 M.2 NVMe 固态硬盘安装到 Radxa 双 2.5G 拓展板上，然后拓展板通过 FPC接口 连接到Radxa ROCK 4D。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme.webp" style={{width: '60%', maxWidth: '1200px'}} />
</div>

### 2.3 安装系统镜像

#### 2.3.1 写入系统镜像到 M.2 NVMe SSD

使用命令将压缩的系统镜像解压并直接写入到 M.2 NVMe SSD，请根据实际下载的系统镜像文件名进行修改。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo xzcat ~/radxa-rk3576_bookworm_kde_t2.output_512.img.xz | sudo dd of=/dev/nvme0n1 bs=1M status=progress
```
</NewCodeBlock>

- xzcat : 解压 xz 格式的系统镜像文件
- dd : 复制并写入到 M.2 NVMe SSD 设备（⚠️注意：使用dd命令时请确认设备名称，错误的设备名可能导致数据丢失）
- of=/dev/nvme0n1 : 指定写入的设备为 nvme0n1（可以根据实际情况修改）
- bs=1M : 指定写入的块大小为 1M，提高写入速度
- status=progress : 显示写入进度，让您了解写入状态

#### 2.3.2 验证写入结果

写入完成后，您可以验证 M.2 NVMe SSD 中的分区表是否正确创建：

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo fdisk -l /dev/nvme0n1
```
</NewCodeBlock>

正确写入后，应该会看到类似以下的分区信息：
<NewCodeBlock tip="radxa@radxa-4d$" type="host">

```
Disk /dev/nvme0n1: 465.76 GiB, 500107862016 bytes, 976773168 sectors
Disk model: Samsung SSD 980 500GB
Units: sectors of 1 \* 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 16384 bytes / 131072 bytes
Disklabel type: gpt
Disk identifier: 9ABAF4B4-329B-41A8-908A-088211D43542

Device Start End Sectors Size Type
/dev/nvme0n1p1 32768 65535 32768 16M Linux filesystem
/dev/nvme0n1p2 65536 679935 614400 300M EFI System
/dev/nvme0n1p3 679936 15620800 14940865 7.1G EFI System
```

</NewCodeBlock>

## 3. 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Debian Linux

用户账号：radxa

用户密码：radxa

## 4. 启动系统

完成系统镜像的安装后：

1. 关闭系统：`sudo shutdown -h now`
2. 断开 Radxa ROCK 4D 的 DC 12V 电源
3. 移除 MicroSD 卡
4. 重新连接DC 12V 电源
5. 等待系统从 M.2 NVMe SSD 启动

启动系统后，蓝色和绿色 LED 灯会同时亮起，大概过几秒左右，绿灯常亮、蓝色指示灯会闪烁，一般表示系统启动成功。

## 5. 验证系统

系统启动后，您可以使用 `lsblk` 命令查看系统分区信息：

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo lsblk
```
</NewCodeBlock>

如果您看到 `/dev/nvme0n1p3` 被挂载为根目录 `/`，则表示系统已成功从 M.2 NVMe SSD 启动。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
mtdblock0    31:0    0    16M  0 disk
zram0       253:0    0   1.9G  0 disk [SWAP]
nvme0n1     259:0    0 465.8G  0 disk
├─nvme0n1p1 259:1    0    16M  0 part /config
├─nvme0n1p2 259:2    0   300M  0 part /boot/efi
└─nvme0n1p3 259:3    0 465.4G  0 part /
```
</NewCodeBlock>

:::tip

如果在启动过程中遇到问题，请尝试以下解决方案：

- 系统无法启动：

  - 尝试重新安装 M.2 NVMe SSD，启动系统
  - 尝试 [下载并烧录最新 SPI 启动固件](../boot_start)
  - 尝试重新安装系统到 M.2 NVMe SSD

- 系统可以启动但无法登录：
  - 默认用户名：radxa，密码：radxa
  - 如密码错误，重新下载系统镜像和安装系统到 M.2 NVMe SSD
    :::
