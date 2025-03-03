---
sidebar_position: 3
description: "How to build kernel, uboot and system"
---

# System Build

The whole process is divided into two parts, code download and system compilation. The code download is also divided into two parts, one is the official SDK of Allwinner, and the other is the patch of Radxa A5E, the two parts are downloaded separately, and then merged together to form the complete SDK of A5E.

## SDK Download

Below is the download address of Tina 5.0, the official SDK for Allwinner T527 and A527.

[T527_Tina5.0_AIOT](https://mega.nz/file/w6o3jChY#_Kw6AGMk4EniIGsU0Zur3_0K4eI4pA26slvg7mFx0q8) & [MD5SUM](https://mega.nz/file/) 8n4D2J4C#6kzkRa-jj_XBZ0nyf3RI_8w8Jih5J7CBwuBFyJmMr_w)

Create a directory tina, then extract the SDK to the tina folder after downloading. Then run 'repo sync -l' to get the SDK source code.

The directory structure of the SDK is as follows

```
├── brandy
├── bsp
├── build
├── buildroot
├── build.sh -> build/top_build.sh
├── debian
├── device
├── docs
├── kernel
├── out
├── platform
├── prebuilt
├── rtos
├── target
├── tee_kit
├── test
└── tools

```

After downloading the official standard SDK, you will need to download the Cubie A5E related packages and place them in the directory corresponding to the original official SDK.

<table>
    <tr>
        <th> Num </th>
        <th> Repository Name	</th>
        <th> SDK Directory Path </th>
        <th> Description </th>
    </tr>
    <tr>
        <td>1</td>
        <td>[allwinner-target <br/>(branch:target-a527)](https://github.com/radxa/allwinner-target/tree/target-a527)</td>
        <td>target/a527	</td>
        <td>Target platform configurations and scripts</td>
    </tr>
    <tr>
        <td>2</td>
        <td>[allwinner-device <br/> (branch:device-a527)](https://github.com/radxa/allwinner-device/tree/device-a527)</td>
        <td>device/config/chips/a527</td>
        <td>Device chip configuration files</td>
    </tr>
    <tr>
        <td>3</td>
        <td>[allwinner-bsp <br/> (branch:product-linux-t527)](https://github.com/radxa/allwinner-bsp.git)</td>
        <td>bsp</td>
        <td>Board Support Package (BSP) related code</td>
    </tr>
    <tr>
        <td>4</td>
        <td>[linux<br/>(branch:allwinner-aiot-linux-5.15)](https://github.com/radxa/kernel/tree/allwinner-aiot-linux-5.15)</td>
        <td>kernel/linux-5.15</td>
        <td>Linux kernel source code <br/> patches: [Fix the boot issues caused by the mtd driver](https://mega.nz/file/Ay4wATIL#0Hf7iMAfcPA2YZQB9YlBere2LdYZZ2fSfqsolLrQ88I) </td>
    </tr>
    <tr>
        <td>5</td>
        <td>[u-boot<br/>(branch:allwinner-aiot-v2018.07)](https://github.com/radxa/u-boot/tree/allwinner-aiot-v2018.07)</td>
        <td>brandy/brandy-2.0/u-boot-2018/</td>
        <td>U-Boot source code</td>
    </tr>
</table>

## System build

Configuration

```bash
source build/envsetup.sh

./build.sh config
```

Configuration Example

```bash
Debian xfce image example:
========ACTION List: mk_config ;========
options :
All available platform:
   0. android
   1. linux
Choice [linux]: 1
All available linux_dev:
   0. bsp
   1. dragonboard
   2. buildroot
   3. debian
Choice [debian]: 3
All available kern_name:
   0. linux-5.10
   1. linux-5.15
Choice [linux-5.15]: 1
All available ic:
   0. a523
   1. a527
   2. t527
Choice [a527]: 1
All available board:
   0. cubie_a5e
   1. d10_linux_aiot
   2. demo_linux_aiot
   3. pro2_linux_aiot
Choice [cubie_a5e]: 0
All available flash:
   0. default
   1. nor
Choice [default]: 0
All available rootfs files:
   0. linaro-bullseye-gnome-arm64.tar.gz
   1. linaro-bullseye-lite-arm64.tar.gz
   2. linaro-bullseye-lxde-arm64.tar.gz
   3. linaro-bullseye-xfce-arm64.tar.gz
Choice [linaro-bullseye-xfce-arm64.tar.gz]: 3
Setup BSP files
```

Build Image

```bash
./build.sh

```

Packing Image

```bash
./build.sh pack
```

The generated image is located in the out directory.

If you want to build the kernel or U-boot separately, you can also follow these steps

## U-boot build

```bash
. /build.sh bootloader
```

:::tip
Running '. /build.sh bootloader' will execute the build.sh script located in the brandy/brandy-2.0/ directory.

Alternatively, you can do the same thing manually by executing the following command
:::

```bash
cd brandy/brandy-2.0/
./build.sh -p sun55iw3p1 -b a527
```

:::tip

This command above will use the sun55iw3p1_defconfig file in the u-boot-2018/configs directory.

It then compiles the files needed for the bootloader, including boot0, fes1, sboot and u-boot.

:::

output:

u-boot-sun55iw3p1.bin

boot0_sdcard_sun55iw3p1.bin

fes1_sun55iw3p1.bin

sboot_sdcard_sun55iw3p1.bin

...

:::tip
Viewing the compile log will reveal the folder where the compiled files are located.
:::

<table>
    <tr>
        <th> Num </th>
        <th> Type </th>
        <th> Use </th>
    </tr>
    <tr>
        <td>1</td>
        <td>boot0</td>
        <td>boot0 is the first stage bootloader (FSBL) in the Allwinner chip boot process.<br/>
            It is responsible for initializing basic hardware (such as DRAM, clocks, etc.) and loading the next stage bootloader(such as U-Boot). </td>
    </tr>
    <tr>
        <td>2</td>
        <td>fes</td>
        <td>The program run during firmware burning.</td>
    </tr>
    <tr>
        <td>3</td>
        <td>sboot</td>
        <td>sboot is the bootloader for secure boot. It is responsible for verifying the signatures of subsequent bootloaders <br/>
        (such as U-Boot or the Linux kernel) to ensure the integrity and security of the boot chain.</td>
    </tr>
    <tr>
        <td> 4 </td>
        <td> u-boot</td>
        <td> The universal boot loader </td>
    </tr>
</table>

## Kernel build

:::tip
Ensure you have performed the parameter configuration with ‘./build.sh config’ before running this command.
:::

```bash
$./build.sh kernel
```

:::tip

This will use the defconfig file located at device/config/chips/a527/configs/cubie_a5e/debian/linux-5.15/bsp_defconfig

and the device tree file at device/config/chips/a527/configs/cubie_a5e/linux-5.15/board.dts.

You will find the kernel image in the out/a527/cubie_a5e/debian/ directory.
:::

<table>
    <tr>
        <th> Num </th>
        <th> Type </th>
        <th> Use </th>
    </tr>
    <tr>
        <td>1</td>
        <td>boot.img</td>
        <td>boot img containing the kernel and device tree</td>
    </tr>
        <tr>
        <td>2</td>
        <td>sunxi.dtb</td>
        <td>device tree blob</td>
    </tr>
</table>
