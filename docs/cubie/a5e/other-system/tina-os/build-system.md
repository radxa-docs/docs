---
sidebar_position: 2
---

# 构建系统

构建系统我们需要依次完成源码下载、源码合并以及镜像编译。

- 源码下载

我们需要下载 Allwinner 官方原始 SDK 源码和瑞莎 Cubie A5E 相关的源码。

- 源码合并

我们需要将瑞莎 Cubie A5E 相关的源码合并到 Allwinner 官方原始 SDK 源码中。

- 镜像编译

我们需要将合并后的源码编译成镜像。

## 源码下载

下载 Allwinner 官方原始 SDK 源码和瑞莎 Cubie A5E 相关的源码。

### Allwinner 官方 SDK

- [Tina5.0_AIOT](https://gitlab.com/tina5.0_aiot)

#### 下载源码

- [MEGA 下载](https://mega.nz/file/kFtD0BYY#zm3FXLiLK9SfOFss3BGY1Kx714BFBqyyPeYeE5FvOw0)

- [百度网盘下载（提取码：547b）](https://pan.baidu.com/s/1zcVq4l-rij7RPmJ92nccZg)

#### 同步本地仓库状态

使用 `repo sync -l` 命令同步本地仓库状态：

<NewCodeBlock tip="Linux-Host$" type="host">

```
repo sync -l
```

</NewCodeBlock>

说明：该命令等效于 `.repo/repo/repo sync -l` 且不需要安装 `repo`。

运行正常后，终端会输出类似如下信息：

```
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

:::tip repo 命令

若没有安装 `repo` 命令，可以自行安装 `repo`：

<NewCodeBlock tip="Linux-Host$" type="host">

```
sudo apt update
sudo apt install repo
```

</NewCodeBlock>

:::

### 瑞莎 Cubie A5E 源码

|     仓库名称     | 源码仓库                                      | 目标分支                  | 目标文件夹                     |
| :--------------: | :-------------------------------------------- | :------------------------ | :----------------------------- |
| allwinner-target | https://github.com/radxa/allwinner-target.git | target-a527-v1.4.6        | target/a527/                   |
| allwinner-device | https://github.com/radxa/allwinner-device.git | device-a527-v1.4.6        | device/config/chips/a527/      |
|  allwinner-bsp   | https://github.com/radxa/allwinner-bsp.git    | cubie-aiot-v1.4.6         | bsp/                           |
|      kernel      | https://github.com/radxa/kernel.git           | allwinner-aiot-linux-5.15 | kernel/linux-5.15/             |
|      u-boot      | https://github.com/radxa/u-boot.git           | cubie-aiot-v1.4.6         | brandy/brandy-2.0/u-boot-2018/ |

说明：目标文件夹是指瑞莎 Cubie A5E 源码需要存放到 Allwinner 官方原始 SDK 源码的对应位置。

## 合并源码

将瑞莎 Cubie A5E 源码合并到 Allwinner 官方原始 SDK 源码中。

建议直接进入 Allwinner 官方原始 SDK 源码目录，然后依次执行添加远程仓库地址、更新远程仓库、切换分支命令。

|     仓库名称     | 添加远程仓库地址                                                   | 更新远程仓库    | 切换分支                                                                  |
| :--------------: | :----------------------------------------------------------------- | :-------------- | :------------------------------------------------------------------------ |
| allwinner-target | git remote add radxa https://github.com/radxa/allwinner-target.git | git fetch radxa | git checkout -b target-a527-v1.4.6 radxa/target-a527-v1.4.6               |
| allwinner-device | git remote add radxa https://github.com/radxa/allwinner-device.git | git fetch radxa | git checkout -b device-a527-v1.4.6 radxa/device-a527-v1.4.6               |
|  allwinner-bsp   | git remote add radxa https://github.com/radxa/allwinner-bsp.git    | git fetch radxa | git checkout -b cubie-aiot-v1.4.6 radxa/cubie-aiot-v1.4.6                 |
|      kernel      | git remote add radxa https://github.com/radxa/kernel.git           | git fetch radxa | git checkout -b allwinner-aiot-linux-5.15 radxa/allwinner-aiot-linux-5.15 |
|      u-boot      | git remote add radxa https://github.com/radxa/u-boot.git           | git fetch radxa | git checkout -b cubie-aiot-v1.4.6 radxa/cubie-aiot-v1.4.6                 |

#### 演示示例

进入 Allwinner 官方原始 SDK 源码目录下的指定文件夹，然后依次执行添加远程仓库地址、更新远程仓库、切换分支命令。

<NewCodeBlock tip="Linux-Host$" type="host">
```
cd target/a527/
git remote add radxa https://github.com/radxa/allwinner-target.git
git fetch radxa
git checkout -b target-a527-v1.4.6 radxa/target-a527-v1.4.6
```
</NewCodeBlock>

您可以按照以上步骤依次完成其它源码的合并。

## 镜像编译

进入 Allwinner 官方原始 SDK 源码目录，然后初始化编译环境和启动配置界面。

### 初始化编译环境

<NewCodeBlock tip="Linux-Host$" type="host">
```
source build/envsetup.sh
```
</NewCodeBlock>

### 启动配置界面

<NewCodeBlock tip="Linux-Host$" type="host">
```
./build.sh config
```
</NewCodeBlock>

- 配置示例

```
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

:::tip 常见问题

1. python: command not found

解决办法：

<NewCodeBlock tip="Linux-Host$" type="host">

```
sudo apt update
sudo apt install python3
sudo ln -s /usr/bin/python3 /usr/bin/python
```

</NewCodeBlock>

:::

### 镜像编译

<NewCodeBlock tip="Linux-Host$" type="host">
```
./build.sh
```
</NewCodeBlock>

### 镜像打包

<NewCodeBlock tip="Linux-Host$" type="host">
```
./build.sh pack
```
</NewCodeBlock>

生成的系统镜像会存放在 Allwinner 官方原始 SDK 源码目录的 `out` 文件夹中。

### U-Boot 编译

若单独编译 U-Boot，可以按照以下步骤完成。

<NewCodeBlock tip="Linux-Host$" type="host">

```
./build.sh bootloader
```

</NewCodeBlock>

:::tip U-Boot 编译
运行 './build.sh bootloader' 将会执行位于 brandy/brandy-2.0/ 目录下的 build.sh 脚本。

命令等效于下面命令：命令会使用 `u-boot-2018/configs` 目录下的 `sun55iw3p1_defconfig` 文件

```
cd brandy/brandy-2.0/
./build.sh -p sun55iw3p1 -b a527
```

:::

编译 U-Boot 会生成 u-boot、boot0、fes1 以及 sboot 文件，其中生成的文件位置会通过终端日志输出。

| 文件类型 | 说明                                                                                                                                                             |
| :------: | :--------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|  u-boot  | Universal Bootloader：通用的主流引导加载程序；负责初始化更完整的硬件环境、加载操作系统内核并将控制权移交给它，是启动过程中承上启下的关键环节。                   |
|  boot0   | Allwinner 芯片启动的第一阶段引导加载程序（FSBL）；其主要职责是初始化关键硬件（如DRAM、时钟等），并加载下一阶段的引导程序（如U-Boot）。                           |
|   fes1   | Firmware Execution State：特殊的固件执行状态，通常在强制升级或刷机模式（如通过USB OTG）下启用，用于执行固件烧录和系统恢复任务。                                  |
|  sboot   | Secure Boot：用于实现安全启动的引导加载程序；其核心功能是验证后续启动组件（如U-Boot或Linux内核）的数字签名，确保启动链的完整性与安全性，防止运行未经授权的固件。 |

### Kernel 编译

若单独编译 Kernel，可以按照以下步骤完成。

<NewCodeBlock tip="Linux-Host$" type="host">

```
./build.sh kernel
```

</NewCodeBlock>

:::tip Kernel 编译

运行 './build.sh kernel' 会使用 `device/config/chips/a527/configs/cubie_a5e/debian/linux-5.15/bsp_defconfig` 目录下的 `defconfig` 配置文件和 `device/config/chips/a527/configs/cubie_a5e/linux-5.15/board.dts` 的 `dts` 文件进行编译。

:::

编译 Kernel 会生成内核镜像文件，其中生成的文件位于 `out/a527/cubie_a5e/debian/` 目录下。

| 文件类型  | 说明                                     |
| :-------: | :--------------------------------------- |
| boot.img  | 内核镜像文件，包含 kernel 和 device tree |
| sunxi.dtb | 设备树二进制文件 (device tree blob)      |
