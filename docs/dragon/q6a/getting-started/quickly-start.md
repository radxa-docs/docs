---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用瑞莎 Dragon Q6A 产品。

## 产品实物

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/dragon-q6a-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 |       视图        | 序号 |       视图        | 序号 |       视图        |
| :--: | :---------------: | :--: | :---------------: | :--: | :---------------: |
|  ①   | Dragon Q6A 正视图 |  ②   | Dragon Q6A 侧视图 |  ③   | Dragon Q6A 背视图 |

## 使用前提

您需要提前准备以下硬件设备：

- 主板：瑞莎 Dragon Q6A
- 供电：12V Type-C 电源适配器（兼容 PD 协议）
- 系统启动介质：MicroSD 卡（用于安装系统与启动）
- 显示设备：HDMI 数据线和显示器
- 输入设备：键盘和鼠标（用于图形界面操作）
- 调试工具（可选）：USB 串口数据线（用于串口登录）

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
- 标准 12V Type-C 电源适配器，建议电流 2A 及以上

:::

## 安装系统

主要介绍安装系统到 MicroSD 卡。

:::warning 重要提醒

**安装系统会完全格式化 MicroSD 卡，所有数据将被永久删除！**

请在操作前确认：

- MicroSD 卡中无重要数据或已完成资料备份
- 选择正确的存储设备，避免格式化其他磁盘

:::

## 硬件连接

将 MicroSD 卡插入 MicroSD 卡读卡器，再将 MicroSD 卡读卡器插入电脑。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 下载系统镜像

请访问 [资源汇总下载](../download) 页面，下载 **系统镜像**。

:::tip 软件使用

该镜像文件为 `.img.xz` 格式的压缩包，下载后需要先解压，得到 `.img` 格式的镜像文件才能使用。

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

完成系统的安装后，将 MicroSD 卡安装到 Dragon Q6A 的 MicroSD 卡槽中，然后使用 12V Type-C 电源适配器给 Dragon Q6A 供电，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/dragon-q6a-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ：安装 MicroSD 卡

② ：使用 HDMI 数据线连接显示器和主板

③ ：使用 12V Type-C 电源适配器给 Dragon Q6A 供电

系统启动正常后，电源指示灯绿色亮起，状态指示灯蓝色闪烁。

## 登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

## 使用系统

成功启动系统后，您就可以在 Dragon Q6A 上正式使用瑞莎系统，对于瑞莎系统的简单使用，可参考 [使用系统](./use-system.md) 教程。

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/dragon-q6a-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip 其它启动系统方式
对于想通过其它方式启动系统的用户（如 eMMC、UFS、以及 NVMe SSD 启动系统），可以参考下面教程完成对应系统启动介质安装系统：

- [安装系统到 MicroSD 卡](./install-system/sd-system.md)
- [安装系统到 U 盘](./install-system/udisk-system.md)
- [安装系统到 UFS](./install-system/ufs-system/)
- [安装系统到 eMMC](./install-system/emmc-system/)
- [安装系统到 NVMe 固态硬盘](./install-system/nvme-system/)

系统启动优先级：USB > MicroSD > NVMe 固态硬盘 > eMMC 模块 > UFS 模块

:::

## 更新系统

我们推荐使用 `Rsetup` 工具来更新系统。

:::tip
使用 `Rsetup` 工具可以更加安全地更新系统。

使用 `sudo apt update && sudo apt upgrade` 命令来升级系统可能会导致更新不完全或者系统异常。

对于 `Rsetup` 工具的使用，可以参考：

- [Rsetup 工具](../system-config/rsetup.md)
  :::

### Rsetup 工具

打开终端，输入 `sudo rsetup` 命令打开 `Rsetup` 工具：

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```
sudo rsetup
```

</NewCodeBlock>

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/rsetup-system.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 更新系统

进入 `Rsetup` 工具后，选择 `System` -> `System Update`选项，然后根据 `Rsetup` 工具提示完成系统更新。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/rsetup-system-update.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>
