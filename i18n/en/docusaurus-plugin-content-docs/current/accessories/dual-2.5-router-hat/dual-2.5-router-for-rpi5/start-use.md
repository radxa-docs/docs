---
sidebar_position: 6
---

# Start Use

## Startup System

Insert the installed system microSD card into the Raspberry Pi and use 12V/5A power supply from the Radxa Dual 2.5G Router HAT DC seat. Let's ssh into Raspberry Pi.

```bash
ssh pi@raspberrypi.local
```

## Enable the PCIe on the Raspberry Pi 5

The FPC PCIe channel on the Raspberry Pi 5 is disabled by default, and we need to enable it using the following method.

Use the following command to edit `/boot/firmware/config.txt`, add `dtparam=pciex1` to the end of the file, and then save and reboot.

![step1](/img/accessories/dual-2.5-route-hat/rpi-using-1.webp)

You can refer to the [Raspberry Pi official documentation on PCIe connectors](https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#raspberry-pi-connector-for-pcie).

## Check the Device

Enter the `lspci` command to check if the relevant PCIe devices are recognized.

![step2](/img/accessories/dual-2.5-route-hat/rpi-using-2.webp)

### View the Hard Disk

You can use the lsblk command to check for NVMe devices.

```bash
lsblk
```

![step3](/img/accessories/dual-2.5-route-hat/rpi-using-3.webp)

#### Speed Test

Here is a simple speed test.

```bash
sudo dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=1000 status=progress oflag=direct
```

![step4](/img/accessories/dual-2.5-route-hat/rpi-using-4.webp)

#### Force Gen 3

Add `dtparam=pciex1_gen=3` to `/boot/firmware/config.txt` to force the Raspberry Pi 5 to use PCIe Gen 3.

![step5](/img/accessories/dual-2.5-route-hat/rpi-using-5.webp)

After adding this, reboot the system and use the following commands to check the connection status of the Radxa Dual 2.5G Router HAT.

```bash
sudo lspci
sudo lspci -vvv -s 0000:03:00.0 | grep LnkSta
```

![step6](/img/accessories/dual-2.5-route-hat/rpi-using-6.webp)

Once you see that it is using Gen 3, you can test the write speed again.

![step7](/img/accessories/dual-2.5-route-hat/rpi-using-7.webp)

### View Ethernet Devices

Use `ip a` to check if the 2.5G dual network ports are recognized.

![step8](/img/accessories/dual-2.5-route-hat/rpi-using-8.webp)

#### Test Ethernet Speed

Use iperf3 to test the 2.5G Ethernet speed.

First, run the following commands to install the `iperf3` tool:

```bash
sudo apt-get update
sudo apt-get install iperf3
```

You need a server that supports 2.5G; execute the following command on the server:

```bash
iperf3 -s
```

Then, run the following command on the Raspberry Pi 5:

```bash
iperf3 -c xxx.xxx.x.xxx (Server IP)
```

![step9](/img/accessories/dual-2.5-route-hat/rpi-using-9.webp)
