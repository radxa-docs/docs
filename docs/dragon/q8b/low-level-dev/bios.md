---
sidebar_position: 1
---

# BIOS 说明

BIOS（Basic Input / Output System）是主板上的固件，通电后首先运行，用于唤醒硬件、完成自检并引导操作系统启动。它是连接硬件与操作系统的“桥梁”。

## BIOS 主界面

主板开机的时候按 **F2** 键可以进入主板的 BIOS 界面。

BIOS 界面的上方会显示主板型号、处理器型号、运行频率、固件版本号以及内存大小等信息。

- 操作提示

  - 方向键：切换不同选项
  - Enter：进入或确认当前选项
  - ESC：返回上一层或退出设置界面

```biosscreen
Radxa Dragon Q8B
Snapdragon (TM) 8cx Gen 3 @ 3.0 GHz                              2.99 GHz
6.0.260821.BOOT.MXF.1.1.c1-00167-MAKENA-1                        16384 MB RAM

   Select Language                  <English>
 ► Radxa Platform Configuration
 ► Device Manager
 ► Boot Manager
 ► Boot Maintenance Manager

   Continue
   Reset
   Reboot into EDL/9008
   Enter UEFI Shell
   Enter Boot Menu

   Reset BIOS to default settings

  ↑↓=Move Highlight              <Enter>=Select Entry
```

- **Select Language**：选择 BIOS 显示语言。支持 **English** 和 **简体中文**。
- **Radxa Platform Configuration**：针对瑞莎主板进行硬件配置。
- **Device Manager**：设备管理器。
- **Boot Manager**：启动管理器。
- **Boot Maintenance Manager**：启动维护管理器。
- **Continue**：保存当前设置并退出 BIOS 配置界面，继续后续启动。
- **Reset**：重启 BIOS。
- **Reboot into EDL / 9008**：重启进入 EDL 线刷模式。
- **Enter UEFI Shell**：进入 UEFI 终端。
- **Enter Boot Menu**：进入启动菜单。
- **Reset BIOS to default settings**：将 BIOS 重置为默认设置。执行操作后，将会自动重启 BIOS。

### Radxa Platform Configuration

用于配置瑞莎主板专有硬件功能，例如 GPIO、PCIe、USB 等功能。

在顶部会显示 Dragon Q8B 的主板信息，如生产厂家，SKU，硬件版本，序列号等信息。

```biosscreen
┌────────────────────────────────────────────────────────────────────────────────────┐
│                                  Radxa Platform Configuration                      ｜
└────────────────────────────────────────────────────────────────────────────────────┘

   Manufacturer               Radxa Computer             Configure the PCIe settings.
   Product Name               RS782-D16S32W0X110
   Version                    V1.305
   Serial Number              WGAEZ0HF

   Configuration Options

 ► GPIO
 ► DRAM Settings
 ► PCI Express Settings
 ► USB / Type-C Settings
 ► Real-Time Clock (RTC) Settings
 ► Debugging Settings
 ► Hypervisor Settings
 ► Boot Device Order
 ► Device Tree Settings
 ► Third-party OS Compatibility Settings
 ► Custom Logo

   Blue User LED State              <On>
   Auto Boot Time-out               [5]

┌─────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit        │
└─────────────────────────────────────────────────────────────────────────────────┘
```

- **GPIO**：用于配置 40-Pin GPIO 功能。
- **DRAM Settings**：用于查看和设置 DDR 频率。
- **PCI Express Settings**：配置 PCIe 功能。
- **USB / Type-C Settings**：配置 USB-A / USB-C 接口速率和输出电压等功能。
  - 用户可配置 Type-C 0/1 口输出高电压，如 9V。
  - 用户可配置 Type-C 0/1 口最大速率为 10 Gbps 或 5 Gbps。默认为 **10 Gbps**。
  - 用户可配置 Type-A 3.0 口最大速率为 10 Gbps 或 5 Gbps。默认为 **5 Gbps**。
- **Real-Time Clock (RTC) Settings**：配置 RTC 时间。
  - 用户可配置 I2C RTC 日期和时间。
  - 用户可配置 RTC 同步策略：I2C RTC to PMIC RTC / PMIC RTC to I2C RTC / Do not sync。
- **Debugging Settings**：配置串口调试功能。
  - **Synchronous Debug UART in UEFI**：默认是关闭状态。
  - **Debug Print Level**：用户可配置调试打印等级：Default、Error Only、Error + Warn、Debug。默认是 **Default**。
- **Hypervisor Settings**：配置 KVM / 虚拟化能力。
- **Boot Device Order**：配置启动优先顺序。默认的启动顺序是：**USB → SD Card → NVMe → UFS**。
- **Device Tree Settings**：控制 UEFI 在启动 Linux 前是否加载、修正并传递 Device Tree，以帮助系统正确识别和初始化板载硬件。
- **Third-party OS Compatibility Settings**：第三方操作系统兼容性配置。
- **Custom Logo**：自定义启动 Logo 图片。
- **Blue User LED State**：蓝色用户指示灯状态。支持开启和关闭 LED 操作。
- **Auto Boot Time-out**：自动启动超时时间，单位是秒。默认是 **5 秒**。

#### Third-party OS Compatibility Settings

