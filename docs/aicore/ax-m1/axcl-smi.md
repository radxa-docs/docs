---
sidebar_position: 13
---

# AXCL-SMI 工具使用

## 概述

AXCL-SMI (System Management Interface) 工具用于设备信息收集，对设备进行配置等功能，支持如下设备信息收集：

- 硬件设备型号
- 固件版本号
- 驱动版本号
- 设备利用率
- 内存使用情况
- 设备芯片结温
- 其他信息

## 使用说明

在正确安装 AXCL 驱动包后，`axcl-smi` 即安装成功，直接执行 `axcl-smi` 显示内容如下：

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi
+------------------------------------------------------------------------------------------------+
| AXCL-SMI  V3.0.2_20250326020141                                  Driver  V3.0.2_20250326020141 |
+-----------------------------------------+--------------+---------------------------------------+
| Card  Name                     Firmware | Bus-Id       |                          Memory-Usage |
| Fan   Temp                Pwr:Usage/Cap | CPU      NPU |                             CMM-Usage |
|=========================================+==============+=======================================|
|    0  AX650N                     V3.0.2 | 0000:01:00.0 |                149 MiB /      945 MiB |
|   --   66C                      -- / -- | 1%        0% |                 18 MiB /     7040 MiB |
+-----------------------------------------+--------------+---------------------------------------+

+------------------------------------------------------------------------------------------------+
| Processes:                                                                                     |
| Card      PID  Process Name                                                   NPU Memory Usage |
|================================================================================================|
```

**字段说明**

| 字段             | 说明                               | 字段         | 说明                 |
| ---------------- | ---------------------------------- | ------------ | -------------------- |
| Card             | 设备索引编号，注意不是PCIe的设备号 | Bus-Id       | 设备Bus ID           |
| Name             | 设备名称                           | CPU          | CPU平均利用率        |
| Fan              | 风扇转速比（未支持）               | NPU          | NPU平均利用率        |
| Temp             | 设备芯片结温度                     | Memory-Usage | 系统内存： 使用/总量 |
| Firmware         | 设备固件版本号                     | CMM-Usage    | 媒体内存： 使用/总量 |
| Pwr: Usage/Cap   | 功耗（未支持）                     |              |                      |
|                  |                                    |              |                      |
| PID              | 主控进程PID                        |              |                      |
| Process Name     | 主控进程名称                       |              |                      |
| NPU Memory Usage | 设备NPU已使用的CMM内存             |              |                      |

### 帮助 (-h) 和版本 (-v)

`axcl-smi -h` 查询帮助信息

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi -h
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi -h
usage: axcl-smi [<command> [<args>]] [--device] [--version] [--help]

axcl-smi System Management Interface V3.0.2_20250326020141

Commands
    info                                    Show device information
        --temp                                  Show SoC temperature
        --mem                                   Show memory usage
        --cmm                                   Show CMM usage
        --cpu                                   Show CPU usage
        --npu                                   Show NPU usage
    proc                                    cat device proc
        --vdec                                  cat /proc/ax_proc/vdec
        --venc                                  cat /proc/ax_proc/venc
        --jenc                                  cat /proc/ax_proc/jenc
        --ivps                                  cat /proc/ax_proc/ivps
        --rgn                                   cat /proc/ax_proc/rgn
        --ive                                   cat /proc/ax_proc/ive
        --pool                                  cat /proc/ax_proc/pool
        --link                                  cat /proc/ax_proc/link_table
        --cmm                                   cat /proc/ax_proc/mem_cmm_info
    set                                     Set
        -f[MHz], --freq=[MHz]                   Set CPU frequency in MHz. One of: 1200000, 1400000, 1700000
    log                                     Dump logs from device
        -t[mask], --type=[mask]                 Specifies which logs to dump by a combination (bitwise OR) value of blow:
                                                  -1: all (default) 0x01: daemon 0x02: worker 0x10: syslog 0x20: kernel
        -o[path], --output=[path]               Specifies the path to save dump logs (default: ./)
    sh                                      Execute a shell command
        cmd                                     Shell command
        args...                                 Shell command arguments
    reboot                                  reboot device
-d, --device                            Card index [0, connected cards number - 1]
-v, --version                           Show axcl-smi version
-h, --help                              Show this help menu
```

