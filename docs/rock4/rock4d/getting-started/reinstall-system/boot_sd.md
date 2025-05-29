---
sidebar_position: 1
---

# 安装系统到 MicroSD 卡

本节教程主要介绍如何给 MicroSD 卡重新安装系统。

## 1. 硬件准备

您需要提前准备好以下硬件设备才可以完成重装和启动系统的所有操作。

#### 重装系统

- 读卡器：MicroSD 卡读卡器
- 系统启动介质：MicroSD 卡（推荐容量 32GB 或以上）

#### 启动系统

- 开发板： Radxa ROCK 4D
- 电源适配器：Type-C 电源适配器( 支持 PD 协议，5V 电源输入，建议电流 2A 以上)

:::tip
Radxa ROCK 4D 主板仅支持 5V 电源输入，建议电流 2A 以上，确保所有外设稳定运行。

参考电源：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

- 标准 Type-C 电源适配器( 5V 电源输入，支持 PD 协议，建议电流 2A 以上)
  :::

## 2. 重装系统

重装系统会格式化 MicroSD 卡，如果有重要数据请提前备份。

### 2.1 下载系统镜像

在 PC 上访问 [资源下载汇总](../download) 页面，在下载页面找到 MicroSD 卡对应的系统镜像。

下载完成后，解压系统镜像文件，得到的 `*.img` 文件就是待烧写到 MicroSD 卡中的系统镜像文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件安装到SD卡, 未解压就直接烧录到SD卡，可能会出现安装系统失败或者启动系统失败的情况。
:::

### 2.2 硬件连接

将 MicroSD 卡插入读卡器中，然后将读卡器插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 2.3 安装系统镜像

使用开源镜像烧录工具 Etcher 烧写系统镜像文件到 MicroSD 卡。

#### 2.3.1 下载 Etcher

进入 Balena Etcher 官网下载系统对应平台的软件：balenaEtcher。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

根据自己的系统平台和架构下载对应的软件安装包。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 2.3.2 使用 Etcher

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

#### 2.3.3 安装系统镜像

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

## 3. 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

Debian Linux
用户账号：radxa

用户密码：radxa

## 4. 启动系统

完成系统镜像的安装后，将 MicroSD 卡从读卡器上取下来，然后将卡插入主板的 MicroSD 卡槽中。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-sd.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

最后，使用 5V Type-C 电源适配器启动系统。

## 5. 系统使用

### 5.1 有屏模式

若您是 Radxa ROCK 4D 搭配显示器使用，使用系统就变的比较简单，你可以根据显示器上的系统界面进行操作。

### 5.2 无屏模式

若您是 Radxa ROCK 4D 搭配 USB 转 TTL 模块使用，您可以通过 [串口调试](../../system-config/uart_debug) 方式进行系统操作。

:::tip
对于无屏模式的用户，我们提供以下建议助力您快速熟悉系统使用。

1. 配置网络

您可以直接给 Radxa ROCK 4D 插入网线，确保系统能够连接网络。

2. 配置 SSH 远程

配置 [SSH 远程](../../system-config/ssh-remote) 登录可以去掉 USB 转 TTL 模块，直接使用 SSH 远程登录系统。

3. 配置 VNC 远程

若系统本身带有图形化界面，配置 [VNC 远程](../../system-config/vnc-remote) 登录可以让您直接看到系统画面，无需使用显示器。
:::
