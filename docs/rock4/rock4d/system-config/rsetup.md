---
sidebar_position: 9
---

# Rsetup 工具

Rsetup 是一个适用于 Radxa OS 的系统配置工具，它可以帮助用户轻松地进行系统配置，包括系统设置、硬件设置、软件设置、网络设置、用户设置、语言设置等。

## 1. 使用 Rsetup

在终端命令行运行 `rsetup` 命令启动 Rsetup 工具。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo rsetup
```
</NewCodeBlock>

## 2. Rsetup 选项

启动 Rsetup 后，会出现类似下面的选项列表：可能会因为版本界面有微小差异，请以实际情况为准。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
┌──────────────────────────────────┤ RSETUP ├──────────────────────────────────┐
│ Please select an option below:                                               │
│                                                                              │
│                                System                                        │
│                                Hardware                                      │
│                                Overlays                                      │
│                                Connectivity                                  │
│                                User Settings                                 │
│                                Localization                                  │
│                                Common Tasks                                  │
│                                About                                         │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                     <Ok>                         <Cancel>                    │
│                                                                              │
└──────────────────────────────────────────────────────────────────────────────┘
```
</NewCodeBlock>

:::tip
rsetup 工具使用指南：

- 选中选项 ： 对应选项会高亮显示
- 确认选择 ： 按 `Enter`
- 取消选择 ： 按 `ESC`
- 切换选项 ： 按 `Up` 、 `Down` 、 `Left` 、 `Right` 控制
- 多选界面 ： 按 `Space` 选择，按 `Enter` 确认选择

:::

### 2.1 System

System 选项用于系统升级、修改启动方式和配置 Bootloader 等。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
┌──────────────────────────────────┤ RSETUP ├──────────────────────────────────┐
│ System                                                                       │
│                                                                              │
│                         System Update                                        │
│                         Change default boot target                           │
│                         =========                                            │
│                         Bootloader Management                                │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                     <Ok>                         <Cancel>                    │
│                                                                              │
└──────────────────────────────────────────────────────────────────────────────┘
```
</NewCodeBlock>

:::tip
我们推荐使用 `System Update` 选项来升级系统，确保您的系统是最新版本。

使用 `sudo apt update && sudo apt upgrade` 命令来升级系统可能会导致更新不完全或者系统异常。
:::

### 2.2 Hardware

Hardware 选项用于管理板载硬件，包括视频捕获设备、LED 控制、GPIO 控制等。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
┌──────────────────────────────────┤ RSETUP ├──────────────────────────────────┐
│ Manage on-board hardware                                                     │
│                                                                              │
│                       Video capture devices                                  │
│                       GPIO LEDs                                              │
│                       RGB LEDs                                               │
│                       Thermal governor                                       │
│                       Configure DSI display mirroring                        │
│                       40-pin GPIO                                            │
│                       USB OTG services                                       │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                     <Ok>                         <Cancel>                    │
│                                                                              │
└──────────────────────────────────────────────────────────────────────────────┘
```
</NewCodeBlock>

### 2.3 Overlays

Overlays 选项用于管理设备树覆盖（Device Tree Overlays），可以启用或禁用特定的硬件功能。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
┌──────────────────────────────────┤ RSETUP ├──────────────────────────────────┐
│ Configure Device Tree Overlay                                                │
│                                                                              │
│                          Manage overlays                                     │
│                          View overlay info                                   │
│                          Install 3rd party overlay                           │
│                          Rebuild overlays                                    │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                     <Ok>                         <Cancel>                    │
│                                                                              │
└──────────────────────────────────────────────────────────────────────────────┘
```
</NewCodeBlock>

### 2.4 Connectivity

Connectivity 选项用于管理网络连接，包括有线网络和无线网络的设置。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```

                           ┌─┤ NetworkManager TUI ├──┐
                           │                         │
                           │ Please select an option │
                           │                         │
                           │ Edit a connection       │
                           │ Activate a connection   │
                           │ Set system hostname     │
                           │                         │
                           │ Quit                    │
                           │                         │
                           │                    <OK> │
                           │                         │
                           └─────────────────────────┘

```
</NewCodeBlock>

### 2.5 User Settings

User Settings 选项用于管理系统当前用户名、密码以及设置自动登录。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```

┌──────────────────────────────────┤ RSETUP ├──────────────────────────────────┐
│ User Settings │
│ │
│ Change Password │
│ Change Hostname │
│ Configure auto login │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ <Ok> <Cancel> │
│ │
└──────────────────────────────────────────────────────────────────────────────┘

```
</NewCodeBlock>

### 2.6 Localization

Localization 选项用于设置系统时区、区域以及 WiFi 国家。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```

┌──────────────────────────────────┤ RSETUP ├──────────────────────────────────┐
│ Please select an option below: │
│ │
│ Change Timezone │
│ Change Locale │
│ Change Wi-Fi Country │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ <Ok> <Cancel> │
│ │
└──────────────────────────────────────────────────────────────────────────────┘

```
</NewCodeBlock>

### 2.7 Common Tasks

Common Tasks 选项用于执行一些常见的系统任务。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```

┌──────────────────────────────────┤ RSETUP ├──────────────────────────────────┐
│ Please select all tasks you want to perform: │
│ │
│ [ ] Install Baota │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ <Ok> <Cancel> │
│ │
└──────────────────────────────────────────────────────────────────────────────┘

```
</NewCodeBlock>

### 2.8 About

About 选项用于查看 Rsetup 工具的信息。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```

┌──────────────────────────────────┤ RSETUP ├──────────────────────────────────┐
│ │
│ rsetup - Radxa system setup utility │
│ │
│ Copyright 2022-2025 Radxa Computer Co., Ltd │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ │
│ <Ok> │
│ │
└──────────────────────────────────────────────────────────────────────────────┘

```
</NewCodeBlock>
```
