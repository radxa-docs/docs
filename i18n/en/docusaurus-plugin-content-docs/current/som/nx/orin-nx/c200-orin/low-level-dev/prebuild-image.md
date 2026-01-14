---
sidebar_position: 5
---

# Use Radxa Prebuilt BIOS Firmware

Using Radxa prebuilt BIOS firmware is more convenient than rebuilding and flashing the BIOS yourself, and avoids the complexity of compiling and flashing firmware manually.

## Hardware Requirements

It is recommended to use an Ubuntu 22.04 host to perform the installation. If you are running Ubuntu 22.04 in a virtual machine, make sure the board is passed through to the VM during the BIOS flashing process.

- Ubuntu 22.04

## Hardware Connections

1. Use a jumper cap or DuPont wire to short the FC REC pin to GND.
2. Power the Radxa C200 Orin developer kit with the board power adapter.
3. Connect the board to the host PC using a USB Type‑C data cable.

:::tip Recovery mode

To enter Recovery mode, it is sufficient that the FC REC pin is detected as connected to GND during power‑on. You may remove the jumper cap or DuPont wire during the flashing process.

:::

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/c200/hardware-connection-edk2.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Download and Extract the Source

Download the NVIDIA L4T source package.

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
wget https://developer.download.nvidia.com/embedded/L4T/r36_Release_v4.3/release/Jetson_Linux_R36.4.3_aarch64.tbz2 -O Jetson_Linux_aarch64.tbz2
tar -xf Jetson_Linux_aarch64.tbz2
```

</NewCodeBlock>

## Download the Prebuilt Firmware

Download the Radxa prebuilt BIOS firmware to the specified directory.

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
cd Linux_for_Tegra
# For Radxa C200 Orin Developer Kit:
wget https://github.com/radxa/c200-bootupd/releases/latest/download/uefi_jetson_c200.bin -O bootloader/uefi_jetson.bin
```

</NewCodeBlock>

## Flash the BIOS Firmware

Use the flashing script provided by NVIDIA to flash the BIOS firmware.

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
sudo ./flash.sh p3768-0000-p3767-0000-a0-qspi internal
```

</NewCodeBlock>

After flashing succeeds, check that the jumper cap or DuPont wire shorting FC REC and GND has been removed to avoid entering Recovery mode directly on the next boot.
