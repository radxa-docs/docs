---
sidebar_position: 3
---

# 电源选择

瑞莎 Dual 2.5G Router HAT 配备了一个 DC 接口（座子规格为外径 5.5mm，内径 2.5mm，中心为正极）。搭配 Raspberry Pi 5 使用时，它支持两种电源供电模式。

- 使用 Type-C 适配器从 Raspberry Pi 5 供电，此时不建议同时使用 NVMe SSD
- 使用 DC 12V 适配器从 Dual 2.5G Router HAT 给 HAT 本身，SSD 和树莓派 5 供电，此时建议 12V/3A 或者以上适配器

:::tip
使用 Type-C 5V/5A 适配器从 Raspberry Pi 5 供电，同时搭配 Dual 2.5G Router HAT 并且接上 NVMe SSD 使用，满载时可能会出现供电不够导致系统无法正常启动的情况。

建议在搭配 Raspberry Pi 5 使用时用 DC 12V 适配器从 Dual 2.5G Router HAT 供电。
:::
