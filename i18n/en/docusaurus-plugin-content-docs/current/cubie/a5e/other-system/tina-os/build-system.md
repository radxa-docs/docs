---
sidebar_position: 3
---

# Build System

To set up the build system, we need to complete the following steps in order: source code download, branch switching, environment setup, and image compilation.

- Source Code Download - We need to download the official Allwinner SDK source code and Radxa-maintained Cubie A5E related source code.
- Branch Switching - We need to switch some repositories to Radxa-maintained versions that support Cubie A5E.
- Environment Setup - We need to set up the required environment for SDK compilation.
- Image Compilation - We need to compile the merged source code into images.

## Source Code Download

Download the official Allwinner SDK source code and Radxa-maintained Cubie A5E related source code.

### Official Allwinner SDK

- [Tina5.0_AIOT](https://gitlab.com/tina5.0_aiot)

#### Download Official SDK Source Code

Two download methods are provided:

- [MEGA Download](https://mega.nz/file/kFtD0BYY#zm3FXLiLK9SfOFss3BGY1Kx714BFBqyyPeYeE5FvOw0)

- [Baidu Netdisk Download (Extraction code: 547b)](https://pan.baidu.com/s/1zcVq4l-rij7RPmJ92nccZg)

#### Synchronize Local Repository

Navigate to the root directory of the official Allwinner SDK source code, then use the `repo sync -l` command to synchronize the local repository status:

<NewCodeBlock tip="Linux-Host$" type="host">

```bash
repo sync -l
```

</NewCodeBlock>

Note: This command is equivalent to `.repo/repo/repo sync -l` and does not require installing `repo`.

After successful execution, the terminal will output information similar to the following:

```text
Updating files: 100% (14802/14802), done.dating files:  71% (10553/14802)
Updating files: 100% (15025/15025), done.ting files:  47% (7062/15025)
Updating files: 100% (588/588), done.rm/configUpdating files:   9% (1355/14239)
Updating files: 100% (2945/2945), done.tina-ng/package/allwinner/tina_multimedia_demoUpdating files:   9% (1371/14239)
Updating files: 100% (169/169), done.ce/config/a733Updating files:   9% (1407/14239)
Updating files: 100% (2963/2963), done./config/commonUpdating files:  45% (1349/2963)
Updating files: 100% (46/46), done.vice/config/rootfs_tarUpdating files:  89% (41/46)
Updating files: 100% (463/463), done.dy-2.0/toolsUpdating files:  96% (446/463)
Updating files: 100% (73678/73678), done.ating files:  12% (1809/14239)
Updating files: 100% (70667/70667), done.xternal/gpu_demoUpdating files:  82% (57947/70667)
Updating files: 100% (1830/1830), done._patchesUpdating files:  72% (1318/1830)
Updating files: 100% (861/861), done.ux/external/libgpuUpdating files:  13% (1891/14239)
Updating files: 100% (990/990), done.dareUpdating files:  79% (783/990)
Updating files: 100% (194/194), done.c-release/libcedarc_v2.0Updating files:  57% (8117/14239)
Updating files: 100% (14239/14239), done.xternal/libtmediaUpdating files:  59% (1001/1696)
Updating files: 100% (151/151), done.a/tina-ng/buildroot-202205Updating files:  63% (1069/1696)
Updating files: 100% (1696/1696), done./external/powerkeyUpdating files:  86% (1459/1696)
Updating files: 100% (3369/3369), done./external/setusbconfigUpdating files:  48% (1618/3369)
Updating files: 100% (1202/1202), done./external/firmwareUpdating files:  63% (760/1202)
Updating files: 100% (8/8), done./linux/external/libcutilsUpdating files:  75% (6/8)
Updating files: 100% (1383/1383), done./external/rtk_hciattachUpdating files:  14% (198/1383)
Updating files: 100% (2934/2934), done./external/lvgl-8Updating files:   7% (114/1451)
Updating files: 100% (5/5), done./tina/tina-ng/prebuilt/hostbuiltUpdating files:  12% (187/1451)
Updating files: 100% (7/7), done./tina/tina-ng/prebuilt/kernel-built/aarch64Updating files: 100% (7/7)
Updating files: 100% (1451/1451), done.tina-ng/prebuilt/kernel-built/armUpdating files:  26% (391/1451)
Updating files: 100% (513/513), done.ing files:  72% (370/513)
Updating files: 100% (1760/1760), done.ating files:   6% (1008/16800)
Updating files: 100% (8337/8337), done.rtosUpdating files:  72% (12229/16800)
Updating files: 100% (1846/1846), done.componentsUpdating files:  25% (6454/25640)
Updating files: 100% (16800/16800), done.na-ng/target/t736Updating files:  99% (16632/16800)
Updating files: 100% (5/5), done./tina/tina-ng/prebuilt/aarch64Updating files:  28% (7180/25640)
Updating files: 100% (6686/6686), done.yocto/baseUpdating files:  98% (849/863)
Updating files: 100% (1631/1631), done.yocto/meta-tinaUpdating files:  13% (213/1631)
Updating files: 100% (863/863), done.onboardUpdating files: 100% (863/863)
Updating files: 100% (25640/25640), done.cto/pokyUpdating files:  33% (8584/25640)
Checking out: 100% (89/89), done in 5m23.476s
repo sync has finished successfully.
```

:::tip repo Command

If the `repo` command is not installed, you can install it manually:

<NewCodeBlock tip="Linux-Host$" type="host">

```bash
sudo apt update
sudo apt install repo
```

</NewCodeBlock>

:::

### Radxa Cubie A5E Source Code

| Repository Name  | Source Repository                             | Target Branch             | Target Directory               |
| :--------------: | :-------------------------------------------- | :------------------------ | :----------------------------- |
| allwinner-target | https://github.com/radxa/allwinner-target.git | target-a527-v1.4.6        | target/a527/                   |
| allwinner-device | https://github.com/radxa/allwinner-device.git | device-a527-v1.4.6        | device/config/chips/a527/      |
|  allwinner-bsp   | https://github.com/radxa/allwinner-bsp.git    | cubie-aiot-v1.4.6         | bsp/                           |
|      kernel      | https://github.com/radxa/kernel.git           | allwinner-aiot-linux-5.15 | kernel/linux-5.15/             |
|      u-boot      | https://github.com/radxa/u-boot.git           | cubie-aiot-v1.4.6         | brandy/brandy-2.0/u-boot-2018/ |

Note: The target directory refers to the corresponding location in the official Allwinner SDK source code where the Radxa Cubie A5E source code needs to be placed.

## Branch Switching

Switch some repositories to Radxa-maintained versions that support Cubie A5E.

It is recommended to navigate to the official Allwinner SDK source code directory and execute the following commands in sequence: add remote repository, update remote repository, and switch branches.

| Repository Name  | Add Remote Repository                                                | Update Remote Repository | Switch Branch                                                               |
| :--------------: | :------------------------------------------------------------------- | :----------------------- | :-------------------------------------------------------------------------- |
| allwinner-target | `git remote add radxa https://github.com/radxa/allwinner-target.git` | `git fetch radxa`        | `git checkout -b target-a527-v1.4.6 radxa/target-a527-v1.4.6`               |
| allwinner-device | `git remote add radxa https://github.com/radxa/allwinner-device.git` | `git fetch radxa`        | `git checkout -b device-a527-v1.4.6 radxa/device-a527-v1.4.6`               |
|  allwinner-bsp   | `git remote add radxa https://github.com/radxa/allwinner-bsp.git`    | `git fetch radxa`        | `git checkout -b cubie-aiot-v1.4.6 radxa/cubie-aiot-v1.4.6`                 |
|      kernel      | `git remote add radxa https://github.com/radxa/kernel.git`           | `git fetch radxa`        | `git checkout -b allwinner-aiot-linux-5.15 radxa/allwinner-aiot-linux-5.15` |
|      u-boot      | `git remote add radxa https://github.com/radxa/u-boot.git`           | `git fetch radxa`        | `git checkout -b cubie-aiot-v1.4.6 radxa/cubie-aiot-v1.4.6`                 |

#### Demonstration Example

Navigate to the specified directory in the official Allwinner SDK source code, then execute the commands to add the remote repository, update it, and switch branches.

<NewCodeBlock tip="Linux-Host$" type="host">
```bash
cd target/a527/
git remote add radxa https://github.com/radxa/allwinner-target.git
git fetch radxa
git checkout -b target-a527-v1.4.6 radxa/target-a527-v1.4.6
```
</NewCodeBlock>

You can follow the above steps to complete the merging of other source code.

## Environment Setup

### Hardware Requirements

64-bit system with recommended disk capacity greater than 128GB.

### Software Requirements

Ubuntu 20.04 / 22.04 / 24.04 system

#### Install Dependencies

<NewCodeBlock tip="Linux-Host$" type="host">
```bash
sudo apt update
sudo apt install build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs unzip lib32z1 lib32z1-dev lib32stdc++6 libstdc++6 lib32ncurses-dev lib32z1 ncurses-term bison libexpat-dev cpio busybox -y
```
</NewCodeBlock>

## Script Modification

Before compiling, we need to add a patch in the `build/pack` directory of the official Allwinner SDK source code to support extlinux boot.

```text
--- a/pack
+++ b/pack
@@ -235,6 +235,9 @@ ${LICHEE_CHIP_CONFIG_DIR}/configs/${PACK_BOARD}/wavefile/*:${LICHEE_PACK_OUT_DIR}
 ${LICHEE_CHIP_CONFIG_DIR}/configs/${PACK_BOARD}/${PACK_TYPE}/*.bmp:${LICHEE_PACK_OUT_DIR}/boot-resource/
 ${LICHEE_CHIP_CONFIG_DIR}/boot-resource/boot-resource/bat/bempty.bmp:${LICHEE_PACK_OUT_DIR}/bempty.bmp
 ${LICHEE_CHIP_CONFIG_DIR}/boot-resource/boot-resource/bat/battery_charge.bmp:${LICHEE_PACK_OUT_DIR}/battery_charge.bmp
+${LICHEE_CHIP_CONFIG_DIR}/boot-resource/extlinux:${LICHEE_PACK_OUT_DIR}/boot-resource/
+${LICHEE_PLAT_OUT}/sunxi.dtb:${LICHEE_PACK_OUT_DIR}/boot-resource/extlinux/
+${LICHEE_PLAT_OUT}/bImage:${LICHEE_PACK_OUT_DIR}/boot-resource/extlinux/Image
 )
```

:::tip Patch Instructions
You can search for the code lines in the document that don't have `+` prefix, find the location where the code needs to be added, and then add the patch content to the code block.
:::

## Image Compilation

Navigate to the official Allwinner SDK source code directory, then initialize the build environment and launch the configuration interface.

### Initialize Build Environment

<NewCodeBlock tip="Linux-Host$" type="host">
```bash
source build/envsetup.sh
```
</NewCodeBlock>

After successful initialization, the terminal will output information similar to the following:

```text
NOTE: The SDK(/home/milir/download/tina_sdk) was successfully loaded
load yocto... ok
load buildroot,dragonboard,bsp...ok
Invoke . build/quick.sh from your shell to add the following functions to your environment:
    croot / cl                     - Changes directory to the top of the tree
    cbrandy                        - Changes directory to the brandy
    cspl / cboot0                  - Changes directory to the spl
    csbi[10|14] / copensbi[10|14]  - Changes directory to the opensbi
    cu / cuboot / cboot            - Changes directory to the uboot
    cubsp / cubootbsp / cbootbsp   - Changes directory to the uboot-bsp
    carisc                         - Changes directory to the arisc
    ck / ckernel                   - Changes directory to the kernel
    cbsp                           - Changes directory to the bsp
    cbsptest                       - Changes directory to the bsptest
    cdts                           - Changes directory to the kernel's dts
    cchip / cchips                 - Changes directory to the chip
    cbin                           - Changes directory to the chip's bin
    cboard / cconfigs / cbd        - Changes directory to the board
    crootfs                        - Changes directory to the rootfs
    cdsp                           - Changes directory to the dsp
    crtos                          - Changes directory to the rtos
    crtoshal / crtos-hal           - Changes directory to the rtos-hal
    cbuild                         - Changes directory to the build
    cbr                            - Changes directory to the buildroot
    copenssl                       - Changes directory to the product's openssl-1.0.0
    cout                           - Changes directory to the product's output
    ckout / ckernelout             - Changes directory to the kernel output
Usage: build.sh [args]
    build.sh                       - default build all
    build.sh bootloader            - only build bootloader
    build.sh kernel                - only build kernel
    build.sh buildroot_rootfs      - only build buildroot
    build.sh uboot_menuconfig       - edit uboot menuconfig
    build.sh uboot_saveconfig       - save uboot menuconfig
    build.sh menuconfig            - edit kernel menuconfig
    build.sh saveconfig            - save kernel menuconfig
    build.sh recovery_menuconfig   - edit recovery menuconfig
    build.sh recovery_saveconfig   - save recovery menuconfig
    build.sh buildroot_menuconfig  - edit buildroot menuconfig
    build.sh buildroot_saveconfig  - save buildroot menuconfig
    build.sh clean                 - clean all
    build.sh distclean             - distclean all
    build.sh pack                  - pack firmware
    build.sh pack_debug            - pack firmware with debug info output to card0
    build.sh pack_secure           - pack firmware with secureboot
Usage: pack [args]
    pack                           - pack firmware
    pack -d                        - pack firmware with debug info output to card0
    pack -s                        - pack firmware with secureboot
    pack -sd                       - pack firmware with secureboot and debug info output to card0
```

### Launch Configuration Interface

<NewCodeBlock tip="Linux-Host$" type="host">
```bash
./build.sh config
```
</NewCodeBlock>

After running the command, select the following options in sequence: System Type -> Linux Distribution -> Kernel Version -> SoC Model -> Board Type -> Flash Type -> Rootfs File.

After successful configuration, the terminal will output information similar to the following. You can refer to this information for configuration:

```text
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
   4. yocto
Choice [debian]: 3
All available kern_name:
   0. linux-5.10
   1. linux-5.15
Choice [linux-5.15]: 1
All available ic:
   0. a523
   1. a527
   2. a733
   3. t527
   4. t736
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
   4. linaro-bullseye-xfce-ros2-humble-arm64.tar.gz
Choice [linaro-bullseye-xfce-arm64.tar.gz]: 3
Setup BSP files
INFO: Prepare toolchain ...
INFO: kernel defconfig: generate /home/milir/download/tina_sdk/out/a527/kernel/build/.config by /home/milir/download/tina_sdk/device/config/chips/a527/configs/cubie_a5e/debian/linux-5.15/bsp_defconfig
INFO: Prepare toolchain ...
make: Entering directory '/home/milir/download/tina_sdk/kernel/linux-5.15'
make[1]: Entering directory '/home/milir/download/tina_sdk/out/a527/kernel/build'
  GEN     Makefile
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on '../../../../../device/config/chips/a527/configs/cubie_a5e/debian/linux-5.15/bsp_defconfig'
#
# configuration written to .config
#
make[1]: Leaving directory '/home/milir/download/tina_sdk/out/a527/kernel/build'
make: Leaving directory '/home/milir/download/tina_sdk/kernel/linux-5.15'
INFO: clean buildserver
INFO: prepare_buildserver
```

:::tip Common Issues

1. python: command not found

Solution:

<NewCodeBlock tip="Linux-Host$" type="host">

```bash
sudo apt update
sudo apt install python3
sudo ln -s /usr/bin/python3 /usr/bin/python
```

</NewCodeBlock>

:::

### Image Compilation

<NewCodeBlock tip="Linux-Host$" type="host">
```bash
./build.sh
```
</NewCodeBlock>

After compilation is complete, the terminal will output information similar to the following:

```text
Use init ramdisk file: '/home/milir/download/tina_sdk/kernel/linux-5.15/bsp/ramfs/ramfs_aarch64.cpio.gz'.
15983 blocks
30954 blocks
bootimg_build
Copy boot.img to output directory ...

sun55iw3p1 compile all(Kernel+modules+boot.img) successful


INFO: build dts ...
INFO: Prepare toolchain ...
Setup BSP files
'/home/milir/download/tina_sdk/out/a527/kernel/staging/sunxi.dtb' -> '/home/milir/download/tina_sdk/out/a527/cubie_a5e/debian/sunxi.dtb'
INFO: build rootfs ...
INFO: Prepare toolchain ...
INFO: Build debian rootfs ...
./mk-image.sh cover
INFO: Build rootfs ...
INFO: 1. using exist rootfs: /home/milir/download/tina_sdk/out/a527/cubie_a5e/debian/rootfs_def
INFO: 2. Copy the ko and others that system need...
install deb from packages/arm64
using /home/milir/download/tina_sdk/target/a527/debian/package.config
pkg_list:
libcedarc=libcedarc-dev_1.0.0_arm64.deb
xserver=xserver-xorg-mesa-g57_1.21.1-2_arm64.deb
INFO: install package:/home/milir/download/tina_sdk/debian/packages/arm64/libcedarc/libcedarc-dev_1.0.0_arm64.deb
INFO: install package:/home/milir/download/tina_sdk/debian/packages/arm64/xserver/xserver-xorg-mesa-g57_1.21.1-2_arm64.deb
start copy wifi-firmware
wifi_firmware_list:
PACKAGE_AIC8800_SDIO_FIRMWARE
Copy wifi-firmware: PACKAGE_AIC8800_SDIO_FIRMWARE
cp -rf /home/milir/download/tina_sdk/debian/overlay-firmware/etc /home/milir/download/tina_sdk/out/a527/cubie_a5e/debian/rootfs_def
cp -rf /home/milir/download/tina_sdk/debian/overlay-firmware/usr /home/milir/download/tina_sdk/out/a527/cubie_a5e/debian/rootfs_def
Copy /home/milir/download/tina_sdk/debian/overlay ...
Copy /home/milir/download/tina_sdk/debian/overlay-debug ...
INFO: start copy firmware to /home/milir/download/tina_sdk/out/a527/cubie_a5e/debian/rootfs_def/lib/firmware
INFO: copy firmware to /home/milir/download/tina_sdk/out/a527/cubie_a5e/debian/rootfs_def/lib/firmware ok ...
INFO: 3. Prepare the rootfs img...
PARTITION_FEX:/home/milir/download/tina_sdk/device/config/chips/a527/configs/cubie_a5e/debian/sys_partition.fex
Creating filesystem with parameters:
    Size: 7802716160
    Block size: 4096
    Blocks per group: 32768
    Inodes per group: 8080
    Inode size: 256
    Journal blocks: 29765
    Label:
    Blocks: 1904960
    Block groups: 59
    Reserved block group size: 471
Created filesystem with 68709/476720 inodes and 747165/1904960 blocks
INFO: ===== Build the rootfs finish =====
INFO: img path: /home/milir/download/tina_sdk/out/a527/cubie_a5e/debian/rootfs.ext4
INFO: ----------------------------------------
INFO: build OK.
INFO: ----------------------------------------
```

### Image Packaging

<NewCodeBlock tip="Linux-Host$" type="host">

```bash
./build.sh pack
```

</NewCodeBlock>

After the image packaging is complete, the terminal will output information similar to the following: The generated system image will be located in the `out` directory of the official Allwinner SDK source code.

```text
Dragon execute image.cfg SUCCESS !
----------image is at----------

3.0G    /home/milir/download/tina_sdk/out/a527_linux_cubie_a5e_uart0.img

pack finish
```

### U-Boot Compilation

To compile U-Boot separately, follow these steps:

<NewCodeBlock tip="Linux-Host$" type="host">

```bash
./build.sh bootloader
```

</NewCodeBlock>

:::tip U-Boot Compilation
Running './build.sh bootloader' will execute the build.sh script located in the brandy/brandy-2.0/ directory.

This command is equivalent to the following, which uses the `sun55iw3p1_defconfig` file in the `u-boot-2018/configs` directory:

```text
cd brandy/brandy-2.0/
./build.sh -p sun55iw3p1 -b a527
```

:::

After compilation is complete, the terminal will output information similar to the following: Compiling U-Boot will generate u-boot, boot0, fes1, and sboot files, with the file locations output in the terminal log.

```text
========ACTION List: build_bootloader ;========
options :
find: '/home/milir/download/tina_sdk/brandy/brandy-2.0/spl': No such file or directory
find: '/home/milir/download/tina_sdk/brandy/brandy-2.0/u-boot-bsp': No such file or directory
find: '/home/milir/download/tina_sdk/brandy/brandy-2.0/u-boot-efex': No such file or directory
INFO: build_bootloader: brandy_path=/home/milir/download/tina_sdk/brandy/brandy-2.0
INFO: skip build brandy.
```

| File Type | Description                                                                                                                                                                                                                                                                          |
| :-------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|  u-boot   | Universal Bootloader: The mainstream bootloader; responsible for initializing a more complete hardware environment, loading the operating system kernel, and handing over control, serving as a crucial link in the boot process.                                                    |
|   boot0   | First Stage Bootloader (FSBL) for Allwinner chips; its main responsibility is to initialize critical hardware (such as DRAM, clocks, etc.) and load the next stage bootloader (such as U-Boot).                                                                                      |
|   fes1    | Firmware Execution State: A special firmware execution state, typically enabled during forced upgrade or flashing modes (e.g., via USB OTG), used for firmware burning and system recovery tasks.                                                                                    |
|   sboot   | Secure Boot: A bootloader used to implement secure boot; its core function is to verify the digital signatures of subsequent boot components (such as U-Boot or Linux kernel) to ensure the integrity and security of the boot chain and prevent unauthorized firmware from running. |

### Kernel Compilation

To compile the Kernel separately, follow these steps:

<NewCodeBlock tip="Linux-Host$" type="host">

```bash
./build.sh kernel
```

</NewCodeBlock>

:::tip Kernel Compilation

Running './build.sh kernel' will use the `defconfig` configuration file in the `device/config/chips/a527/configs/cubie_a5e/debian/linux-5.15/bsp_defconfig` directory and the `dts` file in `device/config/chips/a527/configs/cubie_a5e/linux-5.15/board.dts` for compilation.

:::

After compilation is complete, the terminal will output information similar to the following: Compiling the Kernel will generate kernel image files, with the generated files located in the `out/a527/cubie_a5e/debian/` directory.

```text
Use init ramdisk file: '/home/milir/download/tina_sdk/kernel/linux-5.15/bsp/ramfs/ramfs_aarch64.cpio.gz'.
15983 blocks
30954 blocks
bootimg_build
Copy boot.img to output directory ...

sun55iw3p1 compile all(Kernel+modules+boot.img) successful


INFO: build dts ...
INFO: Prepare toolchain ...
Setup BSP files
'/home/milir/download/tina_sdk/out/a527/kernel/staging/sunxi.dtb' -> '/home/milir/download/tina_sdk/out/a527/cubie_a5e/debian/sunxi.dtb'
```

| File Type | Description                                         |
| :-------: | :-------------------------------------------------- |
| boot.img  | Kernel image file, including kernel and device tree |
| sunxi.dtb | Device Tree Blob (DTB) file                         |
