---
sidebar_position: 10
---

# 编译内核与系统镜像

## 环境准备

- 一台装有 ubuntu 20.04 或者以上的 PC 或者虚拟机

- 安装相关工具

<NewCodeBlock tip="Linux$" type="host">

```bash

sudo apt install git build-essential flex bison

```

</NewCodeBlock>

## 下载源码

<NewCodeBlock tip="Linux$" type="host">

```bash
mkdir -p radxa_dragon_q6a_ubuntu/build

cd radxa_dragon_q6a_ubuntu

git clone https://github.com/nascs/image_build.git  build -b Radxa_Dragon_Q6A

git clone https://github.com/nascs/kernel.git -b work-6.15.y

mkdir rootfs && cd rootfs

wget https://dl.radxa.com/q6a/images/rootfs.img.zst

zstd -d rootfs.img.zst
```

</NewCodeBlock>

## 设置交叉编译工具链

- 下载交叉编译工具链

<NewCodeBlock tip="Linux$" type="host">

```bash
mkdir tools && cd tools

wget https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

tar Jxf arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

```

</NewCodeBlock>

- 设置交叉编译工具链

将 build/board_configs.sh 中的 "export CROSS_COMPILE=aarch64-linux-gnu-" 替换为实际的交叉编译链。

## 编译内核

<NewCodeBlock tip="Linux$" type="host">

```bash

bash ./build/mk-kernel.sh dragon-q6a

```

</NewCodeBlock>

编译成功后，会在 radxa_dragon_q6a_ubuntu 目录下生成一个 out 文件夹, 如下:

- boot.img: boot.img header、kernel 以及 ramdisk 文件系统

- headers: 头文件相关

- kernel: 包含 kernel 的 Image 文件和 Q6A 的设备树文件

- rootfs: 内核编译后打包的 rootfs

:::tip

如果需要在上层空间使用 i2c/spi/uart 等:

方法一：让 ubuntu 的 initramfs-tools 检测到这个固件 /lib/firmware/qcom/qcm6490/qupv3fw.elf 并自动加进 initramfs

方法二：将 CONFIG_QCOM_GENI_SE 改为 module 的方式编译

:::

## 编译系统镜像

<NewCodeBlock tip="Linux$" type="host">

```bash

bash ./build/mk-image.sh -c qcs6490 -t system  -r rootfs/rootfs.img

```

</NewCodeBlock>

编译成功后，会在 radxa_dragon_q6a_ubuntu/out 目录下生成一个 system.img 的系统镜像文件。
