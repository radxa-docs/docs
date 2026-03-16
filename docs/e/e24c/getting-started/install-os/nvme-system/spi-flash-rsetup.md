---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/radxa-os/system-config/_spi-flash-erase-rsetup.mdx
  - docs/common/radxa-os/system-config/_enable-spi-flash.mdx
---

import EnableSPIFlash from '../../../../../common/radxa-os/system-config/\_enable-spi-flash.mdx';
import SPIFlashEraseRsetup from '../../../../../common/radxa-os/system-config/\_spi-flash-erase-rsetup.mdx';

# 使用 Rsetup 擦除 / 烧录 SPI Flash

:::tip Maskrom 模式

主板进入 Maskrom 模式可以参考 [Maskrom 模式](../../../hardware-usage/maskrom.md) 教程。

:::

<EnableSPIFlash />

## 擦除 / 烧录 SPI Flash

<SPIFlashEraseRsetup board="e24c" download_page="../../../download" />
