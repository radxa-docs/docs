---
sidebar_position: 2
---

import Images from "./\_image.mdx"

# 资源下载汇总

## 操作系统镜像

istoreos:

[istoreos-22.03.6-2024062810-e20c-squashfs.img.gz](https://dl.radxa.com/rock2/images/istoreos/istoreos-22.03.6-2024062810-e20c-squashfs.img.gz)

debian xfce:

[rock-2_bullseye_xfce_b1.output.img.xz](https://github.com/radxa-build/rock-2/releases/download/b1/rock-2_bullseye_xfce_b1.output.img.xz)

flippyWRT:

[Radxa E20C Flippy OpenWRT](https://dl.radxa.com/e/e20c/image/openwrt_rk3528_e20c_R24.07.07_k5.10.160-rk35xx-flippy-2407a.7z)

[Flippy OpenWRT Github](https://github.com/unifreq/openwrt_packit)

:::tip
这个镜像完全兼容 E20C、ROCK 2A 和 ROCK 2F 设备，所有这些设备都采用RK3528芯片。兼容的方法如下：

- 这三款产品中的每一款在相同的ADC引脚上使用不同的下拉电阻。
- 每个设备都有预定义的ADC范围值。
- 在u-boot初始化阶段，根据读取的ADC值动态选择适当的设备树，从而实现这些平台之间的无缝兼容。
  :::

## Loader 文件

[rk3528_spl_loader_v1.07.104.bin](https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin)

## 硬件设计

Radxa E20C V1.1 版本

[V1.1 位号图 pdf](https://dl.radxa.com/e/e20c/v1.10/radxa_e20c_v1100_Components_Placement_map.pdf)  
[V1.1 原理图 pdf](https://dl.radxa.com/e/e20c/v1.10/radxa_e20c_v1100_schematic.pdf)

## 质量认证

## 参考文档

## 3D 文件

### 第三方外壳

- [E20C 外壳，支持被动散热式上盖](https://makerworld.com/en/models/519794#profileId-436182) 来自 [JasonYANG17](https://makerworld.com/en/@Jasonyang170)
- [Radxa E20C Box](https://www.printables.com/model/931601-radxa-e20c-box) 来自 [cclll](https://www.printables.com/@cclll_947574)
