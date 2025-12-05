---
sidebar_position: 10
---

# Penta SATA HAT Usage Tutorial

## Preparation

- Picture of ROCK 5A with Radxa PENTA SATA HAT.

![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-05.webp)

- The following pictures show the [RADXA Penta SATA HAT](/accessories/storage/penta-sata-hat) and the parts included.

![ROCK5A Install M.2 Extension Board](/img/accessories/storage/penta-sata-hat-01.webp)

- Please distinguish between the front and back side of the IPEX cable. As shown in the figure.

**The IPEX cables we provide for the ROCK5A have the same direction at both ends.**

![ROCK5A Install M.2 Extension Board](/img/accessories/storage/m2-extension-board-04.webp)

- Please note that the ring clips need to snap into the connectors.

![E key to M key](/img/accessories/storage/ekey-to-mkey-01.webp)

## Installation Tutorial

### Steps

1, M.2 E key to M.2 M key Board with IPEX cable. **Note that the IPEX cable is installed here with the front side up, and the ring clips need to snap onto the connector to ensure that it is fixed.**

![ROCK5A Install M.2 Extension Board](/img/accessories/storage/m2-extension-board-02.webp)

2. Radxa Penta SATA HAT motherboard with IPEX cable. **Note that the IPEX cable installed here is face up, and the ring clips need to snap onto the connector to ensure fixation.**

![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-04.webp)

3. Please install the M2.5x18+6 copper post and M2.5x5 copper post supplied with the product on the ROCK5A as shown in the picture.

![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-04.webp)

4. Please connect one end of the IPEX cable to the M.2 E key to M Key board and the other end to the Radxa Penta SATA HAT and install the M.2 E key to M key board to the connector of the M.2 E key ROCK5A. As shown in the figure.

![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-03.webp)

5. Finally, assemble the Radxa Penta SATA HAT using M2.5x5+5 copper posts.

![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-01.webp)
![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-02.webp)

### Checking the Penta SATA HAT mount status

1. Check if the SATA device is recognized by `lsblk`.

```
radxa@rock-5a:~$ lsblk
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
mmcblk0boot0 179:32   0     4M  1 disk
mmcblk0boot1 179:64   0     4M  1 disk
zram0        254:0    0   3.8G  0 disk [SWAP]
radxa@rock-5a:~$
```

2. When the system recognizes the Penta SATA HAT, you can view the SATA devices (sda/sdb/sdc/sdd).

## Software Support

We provide an installation script to help you install the software we provide that enables the Penta top panel to display information and control fans.

```
curl -sL https://rock.sh/get-rockpi-penta | sudo -E bash -
```

Simply copy the above command and paste it into the terminal and press enter.

### Software configuration

Edit /etc/rockpi-penta.conf, and enable it with the following command.

```
sudo systemctl restart rockpi-penta.service
```

### Default configuration

The following is the default configuration of /etc/rockpi-penta.conf, which you can modify according to the comments.

```
[fan]
# When the temperature is above lv0 (35'C), the fan at 25% power,
# and lv1 at 50% power, lv2 at 75% power, and lv3 at 100% power.
# When the temperature is below lv0, the fan is turned off.
# You can change these values if necessary.
lv0 = 35
lv1 = 40
lv2 = 45
lv3 = 50

[key]
# You can customize the function of the key, currently available functions are
# slider: oled display next page
# switch: fan turn on/off switch
# reboot, poweroff
# If you have any good suggestions for key functions,
# please add an issue on https://rock.sh/rockpi-sata
click = slider
twice = switch
press = none

[time]
# twice: maximum time between double clicking (seconds)
# press: long press time (seconds)
twice = 0.7
press = 1.8

[slider]
# Whether the oled auto display next page and the time interval (seconds)
auto = true
time = 10

[oled]
# Whether rotate the text of oled 180 degrees, whether use Fahrenheit
rotate = false
f-temp = false
```
