---
sidebar_position: 1
---

# Install System to Onboard UFS

This guide explains how to install the system onto the onboard UFS of the Fogwise® AIRbox Q900.

:::info Configuration Note
Fogwise® AIRbox Q900 comes with 128GB onboard UFS.
:::

## Prerequisites

### Entering EDL Mode

:::tip EDL Mode

**EDL Mode (Emergency Download Mode)** is a low-level recovery mechanism designed by Qualcomm for devices with Qualcomm chipsets. It is used to forcibly flash firmware or repair critical data through the USB interface when the device cannot boot normally due to system crashes, failed firmware updates, or hardware failures.

:::

1. Press and hold the EDL button before powering on the board.
2. Release the EDL button after the board is powered on, and it will automatically enter EDL mode.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-enter-edl-mode.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Entering EDL Mode" />
</div>

① : Press and hold the EDL button using a pin or toothpick

② : Power the board using a 12V DC power adapter

③ : Release the EDL button

④ : Connect the board's USB 3.1 OTG Type-A port to your computer's USB Type-A port using a dual-ended USB Type-A cable

### Verifying EDL Mode

This section describes how to verify EDL mode on both Windows and Ubuntu systems.

<Tabs queryString="Platform">

<TabItem value="Windows">

- Download the QDL tool

Go to the [Resource Downloads](../../download.md) page to download and extract the QDL tool (the QDL tool includes QDL software and QDL drivers).

- Install QDL Driver

Open the extracted QDL tool folder, locate the `qcserlib.inf` file, right-click on it, and select the `Install` option.

- Verify EDL Mode

After successfully installing the driver, try unplugging and replugging the USB Type-A cable, then observe if the system's Device Manager interface refreshes and shows the `Qualcomm HS-USB QDLoader 9008` device.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-edl-mode-windows.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Windows Device Manager showing Qualcomm HS-USB QDLoader 9008" />
</div>

</TabItem>

<TabItem value="Ubuntu">

Use the `lsusb` command to check if the device has entered QDL mode.

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
lsusb
```

</NewCodeBlock>

If the board has successfully entered QDL mode, the terminal will output something similar to:

```text
Bus 001 Device 012: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL mode)
```

</TabItem>

</Tabs>

## Installing the System

This section describes how to install the system onto the onboard UFS of the Fogwise® AIRbox Q900 on both Windows and Ubuntu systems.

### Download Files

Go to the [Resource Downloads](../../download.md) page to download the boot firmware and system image files.

### Set Environment Variables

Setting environment variables can simplify subsequent flashing operations and commands.

<Tabs queryString="Platform">

<TabItem value="Windows">

1. Press `Win + R` to open the Run dialog, type `sysdm.cpl`, and click `OK`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-set-env-variable-01.webp" style={{width: '50%', maxWidth: '1200px'}} alt="Windows Run Dialog" />
</div>

2. In the `System Properties` window, click on the `Advanced` tab, then click the `Environment Variables...` button.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-set-env-variable-02.webp" style={{width: '50%', maxWidth: '1200px'}} alt="System Properties Window" />
</div>

3. In the `Environment Variables` window, double-click on the `Path` variable under `System variables`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-set-env-variable-03.webp" style={{width: '50%', maxWidth: '1200px'}} alt="Environment Variables Window" />
</div>

4. In the `Edit Environment Variable` window, click the `New` button, enter the path to the QDL tool, and click `OK`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-set-env-variable-04.webp" style={{width: '50%', maxWidth: '1200px'}} alt="Edit Environment Variable Window" />
</div>

5. After completing the above steps, reopen the terminal. If you can view the version information using the `qdl` command, the setup was successful.

<NewCodeBlock tip="Windows$" type="host">

```bash
qdl
```

</NewCodeBlock>

Terminal output example:

```text
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

1. Check Path

Navigate to the QDL tool directory and use the `realpath` command to view the QDL tool's path.

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
realpath qdl
```

</NewCodeBlock>

Terminal output example:

```text
/home/user_name/download/QDL_2.3.9.2_Linux_x64/qdl
```

2. Executable Permissions

Use the `chmod` command to add execute permissions to the QDL tool.

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
sudo chmod 777 qdl
```

</NewCodeBlock>

3. Create Symbolic Link

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
sudo ln -s /home/user_name/download/QDL_2.3.9.2_Linux_x64/qdl /usr/local/bin/qdl
```

</NewCodeBlock>

4. Verification

Open a terminal in any location, and if you can view the version information using the `qdl` command, it means the setup was successful.

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
qdl
```

</NewCodeBlock>

Terminal output example:

```text
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

### Provision UFS

Navigate to the `qcs9075-provision` folder, open a terminal, and use the following command to provision UFS.

<NewCodeBlock tip="PC$" type="host">

```bash
qdl --storage ufs prog_firehose_ddr.elf provision_1_2.xml
```

</NewCodeBlock>

Terminal output example:

```text
Waiting for EDL device
waiting for programmer...
UFS provisioning succeeded
```

### Flash SAIL

Navigate to the `radxa-airbox-q900_noble_gnome_xxx\sail_nor` folder, open a terminal, and use the following command to flash SAIL.

<NewCodeBlock tip="PC$" type="host">

```bash
qdl --storage spinor prog_firehose_ddr.elf rawprogram0.xml patch0.xml
```

</NewCodeBlock>

```text
Waiting for EDL device
waiting for programmer...
flashed "SAIL_HYP" successfully
flashed "SAIL_HYP_BKUP" successfully
flashed "PrimaryGPT" successfully
flashed "BackupGPT" successfully
11 patches applied
```

### Flash System Image

Navigate to the `radxa-airbox-q900_noble_gnome_xxx` folder, open a terminal, and use the following command to flash the system image.

<NewCodeBlock tip="PC$" type="host">

```bash
qdl prog_firehose_ddr.elf rawprogram*.xml patch*.xml
```

</NewCodeBlock>

Terminal output example:

```text
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

## Using the System

After completing the above operations, you can use the Fogwise® AIRbox Q900 by following the [Quick Start](../quickly-start.md) guide.

## Other Operation

### Erase System on UFS

Boot AIRbox Q900 to EDL mode.

Navigate to the `radxa-airbox-q900_noble_gnome_xxx/partition_ufs` folder, open a terminal, and use the following command to erase UFS.

<NewCodeBlock tip="PC$" type="host">

```bash
qdl --storage ufs ../prog_firehose_ddr.elf rawprogram*_BLANK_GPT.xml
```

</NewCodeBlock>

Terminal output example:

```text
flashed "PrimaryGPT" successfully
flashed "PrimaryGPT" successfully
flashed "PrimaryGPT" successfully
flashed "PrimaryGPT" successfully
flashed "PrimaryGPT" successfully
0 patches applied
```
