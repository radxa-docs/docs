---
sidebar_position: 1
---

# Enable PCIe Gen3

## Enable PCIe

Edit the `/boot/firmware/config.txt` file.

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo nano /boot/firmware/config.txt
```

</NewCodeBlock>

Add `dtparam=pciex1` to the end of the file, then save and reboot.

```text
dtparam=pciex1
```

## Check Disks

Use the `lsblk` command to view disk devices.

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

![step2](/img/accessories/storage/penta/rpi-using-2.webp)

## Speed Test

Below is a simple speed test. Since a mechanical hard drive is used, the speed is relatively lower.

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo dd if=/dev/zero of=/dev/sda bs=32M status=progress count=100 oflag=direct
```

</NewCodeBlock>

![step3](/img/accessories/storage/penta/rpi-using-3.webp)

## Force Gen 3

Adding `dtparam=pciex1_gen=3` to `/boot/firmware/config.txt` allows the Raspberry Pi CM5 to force PCIe Gen 3.

![step4](/img/accessories/storage/penta/rpi-using-4.webp)

After adding and rebooting, use the following commands to check the Radxa Taco connection status.

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo lspci
sudo lspci -vvv -s 0000:01:00.1 | grep LnkSta
```

</NewCodeBlock>

![step5](/img/accessories/storage/penta/rpi-using-5.webp)

After seeing Gen3 is used, we can test the write speed again.

![step6](/img/accessories/storage/penta/rpi-using-6.webp)
