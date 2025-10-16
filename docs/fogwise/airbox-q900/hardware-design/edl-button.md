---
sidebar_position: 14
---

# EDL 按键

Fogwise® AIRbox Q900 板载 EDL 按键，主要用于进入紧急下载模式（Emergency Download Mode），进行系统固件刷写、系统恢复等场景。

## 介绍 EDL 模式

高通的 **EDL 模式（Emergency Download Mode，紧急下载模式）** 是一种专为高通芯片设备设计的底层救援机制，用于在设备因系统崩溃、刷机失败或硬件故障导致无法正常启动时，通过 USB 接口强制刷写固件或修复关键数据。

## 进入 EDL 模式

主板上电前，按住 EDL 按键；主板上电后，松开 EDL 按键，主板会自动进入 EDL 模式。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-enter-edl-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : 使用插针或牙签按住 EDL 按键

② : 使用 12V DC 电源适配器给主板供电

③ : 松开 EDL 按键

④ : 使用双头 USB Type-A 数据线连接主板的 USB 3.1 OTG Type-A 接口和电脑的 USB Type-A 接口

## 验证 EDL 模式

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

## 接口规格

:::note 技术参考

完整的技术规格和引脚定义可参考 [下载专区](../download.md#硬件设计) 的硬件设计文档!

:::
