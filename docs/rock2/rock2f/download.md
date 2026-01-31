---
sidebar_position: 2
---

# 资源下载汇总

## Loader 文件

[rk3528_spl_loader_v1.07.104.bin](https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin)

## 操作系统镜像

- Radxa OS

[radxa-rk3528_bookworm_kde_r3.output_512.img.xz](https://github.com/radxa-build/radxa-rk3528/releases/download/rsdk-r3/radxa-rk3528_bookworm_kde_r3.output_512.img.xz)

:::tip
这个镜像完全兼容 E20C、ROCK 2A 和 ROCK 2F 设备，所有这些设备都采用RK3528芯片。兼容的方法如下：

- 这三款产品中的每一款在相同的ADC引脚上使用不同的下拉电阻。
- 每个设备都有预定义的ADC范围值。
- 在u-boot初始化阶段，根据读取的ADC值动态选择适当的设备树，从而实现这些平台之间的无缝兼容。
  :::

- Android

[Radxa ROCK 2F Android 13 MicroSD and eMMC Image](https://github.com/radxa/manifests/releases/download/radxa-rock2a-20241230/ROCK2A_Android13_box_20241230_gpt.zip)：适用于 MicroSD 卡、板载 eMMC 启动系统。

:::tip
ROCK 2A 和 ROCK 2F 使用同一个安卓系统镜像。
:::

Armbian ：

[Armbian](https://www.armbian.com/rock-2f/) （包含 Ubuntu 和 Debian 系统）

## 硬件设计

Radxa ROCK 2F V1.0 版本

[v1.0 原理图 pdf](https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_schematic.pdf)

[v1.0 位号图 pdf](https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_components_placement_map.pdf)

[v1.0 PCBA 3D 模型文件](https://dl.radxa.com/rock2/2f/2F_pcba_20240401.zip)

## 质量认证

## 参考文档
