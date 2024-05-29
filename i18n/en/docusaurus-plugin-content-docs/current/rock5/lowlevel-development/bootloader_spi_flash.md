---
sidebar_position: 20
---

# Flash BootLoader to SPI Nor Flash

The SPI NOR flash stores bootloader files like `idbloader.img` and `u-boot.itb`.

The PCIe NVMe SSD stores the system img/rootfs.

## Introduction

ROCK 5 has a SPI flash on the board, it contains the bootloader for backup booting and supports booting other media that the SoC maskrom mode itself does not direct support (such as NVMe, SATA or USB 3).  
**Notice:On the ROCK 5A, there is not a SPI flash on the board, it's a spi module like eMMC.**

This page describe how to write/install the bootloader to the SPI flash on the ROCK 5B, ROCK 5A in a similar way.

**Notice: As eMMC and spi module share a common interface on the ROCK 5A, please use microSD card when using simple method.**

There are two methods available to flash the SPI:

<Tabs queryString="method">
<TabItem value="simple" label="Simple method" default>

## Simple method

### Preparation

    - ROCK 5B (Only ROCK 5B supported for now)
    - Power supply
    - Linux image for ROCK 5B, Android image is not supported yet
    - SD card or eMMC module
    - USB Type C cable
    - Windows/linux/macOS PC

### Procedure

1. Boot linux from µSD card/eMMC

   Please check [flash guides](../rock5b/getting-started/) for guidance.

