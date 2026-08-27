---
sidebar_position: 2
---

# Windows 11 (ARM64)

本文介绍如何在 Radxa Dragon Q8B 上全新安装 Windows 11 ARM64，并安装 Q8B Windows 驱动。

:::caution
本教程适用于将 Windows 安装到 **NVMe SSD** 或 **UFS 模块**的场景。安装过程会清除所选目标存储设备上的全部数据，请提前备份。
:::

## 安装前须知

### 支持的 Windows 版本

- 推荐：Windows 11 **25H2（构建版本系列：26200）** ARM64。
- 最低支持：Windows 11 **24H2（构建版本系列：26100）** ARM64。
- 必须使用 **ARM64** ISO，不能使用 x64 ISO。

建议优先从[微软 Windows 11 ARM64 下载页](https://www.microsoft.com/zh-cn/software-download/windows11arm64)下载 ISO。UUP dump 可作为替代下载方式，但优先使用微软官方镜像。

### Windows 驱动功能概览

以下功能以已完成第 6 节 Q8B 驱动安装为前提；功能可用性也取决于所连接的显示器、存储设备、无线网卡和其他外设。

**当前支持的功能：**

- 显示输出：HDMI 和 USB-C DP Alt Mode，最高支持 4K@60 Hz 或 2K@120 Hz、10 bpc；支持三屏异显和 DP MST。
- 系统启动：NVMe SSD 或 UFS 模块可作为 Windows 系统盘和启动盘。
- GPU：支持 Direct3D 12。OpenCL、Vulkan、OpenGL 等能力需要从 Microsoft Store 安装[兼容包](https://apps.microsoft.com/detail/9nqpsl29bfff)。
- 视频硬件解码：支持 D3D11VA、AVC、HEVC、VP9 和 10-bit 视频，最高支持 4096 × 2160@120 fps。
- 视频硬件编码：支持通过 Media Foundation 使用 AVC 和 HEVC 编码。
- 网络与无线：支持 2.5GbE 以太网接口，以及本教程第 8 节列出的 M.2 E-Key 无线网卡。
- 其他硬件：支持风扇控制（见第 7.1 节）、HDMI/USB-C DP Alt Mode/3.5 mm 耳机插孔音频输出、USB 3.2 Gen 2 和 microSD 卡。

:::note
USB-C DP Alt Mode 显示器仅在驱动安装完成后可用；当前版本 BIOS 不支持 USB-C 显示输出。安装 Windows、进入 BIOS 或 F12 启动菜单时，请使用 HDMI 显示器。
:::

**当前暂不支持的功能：**

- 40-Pin GPIO。
- 2.5GbE 以太网接口的 Wake-on-LAN（网络唤醒）。

### 确认 BIOS 版本

安装 Windows 需要 Q8B 的 BIOS 版本为 **260825 或更新版本**。未满足此条件时，请先升级 BIOS，再继续本教程。

1. 使用 HDMI 显示器连接 Q8B，开机后按 **F2** 进入 BIOS。
2. 在 BIOS 界面顶部查看 BIOS 版本号。版本号中的六位日期部分应为 `260825` 或更高，例如 `6.0.260825.BOOT...`。
3. 如当前版本为 260825 或更新版本，继续第 1.4 节。
4. 如当前版本低于 260825，按照[查看 BIOS 版本](../system-config/check-bios-version)和[烧录 SPI 启动固件](../low-level-dev/spi-fw)的官方说明完成 BIOS 升级；升级完成后重新确认版本。

:::warning
BIOS 升级期间请保持供电稳定，不要中断操作。仅在 BIOS 版本低于 260825 时，才需要按官方流程进入 EDL 模式并升级 SPI 启动固件。
:::

### 需要准备的硬件和文件

| 项目 | 要求 |
| --- | --- |
| 主板 | Radxa Dragon Q8B |
| BIOS | 260825 或更新版本；请按第 1.3 节确认 |
| 电源 | 20 V USB PD 或固定 20 V Type-C 电源适配器；建议电流不低于 3 A，并使用 Type-C to Type-C 线缆 |
| 系统盘 | 已安装的 NVMe SSD 或 UFS 模块；Windows 将安装到其中之一 |
| 安装 U 盘 | 空白 U 盘，容量至少 8 GB，建议 16 GB 或以上 |
| 制作安装盘的电脑 | 可联网的 Windows 电脑，且具有管理员权限 |
| 显示与输入设备 | 安装过程需要 HDMI 显示器和 USB 键盘鼠标；驱动安装完成后可使用支持 DP Alt Mode 的 USB-C 显示器 |
| 软件和文件 | Windows 11 ARM64 ISO、Rufus 4.15 或更新版本、[Q8B Windows 驱动包 v1.0.0](https://dl.radxa.com/dragon/q8b/driver/dragon-q8b_win_driver_pack_v1.0.0.7z)（也可从[资源下载页](../download)获取） |

Q8B 提供 HDMI 和支持 DisplayPort Alt Mode 的 USB-C 显示输出；供电 Type-C 接口仅用于 20 V 供电，请勿将电源接入 USB-C 数据/显示接口。有关接口位置，请参考 [Q8B 官方接口说明](../)。

:::note
**显示器限制：**当前版本的 BIOS 界面不支持 USB-C 显示输出，且 USB-C DP Alt Mode 显示器仅在 Q8B 驱动安装完成后才能使用。因此，从开机、进入 F12 启动菜单到完成第 6 节驱动安装前，请使用 HDMI 显示器。
:::

:::caution
Q8B 的板载 microSD 卡槽**不支持启动 Windows ISO 安装程序**。请使用本教程制作的 USB 安装盘启动 Windows 安装程序。
:::

### 重要提示

- 仅删除和格式化要安装 Windows 的 NVMe SSD 或 UFS 模块；不要删除安装 U 盘或其他存储设备上的分区。
- 本教程不需要将设备制造商驱动手动注入 Windows ISO。
- Q8B 是开发板。当前驱动包未通过 WHQL 签名，因此安装驱动前必须关闭"智能应用控制"。请仅使用 Radxa 提供的 Q8B 驱动包。
- BIOS 已为 260825 或更新版本时，无需进入 EDL 模式或更新 SPI 启动固件；仅当 BIOS 版本低于要求时，才按第 1.3 节的官方流程升级。

## 制作 Windows 安装 U 盘

### 下载 Windows 11 ARM64 ISO

从[微软 Windows 11 ARM64 下载页](https://www.microsoft.com/zh-cn/software-download/windows11arm64)下载 Windows 11 ARM64 ISO，并保存到制作安装盘的电脑。

请确认文件名称或下载页面包含 `ARM64`。`x64` 镜像适用于 Intel/AMD PC，不能用于 Q8B。

<img src="/img/dragon/q8b/windows/01-download-iso.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 使用 Rufus 写入安装 U 盘

1. 从 [Rufus 官网](https://rufus.ie/) 下载并打开 Rufus 4.15 或更新版本。
2. 插入空白 U 盘，并在"设备"中确认选择的是该 U 盘。写入过程会清除 U 盘上的所有数据。
3. 在"引导类型选择"中选择已下载的 Windows 11 ARM64 ISO。
4. 确认以下选项：
   - 镜像选项：`标准 Windows 安装`
   - 分区类型：`GPT`
   - 目标系统类型：`UEFI（非 CSM）`
5. 点击"开始"。

<img src="/img/dragon/q8b/windows/02-rufus-settings.webp" style={{width: '100%', maxWidth: '600px'}} />

6. 在"Windows 用户体验"窗口中，勾选以下两项：
   - `移除对 4GB+ 内存、安全引导和 TPM 2.0 的要求`
   - `移除对登录微软帐户的要求`

<img src="/img/dragon/q8b/windows/03-rufus-windows-ux.webp" style={{width: '100%', maxWidth: '800px'}} />

7. 点击"OK"，等待 Rufus 写入完成后安全弹出 U 盘。

## 连接 Q8B 并从 U 盘启动

1. 确认 NVMe SSD 或 UFS 模块已安装在 Q8B 上。
2. 将键盘、鼠标和 **HDMI 显示器**接入 Q8B。当前 BIOS 界面和 Windows 驱动安装前不支持 USB-C 显示输出。
3. 将 Windows 安装 U 盘接入 Q8B 的 USB 数据接口。
4. 将 20 V Type-C 电源接入 Q8B 的专用供电接口，并开机。
5. 出现启动画面后，按 **F12** 进入启动菜单。

<img src="/img/dragon/q8b/windows/04-f12-boot-menu.webp" style={{width: '100%', maxWidth: '1200px'}} />

6. 选择 Windows 安装 U 盘对应的 USB 启动项。

<img src="/img/dragon/q8b/windows/05-select-usb-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />

:::note
如果启动菜单中没有 U 盘，请关机后重新插拔 U 盘，确认安装盘按第 2 节所述使用 ARM64 ISO、GPT 和 UEFI 方式制作，再重新开机按 F12。
:::

## 安装 Windows 到 NVMe SSD 或 UFS

<img src="/img/dragon/q8b/windows/06-win-installer.webp" style={{width: '100%', maxWidth: '1200px'}} />

1. 进入 Windows 安装程序后，按界面提示选择语言、时间和键盘布局。
2. 点击"现在安装"。若要求输入产品密钥，可输入有效密钥；也可以选择"我没有产品密钥"，稍后在 Windows 中激活。
3. 选择与许可证匹配的 Windows 版本。
4. 在"你想执行哪种类型的安装？"界面中，选择 **自定义：仅安装 Windows（高级）**。
5. 在"你想将 Windows 安装在哪里？"界面中，找到要安装 Windows 的 **NVMe SSD** 或 **UFS 模块**。
   - 通过磁盘容量和名称确认目标；不要仅凭"驱动器 0"判断，因为编号会随设备连接情况变化。
   - 如目标盘已有分区，依次选择该目标盘的各个分区并点击"删除"，直到显示为"未分配的空间"。
   - **不要删除安装 U 盘或非目标存储设备上的任何分区。**
6. 选中目标盘的"未分配的空间"，点击"下一步"。Windows 会自动创建所需分区并开始安装。
7. 安装过程中设备会重启数次。首次重启后，如再次回到 U 盘安装程序，请拔出安装 U 盘，或在启动菜单中选择已安装 Windows 的目标盘。

:::caution
若安装程序未显示 NVMe SSD 或 UFS 模块，请先关机并检查存储设备是否安装牢固。请勿在未确认原因的情况下删除其他磁盘分区。
:::

## 完成首次开机设置

Windows 安装完成并重启后，按屏幕提示完成 OOBE（首次开机设置）。

当出现网络连接页面时，选择 **我没有 Internet 连接**，再按提示创建本地账户。由于网卡驱动尚未安装，此时无法联网属于正常现象。

:::note
不同 Windows 版本的 OOBE 文案和布局可能略有不同。第 2.2 节中勾选"移除对登录微软帐户的要求"后，应可继续使用本地账户完成首次设置。
:::

<img src="/img/dragon/q8b/windows/07-oobe-local-account.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 安装 Q8B 驱动

### 解压驱动包

从 [Q8B 资源下载页](../download) 下载 Q8B Windows 驱动包（或直接下载 [Q8B Windows 驱动包 v1.0.0](https://dl.radxa.com/dragon/q8b/driver/dragon-q8b_win_driver_pack_v1.0.0.7z)），将其复制到 Q8B 的本地存储，然后使用 Windows 文件资源管理器解压。

<img src="/img/dragon/q8b/windows/08-driver-download.webp" style={{width: '100%', maxWidth: '1200px'}} />

<img src="/img/dragon/q8b/windows/09-driver-extract.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 关闭智能应用控制

当前 Q8B 驱动包未通过 WHQL 签名；为使驱动安装器能够运行，必须先关闭 Windows 的"智能应用控制"。

1. 在已解压的驱动目录中，双击 `RadxaDriverInstaller` 打开驱动安装器。

<img src="/img/dragon/q8b/windows/10-driver-installer.webp" style={{width: '100%', maxWidth: '1000px'}} />

2. 在安装器中点击"打开 Windows 安全中心"。
3. 打开"智能应用控制设置"，选择"关闭"，并按 Windows 提示确认。

<img src="/img/dragon/q8b/windows/11-smart-app-control.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 运行驱动安装器

返回驱动安装器界面，点击"安装"，等待安装器完成当前阶段。

<img src="/img/dragon/q8b/windows/12-install-driver.webp" style={{width: '100%', maxWidth: '1000px'}} />

系统会自动重启。请不要断开电源。重启进入桌面后，安装器会自动再次启动，继续完成剩余驱动安装。安装器提示完成后，重启系统一次。

<img src="/img/dragon/q8b/windows/13-reboot-complete.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 安装完成后的检查

完成驱动安装并重启后，请检查以下项目：

1. 打开"设备管理器"，确认没有"未知设备"或带黄色感叹号的设备。

<img src="/img/dragon/q8b/windows/14-device-manager.webp" style={{width: '100%', maxWidth: '900px'}} />

2. 连接以太网，确认网络可以正常使用。
3. 检查 HDMI 显示器、USB 键盘鼠标和音频设备是否正常工作；驱动安装完成后，可按需连接并检查支持 DP Alt Mode 的 USB-C 显示器。
4. 打开"设置" > "系统" > "激活"，使用有效许可证完成 Windows 激活。
5. 在网络连接正常后运行 Windows Update，完成更新并按提示重启。更新后再次检查设备管理器和网络是否正常。

:::note
Radxa Dragon Q8B 使用 Windows on ARM。需要额外安装驱动的外设应提供 ARM64 版 Windows 驱动；请在购买或安装第三方外设前确认兼容性。
:::

### 风扇控制与硬件监控

#### Radxa Control Center

[Radxa Control Center](https://github.com/strongtz/radxa-svc-tool/releases) 可用于管理 Q8B 的风扇和查看基础硬件状态。请从发布页面下载适用于当前系统的最新版本，并按照软件提示完成安装。

- 风扇模式：自动、全速、手动。
- 硬件状态：温度和功耗数据。

<img src="/img/dragon/q8b/windows/15-control-center.webp" style={{width: '100%', maxWidth: '1200px'}} />

#### 使用 HWiNFO 查看详细温度

如需查看更详细的温度传感器数据，可从 [HWiNFO 下载页](https://www.hwinfo.com/download/) 下载 ARM64 版本。使用便携版时，解压后打开 `HWiNFO_ARM64.exe`；随后在 HWiNFO 中查看传感器数据。

## 使用 M.2 E-Key 无线网卡（可选）

Q8B 的 M.2 E-Key 插槽可安装下列已支持的无线网卡。请在安装 Windows 和 Q8B 驱动后，再确认 Wi-Fi 与蓝牙功能。

| 无线网卡 | Wi-Fi 规格 | 蓝牙规格 | 蓝牙连接方式 |
| --- | --- | --- | --- |
| Qualcomm NCM865 | Wi-Fi 7 | Bluetooth 5.4 | USB |
| Qualcomm NCM865A | Wi-Fi 7 | Bluetooth 5.4 | UART |
| Qualcomm NFA765 | Wi-Fi 6E | Bluetooth 5.2 | USB |

<img src="/img/dragon/q8b/windows/16-wifi-cards.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 使用 NCM865A 时设置蓝牙模式

NCM865A 的蓝牙通过 UART 连接。使用该模块时，必须在 BIOS 中将 Windows 蓝牙模式设置为 `UART`；其他两款 USB 蓝牙模块无需修改此设置。

1. 使用 **HDMI 显示器**连接 Q8B。当前 BIOS 不支持 USB-C 显示输出。
2. 开机后按 **F2** 进入 BIOS。
3. 依次进入：`Radxa 平台配置` > `PCI Express 设置` > `M.2 E-key (PCIE_4 J18)` > `Windows Bluetooth 模式`。
4. 将该选项设置为 `UART`。
5. 保存更改并退出 BIOS，然后启动 Windows。

:::note
若 NCM865A 的蓝牙无法识别，请先确认此 BIOS 设置已保存为 `UART`，再检查 Q8B 驱动是否已完成安装。
:::

## 常见问题

### 无法从 U 盘进入 Windows 安装程序

- 确认使用的是 Windows 11 ARM64 ISO，而不是 x64 ISO。
- 按第 2 节重新使用 Rufus 制作 U 盘，并确认选择了 GPT、UEFI（非 CSM）和标准 Windows 安装。
- 开机时按 F12，并在启动菜单中选择 USB 启动项。

### Windows 安装程序找不到 NVMe SSD 或 UFS 模块

- 关机后检查 NVMe SSD 或 UFS 模块是否安装牢固。
- 确认识别的是实际要安装 Windows 的存储设备，不要删除其他磁盘分区。
- 若问题仍存在，请记录安装器界面和存储设备型号，并联系产品支持渠道。

### 首次开机时无法联网

在安装 Q8B 驱动前，网络设备可能尚不可用。按照第 5 节使用本地账户完成 OOBE，然后安装第 6 节的 Q8B 驱动包。

### USB-C 显示器在 BIOS 界面或安装期间无画面

这是当前版本的预期行为。BIOS 界面不支持 USB-C 显示输出，且 USB-C DP Alt Mode 显示器需要在 Q8B 驱动安装完成后才能使用。请在安装和驱动安装期间使用 HDMI 显示器。
