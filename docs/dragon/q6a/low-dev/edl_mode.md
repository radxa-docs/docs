---
sidebar_position: 1
---

# 进入 EDL 模式

高通 EDL（Qualcomm Download Mode）模式是高通处理器设备中的一种紧急下载模式，主要用于紧急修复、刷写固件或解锁设备。

## 进入 EDL 模式

主板上电前，按住 EDL 按键；主板上电后，松开 EDL 按键，进入 EDL 模式。

具体操作步骤：

① ： 按住 EDL 按键

② ： 连接 12V Type-C 电源适配器（兼容 PD 协议）

③ ： 松开 EDL 按键

④ ： 使用双头 USB Type-A 数据线连接 Dragon Q6A 的 USB 3.1 Type-A 接口和电脑的 USB Type-A 接口

## 验证 EDL 模式

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>
    - 下载 EDL 工具

    在 Windows 平台，您需要去 [资源汇总下载](../download) 页面下载 EDL 工具（EDL 工具包括 EDL 软件和 EDL 驱动）。

    - 安装 EDL 驱动

    双击 `qcom_winusb_drv_inst.exe` 驱动安装包，按照以下步骤完成驱动安装。

    ① : 点击 `Install Certificate` 选项安装证书

    ② : 点击 `Install Driver` 选项安装驱动

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_edl_driver.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

    - 设备识别

    在 Windows 系统中，可以进入系统的 `设备管理器` 查看设备是否被正常识别。

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_device_manager.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

  </TabItem>
  <TabItem value="Linux" label="Linux">
  在 Linux 系统中，可以使用 `lsusb` 命令查看设备是否进入 EDL 模式。

  <NewCodeBlock tip="Linux$" type="host">

```
lsusb
```

  </NewCodeBlock>

设备进入 EDL 模式后，会显示类似下面的信息：

```
Bus 001 Device 008: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (EDL mode)
```

  </TabItem>
</Tabs>
