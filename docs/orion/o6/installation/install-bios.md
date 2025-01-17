---
sidebar_position: 4
description: ""
---

# 安装 BIOS

## 获取 BIOS 发布包

https://github.com/radxa-pkg/edk2-cix/releases

## 使用 Serial Flash 编程器刷 BIOS

可使用 Serial Flash 编程器将 BIOS 固件（cix_flash_all.bin），刷到 SPI Nor Flash 中。

## 使用 UEFI Shell 更新 BIOS

### 制作 U盘刷 BIOS 环境

#### 在 Windows PC 上操作

1，将 U盘格式化出一个分区，格式为 FAT32。

2，用 7z 工具，把发布包 edk2-cix 包解压。在 `data/usr/share/edk2/radxa/orion-o6/` 目录下有 BIOS 文件和工具。

```
BuildOptions  BurnImage.efi  cix_flash_all.bin  cix_flash_ota.bin  FlashUpdate.efi  setup.nsh  Shell.efi  VariableInfo.efi
```

3，将 BIOS 文件和工具拷贝到 U盘的顶层目录中。

#### 在 Linux PC 上操作

1，将 U盘格式化出一个分区，格式为 FAT32。

2，用 ar 先解压，得到 data.tar.xz。

```
ar vx edk2-cix_0.2.1-1_all.deb
```

3，用 tar 解压，得到文件和工具

```
$ tar xvf data.tar.xz
$ ls usr/share/edk2/radxa/orion-o6/
BuildOptions  BurnImage.efi  cix_flash_all.bin  cix_flash_ota.bin  FlashUpdate.efi  setup.nsh  Shell.efi  VariableInfo.efi
```

4，将 BIOS 文件和工具拷贝到 U盘的顶层目录中。

### 刷 BIOS

#### 选项一：通过 HDMI 显示器和键盘来操作

通过 HDMI 显示器和键盘操作的步骤如下。

##### 步骤一：进入 BIOS 界面

- 把 HDMI 显示器和键盘接到 O6 上
- 插上电源
- 在启动过程中，持续短按键盘的 “Esc” 按键
- 在 HDMI 显示器将会出现 BIOS 菜单

##### 步骤二：进入 UEFI Shell 界面

键盘选择 “Boot Manager” --> “UEFI Shell”

##### 步骤三：烧录 BIOS

选择放置 BIOS 和工具的 U盘分区

```
UEFI Interactive Shell v2.2
EDK II
UEFI v2.70 (EDK II, 0x00010000)
Mapping table
      FS0: Alias(s):HD0a0b:;BLK1:
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,008026090000000000)/USB(0x0
,0x0)/HD(1,GPT,660DE004-9906-4DE7-B00C-14C6B99380E9,0x5000,0x64000)
      FS1: Alias(s):HD0a0c:;BLK2:
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,008026090000000000)/USB(0x0
,0x0)/HD(2,GPT,970FDACB-F892-4267-9E82-75D39AF6CCBC,0x69000,0x3A2EFDF)
     BLK0: Alias(s):
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,008026090000000000)/USB(0x0
,0x0)
Press ESC in 5 seconds to skip startup.nsh or any other key to continue.
Shell> 
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
```

执行脚本 setup.nsh，并按回车键开始烧录。

```
FS1:\> setup.nsh
************************************************************************
                       Radxa BIOS Update Utility
************************************************************************
 
You are about to update the BIOS.
Please make sure the power stays on during the operation.
 
Enter 'q' to quit, any other key to continue:

************************************************************************
                            Updating BIOS...
************************************************************************
 
========================================================================
 Copyright 2024 Cix Technology Group Co., Ltd. All Rights Reserved.
                   FlashUpdate Utility v1.04.
                   Build Date:Jan 14 2025
========================================================================
Old Verison:0.0.1
New Verison:0.2.0-1
[00.29] Processing...
Flash update success.
 
************************************************************************
                         BIOS Update completed!
************************************************************************
System will now power off.
You MUST fully remove all connected power source before connecting them.
Failure to do so may prevent some components to use the updated code.
 
Enter 'q' to quit, any other key to continue:
```

烧录完成后，将 O6 断电，再次上电。

可参照演示：https://radxa-pkg.github.io/edk2-cix/install.html

#### 选项二：通过调试串口 UART2 和键盘来操作

通过调试串口 UART2 和键盘来操作的步骤如下。

##### 步骤一：搭建调试串口环境

- 把调试串口线接到 O6 上的 3-pin UART2 插针上
- 使用串口工具，设置波特率为 115200。

##### 步骤二：进入 BIOS 界面

- 把键盘接到 O6 的 Type-A 口上
- 插上电源
- 在启动过程中，持续短按键盘的 “Esc” 按键
- 在调试串口工具界面，将会出现 BIOS 菜单

##### 步骤三：进入 UEFI Shell 界面

键盘选择 “Boot Manager” --> “UEFI Shell”

##### 步骤四：烧录 BIOS

选择放置 BIOS 和工具的 U盘分区

```
UEFI Interactive Shell v2.2
EDK II
UEFI v2.70 (EDK II, 0x00010000)
Mapping table
      FS0: Alias(s):HD0a0b:;BLK1:
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,008026090000000000)/USB(0x0
,0x0)/HD(1,GPT,660DE004-9906-4DE7-B00C-14C6B99380E9,0x5000,0x64000)
      FS1: Alias(s):HD0a0c:;BLK2:
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,008026090000000000)/USB(0x0
,0x0)/HD(2,GPT,970FDACB-F892-4267-9E82-75D39AF6CCBC,0x69000,0x3A2EFDF)
     BLK0: Alias(s):
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,008026090000000000)/USB(0x0
,0x0)
Press ESC in 5 seconds to skip startup.nsh or any other key to continue.
Shell> 
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
```

执行脚本 setup.nsh，并按回车键开始烧录。

```
FS1:\> setup.nsh
************************************************************************
                       Radxa BIOS Update Utility
************************************************************************
 
You are about to update the BIOS.
Please make sure the power stays on during the operation.
 
Enter 'q' to quit, any other key to continue:

************************************************************************
                            Updating BIOS...
************************************************************************
 
========================================================================
 Copyright 2024 Cix Technology Group Co., Ltd. All Rights Reserved.
                   FlashUpdate Utility v1.04.
                   Build Date:Jan 14 2025
========================================================================
Old Verison:0.0.1
New Verison:0.2.0-1
[00.29] Processing...
Flash update success.
 
************************************************************************
                         BIOS Update completed!
************************************************************************
System will now power off.
You MUST fully remove all connected power source before connecting them.
Failure to do so may prevent some components to use the updated code.
 
Enter 'q' to quit, any other key to continue:
```

烧录完成后，将 O6 断电，再次上电。

可参照演示：https://radxa-pkg.github.io/edk2-cix/install.html
