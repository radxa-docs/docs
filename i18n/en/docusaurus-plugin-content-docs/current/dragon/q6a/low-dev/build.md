---
sidebar_position: 10
---

# Compile the kernel and system image

## Environment preparation

- A PC or virtual machine running Ubuntu 20.04 or later

- Install the relevant tools

<NewCodeBlock tip="Linux$" type="host">

```bash

sudo apt install git build-essential flex bison

```

</NewCodeBlock>

## Download source code

<NewCodeBlock tip="Linux$" type="host">

```bash
mkdir -p radxa_dragon_q6a_ubuntu/build

cd radxa_dragon_q6a_ubuntu

git clone https://github.com/nascs/q6a_build.git  build -b Radxa_Dragon_Q6A

git clone https://github.com/nascs/kernel.git -b work-6.15.y

mkdir rootfs && cd rootfs

wget https://dl.radxa.com/q6a/images/rootfs.img.zst

zstd -d rootfs.img.zst
```

</NewCodeBlock>

## Set up the cross-compilation toolchain

- Download the cross-compilation toolchain

<NewCodeBlock tip="Linux$" type="host">

```bash
mkdir tools && cd tools

wget https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

tar Jxf arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

```

</NewCodeBlock>

- Set up the cross-compilation toolchain

Replace “export CROSS_COMPILE=aarch64-linux-gnu-” in build/board_configs.sh with the actual cross-compilation chain.

## Compile the kernel

<NewCodeBlock tip="Linux$" type="host">

```bash

bash ./build/mk-kernel.sh dragon-q6a

```

</NewCodeBlock>

After successful compilation, an out folder will be generated in the radxa_dragon_q6a_ubuntu directory, as follows:

- boot.img: boot.img header, kernel, and ramdisk filesystem

- headers: header files

- kernel: contains the kernel image file and the Q6A device tree file

- rootfs: the rootfs packaged after kernel compilation

:::tip

If you need to use I2C/SPI/UART, etc., in the upper layer:

Method 1: Have Ubuntu's initramfs-tools detect this firmware /lib/firmware/qcom/qcm6490/qupv3fw.elf and automatically add it to initramfs

Method 2: Compile with CONFIG_QCOM_GENI_SE set to module mode

:::

## Compile System Image

<NewCodeBlock tip="Linux$" type="host">

```bash

bash ./build/mk-image.sh -c qcs6490 -t system  -r rootfs/rootfs.img

```

</NewCodeBlock>

After successful compilation, a system image file named system.img will be generated in the radxa_dragon_q6a_ubuntu/out directory.
