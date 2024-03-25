---
sidebar_label: "Maskrom"
sidebar_position: 2
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Maskrom 模式

当板子上没有启动固件的时候，SoC会自动运行Rockusb驱动，此时的模式我们称为Maskrom模式

## 进入Maskrom 模式

![Radxa CM3I](/img/cm3i/cm3i-overview.webp)

1. 取下 microSD 卡
2. 同时按住 CM3I 上的 Maskrom Button （SPI Flash） 和 Maskrom Button （eMMC）并保持
3. 保持步骤 2 中的 Maskrom 按钮按下，接入电源,即可进入 MASKROM 模式

## 参考文档

[rockchip_wiki_Rockusb](https://opensource.rock-chips.com/wiki_Rockusb)
