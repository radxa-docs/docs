---
sidebar_position: 20
---

# Burn BootLoader to SPI Nor Flash

SPI Nor Flash stores bootloader files like idbloader.img and u-boot.itb.
The PCIe NVME SSD stores all system imgs.

## Introduction

The ROCK 5B has an SPI Flash (SPI Flash), which contains the bootloader for backup booting and supports booting of other media (e.g., NVMe, SATA, USB 3), as well as booting of other media that the SoC does not support booting. media that are not supported by the SoC itself.

There are two ways to burn SPI

1. Beginner method: burn SPI by ROCK 5B itself.
2. Advanced method: burn SPI through host and Maskrom mode

<Tabs queryString="method">
<TabItem value="basic" label="Primary method" default>

## Primary method

### Prepare

- ROCK 5B
- Good power adapter
- Linux image for ROCK 5B, Android image not supported
- Micro SD card or eMMC module

### Steps

1. Boot the Linux system from the SD card or eMMC.

   For detailed tutorial, please refer to [Burn Method Selection](../getting-started/install-os)

2. Download the necessary files on the ROCK 5B.

   You can download the necessary files to the ROCK 5B via wget, provided that the ROCK 5B is connected to the network.

   - Download the clear the spi file

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/others/zero.img.gz
   ```

   - Download the latest version of the spi bootloader
     The generic version is recommended for all but Armbian users, note that this img disables the u-boot serial console.

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rock-5b-spi-image-g49da44e116d.img
   ```

   If you want to boot armbian from an M.2 NVME SSD, use this option

   ```bash
   wget https://github.com/huazi-yg/rock5b/releases/download/rock5b/rkspi_loader.img
   ```

   Bootloader for advanced users, with u-boot serial console already started.

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/loader/rock-5b/debug/rock-5b-spi-image-g3caf61a44c2-debug.img
   ```

3. Check the integrity of the downloaded file:

   ```bash
   md5sum zero.img.gz
   ```

   The correct display is as follows:

   ```bash
   ac581b250fda7a10d07ad11884a16834 zero.img.gz
   ```

4. Unzip the clear the spi file that you downloaded earlier

   ```
   gzip -d zero.img.gz
   md5sum zero.img
   ```

   The correct display looks like this:

   ```bash
   2c7ab85a893283e98c931e9511add182 zero.img
   ```

5. Check the bootloader image you want.

   ```bash
   md5sum rock-5b-spi-image-g49da44e116d.img
   ```

   The correct result is shown below:

   ```bash
   46de85de37b8e670883e6f6a8bb95776 rock-5b-spi-image-g49da44e116d.img
   958cbdb6cf9b2e0841fd76c26930db8f rock-5b-spi-image-g3caf61a44c2-debug.img
   1b83982a5979008b4407552152732156 rkspi_loader.img
   ```

6. Burn SPI Flash

   - Ensure that the SPI Flash is operational

   ```bash
   ls /dev/mtdblock*
   # Returns
   /dev/mtdblock0
   ```

   - Cleaning up the SPI Flash, a process that takes more than 5 minutes.

   ```bash
   sudo dd if=zero.img of=/dev/mtdblock0
   ```

   - Check if it was cleared successfully

   ```bash
   sudo md5sum /dev/mtdblock0 zero.img
   # Returns correctly
   2c7ab85a893283e98c931e9511add182 /dev/mtdblock0
   2c7ab85a893283e98c931e9511add182 zero.img
   ```

   - Burn your downloaded bootloader to SPI Flash, e.g. rock-5b-spi-image-g49da44e116d.img

   ```bash
   sudo dd if=rock-5b-spi-image-g49da44e116d.img of=/dev/mtdblock0
   sync
   # Check if the burn was successful
   sudo md5sum /dev/mtdblock0 rock-5b-spi-image-g49da44e116d.img
   ```

   If the result is the same, it is correct. If not, please burn the bootloader again.

7. Reboot to take effect

You have now finished burning the bootloader with NVMe boot support.

- If you have not burned the system on an NVMe SSD, see [Install Image to NVMe](./install-os-on-nvme) for burning.
- If you have already burned the system on the NVMe SSD, power down the ROCK 5B, remove the µSD card or eMMC module, and power it back up. It should now boot from NVMe

</TabItem>
<TabItem value="advanced" label="Advanced method">

## Advanced methods

### Preparation

- ROCK 5B
- Good power adapter
- Linux image, Android not supported
- Micro SD card or eMMC module
- USB Type C cable
- Host PC (Windows/linux/macOS)

### Steps

1. Install drivers and tools

- Please check the tool tutorial to install RockChip Flash tools on Windows/Linux/MacOS PC.
- We set ROCK 5B to Maskrom mode to communicate with RockChip tools via rkdevelopool on Linux/macOS and RkDevtool on Windows PC.

2. Get the RK3588 loader and U-boot images.

- Download [loader images](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/rk3588_spl_loader_v1.08.111.bin)
- Download the latest SPI images

  - [Official version](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rock-5b-spi-image-g49da44e116d.img), u-boot serial console off
  - [Debug version](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/debug/rock-5b-spi-image-g3caf61a44c2-debug.img), u-boot serial console startup
  - [Armbian version](https://github.com/huazi-yg/rock5b/releases/download/rock5b/rkspi_loader.img), required when installing armbian image to M.2 NVME SSDs

3. ROCK 5B enters Maskrom mode.

! [rock5b-maskrom](/zh/img/rock5b/rock-5b-maskrom-01.webp)

- ROCK 5B Disconnect power and shut down the board.
- Remove bootable devices such as Micro SD cards, eMMC modules, etc.
- Press the gold (or silver on some board versions) button and hold it down. As shown above
- Plug the USB-A to Type-C cable into the ROCK 5B Type-C port and connect the other end to a PC.
- Release the gold button and check the USB device.

4. Write u-boot image to SPI NOR flash or erase SPI NOR flash

- Option 1. Burning with Linux PC/Mac
  On linux or Mac, run rkdeveloptool

sudo rkdeveloptool
sudo rkdeveloptool ld
DevNo=1 Vid=0x2207,Pid=0x350b,LocationID=106 Maskrom
``

This command does the following: loads the loader onto the ROCK 5B and initializes the memory and prepares the environment for burning.

```bash
sudo rkdeveloptool db /path/to/rk3588_spl_loader_v1.08.111.bin
Downloading bootloader succeeded.
```

Next, write the SPI images from the PC/Mac to the SPI flash
Using the images downloaded in step 2

```bash
sudo rkdeveloptool wl 0 /path/to/spi-image.img
Write LBA from file (100%)
```

Reboot the device

```bash
rkdeveloptool rd
```

The device is now booting on the SPI Nor Flash, the blue LED is on.

- Option 2. Burning with Windows PC

Open RKDevTool.exe and you will see the following screen:

![RKDevTool-01](/zh/img/rock5b/rock-5b-spi-flash-01.webp)

Step 1: Make sure the ROCK 5B is in maskrom mode
If your ROCK 5B is in maskrom mode and connected to a PC, you can see that the program detects it as shown in circle 2 of the diagram
Found One MASKROM Device

Step 2: Load Configuration File
Right click in the list box and select Load Config, circle 3, then select the configuration file in the resource management folder (the configuration file is in the same directory as the RKDevTool)

! [RKDevTool-02](/zh/img/rock5b/rock-5b-spi-flash-02.webp)

Step 3: Select the loader
Next, click on the last column on the right side of the "Loader" row to select rk3588_spl_loader_v1.08.111.bin. circle 4 in the figure.

Step 4: Select SPI image
Click the last column on the right in the "spi" row to select spi-image.

Step 5: Execute Run
Finally click on the "Run" button, when the progress reaches 100%, the download is complete.

![RKDevTool-03](/zh/img/rock5b/rock-5b-spi-flash-03.webp)

## Erase SPI Nor Flash

Option 1: Operating on the ROCK 5B

- Boot your ROCK 5B with Linux running on a µSD card or eMMC module:
- Make sure the SPI Flash is available:

```bash
ls /dev/mtdblock*
# Output the following
/dev/mtdblock0
```

- Just run the following command

```bash
sudo dd if=/dev/zero of=/dev/mtdblock0
sync
```

Option 2: Erase on host Linux PC/Mac

Before erasing, make sure the ROCK 5B is in Maskrom mode

- Open RKDevTool and select Advanced Function.
- Select rk3588_spl_loader_v1.08.111.bin on Boot and click the Download button.
- When progress is complete, click the EraseALL button
- Reboot the device when finished ResetDevice

![RKDevTool-04](/zh/img/rock5b/rock-5b-spi-flash-04.webp)

</TabItem>
</Tabs>
