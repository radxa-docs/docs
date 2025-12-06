---
sidebar_position: 2
---

# Raspberry Pi 5 Use Penta HAT

The Raspberry Pi 5 has a PCIe port that works well with the Radxa Penta SATA HAT.

## Power supply selection

Penta SATA HAT is equipped with a DC interface (socket specification is outer diameter 5.5mm, inner diameter 2.5mm, center is positive) and a D-shaped 4PIN interface. When used with Raspberry Pi 5, it supports three power supply modes to adapt to different usage scenarios:

- Use a Type-C adapter to power the Raspberry Pi 5
- Use a DC 12V adapter to power the Penta SATA HAT
- Use a D-shaped 4PIN from an ATX or SFX power supply to power the Penta SATA HAT

The choice of which power supply method to use depends on the number of hard drives we install and other external devices we need to use, such as U disks and fans. The Raspberry Pi 5 has a power consumption of about 8 watts under high load. Typical hard disk power consumption is as follows:

| Hard disk type | Power consumption |
| -------------- | ----------------- |
| 2.5-inch SSD   | Less than 3W      |
| 2.5-inch HDD   | 3-5W              |
| 3.5-inch HDD   | 5-10W             |

We can choose the appropriate power supply method according to the type and number of hard disks installed. Here are two examples:

- If we install 2 2.5-inch solid-state drives and there are no other external devices on the Raspberry Pi 5, we can use a Type-C adapter for power, such as the Raspberry Pi official 27W PD adapter, which should meet the power supply requirements.
- If we install 4 3.5-inch mechanical hard drives, considering the power consumption of the Raspberry Pi 5 itself, the total power consumption of the entire kit may exceed 50W. At this time, we can use a DC 12V adapter for power, such as a 12V/5A adapter. Or use a D-shaped 4PIN from an ATX/SFX power supply, D-shaped 4PIN interface generally can provide a larger power.

:::info

1. Please do not use two or more power supply methods at the same time. <br/>
2. If you need to use the eSATA interface, you need to use a DC 12V adapter or ATX/SFX power supply.

:::

## Assemble

Please assemble in the order shown in the picture below.

1. Installing column
   ![step1](/img/accessories/storage/penta/rpi-assemble-1.webp)
   ![step2](/img/accessories/storage/penta/rpi-assemble-2.webp)

2. Installing an FPC
   ![step3](/img/accessories/storage/penta/rpi-assemble-3.webp)
   Please note that the black side of the FPC is facing us.
   ![step4](/img/accessories/storage/penta/rpi-assemble-4.webp)

3. Put together
   ![step5](/img/accessories/storage/penta/rpi-assemble-5.webp)

4. Installing disks
   ![step6](/img/accessories/storage/penta/rpi-assemble-6.webp)
   ![step7](/img/accessories/storage/penta/rpi-assemble-7.webp)
   ![step8](/img/accessories/storage/penta/rpi-assemble-8.webp)

## Install the system

Please go to https://www.raspberrypi.com/software/ to download Raspberry Pi Imager and install. Insert the microSD card into the USB port on your computer.

1. Open Raspberry Pi Imager
   ![step1](/img/accessories/storage/penta/rpi-install-os-1.webp)

2. Select the device, and select Raspberry Pi5
   ![step2](/img/accessories/storage/penta/rpi-install-os-2.webp)

3. Select a system, Raspberry Pi OS (64-bit) is recommended
   ![step3](/img/accessories/storage/penta/rpi-install-os-3.webp)

4. Select the microSD card device you want to insert
   ![step4](/img/accessories/storage/penta/rpi-install-os-4.webp)

5. Edit Settings
   ![step5](/img/accessories/storage/penta/rpi-install-os-5.webp)

6. Add user
   ![step6](/img/accessories/storage/penta/rpi-install-os-6.webp)

7. Enable SSH
   ![step7](/img/accessories/storage/penta/rpi-install-os-7.webp)

8. Start write
   ![step8](/img/accessories/storage/penta/rpi-install-os-8.webp)

9. Complete installation
   ![step9](/img/accessories/storage/penta/rpi-install-os-9.webp)

## Start Use

Insert the installed system microSD card into the Raspberry Pi and use 12V/5A power supply from the Radxa Penta SATA HAT DC seat. Let's ssh into Raspberry Pi.

```bash
ssh pi@raspberrypi.local
```

### Enable PCIe

Edit `/boot/firmware/config.txt` and add `dtparam=pciex1` to the end of the file, save and reboot.

