---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用瑞莎 C200 Orin 开发套件。

:::tip 说明

瑞莎 C200 Orin 开发套件预装 EDK2 固件，支持从 U 盘或 NVMe 固态硬盘启动系统。

快速上手教程仅介绍安装系统到 U 盘，其它系统启动介质或安装系统方式参考 [安装系统](./install-system/) 教程。
:::

## 产品实物

|        产品实物         | 序号 |  视图  | 序号 |  视图  | 序号 |  视图  |
| :---------------------: | :--: | :----: | :--: | :----: | :--: | :----: |
| 瑞莎 C200 Orin 开发套件 |  ①   | 俯视图 |  ②   | 侧视图 |  ③   | 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/c200/radxa-c200-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 瑞莎 C200 Orin 开发套件
- 供电：电源适配器
- 系统启动介质：U 盘（用于安装系统与启动）
- 显示设备：DP 数据线和显示器
- 输入设备：键盘和鼠标（用于图形界面操作）

:::tip 推荐配件

- [瑞莎 DC 60W 电源适配器(推荐使用)](https://radxa.com/products/accessories/power-dc12-60w)
- 支持 9-20V 的 DC 电源适配器进行供电，推荐功率 40W 及以上

:::

## 安装系统

主要介绍安装系统到 U 盘。

:::warning 重要提醒

**安装系统会完全格式化 U 盘，所有数据将被永久删除！**

请在操作前确认：

- U 盘中无重要数据或已完成资料备份
- 选择正确的存储设备，避免格式化其他磁盘

:::

### 硬件连接

将 U 盘插入电脑的 USB 接口。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/u-disk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 下载系统镜像

请访问 [资源汇总下载](../download) 页面，下载 **系统镜像**。

:::tip 软件使用

该镜像文件为 `.img.xz` 格式的压缩包，下载后需要先解压，得到 `.img` 格式的镜像文件才能使用。

:::

### 安装系统镜像

使用 Balena Etcher 软件可以将系统镜像安装到 U 盘中。

:::tip Balena Etcher
对于 Balena Etcher 的安装和使用，可以参考 [Etcher 使用](/common/radxa-os/install-system/balena-etcher) 教程。
:::

#### 选择系统镜像

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-image-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### 选择存储设备

点击 `Select target` 选项，选择 U 盘设备。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-udisk-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-udisk-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### 开始烧录

点击 `Flash!` 选项，开始烧录系统镜像到 U 盘中。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-flash-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  等待系统安装完成
  <img
    src="/img/common/radxa-os/install-system/etcher-flashing-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  等待系统校验完成
  <img
    src="/img/common/radxa-os/install-system/etcher-valid-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  成功安装系统镜像后，关闭 Etcher 软件！
  <img
    src="/img/common/radxa-os/install-system/etcher-completed-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 启动系统

完成系统的安装后，将 U 盘插到到瑞莎 C200 Orin 开发套件的 USB 接口，然后使用电源适配器给瑞莎 C200 Orin 开发套件供电，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/c200/hardware-connection-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ：安装 U 盘

② ：使用 DP 数据线连接显示器和主板

③ ：使用电源适配器给瑞莎 C200 Orin 开发套件供电

系统启动正常后，电源指示灯绿色亮起。

## 登录系统

启动系统后，您需要根据系统提示完成初次系统配置。

## 使用系统

成功登录系统后，您就可以在瑞莎 C200 Orin 开发套件上进行系统配置与开发。

:::info 安装系统说明

我们提供 3 种方式给用户安装系统，以下是三种方式的优缺点：

1. 使用我们提供的 EDK2 固件和英伟达官方提供的 SD 卡系统镜像

参考教程 [通过 EDK2 固件启动系统](./install-system/radxa-bios-system)。

- 优点：支持 U 盘和 NVMe 固态硬盘启动系统，安装系统简单
- 缺点：无法进入 MAXN_SUPER 模式

2. 通过 SDK Manager 安装系统

参考教程 [通过 SDK Manager 安装系统](./install-system/sdk-manager)。

- 优点：可自行部署组件环境
- 缺点：无法进入 MAXN_SUPER 模式，只支持 NVMe 固态硬盘启动系统

3. 通过命令行安装 Super 系统

参考教程 [通过命令行安装 Super 系统](./install-system/super-system)。

- 优点：可进入 MAXN_SUPER 模式
- 缺点：只支持 NVMe 固态硬盘启动系统

:::