`axcl-smi -v` 查询AXCL-SMI工具的版本

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi -v
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi -v
AXCL-SMI V3.0.2_20250326020141 BUILD: Mar 26 2025 02:27:24
```

### 选项

#### 设备号 (-d, --device)

```bash
-d, --device                             Card index [0, connected cards number - 1]
```

`[-d, --device]` 指定设备号索引，范围：[0, 连接设备数量 - 1]， **默认为0号设备**。

### 信息查询（info）

`axcl-smi info`用于显示设备的详细信息，支持子命令如下：

| 子命令 | 说明                                                                                                                          |
| ------ | ----------------------------------------------------------------------------------------------------------------------------- |
| temp   | 显示设备芯片结温，单位是摄氏度x1000。                                                                                         |
| mem    | 显示设备系统详细内存使用情况。                                                                                                |
| cmm    | 显示设备媒体内存使用情况。如果需要更详细的媒体内存，执行`axcl-smi sh cat /proc/ax_proc/mem_cmm_info -d xx` (xx是PCIe设备号)。 |
| cpu    | 显示设备CPU利用率。                                                                                                           |
| npu    | 显示设备NPU利用率。                                                                                                           |

**示例**：查询索引号为0号的设备的媒体内存使用情况：

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi info --cmm -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi info --cmm -d 0
Device ID           : 1 (0x1)
CMM Total           :  7208960 KiB
CMM Used            :    18876 KiB
CMM Remain          :  7190084 kiB
```

### PROC查询（proc）

`axcl-smi proc`用于查询设备模块的proc信息，支持子命令如下：

| 子命令 | 说明                                                  |
| ------ | ----------------------------------------------------- |
| --vdec | 查询 VDEC 模块 proc (`cat /proc/ax_proc/vdec`)        |
| --venc | 查询 VENC 模块 proc (`cat /proc/ax_proc/venc`)        |
| --jenc | 查询 JENC 模块 proc (`cat /proc/ax_proc/jenc`)        |
| --ivps | 查询 IVPS 模块 proc (`cat /proc/ax_proc/ivps`)        |
| --rgn  | 查询 RGN 模块 proc (`cat /proc/ax_proc/rgn`)          |
| --ive  | 查询 IVE 模块 proc (`cat /proc/ax_proc/ive`)          |
| --pool | 查询 POOL 模块 proc (`cat /proc/ax_proc/pool`)        |
| --link | 查询 LINK 模块 proc (`cat /proc/ax_proc/link_table`)  |
| --cmm  | 查询 CMM 模块 proc (`cat /proc/ax_proc/mem_cmm_info`) |

**示例**：查询0号设备的VDEC proc信息

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi proc --vdec -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi proc --vdec -d 0
--------AX VDEC VERSION ------------------------
[Axera version]: ax_vdec V3.0.2_20250326020141 Mar 26 2025 02:20:01 JK
```

### 参数设置（set）

`axcl-smi set` 用户配置设备信息，支持的子命令如下：

| 子命令                | 说明                                                           |
| --------------------- | -------------------------------------------------------------- |
| -f[MHz], --freq=[MHz] | 设置设备的 CPU 频率，只支持 1200000, 1400000, 1700000 三种频率 |

**示例**：设置索引号为0号的设备CPU主频为1200MHz

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi set -f 1200000 -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi set -f 1200000 -d 0
set cpu frequency 1200000 to device 1 succeed.
```

### 下载日志（log）

`axcl-smi log` 用于下载设备的日志文件到主控侧，支持的参数如下：

| 参数                      | 说明                                                                                                                                                              |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| -t[mask], --type=[mask]   | 指定下载的日志类别。设备侧日志类别如下：<br />-1： 全部日志<br />0x01：守护进程<br />0x02: 业务进程<br />0x10：syslog<br />0x20：内核日志<br />推荐-1下载全部日志 |
| -o[path], --output=[path] | 指定日志保存路径，支持绝对和相对路径，默认是当前目录。注意目录需要有写权限。                                                                                      |

