---
sidebar_position: 5
---

# Update SPI Flash Firmware

Update the SPI Flash firmware of Radxa AICore AX-M1 from the host board.

## Prerequisites

- This operation writes to SPI Flash. Make sure the power supply is stable and do not power off during the update.
- The following commands are executed on the host board (Host).

## Install software

Go to the [Downloads](../download.md) page to download the required software packages, and place them in the same directory.

<NewCodeBlock tip="Host" type="host">

```bash
sudo dpkg -i axclhost-firmware_3.6.5-1_all.deb
sudo dpkg -i task-axclhost_3.6.5-1_all.deb
sudo dpkg -i axclhost-dkms_3.6.5-1_all.deb
sudo systemctl restart systemd-modules-load
```

</NewCodeBlock>

## Detect the device

Verify that the host recognizes the SPI Flash device node of Radxa AICore AX-M1.

<NewCodeBlock tip="Host" type="host">

```bash
axcl-smi sh "ls /dev/mtd0"
```

</NewCodeBlock>

If the output shows that `/dev/mtd0` exists, the device node is present.

## Update firmware

Go to the [Downloads](../download.md) page to download the SPI Flash firmware file, and make sure the firmware filename matches the command arguments.

<NewCodeBlock tip="Host" type="host">

```bash
axcl_spl_update -i spl_AX650_card_signed.bin -d 0
```

</NewCodeBlock>

`-d 0` selects the device with index 0.

## Post-update verification

After the update is completed, it is recommended to reboot the host board and check that the device node is still present.
