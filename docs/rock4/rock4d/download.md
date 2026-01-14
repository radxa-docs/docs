---
sidebar_position: 15
---

# 资源汇总下载

## Loader文件下载

USB 刷机使用，Loader 文件用于 USB 下载初始化。

- Loader： [rk3576_spl_loader.bin](https://dl.radxa.com/rock4/4d/images/rk3576_spl_loader.bin)

## SPI 文件下载

最新的 SPI 文件支持启动 Linux 和 Android 系统。

:::tip

擦除和烧录 SPI 启动固件请参考 [擦除/烧录 SPI 启动固件](./low-level-dev/spi_flash) 教程。

:::

- [spi.img](https://dl.radxa.com/rock4/4d/images/rock-4d-spi-flash-image.img)

## 系统镜像下载

### Linux 系统镜像

:::info 最新系统镜像发布页面

- [ROCK 4D Linux 系统镜像](https://github.com/radxa-build/radxa-rk3576/releases)

该页面会发布最新的正式版本和测试版本的系统镜像，测试版本以 `t` 开头，正式版本以 `r` 开头。

:::

若没有清除过 SPI Flash，可以直接写入系统镜像到 MicroSD 卡 / UFS 模块 / NVME / eMMC 启动系统。

- 适用于 MicroSD 卡 / NVME SSD / U 盘 / eMMC 等介质启动的系统镜像： [Linux-SD-NVME-UDisk.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b3/radxa-rk3576_bookworm_kde_b3.output_512.img.xz)

- 适用于 UFS 启动的系统镜像： [Linux-UFS.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b3/radxa-rk3576_bookworm_kde_b3.output_4096.img.xz)

:::caution

1. 请根据自己的系统启动介质下载对应系统镜像文件，下载错误的镜像会导致无法启动系统， UFS 镜像和普通镜像主要区别是 UFS 镜像的块大小是 4K 字节，普通镜像块大小是 512 字节。
2. 下载的系统镜像是经过压缩的，请务必解压后再写入到 MicroSD 卡/UFS 模块/NVME 启动系统。
   :::

#### Android 系统镜像

:::info 最新系统镜像发布页面

- [ROCK 4D Android 系统镜像](https://github.com/radxa/manifests/releases?q=4D&expanded=true)

:::

- 适用于 MicroSD 卡启动的系统镜像：[Android-SD.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-sd-20250527-gpt.zip)

- 适用于 UFS 模块启动的 update 系统镜像：[Android-UFS-update.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20251014/Rock4d-Android14-rk6-gms-ufs-20251014-update.zip)

- 适用于 UFS 模块启动的 gpt 系统镜像：[Android-UFS-gpt.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-ufs-20250527-gpt.zip)

- 适用于 NVME 启动的系统镜像：[Android-NVME.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-nvme-20250527-gpt.zip)

## 硬件设计

- [原理图 v1.11](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.11.pdf)
- [原理图 v1.12](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.12.pdf)
- [位号图 v1.11](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SMD_V1.11.pdf)
- [位号图 v1.12](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SMD_v1.12.pdf)
- [3D 模型](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_3D_v1_11_20250328.stp)

## 参考文档

- [Radxa ROCK 4D 特性图](https://dl.radxa.com/rock4/4d/docs/ROCK4D_Quick_Features_EN.pdf)
- [Radxa ROCK 4D 规格书](https://dl.radxa.com/rock4/4d/docs/radxa_rock4d_product_brief.pdf)
