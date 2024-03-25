---
sidebar_position: 40
---

# Maskrom 模式

ROCK 3B 的 OTG 接口位于处于上方的 USB 3.0 接口，如果需要进入 Maskrom 模式，则应先将 USB 3.0 座子下方的拨码开关调至 device 侧。  
在 Maskrom 模式下，您可通过 USB-A 转 USB-A 线连接主机使用 [rkdevtool](low-level-dev/rkdevtool) 或 [upgrade-tool](low-level-dev/upgrade-tool) 来对您的产品进行擦写、线刷等操作。

## 进入 Maskrom 模式的方法

按以下步骤进入 Maskrom 模式：

1. 将 USB 3.0 座子下方的拨码开关调至 device 侧

![device](/img/rock3/3b/rock3b-otg.webp)

2. 使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机
3. 短接 Maskrom 引脚，其位于 USB 3.0 座子和以太网中间，如附图所示

![Maskrom](/img/rock3/3b/rock3b-maskrom.webp)

4. 插入电源线上电，如果电源绿灯常亮则成功进入 Maskrom 模式
5. 插入需要进行操作的 eMMC 或 microSD 卡
6. 使用 [rkdevtool](low-level-dev/rkdevtool) 或 [upgrade-tool](low-level-dev/upgrade-tool) 进行 Maskrom 模式操作
