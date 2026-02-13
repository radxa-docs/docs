---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用瑞莎 X5 产品。

## 产品实物

| 位置 |   视图    | 位置 |   视图    | 位置 |   视图    |
| :--: | :-------: | :--: | :-------: | :--: | :-------: |
|  左  | X5 正视图 |  中  | X5 背视图 |  右  | X5 侧视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件准备

您需要提前准备以下硬件设备：

- 主板：瑞莎 X5
- 供电：USB Type-C（兼容 PD / QC 协议）电源适配器或 12V DC 电源适配器
- 系统启动盘：U 盘
- 系统安装盘：固态硬盘（M.2 M Key 2230）或板载 eMMC
- 显示设备：Micro HDMI 转 HDMI 线与显示器（用于显示图形界面）
- 输入设备：键盘和鼠标（用于图形界面操作）

:::tip 推荐配件
瑞莎 X5 支持 USB Type-C（兼容 PD / QC 协议）或 12V DC 供电，建议电源适配器功率充足，确保所有外设稳定运行。

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 安装系统

我们需要提前将 U 盘制作为启动盘，然后通过启动盘给板载 eMMC 或 NVMe 固态硬盘安装系统。

### 下载系统镜像

您可以根据自己的喜好选择对应系统镜像，教程以安装 Windows 11 系统为例。

- [Windows 10](https://www.microsoft.com/software-download/windows10)
- [Windows 11](https://www.microsoft.com/zh-cn/software-download/windows11)
- [Ubuntu](https://ubuntu.com/download)
- [Debian](https://www.debian.org/download)
- [Fedora](https://fedoraproject.org/workstation/download)
- [FreeBSD](https://www.freebsd.org/where/)

### 制作启动 U 盘

使用 [Rufus](https://rufus.ie/) 制作启动 U 盘。

#### 下载 Rufus

访问 [Rufus 下载](https://rufus.ie/en/#download) 页面，下载 Rufus 软件。

#### 开始制作启动盘

打开 Rufus 软件，按照以下步骤操作：

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/rufus-windows-param.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : 选择制作启动盘的 U 盘

② : 选择下载的系统镜像

③ : 开始制作启动盘

④ : 自定义 Windows 用户，选择 `OK` 即可

:::tip

其他选项选择默认设置即可，若有特殊需求，可自行调整选项设置。

:::

#### 制作启动盘成功

等待 Rufus 制作启动盘成功， Rufus 会提示 `Ready`。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/rufus-windows-succ.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

### 安装系统镜像

将制作好的启动 U 盘安装到主板的 USB Type-A 端口，主板分别连接显示器、鼠标以及键盘，最后使用电源适配器给主板供电。

#### 进入启动菜单

主板上电后，按键盘的 `F7` 键，进入启动菜单，选择 U 盘对应的启动项。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-boot-menu.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 设置系统语言

选择 `English (United States)`，点击 `Next`。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-language.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 选择键盘设置

选择 `US`，点击 `Next`。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-keyboard.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 选择安装选项

选择 `Install Windows 11` 和勾选 `I agree ...`，点击 `Next`。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-install.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 填写产品密钥

若无产品密钥，则点击 `I don't have a product key`；若有产品密钥，则输入产品密钥，点击 `Next`。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-product-key.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 选择系统镜像

选择自己需要安装的系统镜像，点击 `Next`。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-image.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 接受许可协议

选择 `Accept` 选项。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-accept.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 选择安装位置

选择安装位置，点击 `Next`。

:::tip 镜像位置

瑞莎 X5 可选板载 eMMC 和外接 M.2 M Key 2230，选择安装位置时，可以根据对应的容量来判断磁盘类型。

:::

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-install-location.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 正式安装系统

点击 `Install`，等待系统安装完成，整个安装过程中可能会出现重启，这是正常现象，等待安装完成即可。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-install-progress.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 设置系统地区

选择 `United States`，点击 `Next`。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-region.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 设置键盘布局

选择 `US`，点击 `Next`。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-keyboard-layout.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 设置网络连接

可以连接有线网络进行联网，无线网络需要安装驱动，目前演示无网络安装系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-network.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 设置用户信息

填写用户名、密码、确认密码，然后点击 `Next` 进入下一步。

:::tip 密码

不填写密码并点击 `Next`，系统会默认设置密码为空。

:::

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-user.webp" style={{width: '100%', maxWidth: '1200px'}} />
   <img src="/img/x/x5/x5-windows-password.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 设置隐私信息

自行选择需要开启和关闭的隐私选项，然后点击 `Accept` 进入下一步。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-privacy.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 设置完成

等待几分钟，进入 Windows 11 桌面环境，至此，Windows 11 系统安装完成。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-windows-desktop.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
