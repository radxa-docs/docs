---
sidebar_position: 6
description: ""
---

# 启动 Debian 官方 ISO

O6 BIOS 支持启动 Debian 官方 ARM64 ISO。下面说明如何在 O6 上启动 Debian 官方 ISO 镜像。

## 获取 Debian 官方 ARM64 ISO

参考 Debian 官方文档：[Debian ARM64 ISO](https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/)

## 制作 U盘启动盘

使用 [balenaEtcher](https://etcher.balena.io/)，将下载好的 ISO 文件，如 debian-12.9.0-arm64-netinst.iso，写入到 U盘中。
这样就把 U盘启动盘做好了。

## 硬件连接

按照如下说明，做好硬件连接。

- 把 PCIe NVME SSD 装配到 O6 M.2 M-Key
- 把 U盘启动盘插到 O6 Type-A 3.2 口
- O6 接好 USB 键盘和鼠标，和 HDMI 显示器
- 将 O6 Type-A 口接 Type-A **USB 转以太网适配器**（安装 ISO 过程需要有网络）
- O6 上电，在启动过程中，看到 Radxa Logo 和进度条时，短按下键盘 “Esc” 键进入 BIOS 界面

## 配置 O6 BIOS 为 ACPI 启动

O6 BIOS 默认为 Device Tree 启动方式。需要切换为 ACPI 启动。

在 BIOS 界面，通过键盘选择：

```
Device Manager
    --> O/S Hardware Description Selection
        --> O/S Hardware Description   <ACPI>
```

进入 BIOS 界面

```

 Radxa Orion O6
 CIX P1 CD8180                                       1.80 GHz
 0.2.2-1                                             65536 MB RAM



   Select Language            <English>                  This selection will
                                                         take you to the Boot
 > Device Manager                                        Manager
 > Boot Manager
 > Boot Maintenance Manager

   Continue
   Reset







  ^v=Move Highlight       <Enter>=Select Entry


```

进入 `Device Manager`

```
/------------------------------------------------------------------------------\
|                               Device Manager                                 |
\------------------------------------------------------------------------------/

   Devices List                                          Press <Enter> to view
 > System Information                                    current system
 > Platform Configuration                                information.
 > O/S Hardware Description Selection
 > Secure Boot Configuration
 > Network Device List


   Press ESC to exit.







/------------------------------------------------------------------------------\
|                                                                              |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/

```

进入 `O/S Hardware Description Selection`

```
/------------------------------------------------------------------------------\
|                     O/S Hardware Description Selection                       |
\------------------------------------------------------------------------------/

   O/S Hardware Description   <Device Tree>              Select the hardware
                                                         description that will
                                                         be exposed to the O/S.













/------------------------------------------------------------------------------\
|                         F9=Reset to Defaults      F10=Save                   |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/
                                                    Configuration changed

```

修改为 `ACPI`，并保存。

```
/------------------------------------------------------------------------------\
|                     O/S Hardware Description Selection                       |
\------------------------------------------------------------------------------/

   O/S Hardware Description   <ACPI>                     Select the hardware
                                                         description that will
                                                         be exposed to the O/S.

                  /------------------------------------------\
                  |                                          |
                  |        Save configuration changes?       |
                  |Press 'Y' to confirm, 'N'/'ESC' to ignore.|
                  |                                          |
                  \------------------------------------------/






/------------------------------------------------------------------------------\
|                         F9=Reset to Defaults      F10=Save                   |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/

```

改动后，需要重启 O6。可通过短按复位按键。

## 安装 ISO 镜像

O6 重启后，引导 O6 进入 BIOS 界面，然后选择设备 U盘启动。

键盘选择进入 `Boot Manager` 后，选择 U盘，`UEFI aigo U330 EABF80131F85D705`

```
/------------------------------------------------------------------------------\
|                                Boot Manager                                  |
\------------------------------------------------------------------------------/

                                                         Device Path :
   Boot Manager Menu                                     VenHw(0D51905B-B77E-45
                                                         2A-A2C0-ECA0CC8D514A,0
   debian                                                0801D090000000000)/USB
   UEFI Shell                                            (0x1,0x0)
   UEFI aigo U330 EABF80131F85D705
   UEFI KINGBANK KP230 K19010J001612

   Use the <^> and <v> keys to choose a boot option,
   the <Enter> key to select a boot option, and the
   <Esc> key to exit the Boot Manager Menu.





/------------------------------------------------------------------------------\
|                                                                              |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/
```

选择 `Graphical install`，然后按照提示安装系统。

```

                       GNU GRUB  version 2.06-13+deb12u1

 /----------------------------------------------------------------------------\
 | Install                                                                    |
 |*Graphical install                                                          |
 | Advanced options ...                                                       |
 | Accessible dark contrast installer menu ...                                |
 | Install with speech synthesis                                              |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 \----------------------------------------------------------------------------/

      Use the ^ and v keys to select which entry is highlighted.
      Press enter to boot the selected OS, `e' to edit the commands
      before booting or `c' for a command-line.

```
