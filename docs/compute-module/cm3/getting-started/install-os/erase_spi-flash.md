---
sidebar_position: 4
description: "清空 SPI Flash"
---

# 手动清空 SPI Flash

有两种方式去擦除 SPI Flash 里面的数据

- 在板子上操作：

  如果板子上的系统能正常运行，可以通过系统自带的 rsetup 工具进行操作。

- 在 PC 上操作：

  如果板子不能正常启动或者我们不想在板子上进行操作，我们可以通过 USB 线连接 PC 和板子，在 PC 侧通过工具进行擦除。

## 在板子上操作

- 打开终端，执行 rsetup

- 选择 "System Maintenance"

<img src="/img/common/rsetup/main_menu.webp" alt="main menu" style={{ width: "80%" }} />

- 选择 "Erase SPI Bootloader"

<img src="/img/common/rsetup/system-maintenance.webp" alt="System Maintenance" style={{ width: "80%" }} />

- 选择 "OK" 之后，按空格键，选中 "radxa-cm3-io"

<img src="/img/common/rsetup/rsetup-radxa-cm3-io.webp" alt="rsetup rock-5-tix" style={{ width: "80%" }} />

## 在 PC 上操作

参考 [清除 eMMC 或者 SPI Flash](/compute-module/cm3/low-level-dev/maskrom/erase)
