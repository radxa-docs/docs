---
sidebar_position: 15
---

# 资源汇总下载

## Loader文件下载

USB 刷机使用，Loader 文件用于 USB 下载初始化。

- Loader： [rk3576_spl_loader.bin](https://dl.radxa.com/rock4/4d/images/rk3576_spl_loader.bin)

## 系统镜像下载

Linux 系统镜像，可以直接写入系统镜像到 MicroSD 卡 / UFS 模块 / NVME 启动系统。

- 适用于 MicroSD 卡 / NVME SSD / U 盘 等介质启动的系统镜像： [rk3576_bookworm_kde_512.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b1/radxa-rk3576_bookworm_kde_b1.output_512.img.xz)

- 适用于 UFS 启动的系统镜像： [rk3576_bookworm_kde_4096.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b1/radxa-rk3576_bookworm_kde_b1.output_4096.img.xz)

:::caution

1. 请根据自己的系统启动介质下载对应系统镜像文件，下载错误的镜像会导致无法启动系统， UFS 镜像和普通镜像主要区别是 UFS 镜像的块大小是 4K 字节，普通镜像块大小是 512 字节。
2. 下载的系统镜像是经过压缩的，请务必解压后再写入到 MicroSD 卡/UFS 模块/NVME 启动系统。
   :::

## 硬件设计

- [原理图](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.11.pdf)
- [位号图](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SMD_V1.11.pdf)
- [3D 模型](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_3D_v1_11_20250328.stp)

## 参考文档

- [Radxa ROCK 4D 特性图](https://dl.radxa.com/rock4/4d/docs/ROCK4D_Quick_Features_EN.pdf)
- [Radxa ROCK 4D 规格书](https://dl.radxa.com/rock4/4d/docs/radxa_rock4d_product_brief.pdf)
