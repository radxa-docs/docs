---
sidebar_position: 5
---

# 格式化 UFS

格式化 UFS，可以在 Linux PC 上操作。

## 在 Linux PC 上格式化板载 UFS

- 在 Linux PC，如 Ubuntu 20.04 上安装 modemanger API 工具。

```
$ sudo apt install -y modemmanger
```

- 获取 SP Flash Tool

```
$ mkdir -p ~/sp_flash_tool && wget https://dl.radxa.com/nio12l/tools/sp_flash_tool.tar.gz && tar zxvf sp_flash_tool.tar.gz -C ~/sp_flash_tool
```

- 运行格式化 UFS 脚本

```
$ cd ~/sp_flash_tool
$ ./format_ufs.sh
===[Start format UFS]===
sysname:Linux
 nodename:stephen
 release:5.15.0-101-generic
 version:#111~20.04.1-Ubuntu SMP Mon Mar 11 15:44:43 UTC 2024
 machine:x86_64

  domainame:(none)
 cur_kernel_version = 5.15.0
Begin
MediaTek SP Flash Tool v5.2120.00
Build Time: May  9 2021 19:08:42
Init config from config file
Combo Format Command::Create
General settings creat command
General Command exec
General Command ::LoadDA
General Command ::LoadScatterFile
General Command ::LoadRoms
rom list is empty, auto load all roms
rom list:Index(0), Enable(1),Path:/home/stephen/mediatek/sp_flash_tool/SP_Flash_Tool_V5/preloader_8395m1_64_bsp.bin
General Command ::LoadAuthFile
General Command ::LoadCertFile
General command exec done!
Connection create done!
Command (0)::Execute
Connecting to BROM...
Scanning USB port...
Search usb, timeout set as 3600000 ms
```

- NIO 12L 进入烧录模式

  - 按住 Download Button
  - 使用 USB Type-C 数据线，一端接 NIO 12L 的 Type-C OTG 口，另一端接 PC 的 USB-A 口
  - 释放 Download Button

- 查看格式化过程，有如下输出：

```
$ cd ~/sp_flash_tool
$ ./format_ufs.sh
===[Start format UFS]===
sysname:Linux
 nodename:stephen
 release:5.15.0-101-generic
 version:#111~20.04.1-Ubuntu SMP Mon Mar 11 15:44:43 UTC 2024
 machine:x86_64

  domainame:(none)
 cur_kernel_version = 5.15.0
Begin
MediaTek SP Flash Tool v5.2120.00
Build Time: May  9 2021 19:08:42
Init config from config file
Combo Format Command::Create
General settings creat command
General Command exec
General Command ::LoadDA
General Command ::LoadScatterFile
General Command ::LoadRoms
rom list is empty, auto load all roms
rom list:Index(0), Enable(1),Path:/home/stephen/mediatek/sp_flash_tool/SP_Flash_Tool_V5/preloader_8395m1_64_bsp.bin
General Command ::LoadAuthFile
General Command ::LoadCertFile
General command exec done!
Connection create done!
Command (0)::Execute
Connecting to BROM...
Scanning USB port...
Search usb, timeout set as 3600000 ms
add@/devices/pci0000:00/0000:00:14.0/usb1/1-2

add@/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0

add@/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/tty/ttyACM0

vid is 0e8d

device vid = 0e8d

pid is 0003

device pid = 0003

com portName is: /dev/ttyACM0

Total wait time = -1716195173.000000
USB port is obtained. path name(/dev/ttyACM0), port name(/dev/ttyACM0)
USB port detected: /dev/ttyACM0
BROM connected
Downloading & Connecting to DA...
connect DA end stage: 2, enable DRAM in 1st DA: 0
Download DA now...
30% of DA has been sent.
40% of DA has been sent.
70% of DA has been sent.
80% of DA has been sent.
100% of DA has been sent.
DA Connected
Check Storage Life Cycle: S_DONE(0)
Formatting Flash(2)... addr(0x0), len(0x0)
100% of flash has been formatted.
Format Succeeded.
Formatting Flash(2)... addr(0x0), len(0x0)
0% of flash has been formatted.
100% of flash has been formatted.
Format Succeeded.
Formatting Flash(2)... addr(0x0), len(0x0)
0% of flash has been formatted.
Formatting Flash(2)... addr(0x0), len(0x0)
10% of flash has been formatted.
20% of flash has been formatted.
30% of flash has been formatted.
40% of flash has been formatted.
50% of flash has been formatted.
60% of flash has been formatted.
70% of flash has been formatted.
80% of flash has been formatted.
90% of flash has been formatted.
100% of flash has been formatted.
Format Succeeded.
All command exec done!
Disconnect!
```
