---
sidebar_position: 4
description: ""
---

# 安装 BIOS

:::info
如果您使用的是 RadxaOS，系统提供了更新 BIOS 的相关功能，无需参考以下内容手动进行更新。
您只需要在开机时，选择 `Install EDK2` 启动项，并按照指示确认操作即可。

您也可以将 RadxaOS 安装到 USB 存储设备中，将其作为 BIOS 更新媒介，为多台设备进行更新。

详情请参考 `edk2-cix` [相关文档](https://radxa-pkg.github.io/edk2-cix/update.html)。
:::

## 下载 BIOS 发布包

请参考[下载页面](../download#bios)的相关内容。

## 制作刷 BIOS U盘

1，将 U盘格式化出一个分区，格式为 FAT32。

2，将 BIOS 压缩包解压开，把如下文件放到 U盘的 FAT32 分区的顶层目录中。

<NewCodeBlock tip="Host-Computer" type="host">

```
BuildOptions
BurnImage.efi
cix_flash_all.bin
cix_flash_ota.bin
FlashUpdate.efi
setup.nsh
Shell.efi
VariableInfo.efi
```

</NewCodeBlock>

## 更新 BIOS

### 方法一：在线更新 BIOS 之有屏模式

#### 步骤一：硬件准备

- Orion O6 和 PD 65W 适配器
- HDMI 线和显示器
- USB 键盘与鼠标

#### 步骤二：进入 BIOS 界面

- 把 HDMI 显示器和键盘接到 O6 上。
- 接通 O6 电源，观察显示器。出现 Radxa Logo 和进度条时，短按键盘的 “Esc” 按键，在 HDMI 显示器将会出现 BIOS 菜单。

#### 步骤三：进入 UEFI Shell 界面

键盘选择 `Boot Manager --> UEFI Shell`

<NewCodeBlock tip="O6-UEFI-Shell>" type="device">

```
UEFI Interactive Shell v2.2
EDK II
UEFI v2.70 (EDK II, 0x00010000)
Mapping table
      FS0: Alias(s):HD0b:;BLK1:
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(1,GPT,80810833-48A5-4976-A296-0209E1012834,0x800,0x100000)
      FS1: Alias(s):HD1b0c:;BLK6:
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)/HD(2,GPT,3A7E1703-AD97-4EE2-A0E0-BDC978C453D0,0x8800,0x3A8F000)
     BLK0: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)
     BLK2: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(2,GPT,02EC7511-B73F-4F06-ABBF-ACEF796021D2,0x100800,0xEB93000)
     BLK3: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(3,GPT,19A46BB8-BDB9-4A8B-A2A8-03CE65C39A29,0xEC93800,0x1E8800)
     BLK4: Alias(s):
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)
     BLK5: Alias(s):
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)/HD(1,GPT,EE706585-639D-48CE-B236-4C372373E325,0x800,0x8000)
Press ESC in 1 seconds to skip startup.nsh or any other key to continue.
Shell>
```

</NewCodeBlock>

#### 步骤四：进入放置有 BIOS 文件和工具的 U盘文件夹

这里选择的是 `FS1:`。在 Shell 下，输入 `FS1:` 后按下回车键。然后用 `ls` 查看文件。

<NewCodeBlock tip="O6-UEFI-Shell>" type="device">

```
Shell> FS1:
FS1:\> ls
Directory of: FS1:\
01/01/1980  08:00                 619  BuildOptions
01/01/1980  08:00              57,344  BurnImage.efi
01/01/1980  08:00           6,288,062  cix_flash_all.bin
01/01/1980  08:00           2,101,982  cix_flash_ota.bin
01/01/1980  08:00             434,176  FlashUpdate.efi
01/01/1980  08:00               1,160  setup.nsh
01/01/1980  08:00             970,752  Shell.efi
01/01/1980  08:00              16,384  VariableInfo.efi
          8 File(s)   9,870,479 bytes
          0 Dir(s)
FS1:\>
```

</NewCodeBlock>

#### 步骤五：烧录 BIOS

在 Shell 下，输出命令 `setup.nsh` ，并按下回车执行。

<NewCodeBlock tip="O6-UEFI-Shell>" type="device">
```
FS1:\> setup.nsh
************************************************************************
                       Radxa BIOS Update Utility
************************************************************************

You are about to update the BIOS.
Please make sure the power stays on during the operation.

Enter 'q' to quit, any other key to continue:

---

                            Updating BIOS...

---

========================================================================
Copyright 2024 Cix Technology Group Co., Ltd. All Rights Reserved.
FlashUpdate Utility v1.04.
Build Date:Jan 16 2025
========================================================================
Old Version:0.2.2-1
New Version:0.2.2-1
[00.15] Processing...
Flash update success.

---

                         BIOS Update completed!

---

System will now power off.
You MUST fully remove all connected power source before connecting them.
Failure to do so may prevent some components to use the updated code.

Enter 'q' to quit, any other key to continue:

Reset with BIOS Update (24 bytes)

```
</NewCodeBlock>

烧录完成后，拔掉 O6 的电源，然后重新上电。

### 方法二：在线更新 BIOS 之无屏模式

#### 步骤一：硬件准备

- Orion O6 和 PD 65W 适配器
- x86 Windows/Linux/Mac 宿主机（有键盘和鼠标，串口工具）
- 调试串口线

#### 步骤二：搭建宿主机的调试串口环境

- 把调试串口线接到 O6 上的 3-pin UART2 插针上，参考：[调试连接器㉔](../hardware-design/hardware-interface#circle-24)
- 使用串口工具，设置波特率为 115200。

#### 步骤三：引导 O6 进入 BIOS 界面

- O6 插上电源开机，观察调试串口工具界面的启动日志
- 在启动过程中，会看到有提示我们进入 BIOS 界面。这时，短按宿主机的键盘的 “Esc” 按键

<NewCodeBlock tip="O6-Serial-Console" type="host">
```

Tianocore/EDK2 firmware version 0.2.2-1
Press ESCAPE for boot options
.....

```
</NewCodeBlock>

- 在调试串口工具界面，将会出现 BIOS 菜单

<NewCodeBlock tip="O6-Serial-Console" type="host">
```

Radxa Orion O6
CIX P1 CD8180 1.80 GHz
0.2.2-1 65536 MB RAM

Select Language <English> This is the option
one adjusts to change

> Device Manager the language for the
> Boot Manager current system
> Boot Maintenance Manager

Continue
Reset

^v=Move Highlight <Enter>=Select Entry

```
</NewCodeBlock>

##### 步骤四：进入 UEFI Shell 界面

键盘选择 `“Boot Manager --> UEFI Shell`

`Boot Manager` 界面如下：

<NewCodeBlock tip="O6-Serial-Console" type="host">
```

/------------------------------------------------------------------------------\
| Boot Manager |
\------------------------------------------------------------------------------/

                                                         Device Path :

Boot Manager Menu Fv(9A15AA37-D555-4A4E-
B541-86391FF68164)/FvF
debian ile(7C04A583-9E3E-4F1C
UEFI aigo U330 90003C33924E4D12 -AD65-E05268D0B4D1)
UEFI KINGBANK KP230 K19010J001612
UEFI Shell

Use the <^> and <v> keys to choose a boot option,
the <Enter> key to select a boot option, and the
<Esc> key to exit the Boot Manager Menu.

/------------------------------------------------------------------------------\
| |
| ^v=Move Highlight <Enter>=Select Entry Esc=Exit |
\------------------------------------------------------------------------------/

```
</NewCodeBlock>

选择 `UEFI Shell`，进入 shell 环境。

<NewCodeBlock tip="O6-Serial-Console" type="host">
```

UEFI Interactive Shell v2.2
EDK II
UEFI v2.70 (EDK II, 0x00010000)
Mapping table
FS0: Alias(s):HD0b:;BLK1:
PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(1,GPT,80810833-48A5-4976-A296-0209E1012834,0x800,0x100000)
FS1: Alias(s):HD1b0c:;BLK6:
VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)/HD(2,GPT,3A7E1703-AD97-4EE2-A0E0-BDC978C453D0,0x8800,0x3A8F000)
BLK0: Alias(s):
PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0

1.                                                    BLK2: Alias(s):
              PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
    1)/HD(2,GPT,02EC7511-B73F-4F06-ABBF-ACEF796021D2,0x100800,0xEB93000)
    BLK3: Alias(s):
    PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
    1)/HD(3,GPT,19A46BB8-BDB9-4A8B-A2A8-03CE65C39A29,0xEC93800,0x1E8800)
    BLK4: Alias(s):
    VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
    ,0x0)
    BLK5: Alias(s):
    VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
    ,0x0)/HD(1,GPT,EE706585-639D-48CE-B236-4C372373E325,0x800,0x8000)
    Press ESC in 1 seconds to skip startup.nsh or any other key to continue.
    Shell>

```
</NewCodeBlock>

##### 步骤五：烧录 BIOS

在 Shell 下，输出命令 `setup.nsh` ，并按下回车执行。

<NewCodeBlock tip="O6-Serial-Console" type="host">
```

FS1:\> setup.nsh

---

                       Radxa BIOS Update Utility

---

You are about to update the BIOS.
Please make sure the power stays on during the operation.

Enter 'q' to quit, any other key to continue:

---

                            Updating BIOS...

---

========================================================================
Copyright 2024 Cix Technology Group Co., Ltd. All Rights Reserved.
FlashUpdate Utility v1.04.
Build Date:Jan 16 2025
========================================================================
Old Version:0.2.2-1
New Version:0.2.2-1
[00.15] Processing...
Flash update success.

---

                         BIOS Update completed!

---

System will now power off.
You MUST fully remove all connected power source before connecting them.
Failure to do so may prevent some components to use the updated code.

Enter 'q' to quit, any other key to continue:

Reset with BIOS Update (24 bytes)

```
</NewCodeBlock>

烧录完成后，拔掉 O6 的电源，然后重新上电。

可参照演示：https://radxa-pkg.github.io/edk2-cix/install.html

### 方法三：离线更新 BIOS

对于需要从损坏的BIOS中恢复或偏好直接硬件访问的高级用户，可以使用 Serial Flash 编程器（如CH341A）将BIOS固件（cix_flash_all.bin）直接刷写到SPI NOR Flash芯片中。此方法完全绕过操作系统，即使在设备无法启动的情况下也能工作。有关详细的步骤说明和硬件要求，请参阅社区成员Meco提供的全面[论坛指南](https://forum.radxa.com/t/guide-flash-bios-with-ch341a-macos-linux/26742)，其中涵盖了在macOS和Linux平台上的操作过程。
```
