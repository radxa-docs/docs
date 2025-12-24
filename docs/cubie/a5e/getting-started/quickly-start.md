---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A5E 产品。

## 产品实物

| 序号 |       视图       | 序号 |       视图       | 序号 |       视图       |
| :--: | :--------------: | :--: | :--------------: | :--: | :--------------: |
|  ①   | Cubie A5E 正视图 |  ②   | Cubie A5E 背视图 |  ③   | Cubie A5E 侧视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/cubie_a5e_view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件准备

您需要提前准备以下硬件设备：

- 主板：瑞莎 Cubie A5E
- 供电：5V Type-C 电源适配器
- 系统启动介质：MicroSD 卡（用于安装系统与启动）
- 显示设备：HDMI 数据线与显示器（用于显示图形界面）
- 输入设备：键盘和鼠标（用于图形界面操作）
- 调试工具（可选）：USB 串口数据线（用于串口登录）和 USB-A 拓展坞（用于拓展 USB 外设）

推荐用户使用显示器、键盘和鼠标搭配 Cubie A5E 使用。

:::tip 推荐配件
Cubie A5E 主板兼容 PD 协议的 5V Type-C 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 安装系统

主要介绍安装系统到 MicroSD 卡。

:::warning 重要提醒
**安装系统会完全格式化 MicroSD 卡，所有数据将被永久删除！**

请在操作前确认：

- MicroSD 卡中没有重要数据，或已完成备份
- 选择了正确的存储设备（避免误格式化其他磁盘）
  :::

### 硬件连接

将 MicroSD 卡插入 MicroSD 卡读卡器，再将 MicroSD 卡读卡器插入电脑。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 下载系统镜像

请访问 [资源汇总下载](../download) 页面，根据推荐下载 **GPT 格式的 Radxa OS 官方系统镜像**。该镜像文件为 `.img.xz` 格式的压缩包，下载后需要先解压，得到 `.img` 格式的镜像文件才能使用。

:::tip 镜像说明
下载的系统镜像是压缩文件，需要解压后才能使用！
:::

### 安装系统镜像

使用 Balena Etcher 软件可以将系统镜像安装到 MicroSD 卡中。

:::tip Balena Etcher
对于 Balena Etcher 的安装和使用，可以参考 [Etcher 使用](/common/radxa-os/install-system/balena-etcher) 教程。
:::

#### 选择系统镜像

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-image.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### 选择存储设备

点击 `Select target` 选项，选择 MicroSD 卡设备。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-sd-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-sd-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### 开始烧录

点击 `Flash!` 选项，开始烧录系统镜像到 MicroSD 卡中。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-flash.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  等待系统安装完成
  <img
    src="/img/common/radxa-os/install-system/etcher-flashing.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  等待系统校验完成
  <img
    src="/img/common/radxa-os/install-system/etcher-valid.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  成功安装系统镜像后，关闭 Etcher 软件！
  <img
    src="/img/common/radxa-os/install-system/etcher-completed.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 启动系统

① : 将 MicroSD 卡插入 MicroSD 卡槽

② : 使用 HDMI 数据线连接显示器和主板

③ : 使用 USB-A 接口连接鼠标或键盘：若有 USB-A 拓展坞，可以通过拓展坞连接鼠标和键盘

④ : 使用 5V Type-C 电源适配器给主板供电

若主板供电正常，主板电源指示灯绿色亮起；若系统启动正常，状态指示灯蓝色闪烁。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/a5e-quickly-start.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

成功启动系统后，显示器会显示系统桌面。

<div style={{textAlign: 'center'}}>
   <img src="/img/common/radxa-os/system-config/vnc-debian11-succ.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 首次登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-debian11-desktop.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 使用系统

成功启动系统后，您就可以在 Cubie A5E 上正式使用瑞莎系统，对于瑞莎系统的简单使用，可参考 [系统使用](../system-config) 教程。

:::tip 其它启动系统方式
对于想通过其它方式启动系统的用户（如 eMMC 和 NVMe SSD 启动系统），可以参考下面教程完成对应系统启动介质安装系统：

- [安装系统到 eMMC](./install-system/emmc-system)
- [安装系统到 NVMe SSD](./install-system/nvme-system)

:::