默认情况下，为启动 Radxa OS，如下功能是关闭的：

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────┐
│                              Third-party OS Compatibility Settings               │
└──────────────────────────────────────────────────────────────────────────────────┘

   Ignore unused clocks for Linux   <Enabled>          Append clk_ignore_unused to
                                                       Linux bootargs when enabled.
   These options are not recommended when using
   RadxaOS or other supported systems.                 Enabled: Add clk_ignore_unused
                                                       Disabled: Do not add this
   Workaround for missing           <Disabled>         argument.
   simple-bridge driver
   Workaround for broken            <Disabled>
   gpio-shared support
   Workaround for broken PCIe port  <Disabled>
   node parsing
   Force smaller PCIe BAR windows   <Disabled>
   Support efivars by patching      <Disabled>
   compatible value
   Ignore unused power domains      <Disabled>
   (PD) for Linux

┌──────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit         │
└──────────────────────────────────────────────────────────────────────────────────┘
```

为了启动第三方系统，如 Ubuntu 26 ISO、Fedora ISO、Debian 14 ISO 等，需要开启全部功能配置：

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────┐
│                              Third-party OS Compatibility Settings               │
└──────────────────────────────────────────────────────────────────────────────────┘

   Ignore unused clocks for Linux   <Enabled>
   Workaround for missing           <Enabled>
   simple-bridge driver
   Workaround for broken            <Enabled>
   gpio-shared support
   Workaround for broken PCIe port  <Enabled>
   node parsing
   Force smaller PCIe BAR windows   <Enabled>
   Support efivars by patching      <Enabled>
   compatible value
   Ignore unused power domains      <Enabled>
   (PD) for Linux

┌──────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit         │
└──────────────────────────────────────────────────────────────────────────────────┘
```

### Device Manager

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────┐
│                                         Device Manager                           │
└──────────────────────────────────────────────────────────────────────────────────┘

   Devices List
 ► TCG Drive Management

   Press ESC to exit.

┌─────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit        │
└─────────────────────────────────────────────────────────────────────────────────┘
```

- **TCG Drive Management**：TCG（Trusted Computing Group）驱动器管理。

### Boot Manager

用于临时调整当前系统启动的方式。也能从这里看出当前 BIOS 识别到了哪些介质，如 SPI Nor Flash 和 NVMe SSD。

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────┐
│                                       Boot Manager                               │
└──────────────────────────────────────────────────────────────────────────────────┘

   Boot Manager Menu

   UEFI SPI NOR Flash
   UEFI NVMe Disk

   Use the <↑> and <↓> keys to choose a boot option, the
   key to select a boot option, and the  key to exit the Boot
   Manager Menu.

┌─────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              =Select Entry             Esc=Exit               │
└─────────────────────────────────────────────────────────────────────────────────┘
```

### Boot Maintenance Manager

用于更细致的启动项管理，可创建、修改、删除自定义启动项，并控制驱动与控制台行为。

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────┐
│                           Boot Maintenance Manager                               │
└──────────────────────────────────────────────────────────────────────────────────┘

 ► Boot Options
 ► Driver Options
 ► Boot From File
 ► Boot Device Order

┌─────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight            <Enter>=Select Entry           Esc=Exit             │
└─────────────────────────────────────────────────────────────────────────────────┘
```

- **Boot Options**：修改系统启动顺序。
- **Driver Options**：修改启动驱动选项。
- **Boot From File**：从文件或者设备启动系统。
- **Boot Device Order**：修改启动设备顺序。

## FAQs

### 定制 Logo 示例

#### 要点

1. 支持的图片格式：**JPEG**、**PNG**、**BMP**。
2. 不限制用户提供的图片大小和分辨率，BIOS 会将图片自动缩放到 960x960 以下，不超过 logo 分区大小。

#### 步骤

1. 以 Radxa OS 为例，把 Logo jpg 文件放在 Radxa OS 的第一个分区，config 分区。

```plaintext
root@radxa-dragon-q8b:~# ls /config/test_logo.jpg
/config/test_logo.jpg
```

2. 重启系统，进入 BIOS 的 `Select Logo Image` 界面。

```plaintext
-> Radxa Platform Configuration
    -> Custom Logo
        -> Select Logo Image...
```

3. 在 File explorer 页面找到 config 分区，并选中。

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                          File Explorer                                           │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘

 ► config,                                                                                          │
   [VenHw(D1531D41-3F80-4091-8D0A-541F59236D66)/HD(1,GPT,0CDE56A9-52                                │
   32-43CD-A74C-709EDE794C8F,0x8000,0x8000)]                                                        │
 ► efi,                                                                                             │
   [VenHw(D1531D41-3F80-4091-8D0A-541F59236D66)/HD(2,GPT,AB7482D2-52                                │
   D5-41EB-AA7A-9D967C1BA1A4,0x10000,0x200000)]                                                     │

┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit                         │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```

4. 选中 `test_logo.jpg`。

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                          File Explorer                                           │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘

 ► ***NEW FILE***                                                     This menu used to create a    │
 ► ***NEW FOLDER***                                                   new file in current           │
                                                                      directory, jump to next page  │
                                                                      to name the new file          │
   config.txt                                                         │
   logo.bmp                                                           │
   test_logo.jpg                                                      │

┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit                         │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```

5. 选择 `test_logo.jpg` 文件后，会出现如下打印：

```plaintext
Loading selected image...
Converting and writing logo (1134485 bytes)...
Decoding image...
Resizing 1920x1080 -> 960x540
Encoding BMP...
Writing Logo...
Writing BMP to flash...
Writing Stamp to flash...
Logo written successfully!

Press any key to continue...
```

6. 按 `Esc` 键回退到主界面，选中 `Reset` 重启 BIOS，然后在 HDMI 显示器上确认新的 Logo。