![step1](/img/accessories/storage/penta/rpi-using-1.webp)

### Check disk

Use the `lsblk` command to view disk devices.

```bash
lsblk
```

![step2](/img/accessories/storage/penta/rpi-using-2.webp)

### Speed test

Here is a simple speed test, which is relatively low due to the use of a mechanical hard disk.

```bash
sudo dd if=/dev/zero of=/dev/sda bs=32M status=progress count=100 oflag=direct
```

![step3](/img/accessories/storage/penta/rpi-using-3.webp)

### Forcing Gen 3

Adding `dtparam=pciex1_gen=3` to `/boot/firmware/config.txt` will force the Raspberry Pi 5 to use PCIe Gen 3.

![step4](/img/accessories/storage/penta/rpi-using-4.webp)

After adding and rebooting, you can use the following command to check the link status of the Radxa Penta HAT.

```bash
sudo lspci
sudo lspci -vvv -s 0000:01:00.1 | grep LnkSta
```

![step5](/img/accessories/storage/penta/rpi-using-5.webp)

After seeing the Gen 3 in use, we can measure the write speed again.

![step6](/img/accessories/storage/penta/rpi-using-6.webp)

## 3D print case

We have not yet produced the corresponding case for sale. But we and the community users have provided some very nice 3D printed cases, you can try to print these cases:

| Case name          | Preview                                                                                | Download link                                                                                             | Author                                                              | Note                                                                                                                                                                                                          |
| ------------------ | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Radxa Penta NAS    | <img src="/img/accessories/storage/penta/case/case-1.webp" width="480" alt="case-1" /> | [GrabCAD](https://grabcad.com/library/radxa-penta-sata-hat-nas-case-1)                                    | [Radxa Computer](https://radxa.com/)                                | Supports installation of [Top board](sata-hat-top-board)<br/>Issue discussion: [Raspberry Pi 3D print penta hat case quirks ](https://forum.radxa.com/t/raspberry-pi-3d-print-penta-hat-case-quirks/21063/15) |
| Pi 5 Four Bay NAS  | <img src="/img/accessories/storage/penta/case/case-2.webp" width="480" alt="case-2" /> | [MakerWorld](https://makerworld.com/en/models/464746#profileId-373433)                                    | [Michael Klements](https://www.youtube.com/@MichaelKlements)        | Video: [I Built A 4-Bay NAS Using A Raspberry Pi 5](https://www.youtube.com/watch?v=vIEjdjS7uVg)                                                                                                              |
| Pi 5 NAS TOWER     | <img src="/img/accessories/storage/penta/case/case-3.webp" width="480" alt="case-3" /> | [Cults 3D](https://cults3d.com/en/3d-model/gadget/pi-5-nas-tower-for-radxa-hat-with-option-noctua-fan)    | [CeIIy](https://cults3d.com/en/users/CeIIy)                         | Noctua 8CM fan, excellent heat dissipation                                                                                                                                                                    |
| Pi 5 NAS BOX       | <img src="/img/accessories/storage/penta/case/case-4.webp" width="480" alt="case-4" /> | [MakerWorld](https://makerworld.com/en/models/507716#profileId-423445)                                    | [WikiZell](https://makerworld.com/en/@WikiZell)                     | Hard disk is easy to plug and play                                                                                                                                                                            |
| Radxa Penta Case   | <img src="/img/accessories/storage/penta/case/case-5.webp" width="480" alt="case-5" /> | [Printables](https://www.printables.com/model/980955-radxa-sata-hat-case-w-80mm-fan)                      | [Patrick Friedel](https://www.printables.com/@PatrickFriede_243003) | 8CM fan, excellent heat                                                                                                                                                                                       |
| Pi 5 NAS 2.5" 3.5" | <img src="/img/accessories/storage/penta/case/case-6.webp" width="480" alt="case-6" /> | [Printables](https://www.printables.com/model/1183731-raxda-penta-3525-drives-nas-case)                   | [Whyzard](https://www.printables.com/@whyzard_2435863)              | Simple casing, supporting 2.5/3.5-inch hard drives                                                                                                                                                            |
| AnaNAS (PiNASpple) | <img src="/img/accessories/storage/penta/case/case-7.webp" width="480" alt="case-7" /> | [Printables](https://www.printables.com/model/1468673-ananas-pinaspple-raspberry-pi-5-radxa-penta-sata-h) | [Ingo H](https://www.printables.com/@IngoH_455080)                  | A big pineapple 🍍                                                                                                                                                                                            |
