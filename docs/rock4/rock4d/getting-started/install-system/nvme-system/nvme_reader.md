---
sidebar_position: 1
---

# 使用 M.2 NVMe 固态硬盘盒

本节教程适用于有 M.2 NVMe 固态硬盘盒的用户，主要介绍如何通过 M.2 NVMe 固态硬盘盒给 M.2 NVMe SSD 安装系统。

:::tip
M.2 NVMe SSD 是指支持 M.2 接口和 NVMe 协议的固态硬盘。
:::

## 硬件准备

使用固态硬盘盒 给 M.2 NVMe SSD 安装系统，不需要依赖 MicroSD 卡，直接将 M.2 NVMe SSD 插入固态硬盘盒中，使用 Etcher 软件安装系统到 M.2 NVMe SSD 中。

**注意：使用 M.2 NVMe SSD 启动系统都需要搭配 PCIe 转 M.2 M Key HAT 使用。**

您需要准备以下硬件：

- 开发板：Radxa ROCK 4D
- M.2 NVMe SSD: 自行购买
- M.2 NVMe 固态硬盘盒: 自行购买
- PCIe 转 M.2 M Key HAT : 自行购买
- 电源适配器：Type-C 电源适配器( 支持 PD 协议，5V 电源输入，建议电流 2A 以上)

:::tip
Radxa ROCK 4D 主板仅支持 5V 电源输入，建议电流 2A 以上，确保所有外设稳定运行。

参考电源：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

- 标准 Type-C 电源适配器( 5V 电源输入，支持 PD 协议，建议电流 2A 以上)
  :::

## 重装系统

重装系统会格式化 M.2 NVMe 固态硬盘，如果有重要数据请提前备份。

### 下载系统镜像

在 PC 上访问 [资源下载汇总](../../../download) 页面，在下载页面找到 M.2 NVMe SSD 对应的系统镜像文件，下载并解压。

下载完成后，得到的 `*.img` 文件就是待烧写到 M.2 NVMe SSD 中的系统镜像文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件安装到 M.2 NVMe SSD , 未解压就直接烧录到 M.2 NVMe SSD ，可能出现安装系统失败或者启动系统失败的情况。
:::

### 硬件连接

将 M.2 NVMe 固态硬盘插入固态硬盘盒中，然后将固态硬盘盒插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/write-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 安装系统镜像

使用开源镜像烧录工具 Etcher 烧写系统镜像文件到 M.2 NVMe 固态硬盘中。

#### 下载 Etcher

进入 Balena Etcher 官网下载系统对应平台的软件：balenaEtcher。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

根据自己的系统平台和架构下载对应的软件安装包。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 使用 Etcher

下载完成后，双击打开 Etcher 应用。

:::tip

- Windows

下载的文件是 `*.exe` 格式的安装包，双击程序就可以运行。

- Linux

推荐下载 `*.zip` 格式的压缩包，解压后双击程序就可以运行。

- MacOS

根据自己的系统架构下载对应的 `*.dmg` 文件,双击打开后，将软件拖拽到 Applications 文件夹进行安装，安装完成后双击应用图标运行。

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 安装系统镜像

1. 选择镜像文件

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. 选择存储设备

点击 `Select target` 选项，选择自己待安装系统镜像对应存储设备。

:::danger
请勿选错存储设备，否则 Etcher 将格式化被选中的存储设备，造成重要数据丢失！

您可以插拔存储设备，观察可选存储设备的变化，从而进一步判断待安装的存储设备。
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： 选择需要安装系统镜像的存储设备

② ： 点击 `Select 1` 选项确认设备选择

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. 安装系统镜像

点击 `Flash` 选项，等待软件自动进行系统镜像的安装和校验。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统安装完成
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统校验完成
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
  成功安装系统镜像后，关闭 Etcher 软件！
</div>

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Debian Linux

用户账号：radxa

用户密码：radxa

## 启动系统

完成系统镜像的安装后：

1. 将 M.2 NVMe SSD 从 M.2 固态硬盘盒中取出
2. 取下 Radxa ROCK 4D 上的 MicroSD 卡
3. 将 M.2 NVMe SSD 安装到 PCIe 转 M.2 M Key HAT
4. 将 PCIe 转 M.2 M Key HAT 安装到 Radxa ROCK 4D 上
5. 连接 Radxa ROCK 4D 的电源
6. 等待系统从 M.2 NVMe SSD 启动

启动系统后，蓝色和绿色 LED 灯会同时亮起，大概过几秒左右，绿灯常亮、蓝色指示灯会闪烁，一般表示系统启动成功。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 验证系统

系统启动后，您可以使用 `lsblk` 命令查看系统分区信息：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo lsblk
```
</NewCodeBlock>

如果您看到 `/dev/nvme0n1p3` 被挂载为根目录 `/`，则表示系统已成功从 M.2 NVMe SSD 启动。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
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
