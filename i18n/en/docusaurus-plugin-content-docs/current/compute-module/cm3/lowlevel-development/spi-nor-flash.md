---
sidebar_position: 4
---

# Maskrom Mode

This guide can help you to install the image to the SPI Nor Flash from the USB port using the maskrom mode with the rkdeveloptool and the RKDevTool.

## Preparation

- Radxa CM3 with SPI Nor Flash and button, CM3 IO board. You can find SPI Nor Flash like the following:

![CM3 with SPI](/img/cm3/cm3-with-spi.webp)

- Power adapter
- USB Male A to Micro USB cable
- PC with [RKDevTool](rkdevtool) or [rkdeveloptool](rkdeveloptool)
- Get Radxa CM3 IO loader and U-Boot images  
  [RK356X loader](https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/rk356x_spl_loader_ddr1056_v1.10.111.bin)  
  [Radxa CM3 IO idbloader](https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/radxa-cm3-io-idbloader-g8684d740b9f.img)  
  [Radxa CM3 IO u-boot.itb](https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/radxa-cm3-io-u-boot-g8684d740b9f.itb)  
  [Radxa CM3 IO SPI Image](https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/radxa-cm3-io-spi-image-g8684d740b9f.img.gz)

## Steps

1. Installing the CM3 on the IO board like the following:

![CM3 on CM3 IO Board](/img/cm3/cm3-with-io.webp)

2. Boot the board to Maskrom mode

   - Power off the board
   - Remove bootable devices like microSD card, etc
   - Press SPI Flash disable button, eMMC disable button and hold them

     ![CM3 Button](/img/cm3/cm3-button.webp)

   - Power on Radxa CM3 IO
   - Release SPI Flash disable button and eMMC disable button
   - Plug the USB Male A to MicroUSB cable to Radxa CM3 IO OTG port(the Micro USB port), the other side to PC
   - Check usb device

   <Tabs groupId="os" queryString>
    <TabItem value="windows" label="Windows">

   Open RKDevTool and you would see the device is in **Found One MASKROM Device**.

   ![RKevTool Maskrom](/img/configuration/rkdevtool-maskrom.webp)

    </TabItem>
    <TabItem value="linux_mac" label="Linux/MacOS">

   Use the command line to check:

   ```bash
   lsusb
   Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company # output like this
   ```

    </TabItem>
   </Tabs>

3. Write U-Boot images to SPI Nor Flash or erase SPI Nor Flash

   <Tabs groupId="os" queryString>
    <TabItem value="windows" label="Windows PC">
    <Tabs groupId="operation" queryString>
    <TabItem value="write" label="Write U-Boot to SPI">

   1.Open the RKDevTool

   2.Write config like the following:

   ![Write SPINOR](/img/configuration/rkdevtool-spinor.webp)

   3.Run

   Finally, click the `run` button, and you will see the content on the right side. When RKDevTool shows Download image OK, the download job is completed.

   ![SPINOR Compeled](/img/configuration/rkdevtool-spi-complete.webp)

    </TabItem>
    <TabItem value="erase" label="Erase SPI Nor Flash">

   Open the RKDevTool and click button `Advanced Function` to get into Advanced Function window.
   The whole process is shown in the figure below:

   ![Progress](/img/configuration/rkdevtool-erase-spi.webp)

   1.Confirm "Found One Maskrom Device"

   2.Download RK356X Loader  
    Choose loader rk356x_spl_loader_ddr1056_v1.10.111.bin and click `Download` to download it.

   ![Download loader](/img/configuration/rkdevtool-download-loader.webp)

   3.Erase device  
    Click button `EraseAll` to erase device.

   ![Erase spi](/img/configuration/rkdevtool-erase-device.webp)

   4.Reset device
   Click button `ResetDevice` to reset device.

   ![Reset device](/img/configuration/rkdevtool-reset-device.webp)

    </TabItem>
    </Tabs>
    </TabItem>
    <TabItem value="linux_mac" label="Linux/MacOS PC">
    <Tabs groupId="operation" queryString>
    <TabItem value="write" label="Write U-Boot to SPI">

   Open the terminal and run command rkdeveloptool:

   ```bash
   rkdeveloptool ld
   DevNo=1	Vid=0x2207,Pid=0x350a,LocationID=104	Maskrom
   ```

   Download the loader (flash helper) to init the ram and prepare the flashing environment etc:

   ```bash
   rkdeveloptool db rk356x_spl_loader_ddr1056_v1.10.111.bin
   ```

   Write bootloader:

   ```bash
   rkdeveloptool wl 0 spi_image.img
   ```

   Reboot the device:

   ```bash
   rkdeveloptool rd
   ```

   Now the device should boot on SPI Nor Flash.

    </TabItem>
    <TabItem value="erase" label="Erase SPI Nor Flash">

   Please notice that when you want to erase SPI Nor Flash, run following commands.

   ```bash
   rkdeveloptool db rk356x_spl_loader_ddr1056_v1.10.111.bin
   rkdeveloptool ef
   rkdeveloptool rd
   ```

    </TabItem>
    </Tabs>
    </TabItem>
   </Tabs>
