---
sidebar_position: 17
---

# 启动方式说明

Dragon Q6A 默认从 SPI NOR Flash 启动，并已预装 BIOS。

如需将启动介质改为直接从 UFS 启动，可以按以下方式调整板载电阻：

1. 移除 R137 位号的电阻。
2. 在 R207 位号焊接一个 10 kΩ 电阻。

:::warning 注意
该操作涉及硬件焊接，可能造成设备损坏或影响保修。操作前请断开设备电源，并由具备焊接经验的人员完成。
:::

:::warning 注意
完成以上硬件修改后，Dragon Q6A 将无法从 microSD 卡、eMMC 模块、NVMe SSD 启动系统。
:::
