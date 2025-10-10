---
sidebar_position: 1
---

# 安装系统到板载 UFS

主要介绍如何将系统安装到 Fogwise® AIRbox Q900 的板载 UFS 上。

:::info 配置说明
Fogwise® AIRbox Q900 板载 128GB UFS。
:::

## 使用前提

### 进入 EDL 模式

:::tip EDL 模式

高通的 **EDL 模式（Emergency Download Mode，紧急下载模式）** 是一种专为高通芯片设备设计的底层救援机制，用于在设备因系统崩溃、刷机失败或硬件故障导致无法正常启动时，通过 USB 接口强制刷写固件或修复关键数据。

:::

主板上电前，按住 EDL 按键；主板上电后，松开 EDL 按键，主板会自动进入 EDL 模式。

① : 使用插针或牙签按住 EDL 按键

② : 使用 12V DC 电源适配器给主板供电

③ : 松开 EDL 按键

④ : 使用双头 USB Type-A 数据线连接主板的 USB 3.1 OTG Type-A 接口和电脑的 USB Type-A 接口

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-enter-edl-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 验证 EDL 模式

主要介绍 Windows 和 Ubuntu 系统下验证 EDL 模式的方法。

<Tabs queryString="Platform">

<TabItem value="Windows">

- 下载 QDL 工具

进入 [资源汇总下载](../../download.md) 页面下载 QDL 工具并解压（QDL 工具包括 QDL 软件和 QDL 驱动）。

- 安装 QDL 驱动

打开解压后的 QDL 工具文件夹，找到 `qcserlib.inf` 文件，鼠标右击，选择 `安装` 选项。

- 验证 EDL 模式

安装驱动成功后，可以尝试插拔 USB Type-A 数据线，观察系统的设备管理器界面是否刷新以及出现 `Qualcomm HS-USB QDLoader 9008` 设备。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-edl-mode-windows.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Ubuntu">

使用 `lsusb` 命令查看设备是否进入 QDL 模式。

<NewCodeBlock tip="Ubuntu$" type="host">

```
lsusb
```

</NewCodeBlock>

若主板进入 QDL 模式，终端会输出类似以下结果：

```

Bus 001 Device 012: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL mode)

```

</TabItem>

</Tabs>

## 安装系统

主要介绍 Windows 和 Ubuntu 系统下安装系统到 Fogwise® AIRbox Q900 的板载 UFS 上的方法。

### 下载文件

进入 [资源汇总下载](../../download.md) 页面下载启动固件和系统镜像文件。

使用说明：

1. 将 QDL 工具和启动固件、系统镜像文件放在同一目录下并解压

2. 进入文件所在位置，打开终端烧录命令，其中调用 QDL 工具采用相对路径运行

### 配置 UFS

<Tabs queryString="Platform">

<TabItem value="Windows">

</TabItem>

<TabItem value="Ubuntu">

</TabItem>

</Tabs>

### 烧录 SAIL

<Tabs queryString="Platform">

<TabItem value="Windows">

</TabItem>

<TabItem value="Ubuntu">

</TabItem>

</Tabs>

### 烧录 CDT

<Tabs queryString="Platform">

<TabItem value="Windows">

</TabItem>

<TabItem value="Ubuntu">

</TabItem>

</Tabs>

### 烧录系统镜像

<Tabs queryString="Platform">

<TabItem value="Windows">

</TabItem>

<TabItem value="Ubuntu">

</TabItem>

</Tabs>

完成以上操作，可以按照 [快速上手](../quickly_start.md) 教程使用 Fogwise® AIRbox Q900。