2. Download required files on the ROCK 5

   You can download files by using `wget DOWNLOADLINK`.

   - Download the spi clearing files

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/others/zero.img.gz
   ```

   - Downloadthe latest spi bootloader:

     with u-boot serial console disabled(Recommend)

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rock-5b-spi-image-gbf47e81-20230607.img
   ```

   Use it when you need to install the armbian Image to M.2 NVME SSD

   ```bash
   wget https://github.com/huazi-yg/rock5b/releases/download/rock5b/rkspi_loader.img
   ```

   with u-boot serial console enabled(Use it when you need to troubleshoot booting issue)

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/loader/rock-5b/debug/rock-5b-spi-image-gbf47e81-20230607-debug.img
   ```

3. Check the integrity of the downloaded files:

   ```bash
   md5sum zero.img.gz
   ```

   it should report back:

   ```bash
   ac581b250fda7a10d07ad11884a16834  zero.img.gz
   ```

4. extract/uncompress the previous downloaded spi clearing file (gzip should already be installed otherwise install it):

   ```bash
   gzip -d zero.img.gz
   md5sum zero.img
   ```

   it should report back:

   ```bash
   2c7ab85a893283e98c931e9511add182  zero.img
   ```

5. check your desired bootloader image:

   ```bash
   md5sum rock-5b-spi-image-gd1cf491-20240523.img
   ```

   it should report back one of the following lines:

   ```bash
   cf53d06b3bfaaf51bbb6f25896da4b3a  rock-5b-spi-image-gd1cf491-20240523.img
   fa14c99718f55b66e82aa1661e43c1ec  rock-5b-spi-image-gd1cf491-20240523-debug.img
   1b83982a5979008b4407552152732156  rkspi_loader.img
   ```

6. Flash the SPI flash

   - Make sure the spi flash is available:

   ```bash
   ls /dev/mtdblock*
   # report
   /dev/mtdblock0
   ```

   - completely clear the spi flash: (be patient the flash can take 5mins)

   ```bash
   sudo dd if=zero.img of=/dev/mtdblock0
   ```

   - check if the flash was successfully cleared

   ```bash
   sudo md5sum /dev/mtdblock0 zero.img
   # report
   2c7ab85a893283e98c931e9511add182  /dev/mtdblock0
   2c7ab85a893283e98c931e9511add182  zero.img
   ```

   - now write you desired bootloader to the spi flash (replace rkspi_loader.img with the name of your downloaded image again):

   ```bash
   sudo dd if=rkspi_loader.img of=/dev/mtdblock0
   sync
   # check if the flash was successfully
   sudo md5sum /dev/mtdblock0 rkspi_loader.img
   ```

   the checksums should be the same again - **if not flash the bootloader again.**

7. Reboot

Now you are done flashing a bootloader supporting NVMe booting.

- If you do not flashed the NVMe already check [this guide](https://wiki.radxa.com/Rock5/install/nvme) to flash it. (again there are two options available)
- Otherwise power off the ROCK 5, remove the µSD card or eMMC module and power it back up.It should boot now from your NVMe.

</TabItem>
<TabItem value="external" label="Advanced (external) method">

## Advanced (external) method

### Requirements

- ROCK 5 SBC
- proper power
- Linux image for ROCK 5, Android image is not supported yet
- USB Type C cable, USB-A to USB-A cable
- Windows/linux/macOS PC

### Procedure

1. Install Tools & Drivers

- Please check [this guide](https://wiki.radxa.com/Rock5/install/rockchip-flash-tools), Install rockchip flash tools under Windows/Linux/MacOS PC.
- The PC tools we use to communicate with ROCK 5 in maskrom mode are the rkdeveloptool on Linux/macOS and RkDevtool on Windows PC.

2. Get RK3588 loader and U-Boot images

- Download [loader images](https://dl.radxa.com/rock5/sw/images/loader/rk3588_spl_loader_v1.15.113.bin)

- Download the latest SPI image from:
  - [Release Edition](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rock-5b-spi-image-gbf47e81-20230607.img), with u-boot serial console disabled
  - [Debug Edition](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/debug/rock-5b-spi-image-gbf47e81-20230607-debug.img), with u-boot serial console enabled
  - [Armbian Edition](https://github.com/huazi-yg/rock5b/releases/download/rock5b/rkspi_loader.img). Use it when you need to install the armbian Image to M.2 NVME SSD
  - [ROCK 5A SPI img](https://dl.radxa.com/rock5/sw/images/loader/rock-5a/rock-5a-spi-image-g4b32117-20230605.img). Only one version now.

3. Boot the board to Maskrom mode

For ROCK 5A, please check [this guide](../rock5a/getting-started/rkdevtool).

For ROCK 5B, operate as following:

- ![rock5b-maskrom](/zh/img/rock5b/rock-5b-maskrom-01.webp)

- Power off the board.
- Remove bootable device like MicroSD card, eMMC module, etc.
- Press the golden (or silver on some board revisions) button and hold it.
- Plug the USB-A to Type-C cable to ROCK 5B Type-C port, the other side to PC.
- Release the golded button, Check usb device
- For macOS host: `lsusb` a result should be: `... ID 2207:350b Fuzhou Rockchip Electronics Co., Ltd. Composite Device`
- For Linux host: `lsusb` a result should be: `... ID 2207:350b Fuzhou Rockchip Electronics Company`
- For Windows host: Open RKDevTool and you would see the device is in **Found One MASKROM Device**

4. Write u-boot images to SPI NOR flash or erase SPI NOR flash

- Option 1: Flash with Linux PC/Mac
  On linux or Mac, run the rkdeveloptool

```bash
sudo rkdeveloptool ld
DevNo=1 Vid=0x2207,Pid=0x350b,LocationID=106 Maskrom
```

This will load the loader (flash helper, downloaded from 2) to run on ROCK 5B and init the ram and prepare the flashing environment etc.

```bash
sudo rkdeveloptool db /path/to/rk3588_spl_loader_v1.15.113.bin
Downloading bootloader succeeded.
```

Next, write SPI image from PC/Mac to ROCK 5B SPI flash

You can use the image download from Step 2.

```bash
sudo  rkdeveloptool wl 0 rock-5b-spi-image-gd1cf491-20240523.img
Write LBA from file (100%)
```

Reboot the device

```bash
rkdeveloptool rd
```

now, the device should boot on SPI Nor Flash. And the blue led is on.

- Option 2: Flash with Windows PC

Double click the RKDevTool.exe and you will see the following interface: Double click the RKDevTool.exe and you will see the following interface:

![RKDevTool-01](/zh/img/rock5b/rock-5b-spi-flash-01.webp)

Step 1: confirm that ROCK 5B is in maskrom mode
If your ROCK 5B is in maskrom mode and connects to PC, you can see that the program detects it, as the red arrow below

Step 2: Load Configuration File
Right-click in the list box and select Load Config,Then select the configuration file in the resource management folder（The configuration file and RKDevTool are in the same directory）

![RKDevTool-02](/zh/img/rock5b/rock-5b-spi-flash-02.webp)

Step 3: Select Loader
Next, click the right last columns in the "Loader" row to select rk3588_spl_loader_v1.15.113.bin

Step 4: Select SPI image
Next, click the right last columns in the "spi" row to select spi-image.

Step 5: Execute
Finally, click the "Execute" button, and you will see the content in the red box on the right. When the progress reaches 100%, the download is completed.

![RKDevTool-03](/zh/img/rock5b/rock-5b-spi-flash-03.webp)

## erase the SPI NOR flash

Option 1: Operate on ROCK 5B

- Boot your ROCK 5B with linux running on µSD card or eMMC module:
- Make sure the SPI flash is available:

```bash
ls /dev/mtdblock*
# It should give following back
/dev/mtdblock0
```

- erase the SPI flash

```bash
sudo dd if=/dev/zero of=/dev/mtdblock0
sync
```

Option 2: Erase with Windows PC

Before Erasing, please confirm that ROCK 5B is in maskrom mode

- Open RKDevTool, Choose the "Advanced features" button
- select `rk3588_spl_loader_v1.15.113.bin` on boot, click the "Download" button
- Click the "erase all" button after completion of Download
- Reboot device

![RKDevTool-04](/zh/img/rock5b/rock-5b-spi-flash-04.webp)

</TabItem>
</Tabs>
