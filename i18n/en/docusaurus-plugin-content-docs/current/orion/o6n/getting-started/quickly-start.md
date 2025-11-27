---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用瑞莎星睿 O6 / O6N 产品。

## 产品实物

| 序号 |        视图         | 序号 |        视图         | 序号 |        视图         |
| :--: | :-----------------: | :--: | :-----------------: | :--: | :-----------------: |
|  ①   | 瑞莎星睿 O6N 正视图 |  ②   | 瑞莎星睿 O6N 侧视图 |  ③   | 瑞莎星睿 O6N 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 主板：瑞莎星睿 O6N
- 供电：电源适配器
- 系统启动介质：U 盘（用于安装系统与启动）
- 显示设备：HDMI / DP 数据线和显示器
- 输入设备：键盘和鼠标（用于图形界面操作）
- 调试工具（可选）：USB 串口数据线（用于串口登录）

:::tip 推荐配件

- [瑞莎 DC 36W 电源适配器(推荐使用)](https://radxa.com/products/accessories/power-dc12-36w)
- [瑞莎 DC 60W 电源适配器(推荐使用)](https://radxa.com/products/accessories/power-dc12-60w)
- 标准 12V DC5525 电源适配器，建议电流 3A 及以上

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

请访问 [资源汇总下载](../../download) 页面，下载 **系统镜像**。

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

完成系统的安装后，将 U 盘插到到瑞莎星睿 O6N 的 USB 接口，然后使用 12V DC 电源适配器给瑞莎星睿 O6N 供电，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ：安装 U 盘

② ：使用 HDMI / DP 数据线连接显示器和主板

③ ：使用电源适配器给瑞莎星睿 O6N 供电

系统启动正常后，电源指示灯绿色亮起，状态指示灯蓝色闪烁。

## 登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

## 使用系统

成功登录系统后，您就可以在瑞莎星睿 O6N 上进行系统配置与开发。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip 其它启动系统方式
对于想通过其它方式启动系统的用户（如 UFS、NVMe SSD 启动系统），可以参考下面教程完成对应系统启动介质安装系统：

- [安装系统到 UFS](./install-system/ufs-system/)
- [安装系统到 NVMe 固态硬盘](./install-system/nvme-system/)

:::
