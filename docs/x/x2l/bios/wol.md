---
sidebar_position: 20
---

# 局域网唤醒

## 打开 WOL 功能

:::tip
Radxa X2L 的 BIOS 默认打开 WOL 功能
:::

- 接通电源，开机按住 DEL 按键进入 BIOS 设置页面
- 在 Chipset Chipset--South Cluster Configuration--Miscellaneous Configuration 页面下查看
- Wake On LAN 选项是 enable 状态

![WOL Setting 01](/img/x/x2l/wol-setting-01.webp)

## WOL 功能使用

:::tip
此处使用 Windows 系统为例
:::

### 启动 WOL 功能

- 进入 Windows 系统，请打开设备管理器。
- 找到网卡设备 Realtek PCIe Gbe family Controller
- 打开属性，切换到 Power Management 页面
- 勾选 Allow this device to wake the computer 选项

![WOL Setting 02](/img/x/x2l/wol-setting-02.webp)

### 记录网卡 MAC 地址

- 通过网线将 Radxa X2L 到局域网中
- 打开 Windows 设置，选择 Network & Internet
- 打开 Properties 界面，在下方找到 Physical Address(MAC)
- 记录下网卡的 MAC 地址(eg: 00-E0-4C-06-00-2E) 保持网络连接
- 关闭 Radxa X2L，此处 Radxa X2L 的电源需要保持通电状态。

![WOL Setting 03](/img/x/x2l/wol-setting-03.webp)

### 局域网唤醒

:::tip
此处使用 [Wake On LAN](https://apps.microsoft.com/detail/9WZDNCRDFSHB?activetab=pivot%3Aoverviewtab&hl=en-us&gl=US) 软件唤醒
:::

- 使用同一个局域网内另一台任意终端设备(Windows PC)，发送网络唤醒 magic 包(多种方式可选，选用 MicroSoft 的 WOL 软件为例)
- 安装 Wake On LAN 软件
- 打开 Wake On LAN 软件，输入任意 Device Name 设备名（方便记录）, 输入之前记录的 Radxa X2L 的网卡 MAC 地址，然后点击 Wake
- 此时 Radxa X2L 主机会从关机状态唤醒

![WOL Setting 04](/img/x/x2l/wol-setting-04.webp)
