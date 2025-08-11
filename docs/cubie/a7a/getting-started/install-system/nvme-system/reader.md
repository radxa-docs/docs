---
sidebar_position: 2
---

# 使用 M.2 NVMe 固态硬盘盒

主要介绍 M.2 NVMe SSD 搭配 M.2 NVMe 固态硬盘盒使用并安装系统到 M.2 NVMe SSD 中。

:::warning
安装系统会格式化 M.2 NVMe SSD，如果有重要数据请提前备份！

M.2 NVMe SSD 启动系统需要搭配 PCIe 转 M.2 M Key HAT 扩展板使用。
:::

## 硬件准备

您需要提前准备以下硬件：

- 主板：瑞莎 Cubie A7A
- 系统启动介质：M.2 NVMe SSD
- 固态硬盘盒：M.2 NVMe 固态硬盘盒
- 拓展板：PCIe 转 M.2 M Key HAT 扩展板
- 电源适配器：5V Type-C 电源适配器

:::tip
推荐配件：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 硬件说明

Cubie A7A 主板支持标准 PD 协议的 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

- 电源适配器

当系统镜像烧录到 M.2 NVMe SSD 后，可以使用 Type-C 电源适配器给 Cubie A7A 供电，避免后期开发功率不足的问题。

## 硬件连接

将 M.2 NVMe SSD 安装到固态硬盘盒中，然后将固态硬盘盒插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/write-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 软件准备

使用开源镜像烧录工具 Etcher 烧写系统镜像文件到 eMMC 模块。

### 下载系统镜像

进入 [资源汇总下载](../../../download) 页面下载并解压系统镜像文件到 PC 上。

### 下载 Etcher

进入 Balena Etcher 官网下载系统对应平台的软件：[balenaEtcher](https://etcher.balena.io)。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

根据自己的系统平台和架构下载对应的软件安装包。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 使用 Etcher

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

- 安装系统镜像

1. 选择主板对应的系统镜像：点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. 选择 eMMC 模块对应的磁盘：点击 `Select target` 选项，选择自己接入 PC 的读卡器对应磁盘设备。

:::danger
请勿选错磁盘，否则 Etcher 将格式化被选中的磁盘，造成重要数据丢失！
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： 选择需要安装系统镜像的磁盘设备

② ： 点击 `Select 1` 选项确认设备选择

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3.开始写入系统镜像：点击 `Flash` 选项，等待软件自动进行系统镜像的写入和校验。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统写入完成
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统校验完成
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4.成功写入系统镜像后，关闭 Etcher 软件！

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统；

出厂系统镜像默认存在两个用户账号，分别是 `root` 和 `radxa`。

- root

用户账号：root

用户密码：radxa

- radxa

用户账号：radxa

用户密码：radxa
