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
- 调试工具（可选）：USB 串口数据线（用于串口登录与调试）
- 显示设备（可选）：HDMI 数据线与显示器（用于显示图形界面）
- 输入设备（可选）：键盘和鼠标（用于图形界面操作）

推荐用户使用显示器、键盘和鼠标搭配 Cubie A5E 使用，整体操作比较直观和简单。

:::tip 推荐配件
Cubie A5E 主板兼容 PD 协议的 5V Type-C 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 安装系统

主要介绍安装系统到 MicroSD 卡。

:::warning
安装系统会格式化 MicroSD 卡，如果有重要数据请提前备份！
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

使用 PC 访问 [资源汇总下载](../download) 页面，直接下载系统镜像文件到本地上。

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

:::tip
若 Cubie A5E 安装了多个系统启动介质，Cubie A5E 的系统启动优先级为：MicroSD 卡 > NVMe SSD > 板载 eMMC
:::

① : 将对应系统启动介质安装到主板的对应接口：将 MicroSD 卡插入 MicroSD 卡槽

② : 使用 HDMI 数据线连接显示器和主板

③ : 使用 5V Type-C 电源适配器给主板供电

若主板供电正常，主板电源指示灯绿色亮起；若系统启动正常，状态指示灯蓝色闪烁。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/a5e-quickly-start.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- radxa

用户账号：radxa

用户密码：radxa

## 使用系统

<Tabs queryString="use-system">

<TabItem value="有屏模式">

有屏模式是指 Cubie A5E 搭配显示器使用，整体操作比较直观和简单。

成功启动系统后，显示器会显示系统桌面，你可以根据系统信息登录并使用系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/common/radxa-os/system-config/vnc-debian11-succ.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="无屏模式">

无屏模式是指 Cubie A5E 不搭配显示器使用，通过串口或者 SSH 登录系统进行操作！

成功启动系统后，你可以在串口看到系统的日志，您可以根据系统信息登录并使用系统。

说明：串口登录系统并不会显示密码，输入密码后按回车键即可登录系统。

```
[  OK  ] Started WPA supplicant.
[  OK  ] Started Network Manager.
[  OK  ] Reached target Network.
[  OK  ] Reached target Radxa USB OTG services.
         Starting CUPS Scheduler...
         Starting dnsmasq - A light…DHCP and caching DNS server...
         Starting Permit User Sessions...
         Mounting /boot/efi...
         Starting Authorization Manager...
[  OK  ] Finished Permit User Sessions.
         Starting Hold until boot process finishes up...
         Starting Terminate Plymouth Boot Screen...
[  OK  ] Started Simple Desktop Display Manager.
         Starting HDMI toggle (1280… 1920x1080) once after boot...
         Starting Hostname Service...
[    8.333541] ieee80211 phy0:
[    8.333541] *******************************************************
[    8.333541] ** CAUTION: USING PERMISSIVE CUSTOM REGULATORY RULES **
[    8.333541] *******************************************************
[   11.090807] dma dma1chan0: The timeout func is not supported or chan->private is NULL, timeout mode not used

Debian GNU/Linux 11 radxa-cubie-a5e ttyAS0

radxa-cubie-a5e login: radxa
Password:
Linux radxa-cubie-a5e 5.15.147-9-aw2501 #9 SMP PREEMPT Wed Aug 20 13:08:49 UTC 2025 aarch64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Thu Jun 26 00:45:47 UTC 2025 on ttyAS0
radxa@radxa-cubie-a5e:~$
```

</TabItem>

</Tabs>