**示例**：下载索引为0号的设备的全部日志，并保存到当前目录

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi log -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi log -d 0
[2025-07-22 07:31:59.215][1858][C][log][dump][73]: log dump finished: ./dev1_log_20250722122146.tar.gz
```

### shell命令（sh）

`axcl-smi sh` 支持shell命令查询设备信息，通常用于查询设备侧模块的运行proc信息，**示例**：查询索引号为0号的设备CMM信息

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi sh cat /proc/ax_proc/mem_cmm_info -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi sh cat /proc/ax_proc/mem_cmm_info -d 0
--------------------SDK VERSION-------------------
[Axera version]: ax_cmm V3.0.2_20250326020141 Mar 26 2025 02:19:19 JK
+---PARTITION: Phys(0x148000000, 0x2FFFFFFFF), Size=7208960KB(7040MB),    NAME="anonymous"
 nBlock(Max=0, Cur=23, New=0, Free=0)  nbytes(Max=0B(0KB,0MB), Cur=19329024B(18876KB,18MB), New=0B(0KB,0MB), Free=0B(0KB,0MB))  Block(Max=0B(0KB,0MB), Min=0B(0KB,0MB), Avg=0B(0KB,0MB))
   |-Block: phys(0x148000000, 0x148013FFF), cache =non-cacheable, length=80KB(0MB),    name="TDP_DEV"
   |-Block: phys(0x148014000, 0x148014FFF), cache =non-cacheable, length=4KB(0MB),    name="TDP_CMODE3"
   |-Block: phys(0x148015000, 0x148015FFF), cache =non-cacheable, length=4KB(0MB),    name="TDP_CMODE3_CPU"
   |-Block: phys(0x148016000, 0x148029FFF), cache =non-cacheable, length=80KB(0MB),    name="TDP_DEV"
   |-Block: phys(0x14802A000, 0x14802AFFF), cache =non-cacheable, length=4KB(0MB),    name="TDP_CMODE3"
   |-Block: phys(0x14802B000, 0x14802BFFF), cache =non-cacheable, length=4KB(0MB),    name="TDP_CMODE3_CPU"
   |-Block: phys(0x14802C000, 0x14862BFFF), cache =non-cacheable, length=6144KB(6MB),    name="vdec_ko"
   |-Block: phys(0x14862C000, 0x148647FFF), cache =non-cacheable, length=112KB(0MB),    name="VGP_DEV"
   |-Block: phys(0x148648000, 0x148648FFF), cache =non-cacheable, length=4KB(0MB),    name="VGP_CMODE3"
   |-Block: phys(0x148649000, 0x148649FFF), cache =non-cacheable, length=4KB(0MB),    name="VGP_CMODE3_CPU"
   |-Block: phys(0x14864A000, 0x148665FFF), cache =non-cacheable, length=112KB(0MB),    name="VPP_DEV"
   |-Block: phys(0x148666000, 0x148666FFF), cache =non-cacheable, length=4KB(0MB),    name="VPP_CMODE3"
   |-Block: phys(0x148667000, 0x148667FFF), cache =non-cacheable, length=4KB(0MB),    name="VPP_CMODE3_CPU"
   |-Block: phys(0x148668000, 0x1487E7FFF), cache =non-cacheable, length=1536KB(1MB),    name="h26x_ko"
   |-Block: phys(0x1487E8000, 0x148967FFF), cache =non-cacheable, length=1536KB(1MB),    name="h26x_ko"
   |-Block: phys(0x148968000, 0x148968FFF), cache =non-cacheable, length=4KB(0MB),    name="h26x_ko"
   |-Block: phys(0x148969000, 0x148AE8FFF), cache =non-cacheable, length=1536KB(1MB),    name="jenc_ko"
   |-Block: phys(0x148AE9000, 0x148C68FFF), cache =non-cacheable, length=1536KB(1MB),    name="jenc_ko"
   |-Block: phys(0x148C69000, 0x148C69FFF), cache =non-cacheable, length=4KB(0MB),    name="jenc_ko"
   |-Block: phys(0x148C6A000, 0x148C6AFFF), cache =non-cacheable, length=4KB(0MB),    name="GDC_CMDA3"
   |-Block: phys(0x148C6B000, 0x148C6BFFF), cache =non-cacheable, length=4KB(0MB),    name="GDC_CMDA3_CPU"
   |-Block: phys(0x148C6C000, 0x148C6EFFF), cache =non-cacheable, length=12KB(0MB),    name="GDC_CMD"
   |-Block: phys(0x148C6F000, 0x14926EFFF), cache =non-cacheable, length=6144KB(6MB),    name="vdec_ko"

---CMM_USE_INFO:
 total size=7208960KB(7040MB),used=18876KB(18MB + 444KB),remain=7190084KB(7021MB + 580KB),partition_number=1,block_number=23
```

### 重启（reboot）

`axcl-smi reboot` 命令首先复位指定设备，随后将自动加载固件，示例如下：

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi reboot -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi reboot -d 0
Do you want to reboot device 0 ? (y/n): y
```
