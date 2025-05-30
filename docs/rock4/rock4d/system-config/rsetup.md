---
sidebar_position: 9
---

# Rsetup 工具

Rsetup 是一个适用于 Radxa OS 的系统配置工具，它可以帮助用户轻松地进行系统配置，包括系统设置、硬件设置、软件设置、网络设置、用户设置、语言设置等。

## 使用 Rsetup

在终端命令行运行 `rsetup` 命令启动 Rsetup 工具。

:::tip
rsetup 工具使用指南：

- 选中选项 ： 对应选项会高亮显示
- 确认选择 ： 按 `Enter`
- 取消选择 ： 按 `ESC`
- 切换选项 ： 按 `Up` 、 `Down` 、 `Left` 、 `Right` 控制
- 多选界面 ： 按 `Space` 选择，按 `Enter` 确认选择

:::

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo rsetup
```
</NewCodeBlock>

## Rsetup 选项

启动 Rsetup 后，会出现类似下面的选项列表：可能会因为版本界面有微小差异，请以实际情况为准!

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### System

System 选项用于系统升级、修改启动方式和配置 Bootloader 等。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
我们推荐使用 `System Update` 选项来升级系统，确保您的系统是最新版本。

使用 `sudo apt update && sudo apt upgrade` 命令来升级系统可能会导致更新不完全或者系统异常。
:::

### Hardware

Hardware 选项用于管理板载硬件，包括视频捕获设备、LED 控制、GPIO 控制等。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Overlays

Overlays 选项用于管理设备树覆盖（Device Tree Overlays），可以启用或禁用特定的硬件功能。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Connectivity

Connectivity 选项用于管理网络连接，包括有线网络和无线网络的设置。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### User Settings

User Settings 选项用于管理系统当前用户名、密码以及设置自动登录。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Localization

Localization 选项用于设置系统时区、区域以及 WiFi 国家。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Common Tasks

Common Tasks 选项用于执行一些常见的系统任务。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 2.8 About

About 选项用于查看 Rsetup 工具的信息。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
