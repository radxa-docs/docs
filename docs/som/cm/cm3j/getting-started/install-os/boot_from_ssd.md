---
sidebar_position: 3
description: "从 SSD 启动"
---

# 安装系统到 SSD 启动

## 安装系统

- 使用硬盘盒将系统烧录到 SSD 中。烧录可参照[安装系统](../install-os/boot_from_sd_card.md)

## 向 SPI Flash 中烧写 Bootloader

有两种方式可以向 SPI Flash 里面烧写 Bootloader

- 在板子上操作：

  - 如果板子上的系统能正常运行，可以通过系统自带的 rsetup 工具进行操作。

- 在 PC 上操作：

  - 如果板子不能正常启动或者不想在板子上进行操作，我们可以通过 USB 线连接 PC 和板子，在 PC 端通过工具进行烧写。

### 在板子上操作

- 打开终端，执行 rsetup。

- 选择 "System"，按回车键。

<img src="/img/cm3j/rsetup/main-menu.webp" alt="main menu" style={{ width: "80%" }} />

- 然后选择 "Bootloader Management"，按回车键。

<img src="/img/cm3j/rsetup/bootloader-management.webp" alt="bootloader management" style={{ width: "80%" }} />

- 接着选择 "Update SPI Bootloader" 之后，按回车，接着选中 "yes" 再按回车键。

<img src="/img/cm3j/rsetup/update-spi.webp" alt="rsetup spi" style={{ width: "80%" }} />
<img src="/img/cm3j/rsetup/yes.webp" alt="rsetup yes" style={{ width: "80%" }} />

- 最后空格选中 "radxa-cm3j-rpi-cm4-io" 选项，按回车后开始向 SPI Flash 中烧录。

<img src="/img/cm3j/rsetup/rsetup-radxa-cm3j-rpi-cm4-io.webp" alt="rsetup radxa cm3j" style={{ width: "80%" }} />

### 在 PC 上操作

在 PC 端需要通过 USB 向 SPI Flash 中烧录 Bootloader，这个过程同样需要进入 Maskrom 模式，使用 RKdevtools 工具烧录。

进入 Maskrom 的步骤和[安装系统到 eMMC](./maskrom/)基本一样，只需修改以下内容：

- 上电时需要按下 SPI Flash Button

  ![spi flash](/img/cm3j/radxa-cm3j-spi-flash-1.webp)

- 将 RKdevtools 工具中的 image 选项改为使用[资源下载汇总](../../download.md)中的 SPI Image。

  ![spi flash](/img/cm3j/radxa-cm3j-spi-flash-2.webp)
