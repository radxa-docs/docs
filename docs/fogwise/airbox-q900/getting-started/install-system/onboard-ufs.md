---
sidebar_position: 1
---

# 安装系统到板载 UFS

主要介绍如何将系统安装到 Fogwise® AIRbox Q900 的板载 UFS 上。

:::info 配置说明
Fogwise® AIRbox Q900 板载 128GB UFS。
:::

## 使用前提

### 进入 EDL 模式

:::tip EDL 模式

高通的 **EDL 模式（Emergency Download Mode，紧急下载模式）** 是一种专为高通芯片设备设计的底层救援机制，用于在设备因系统崩溃、刷机失败或硬件故障导致无法正常启动时，通过 USB 接口强制刷写固件或修复关键数据。

:::

主板上电前，按住 EDL 按键；主板上电后，松开 EDL 按键，主板会自动进入 EDL 模式。

① : 使用插针或牙签按住 EDL 按键

② : 使用 12V DC 电源适配器给主板供电

③ : 松开 EDL 按键

④ : 使用双头 USB Type-A 数据线连接主板的 USB 3.1 OTG Type-A 接口和电脑的 USB Type-A 接口

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-enter-edl-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 验证 EDL 模式

主要介绍 Windows 和 Ubuntu 系统下验证 EDL 模式的方法。

<Tabs queryString="Platform">

<TabItem value="Windows">

- 下载 QDL 工具

进入 [资源汇总下载](../../download.md) 页面下载 QDL 工具并解压（QDL 工具包括 QDL 软件和 QDL 驱动）。

- 安装 QDL 驱动

打开解压后的 QDL 工具文件夹，找到 `qcserlib.inf` 文件，鼠标右击，选择 `安装` 选项。

- 验证 EDL 模式

安装驱动成功后，可以尝试插拔 USB Type-A 数据线，观察系统的设备管理器界面是否刷新以及出现 `Qualcomm HS-USB QDLoader 9008` 设备。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-edl-mode-windows.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Ubuntu">

使用 `lsusb` 命令查看设备是否进入 QDL 模式。

<NewCodeBlock tip="Ubuntu$" type="host">

```
lsusb
```

</NewCodeBlock>

若主板进入 QDL 模式，终端会输出类似以下结果：

```
Bus 001 Device 012: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL mode)
```

</TabItem>

</Tabs>

## 安装系统

主要介绍 Windows 和 Ubuntu 系统下安装系统到 Fogwise® AIRbox Q900 的板载 UFS 上的方法。

### 下载文件

进入 [资源汇总下载](../../download.md) 页面下载启动固件和系统镜像文件。

### 设置环境变量

设置环境变量，可以简化后续的烧录操作，简化命令。

<Tabs queryString="Platform">

<TabItem value="Windows">

1. 使用 `Win + R` 打开运行对话框，输入 `sysdm.cpl`，点击 `确定`。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-set-env-variable-01.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

2. 在 `System Properties` 选项窗口中，点击 `Advanced` 选项卡，点击 `Environment Variable ...` 按钮。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-set-env-variable-02.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

3. 在 `Environment Variables` 选项窗口中，双击 `System variables` 下的 Path 变量。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-set-env-variable-03.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

4. 在 `Edit Environment Variable` 选项窗口中，点击 `New` 按钮，输入 QDL 工具的路径，点击 `OK` 按钮。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-set-env-variable-04.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

5. 完成以上操作，重新打开终端，如果输入 `qdl` 命令可以查看到版本信息，说明设置成功。

<NewCodeBlock tip="Windows$" type="host">

```
qdl
```

</NewCodeBlock>

终端输出示例：

```
Usage: qdl [options] <prog.mbn> [<program> <patch> ...]
 -d, --debug                    Print detailed debug info
 -v, --version                  Print the current version and exit
 -n, --dry-run                  Dry run execution, no device reading or flashing
 -f, --allow-missing            Allow skipping of missing files during flashing
 -s, --storage=T                Set target storage type T: <emmc|nand|ufs>
 -l, --finalize-provisioning    Provision the target storage
 -i, --include=T                Set an optional folder T to search for files
 -S, --serial=T                 Select target by serial number T (e.g. <0AA94EFD>)
 -u, --out-chunk-size=T         Override chunk size for transaction with T
 -t, --create-digests=T         Generate table of digests in the T folder
 -D, --vip-table-path=T         Use digest tables in the T folder for VIP
 -h, --help                     Print this usage info

Example: qdl prog_firehose_ddr.elf rawprogram*.xml patch*.xml
```

</TabItem>

<TabItem value="Ubuntu">

1. 查看路径

进入 QDL 工具的目录，使用 `realpath` 命令查看 QDL 工具的路径。

<NewCodeBlock tip="Ubuntu$" type="host">

```
realpath qdl
```

</NewCodeBlock>

终端输出示例：

```
/home/milir/download/QDL_2.3.9.2_Linux_x64/qdl
```

2. 可执行权限

使用 `chmod` 命令为 QDL 工具添加可执行权限。

<NewCodeBlock tip="Ubuntu$" type="host">

```
sudo chmod 777 qdl
```

</NewCodeBlock>

3. 创建软链接

<NewCodeBlock tip="Ubuntu$" type="host">

