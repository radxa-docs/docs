---
sidebar_position: 2
---

import Images from "./\_image.mdx"

# 资源下载汇总

## Loader 文件

[rk3528_spl_loader_v1.07.104.bin](https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin)（用于 debian）

[rock2a_android13_box_20240619_MiniLoader](https://github.com/radxa/manifests/releases/download/radxa-rock2a-20240726/rock2a_android13_box_20240619_MiniLoader.bin)（用于 Android）

## 操作系统镜像

Radxa OS:

[radxa-rk3528_bookworm_kde_r3.output_512.img.xz](https://github.com/radxa-build/radxa-rk3528/releases/download/rsdk-r3/radxa-rk3528_bookworm_kde_r3.output_512.img.xz)

Android13 ：

[rock2a_android13_box_20241230_gpt.img](https://github.com/radxa/manifests/releases/download/radxa-rock2a-20241230/ROCK2A_Android13_box_20241230_gpt.zip) （用于 SD 卡启动）

[rock2a_android13_box_20241230_update.img](https://github.com/radxa/manifests/releases/download/radxa-rock2a-20241230/ROCK2A_Android13_box_20241230_update.zip) （用于 EMMC 启动）

:::tip
镜像完全兼容 E20C、ROCK 2A 和 ROCK 2F 设备，所有这些设备都采用RK3528芯片。兼容的方法如下：

- 这三款产品中的每一款在相同的ADC引脚上使用不同的下拉电阻。
- 每个设备都有预定义的ADC范围值。
- 在u-boot初始化阶段，根据读取的ADC值动态选择适当的设备树，从而实现这些平台之间的无缝兼容。
  :::

## 硬件设计

Radxa ROCK 2A V1.2 版本

[v1.2 2D pdf](https://dl.radxa.com/rock2/2a/v1.2/radxa_rock2a_v1.2_2d_dimension.zip)  
[v1.2 原理图 pdf](https://dl.radxa.com/rock2/2a/v1.2/radxa_rock_2a_v1.2_schematic.pdf)  
[v1.2 位号图 pdf](https://dl.radxa.com/rock2/2a/v1.2/radxa_rock_2a_v1.2_components_placement_map.pdf)

## 质量认证

## 参考文档
