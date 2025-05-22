---
sidebar_position: 2
---

# 安装系统到 NVMe

## 概览

Radxa E54C 通过 NVME 启动系统需要先通过MicroSD 卡或 eMMC 启动系统，然后通过 `rsetup` 工具刷入 SPI Flash，最后通过 `dd` 命令写入系统镜像到 NVME 设备

教程以 MicroSD 卡启动系统作为演示。eMMC 系统安装方式没有区别。

## 1. 启动系统

可以参考[快速上手](../quick-start)教程，使系统通过 MicroSD 卡启动。

确认 Radxa E54C 系统成功启动，关机并断开 Radxa E54C 电源，然后将 NVME 插入 Radxa E54C 主板的 M.2 接口。

:::tip
MicroSD 卡的作用是相当于 x86 系统的启动盘，目的是进入一个可以安装系统的 Linux 环境，并拿到 SPI Flash 的 Image 文件 - `spi.img`，然后将 `spi.img` 通过 `rsetup` 工具刷到 SPI Flash 中
:::

## 2. 刷入 SPI Flash

使用系统配置工具 `rsetup` 将 `spi.img` 刷入 SPI Flash 中。

### 2.1 更新 rsetup

:::tip
rsetup 工具使用指南：可能会因为版本界面有微小差异，请以实际情况为准

- 确认选择 ： 按 `Enter`
- 取消选择 ： 按 `ESC`
- 切换选型 ： 按方向键控制
- 多选界面 ： 按 `Space` 选择，按 `Enter` 确认选择

:::

打开系统命令行，运行 `rsetup` 工具进行更新。

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```
rsetup
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  rsetup 首页界面
  <img src="/img/e/e54c/rsetup-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

1. 更新系统
依次选择 `System` → `System Update` ：
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
选择 `yes` 继续操作，然后按照系统提示完成剩下操作：
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
完成所有操作后重启系统。

### 2.2 使能 SPI Flash 设备

为防止 SPI Flash 中存放的 bootloader 在平时使用被误写入，默认 SPI Flash 设备是关闭的。通过以下方式使能 SPI Flash 设备。

选择 `Overlays` → `Manage Overlays` ：

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-05.webp" style={{width: '100%', maxWidth: '600px'}} />
  <img src="/img/e/e54c/rsetup-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

选择 `Enable SPI Flash` 选项，按空格出现 `*` 符号说明勾选使能 SPI Flash ，然后按 `Enter` 确认操作:

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-08.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
按照系统提示完成剩下操作，完成所有操作后重启系统。

### 2.3 刷入 SPI Flash

重启系统后，再次打开系统配置工具 `rsetup`。

选择 `System` → `Bootloader Management` → `Update SPI Bootloader` :

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-09.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
选择安装的Bootloader文件，若选择的Bootloader有多个选项，优先选择带有spi后缀的选项:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-10.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-11.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
按照系统提示完成剩下操作，完成所有操作后重启系统。

## 3. 写入系统镜像到 NVME

完成刷入 SPI Flash 的操作后，我们可以查看系统是否识别 SPI Flash 和 NVME 设备。

### 3.1 检查设备

打开系统命令行, 使用 `lsblk` 命令检查系统是否识别到 NVME 设备。

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```
lsblk
```
</NewCodeBlock>

- 若 Linux 系统识别出 SPI Flash 设备, 通常会被识别成 `mtdblock*`

- 若 Linux 系统识别出 NVME 设备, 通常会被识别成 `nvme*n*`

使用 `lsblk` 输出的示例信息：
<NewCodeBlock tip="radxa@radxa-e54c$" type="host">

```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
mtdblock0    31:0    0    16M  0 disk
mmcblk1     179:0    0    58G  0 disk
├─mmcblk1p1 179:1    0    16M  0 part
├─mmcblk1p2 179:2    0   300M  0 part
└─mmcblk1p3 179:3    0  57.6G  0 part /
zram0       253:0    0   3.9G  0 disk [SWAP]
nvme0n1     259:0    0 119.2G  0 disk
├─nvme0n1p1 259:1    0    16M  0 part /config
├─nvme0n1p2 259:2    0   300M  0 part /boot/efi
└─nvme0n1p3 259:3    0 118.9G  0 part
```

</NewCodeBlock>

### 3.2 下载系统镜像

下载 Radxa E54C 的系统镜像文件到本地：可以直接使用 `wget` 命令下载文件到当前目录，其中网址链接可以进入[资源汇总下载](../../download)复制。

:::tip
你也可以通过其他方式将系统镜像文件复制到 Radxa E54C 上，比如通过 FTP、SCP 等方式
:::

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```
# 安装 wget
sudo apt-get install wget

# 下载系统镜像文件

wget https://github.com/radxa-build/radxa-e54c/releases/download/rsdk-b2/radxa-e54c_bookworm_cli_b2.output.img.xz

```
</NewCodeBlock>

- wget : 下载文件，后面添加下载链接

### 3.3 写入系统镜像到 NVME

使用命令将压缩的系统镜像解压并直接写入到 NVME 设备。

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo xzcat ~/radxa-e54c_bookworm_cli_b2.output.img.xz | sudo dd of=/dev/nvme0n1 bs=1M status=progress

```
</NewCodeBlock>

- xzcat : 解压 xz 格式的系统镜像文件
- dd : 复制并写入到 NVME 设备
- of=/dev/nvme0n1 : 指定写入的设备为 nvme0n1
- bs=1M : 指定写入的块大小为 1M
- status=progress : 显示写入进度

## 4. 重启系统
:::tip
你若遇到以下情况，可以尝试以下办法解决：

- 系统无法启动：可以更换刷入 SPI Flash 的 Bootloader 文件选项

- 系统无法登录或者密码错误：可以尝试重新下载系统镜像和写入系统镜像文件
:::

完成以上操作后，关机并断开 Radxa E54C 与电源，然后将 MicroSD 卡拔出，接上 Radxa E54C 与电源，等待系统启动。
```