```
sudo ln -s /home/milir/download/QDL_2.3.9.2_Linux_x64/qdl /usr/local/bin/qdl
```

</NewCodeBlock>

4. 验证

在任意位置打开终端，如果可以使用 `qdl` 命令查看到版本信息，说明设置成功。

<NewCodeBlock tip="Ubuntu$" type="host">

```
qdl
```

</NewCodeBlock>

终端输出示例：

```
Usage: qdl [options] <prog.mbn> [<program> <patch> ...]
 -d, --debug                    Print detailed debug info
 -v, --version                  Print the current version and exit
 -n, --dry-run                  Dry run execution, no device reading or flashing
 -f, --allow-missing            Allow skipping of missing files during flashing
 -s, --storage=T                Set target storage type T: <emmc|nand|ufs>
 -l, --finalize-provisioning    Provision the target storage
 -i, --include=T                Set an optional folder T to search for files
 -S, --serial=T                 Select target by serial number T (e.g. <0AA94EFD>)
 -u, --out-chunk-size=T         Override chunk size for transaction with T
 -t, --create-digests=T         Generate table of digests in the T folder
 -D, --vip-table-path=T         Use digest tables in the T folder for VIP
 -h, --help                     Print this usage info

Example: qdl prog_firehose_ddr.elf rawprogram*.xml patch*.xml
```

</TabItem>

</Tabs>

### 配置 UFS

进入 `provision` 文件夹下，打开终端，使用以下命令配置 UFS。

<NewCodeBlock tip="PC$" type="host">

```
qdl --storage ufs prog_firehose_ddr.elf provision_1_2.xml
```

</NewCodeBlock>

终端输出示例：

```
Waiting for EDL device
waiting for programmer...
UFS provisioning succeeded
```

### 烧录 SAIL

进入 `fw702-ubuntu-noble-gnome-20250930\sail_no` 文件夹下，打开终端，使用以下命令烧录 SAIL。

<NewCodeBlock tip="PC$" type="host">

```
qdl --storage spinor prog_firehose_ddr.elf rawprogram0.xml patch0.xml
```

</NewCodeBlock>

```
Waiting for EDL device
waiting for programmer...
flashed "SAIL_HYP" successfully
flashed "SAIL_HYP_BKUP" successfully
flashed "PrimaryGPT" successfully
flashed "BackupGPT" successfully
11 patches applied
```

### 烧录 CDT

进入 `fw702-ubuntu-noble-gnome-20250930` 文件夹下，打开终端，使用以下命令烧录 CDT。

<NewCodeBlock tip="PC$" type="host">

```
qdl prog_firehose_ddr.elf rawprogram3.xml patch3.xml
```

</NewCodeBlock>

终端输出示例：

```
Waiting for EDL device
waiting for programmer...
flashed "PrimaryGPT" successfully
flashed "BackupGPT" successfully
13 patches applied
```

### 烧录系统镜像

进入 `fw702-ubuntu-noble-gnome-20250930` 文件夹下，打开终端，使用以下命令烧录系统镜像。

<NewCodeBlock tip="PC$" type="host">

```
qdl prog_firehose_ddr.elf rawprogram*.xml patch*.xml
```

</NewCodeBlock>

终端输出示例：

```
Waiting for EDL device
waiting for programmer...
flashed "efi" successfully at 40329kB/s
flashed "system" successfully at 3630kB/s
flashed "PrimaryGPT" successfully
flashed "BackupGPT" successfully
flashed "xbl_a" successfully
flashed "xbl_b" successfully
flashed "xbl_config_a" successfully
flashed "xbl_config_b" successfully
flashed "PrimaryGPT" successfully
flashed "BackupGPT" successfully
flashed "xbl_a" successfully
flashed "xbl_b" successfully
flashed "xbl_config_a" successfully
flashed "xbl_config_b" successfully
flashed "PrimaryGPT" successfully
flashed "BackupGPT" successfully
flashed "PrimaryGPT" successfully
flashed "BackupGPT" successfully
flashed "aop_a" successfully
flashed "shrm_a" successfully
flashed "uefi_a" successfully
flashed "uefisecapp_a" successfully
flashed "xbl_ramdump_a" successfully
flashed "dtb_a" successfully at 32768kB/s
flashed "tz_a" successfully
flashed "hyp_a" successfully
flashed "devcfg_a" successfully
flashed "cpucp_a" successfully
flashed "multiimgoem_a" successfully
flashed "multiimgqti_a" successfully
flashed "imagefv_a" successfully
flashed "aop_b" successfully
flashed "dtb_b" successfully at 65536kB/s
flashed "imagefv_b" successfully
flashed "shrm_b" successfully
flashed "uefi_b" successfully at 3912kB/s
flashed "uefisecapp_b" successfully
flashed "xbl_ramdump_b" successfully
flashed "tz_b" successfully
flashed "hyp_b" successfully
flashed "devcfg_b" successfully
flashed "cpucp_b" successfully
flashed "multiimgoem_b" successfully
flashed "multiimgqti_b" successfully
flashed "toolsfv" successfully
flashed "PrimaryGPT" successfully
flashed "BackupGPT" successfully
65 patches applied
partition 1 is now bootable
```

## 使用系统

完成以上操作，可以按照 [快速上手](../quickly_start.md) 教程使用 Fogwise® AIRbox Q900。
