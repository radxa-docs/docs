---
sidebar_position: 3
description: "系统编译"
---

# 系统编译

整体分为两部分，代码下载及镜像编译，其中代码下载又分为两部分，一个是 Allwinner 官方原始的SDK，另一部分是 Radxa A5E 相关的patch，两个分别下载后，合并到一起构成 A5E 的完整SDK。

## SDK 下载

下面是 Allwinner T527 及 A527 的官方SDK Tina 5.0 的下载地址

[T527_Tina5.0_AIOT](https://mega.nz/file/w6o3jChY#_Kw6AGMk4EniIGsU0Zur3_0K4eI4pA26slvg7mFx0q8) & [MD5SUM](https://mega.nz/file/8n4D2J4C#6kzkRa-jj_XBZ0nyf3RI_8w8Jih5J7CBwuBFyJmMr_w)

创建一个目录 tina, 然后下载完成后解压 SDK 到 tina 文件夹。 然后执行 'repo sync -l' 来获取 SDK 源码。

SDK的目录结构如下

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

下载官方的标准SDK之后，还需要下载 Cubie A5E 相关的文件包然后放到原始官方 SDK 对应的目录下。

<table>
    <tr>
        <th> Num </th>
        <th> Repository Name	</th>
        <th> SDK Directory Path </th>
        <th> Description </th>
    </tr>
    <tr>
        <td>1</td>
        <td>[allwinner-target<br/>(branch:target-a527)](https://github.com/radxa/allwinner-target/tree/target-a527)</td>
        <td>target/a527	</td>
        <td>平台配置文件</td>
    </tr>
    <tr>
        <td>2</td>
        <td>[allwinner-device<br/>(branch:device-a527)](https://github.com/radxa/allwinner-device/tree/device-a527)</td>
        <td>device/config/chips/a527</td>
        <td>平台配置文件</td>
    </tr>
    <tr>
        <td>3</td>
        <td>[allwinner-bsp<br/>(branch:product-linux-t527)](https://github.com/radxa/allwinner-bsp.git)</td>
        <td>bsp</td>
        <td>BSP 相关修改</td>
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

## 镜像编译

配置

```bash
source build/envsetup.sh

./build.sh config
```

配置 Example

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

镜像编译

```bash
./build.sh

```

镜像打包

```bash
./build.sh pack
```

生成的镜像文件在 out 目录下.

如果你想单独编译 kernel 或者 U-boot 也可以按照下面的步骤执行

## U-boot 编译

```bash
./build.sh bootloader
```

:::tip
运行 './build.sh bootloader' 将会执行位于 brandy/brandy-2.0/ 目录下的 build.sh 脚本;

另外你也可以手动执行下面的命令来达到同样的目的
:::

```bash
cd brandy/brandy-2.0/
./build.sh -p sun55iw3p1 -b a527
```

:::tip

上面这个命令会使用 u-boot-2018/configs 目录下的 sun55iw3p1_defconfig 文件，

然后编译出 bootloader 所需要的文件，包括 boot0, fes1, sboot 及 u-boot

:::

output:

u-boot-sun55iw3p1.bin

boot0_sdcard_sun55iw3p1.bin

fes1_sun55iw3p1.bin

sboot_sdcard_sun55iw3p1.bin

...

:::tip
通过查看编译的log，可以确认编译生成的文件所在的目录。
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
        <td>boot0 是 Allwinner 芯片启动过程中第一阶段的 bootloader(FSBL) <br/>
            他负责初始化基础的硬件(比如 DRAM, Clocks 等)，另外加载下一阶段的 bootloader (比如 U-Boot) </td>
    </tr>
    <tr>
        <td>2</td>
        <td>fes</td>
        <td> 固件烧录过程中会执行这个程序 </td>
    </tr>
    <tr>
        <td>3</td>
        <td>sboot</td>
        <td> sboot 是用于安全启动（Secure Boot）的引导加载程序（bootloader）。它负责验证后续引导加载程序（例如 U-Boot 或 Linux 内核）的签名, 以确保启动链（boot chain）的完整性和安全性。</td>
    </tr>
    <tr>
        <td> 4 </td>
        <td> u-boot</td>
        <td> The universal boot loader </td>
    </tr>
</table>

## Kernel 编译

:::tip
请确保在运行此命令前已通过 "./build.sh config" 进行了参数配置。
:::

```bash
$./build.sh kernel
```

:::tip
这个命令使用

device/config/chips/a527/configs/cubie_a5e/debian/linux-5.15/bsp_defconfig 这个目录下的 defconfig 文件,

及 device/config/chips/a527/configs/cubie_a5e/linux-5.15/board.dts 的dts文件;

生成的 kernel 镜像文件在 out/a527/cubie_a5e/debian/ 目录下
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
        <td>boot img 包含kernel 和 device tree</td>
    </tr>
        <tr>
        <td>2</td>
        <td>sunxi.dtb</td>
        <td>device tree blob</td>
    </tr>
</table>
