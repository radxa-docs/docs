---
sidebar_position: 2
---

# Raspberry Pi 5 Use Penta

The Raspberry Pi 5 has a PCIe port that works well with the Radxa Penta SATA HAT.

:::info
Do not use DC power and Type-C to power the Penta SATA HAT and Raspberry Pi 5 at the same time.

Generally speaking, the power consumption of 2.5-inch hard drives is about 5W, if you use 2 or more hard drives, consider using DC power from Penta.

If you choose DC power supply, use a power supply with a voltage of 12V and a current of 4A or above. The DC seat size is 5525.
:::

## Assemble

Please assemble in the order shown in the picture below.

1. Installing column
   ![step1](/img/accessories/penta/rpi-assemble-1.webp)
   ![step2](/img/accessories/penta/rpi-assemble-2.webp)

2. Installing an FPC
   ![step3](/img/accessories/penta/rpi-assemble-3.webp)
   Please note that the black side of the FPC is facing us.
   ![step4](/img/accessories/penta/rpi-assemble-4.webp)

3. Put together
   ![step5](/img/accessories/penta/rpi-assemble-5.webp)

4. Installing disks
   ![step6](/img/accessories/penta/rpi-assemble-6.webp)
   ![step7](/img/accessories/penta/rpi-assemble-7.webp)
   ![step8](/img/accessories/penta/rpi-assemble-8.webp)

## Install the system

Please go to https://www.raspberrypi.com/software/ to download Raspberry Pi Imager and install. Insert the microSD card into the USB port on your computer.

1. Open Raspberry Pi Imager
   ![step1](/img/accessories/penta/rpi-install-os-1.webp)

2. Select the device, and select Raspberry Pi5
   ![step2](/img/accessories/penta/rpi-install-os-2.webp)

3. Select a system, Raspberry Pi OS (64-bit) is recommended
   ![step3](/img/accessories/penta/rpi-install-os-3.webp)

4. Select the microSD card device you want to insert
   ![step4](/img/accessories/penta/rpi-install-os-4.webp)

5. Edit Settings
   ![step5](/img/accessories/penta/rpi-install-os-5.webp)

6. Add user
   ![step6](/img/accessories/penta/rpi-install-os-6.webp)

7. Enable SSH
   ![step7](/img/accessories/penta/rpi-install-os-7.webp)

8. Start write
   ![step8](/img/accessories/penta/rpi-install-os-8.webp)

9. Complete installation
   ![step9](/img/accessories/penta/rpi-install-os-9.webp)

## Start Use

Insert the installed system microSD card into the Raspberry Pi and use 12V/5A power supply from the Radxa Penta SATA HAT DC seat. Let's ssh into Raspberry Pi.

```bash
ssh pi@raspberrypi.local
```

### Enable PCIe

Edit `/boot/firmware/config.txt` and add `dtparam=pciex1` to the end of the file, save and reboot.

![step1](/img/accessories/penta/rpi-using-1.webp)

### Check disk

Use the `lsblk` command to view disk devices.

```bash
lsblk
```

![step2](/img/accessories/penta/rpi-using-2.webp)

### Speed test

Here is a simple speed test, which is relatively low due to the use of a mechanical hard disk.

```bash
sudo dd if=/dev/zero of=/dev/sda bs=32M status=progress count=100 oflag=direct
```

![step3](/img/accessories/penta/rpi-using-3.webp)

### Forcing Gen 3

Adding `dtparam=pciex1_gen=3` to `/boot/firmware/config.txt` will force the Raspberry Pi 5 to use PCIe Gen 3.

![step4](/img/accessories/penta/rpi-using-4.webp)

After adding and rebooting, you can use the following command to check the link status of the Radxa Penta HAT.

```bash
sudo lspci
sudo lspci -vvv -s 0000:01:00.1 | grep LnkSta
```

![step5](/img/accessories/penta/rpi-using-5.webp)

After seeing the Gen 3 in use, we can measure the write speed again.

![step6](/img/accessories/penta/rpi-using-6.webp)
