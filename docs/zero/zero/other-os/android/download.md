---
sidebar_position: 5
---

# 资源下载汇总

## 硬件设计

### 1.3 最终原型版本

- [v1.3 schematic pdf](https://dl.radxa.com/zero/docs/hw/RADAX_ZERO_V13_SCH_20210309.pdf) - 下载 Radxa ZERO v1.3 的原理图
- [v1.3 SMD pdf](https://dl.radxa.com/zero/docs/hw/RADAX_ZERO_V13_SMD_20210309.pdf) - 下载 Radxa ZERO v1.3 的点位图

### 1.4 首次量产版本

- [v1.4 schematic pdf](https://dl.radxa.com/zero/docs/hw/radxa_zero_v1400_schematic.pdf) - 下载 Radxa ZERO v1.4 的原理图
- [v1.4 SMD pdf](https://dl.radxa.com/zero/docs/hw/radxa_zero_v1400_smd.pdf) - 下载 Radxa ZERO v1.4 的点位图
- [2D dxf for top and bottom](https://dl.radxa.com/zero/docs/hw/radxa_zero_v1400_2d.zip) - 下载 Radxa ZERO v1.4 的 2D CAD 文件

修正了 TYPE-C 连接器的占位面积
缩小了 ESD0402 的占位面积
将 1L2 和 1L4 分开，以降低电路短路的可能性
用 CH482 代替 FUSB340
电源 LED 现在可由 GPIOAO_8 控制
因此，引脚 35（GPIOAO_8）没有连接到 40 引脚针座上

### 1.5 微调

由于芯片短缺，改用其他 USB 配置通道控制器

### 1.51 微调

电源 LED 现在可由 GPIOAO_10 控制
因此，引脚 35（GPIOAO_8）现在连接到了 40 针针座上
引脚 38（GPIOAO_10）现在没有连接到 40 针针座上

## 刷机工具

- [Zagdig](https://zadig.akeo.ie/)：Windows Maskrom 驱动。
- [RZ USB Boot Helper](https://dl.radxa.com/zero/tools/windows/RZ_USB_Boot_Helper_V1.0.0.zip)：Windows bootloader 加载工具。
- [factory-loader.img](https://dl.radxa.com/zero/images/loader/factory-loader.img)：用于在 Windows 上清除 eMMC。不推荐使用。
- [radxa-zero-erase-emmc.bin](https://dl.radxa.com/zero/images/loader/radxa-zero-erase-emmc.bin)：自动擦除 eMMC，然后将 eMMC 作为 USB 存储设备显示。这是烧录 Linux 映像的推荐方法。
- [rz-fastboot-loader.bin](https://dl.radxa.com/zero/images/loader/rz-fastboot-loader.bin)：启用 fastboot 模式，但不能用于安装我们的官方 Android 系统。
- [android-bootloader.img](https://dl.radxa.com/zero/images/loader/android-bootloader.img)：与我们的官方 Android 映像中的 bootloader.img 相同。某些发行版会使用此引导加载器。
- [rz-udisk-loader.bin](https://dl.radxa.com/zero/images/loader/rz-udisk-loader.bin)：将嵌入式 eMMC 作为 USB 大容量存储设备。

## 操作系统镜像

- [Android 9](https://dl.radxa.com/zero/images/android/radxa_zero_android_9_20220311-fastboot.img.zip)

## 质量认证

- [CE RED - EU](https://dl.radxa.com/zero/docs/compliance/radxa_zero_ce_red_report.zip)
- [FCC ID - US](https://fccid.io/2A3PA-RADXA-ZERO)
