---
sidebar_position: 4
---

# 手动清空 SPI Flash

:::tip
本教程适用于内核 >= 5.10 的系统
:::

## 能启动 Linux

- 打开终端，执行 rsetup

- 选择 "System Maintenance"

<img src="/img/common/rsetup/main_menu.webp" alt="main menu" style={{ width: "80%" }} />

- 选择 "Erase SPI Bootloader"

<img src="/img/common/rsetup/system-maintenance.webp" alt="System Maintenance" style={{ width: "80%" }} />

- 选择 "OK" 之后，按空格键，选中 "rock-4a""rock-4b""rock-4a+""rock-4b+""rock-4se"

<img src="/img/common/nvme/rsetup-select-bootloader-rock-4b-plus.webp" alt="rsetup rock4ab-se" style={{ width: "80%" }} />

## 不能启动到系统

[参考 USB 线刷](/rock4/rock4ab-se/low-level-dev/maskrom)
