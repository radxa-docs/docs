---
sidebar_position: 2
---

# 安装系统到 NVME

## 概览

Radxa E54C 通过 NVME 启动系统需要先通过MicroSD 卡或 eMMC 启动系统，然后通过 `rsetup` 工具或 `RKDevTool` 工具刷入 SPI Flash，最后通过 `dd` 命令写入系统镜像到 NVME 设备

教程以 MicroSD 卡启动系统作为演示。eMMC 系统安装方式没有区别。

## 启动系统

可以参考[快速上手](../quick-start)教程，使系统通过 MicroSD 卡启动。

确认 Radxa E54C 系统成功启动，关机并断开 Radxa E54C 电源，然后将 NVME 插入 Radxa E54C 主板的 M.2 接口。

:::tip
MicroSD 卡的作用是相当于 x86 系统的启动盘，目的是进入一个可以安装系统的 Linux 环境，并拿到 SPI Flash 的 Image 文件 - `spi.img`，然后将 `spi.img` 通过 `rsetup` 工具刷到 SPI Flash 中
:::

## 刷入 SPI Flash

### 使用 rsetup 刷入 SPI Flash

使用系统配置工具 `rsetup` 将 `spi.img` 刷入 SPI Flash 中。

#### 更新 rsetup

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
  <img src="/img/e/e54c/rsetup-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

1. 更新系统
依次选择 `System` → `System Update` ：
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
选择 `yes` 继续操作，然后按照系统提示完成剩下操作：
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
完成所有操作后重启系统。

#### 使能 SPI Flash 设备

为防止 SPI Flash 中存放的 bootloader 在平时使用被误写入，默认 SPI Flash 设备是关闭的。通过以下方式使能 SPI Flash 设备。

选择 `Overlays` → `Manage Overlays` ：

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
  <img src="/img/e/e54c/rsetup-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择 `Enable SPI Flash` 选项，按空格出现 `*` 符号说明勾选使能 SPI Flash ，然后按 `Enter` 确认操作:

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
按照系统提示完成剩下操作:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
完成所有操作后重启系统。

#### 刷入 SPI Flash

重启系统后，再次打开系统配置工具 `rsetup`。

选择 `System` → `Bootloader Management` → `Update SPI Bootloader` :

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-10.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-11.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-12.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
选择安装的Bootloader文件，若选择的Bootloader有多个选项，优先选择带有spi后缀的选项:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-13.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
按照系统提示完成剩下操作:
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-14.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
完成所有操作后重启系统。

### 使用 RKDevTool 刷入 SPI Flash

## 写入系统镜像到 NVME

完成刷入 SPI Flash 的操作后，我们可以查看系统是否识别 SPI Flash 和 NVME 设备。

### 检查设备

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

### 下载系统镜像

下载 Radxa E54C 的系统镜像文件到本地：可以直接使用 `wget` 命令下载文件到当前目录，其中网址链接可以进入 [资源汇总下载](../../download) 复制。

:::tip
您也可以进入 [资源汇总下载](../../download) 页面下载系统镜像，然后通过 U 盘或者在线传输（如 FTP、SCP 等）的方式将系统镜像文件复制到 Radxa E54C 上
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

### 写入系统镜像到 NVME

使用命令将压缩的系统镜像解压并直接写入到 NVME 设备。

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo xzcat ~/radxa-e54c_bookworm_cli_b2.output.img.xz | sudo dd of=/dev/nvme0n1 bs=1M status=progress

```
</NewCodeBlock>

- xzcat : 解压 xz 格式的系统镜像文件
- dd : 复制并写入到 NVME 设备（⚠️注意：使用dd命令时请确认设备名称，错误的设备名可能导致数据丢失）
- of=/dev/nvme0n1 : 指定写入的设备为 nvme0n1
- bs=1M : 指定写入的块大小为 1M，提高写入速度
- status=progress : 显示写入进度，让您了解写入状态

### 验证写入结果

写入完成后，您可以验证NVMe中的分区表是否正确创建：

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo fdisk -l /dev/nvme0n1

```
</NewCodeBlock>

正确写入后，应该会看到类似以下的分区信息：
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-16.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 从NVMe启动系统

### 重启准备

完成以上操作后，请按以下步骤操作：

1. 关闭系统：`sudo shutdown -h now`
2. 断开 Radxa E54C 与电源
3. 移除 MicroSD 卡
4. 重新连接电源
5. 等待系统从NVMe启动

### 验证NVMe启动

系统启动后，可通过以下方式验证系统是否成功从NVMe启动：

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

lsblk
df -h

```
</NewCodeBlock>

如果您看到 `/dev/nvme0n1p3` 被挂载为根目录 `/`，则表示系统已成功从NVMe启动。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-15.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 常见问题及解决方案

:::tip
如果在启动过程中遇到问题，请尝试以下解决方案：

- **系统无法启动**：
  - 重新插入MicroSD卡，启动系统
  - 尝试更换刷入 SPI Flash 的 Bootloader 文件选项（优先选择最新版本）
  - 检查 M.2 接口是否连接良好，可尝试重新插拔NVMe

- **系统可以启动但无法登录**：
  - 默认用户名：`radxa`，密码：`radxa`
  - 如密码错误，可重新使用MicroSD卡启动，然后重新下载并写入系统镜像
:::

## 后续步骤

成功从NVMe启动系统后，您可以进行以下操作：

### 系统更新

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo apt update && sudo apt upgrade

```
</NewCodeBlock>


### 备份系统

定期备份重要数据，可使用`dd`或`rsync`命令


### 性能测试

- 测试读取速度

测试读取速度（1GB 数据）。

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo dd if=/dev/nvme0n1 of=/dev/null bs=1M count=1024 iflag=direct

```
</NewCodeBlock>

- 检查NVMe温度

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

# 安装 nvme-cli

sudo apt install nvme-cli

# 检查温度

sudo nvme smart-log /dev/nvme0n1 | grep "temperature"

```
</NewCodeBlock>

- 查看NVMe设备的详细信息和健康状态

<NewCodeBlock tip="radxa@radxa-e54c$" type="host">
```

sudo nvme list

```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e54c/rsetup-17.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
```
