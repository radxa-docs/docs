---
sidebar_position: 13
---

# AXCL-SMI Tool Usage

## Overview

The AXCL-SMI (System Management Interface) tool is used for collecting device information and configuring the device. It supports collecting the following device information:

- Hardware model
- Firmware version
- Driver version
- Device utilization
- Memory usage
- Device junction temperature
- Other information

## Usage

After installing the AXCL driver package correctly, `axcl-smi` is available. Run `axcl-smi` to display the following information:

<NewCodeBlock tip="Host" type="device">

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

**Field description**

| Field            | Description                            | Field        | Description               |
| ---------------- | -------------------------------------- | ------------ | ------------------------- |
| Card             | Device index (not the PCIe device no.) | Bus-Id       | Device Bus ID             |
| Name             | Device name                            | CPU          | Average CPU usage         |
| Fan              | Fan speed ratio (not supported)        | NPU          | Average NPU usage         |
| Temp             | Device junction temperature            | Memory-Usage | System memory: used/total |
| Firmware         | Device firmware version                | CMM-Usage    | Media memory: used/total  |
| Pwr: Usage/Cap   | Power (not supported)                  |              |                           |
|                  |                                        |              |                           |
| PID              | Main process PID                       |              |                           |
| Process Name     | Main process name                      |              |                           |
| NPU Memory Usage | CMM memory used by the device NPU      |              |                           |

### Help (-h) and Version (-v)

`axcl-smi -h` to view help information

<NewCodeBlock tip="Host" type="device">

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

`axcl-smi -v` to view the AXCL-SMI tool version

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi -v
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi -v
AXCL-SMI V3.0.2_20250326020141 BUILD: Mar 26 2025 02:27:24
```

### Options

#### Device index (-d, --device)

```bash
-d, --device                             Card index [0, connected cards number - 1]
```

`[-d, --device]` specifies the device index, range: [0, number of connected devices - 1]. The default is device 0.

### Information query (info)

`axcl-smi info` displays detailed device information. Supported subcommands:

| Subcommand | Description                                                                                                                            |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| temp       | Show the device SoC junction temperature, unit is Celsius x1000.                                                                       |
| mem        | Show detailed system memory usage.                                                                                                     |
| cmm        | Show media (CMM) memory usage. For more detailed media memory, run `axcl-smi sh cat /proc/ax_proc/mem_cmm_info -d xx` (xx is PCIe id). |
| cpu        | Show device CPU utilization.                                                                                                           |
| npu        | Show device NPU utilization.                                                                                                           |

**Example**: Query media (CMM) memory usage for device index 0:

<NewCodeBlock tip="Host" type="device">

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

### PROC query (proc)

`axcl-smi proc` queries proc information for device modules. Supported subcommands:

| Subcommand | Description                                              |
| ---------- | -------------------------------------------------------- |
| --vdec     | Query VDEC module proc (`cat /proc/ax_proc/vdec`)        |
| --venc     | Query VENC module proc (`cat /proc/ax_proc/venc`)        |
| --jenc     | Query JENC module proc (`cat /proc/ax_proc/jenc`)        |
| --ivps     | Query IVPS module proc (`cat /proc/ax_proc/ivps`)        |
| --rgn      | Query RGN module proc (`cat /proc/ax_proc/rgn`)          |
| --ive      | Query IVE module proc (`cat /proc/ax_proc/ive`)          |
| --pool     | Query POOL module proc (`cat /proc/ax_proc/pool`)        |
| --link     | Query LINK module proc (`cat /proc/ax_proc/link_table`)  |
| --cmm      | Query CMM module proc (`cat /proc/ax_proc/mem_cmm_info`) |

**Example**: Query VDEC proc information for device 0

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi proc --vdec -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi proc --vdec -d 0
--------AX VDEC VERSION ------------------------
[Axera version]: ax_vdec V3.0.2_20250326020141 Mar 26 2025 02:20:01 JK
```

### Parameter settings (set)

`axcl-smi set` configures device parameters. Supported subcommands:

| Subcommand            | Description                                                  |
| --------------------- | ------------------------------------------------------------ |
| -f[MHz], --freq=[MHz] | Set device CPU frequency; supports 1200000, 1400000, 1700000 |

**Example**: Set CPU frequency of device index 0 to 1200 MHz

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi set -f 1200000 -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi set -f 1200000 -d 0
set cpu frequency 1200000 to device 1 succeed.
```

### Download logs (log)

`axcl-smi log` downloads device logs to the host. Supported options:

| Option                    | Description                                                                                                                                         |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| -t[mask], --type=[mask]   | Specify which logs to download. On device: <br />-1: all logs (recommended)<br />0x01: daemon<br />0x02: worker<br />0x10: syslog<br />0x20: kernel |
| -o[path], --output=[path] | Path to save logs; supports absolute and relative paths, default is current directory. Ensure the directory is writable.                            |

**Example**: Download all logs from device index 0 and save to the current directory

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi log -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi log -d 0
[2025-07-22 07:31:59.215][1858][C][log][dump][73]: log dump finished: ./dev1_log_20250722122146.tar.gz
```

### Shell command (sh)

`axcl-smi sh` supports running shell commands to query device information, typically to read device-side proc details. **Example**: query CMM info of device index 0

<NewCodeBlock tip="Host" type="device">

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

### Reboot (reboot)

The `axcl-smi reboot` command resets the specified device and then automatically loads the firmware. Example:

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi reboot -d 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi reboot -d 0
Do you want to reboot device 0 ? (y/n): y
```
