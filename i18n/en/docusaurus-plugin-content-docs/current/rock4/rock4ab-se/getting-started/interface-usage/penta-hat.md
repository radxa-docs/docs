---
sidebar_position: 10
---

# Penta SATA HAT Installation and Usage Guide

This document provides installation and usage guide for Radxa Penta SATA HAT on Rock 4A/B/SE series.

## Preparation

- **Radxa Penta SATA HAT Kit**: Ensure you have the complete Penta SATA HAT kit, including:
  - Penta SATA HAT main board
  - M.2 E key to M key adapter board
  - IPEX cable
  - Mounting pillars (M2.5x18+6, M2.5x5, M2.5x5+5)
  - Screws

- **Compatibility Confirmation**: Penta SATA HAT is compatible with the following Rock 4 series products:
  - Rock 4A
  - Rock 4B
  - Rock 4SE
  - Rock 4A+
  - Rock 4B+

- **System Requirements**: It is recommended to use the latest version of Radxa OS or Debian 11 Bookworm and above.

## Installation Tutorial

### Step 1: Prepare IPEX Cable

First, distinguish the front and back sides of the IPEX cable. As shown in the figure, the buckle needs to snap into the connector to ensure fixation.

![IPEX Cable Direction](/img/accessories/storage/m2-extension-board-04.webp)

### Step 2: Install Adapter Board

1. Connect the IPEX cable to the M.2 E key to M key adapter board.
2. **Note**: The IPEX cable should be facing up, and the buckle needs to snap onto the interface to ensure fixation.

![Adapter Board Installation](/img/accessories/storage/m2-extension-board-02.webp)

### Step 3: Install Penta SATA HAT

1. Connect the other end of the IPEX cable to the Penta SATA HAT main board.
2. Similarly, ensure the IPEX cable is facing up and the buckle is snapped onto the interface.

![Penta SATA HAT Connection](/img/rock5a/rock5a-penta-sata-hat-04.webp)

### Step 4: Install Mounting Pillars

1. Install the provided M2.5x18+6 and M2.5x5 mounting pillars on the Rock 4A/B/SE.
2. Refer to the installation positions shown in the figure below:

![Mounting Pillar Positions](/img/rock5a/rock5a-m2-extension-board-04.webp)

### Step 5: Connect Adapter Board to Rock 4

1. Install the M.2 E key to M key adapter board to the M.2 E key interface of Rock 4.
2. Ensure the connection is secure.

### Step 6: Assemble Penta SATA HAT

1. Use M2.5x5+5 mounting pillars to assemble the Penta SATA HAT onto Rock 4.
2. Ensure all connections are secure and the IPEX cable is not excessively bent.

![Complete Assembly Example](/img/rock5a/rock5a-penta-sata-hat-01.webp)
![Side View](/img/rock5a/rock5a-penta-sata-hat-02.webp)

## Check Penta SATA HAT Status

### Hardware Recognition Check

1. Start the Rock 4 system.
2. Check if SATA devices are recognized using the `lsblk` command:

```bash
radxa@rock-4:~$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda            8:0    0 465.8G  0 disk
└─sda1         8:1    0 465.8G  0 part
sdb            8:16   0 465.8G  0 disk
└─sdb1         8:17   0 465.8G  0 part
sdc            8:32   0 465.8G  0 disk
└─sdc1         8:33   0 465.8G  0 part
sdd            8:48   0 465.8G  0 disk
└─sdd1         8:49   0 465.8G  0 part
mmcblk0      179:0    0  14.5G  0 disk
├─mmcblk0p1  179:1    0    16M  0 part /config
└─mmcblk0p2  179:2    0  14.4G  0 part /
```

3. When the system recognizes the Penta SATA HAT, you can see SATA devices (sda/sdb/sdc/sdd).

### Kernel Log Check

If devices are not recognized, check the kernel log:

```bash
sudo dmesg | grep -i sata
sudo dmesg | grep -i ahci
```

## Software Support

### Install rockpi-penta Package (Optional)

If you are using a Penta SATA HAT with OLED display and fan top board, you need to install the rockpi-penta package:

```bash
sudo apt update
sudo apt install wget
wget https://github.com/radxa/rockpi-penta/releases/download/v0.2.2/rockpi-penta-0.2.2.deb
sudo apt install -y ./rockpi-penta-0.2.2.deb
```

### Software Configuration

Edit the `/etc/rockpi-penta.conf` configuration file:

```bash
sudo nano /etc/rockpi-penta.conf
```

Restart the service to make the configuration effective:

```bash
sudo systemctl restart rockpi-penta.service
```

### Default Configuration Reference

```text
[fan]
# When the temperature is above lv0 (35°C), the fan runs at 25% power
# lv1 at 50% power, lv2 at 75% power, and lv3 at 100% power
# When the temperature is below lv0, the fan is turned off
lv0 = 35
lv1 = 40
lv2 = 45
lv3 = 50

[key]
# Customize key functions, currently available functions:
# slider: OLED display next page
# switch: fan on/off switch
# reboot, poweroff
click = slider
twice = switch
press = none

[time]
# twice: maximum time between double clicks (seconds)
# press: long press time (seconds)
twice = 0.7
press = 1.8

[slider]
# Whether OLED automatically switches pages and time interval (seconds)
auto = true
time = 10

[oled]
# Whether to rotate OLED text 180 degrees, whether to use Fahrenheit temperature
rotate = false
f-temp = false
```

## Troubleshooting

### Common Issues

1. **SATA Devices Not Recognized**
   - Check if the IPEX cable connection is secure
   - Check if the AHCI/SATA driver is loaded in the kernel
   - Run `sudo lspci | grep -i sata` to check PCIe device recognition

2. **System Boot Failure**
   - Check if mounting pillars are causing short circuits
   - Check if the system can boot normally after removing the Penta SATA HAT

3. **OLED Display Not Working**
   - Confirm that the rockpi-penta package is installed
   - Check `/etc/rockpi-penta.conf` configuration
   - Check service status: `sudo systemctl status rockpi-penta.service`

### Debian 11 Bookworm Specific Notes

On Debian 11 Bookworm, ensure necessary kernel modules are installed:

```bash
sudo apt update
sudo apt install linux-image-$(uname -r) linux-headers-$(uname -r)
```

## Related Documentation

- [Radxa Penta SATA HAT Main Documentation](/accessories/storage/penta-sata-hat)
- [Creating RAID Arrays with mdadm](/accessories/storage/penta-sata-hat/raid-with-mdadm)
- [Penta SATA HAT TOP Board Usage Guide](/accessories/storage/penta-sata-hat/sata-hat-top-board)

---

**Note**: This document was created based on actual technical support cases. Customer feedback indicated a need for detailed installation guides specifically for RockPi 4B running Debian 11 Bookworm. If you encounter issues during use, please refer to the troubleshooting section or contact technical support.