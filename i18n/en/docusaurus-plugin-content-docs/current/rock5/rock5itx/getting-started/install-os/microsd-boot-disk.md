---
sidebar_position: 2
---

import Images from "../../\_image.mdx"

## Boot from SD card to eMMC as boot disc

### File download

<Images loader={false} system_img={true} spi_img={false} />

For third-party systems, please refer to [Resource Download](../../download)

### Creating a boot disk

Refer to [Making a MicroSD boot disc](./etcher) above, we will use it as a base to install the system into eMMC.

### Logging in to the system

Login to the system via serial port or HDMI.

:::tip
The password is radxa.
:::

### Enable Overlay

ROCK 5 ITX's eMMC is disabled by default, we need to enable overlay in the system via [Device Tree Configuration](../os-config/rsetup#overlays) to enable eMMC.

:::tip

1. Please enable the `[] Enable EMMC` item Overlay. 2.
2. Quit and reboot after `[*] Enable EMMC` is successfully displayed for the configuration to take effect.

:::.

### Viewing eMMC devices

Open a terminal and use the command lsblk to view the mmc device.

```
radxa@rock-5-itx:~$ lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
mtdblock0     31:0    0   16M  0 disk
mmcblk1      179:0    0 29.3G  0 disk
|-mmcblk1p1  179:1    0   16M  0 part /config
|-mmcblk1p2  179:2    0  300M  0 part /boot/efi
`-mmcblk1p3  179:3    0   29G  0 part /
mmcblk0      179:32   0 29.1G  0 disk
|-mmcblk0p1  179:33   0    4M  0 part
|-mmcblk0p2  179:34   0    4M  0 part
|-mmcblk0p3  179:35   0    4M  0 part
|-mmcblk0p4  179:36   0    4M  0 part
|-mmcblk0p5  179:37   0    4M  0 part
|-mmcblk0p6  179:38   0    1M  0 part
|-mmcblk0p7  179:39   0   40M  0 part
|-mmcblk0p8  179:40   0  123M  0 part
|-mmcblk0p9  179:41   0  372M  0 part
|-mmcblk0p10 179:42   0  384M  0 part
|-mmcblk0p11 179:43   0   16M  0 part
|-mmcblk0p12 179:44   0    1M  0 part
|-mmcblk0p13 179:45   0  5.2G  0 part
`-mmcblk0p14 179:46   0   23G  0 part
mmcblk0boot0 179:64   0    4M  1 disk
mmcblk0boot1 179:96   0    4M  1 disk
zram0        254:0    0  3.9G  0 disk [SWAP]
```

eMMC defaults to mmcblk0

### Install the system to eMMC

See [file download](#file download) for details of the image file, below is rock-5-itx_debian_bullseye_kde_b3.img.xz as an example.

```
radxa@rock-5-itx:~$ sudo xzcat /home/radxa/rock-5-itx_debian_bullseye_kde_b3.img.xz | dd of=/dev/mmcblk0 bs=1M status=progress
```

### Booting the system

After shutting down the system, powering down, disconnecting the Micro SD card, and then powering up, the system boots from eMMC.
