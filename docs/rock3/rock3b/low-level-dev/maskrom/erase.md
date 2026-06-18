---
sidebar_position: 4
description: "通过 Maskrom 清除 eMMC 或者 SPI Flash"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_erase-spi-emmc.mdx
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# 清除 eMMC 或者 SPI Flash

<ERASE loader="https://dl.radxa.com/rock3/images/loader/rock-3b/rk356x_spl_loader_ddr1056_v1.10.111.bin"  loader_name="rk356x_spl_loader_ddr1056_v1.10.111.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<Tabs queryString="board">
    <TabItem value="ROCK 3B">

1. 短接 **DIS SPI** 和 **GND** 引脚，**DIS eMMC** 和 **GND** 引脚

2. 将 USB 3.0 接口下方的开关拨到 Device 侧

3. 使用电源适配器供电，电源绿灯常亮说明成功进入 Maskrom 模式

4. 使用 USB-A 转 USB-A 数据线连接主板 OTG 口和 PC

说明：

- 若未安装 eMMC 模块则无需短接 DIS eMMC 和 GND 引脚
- 若需要清除 SPI Flash，则主板上电后取下短接 DIS SPI 和 GND 引脚的跳线帽或杜邦线
- 若需要清除 eMMC 模块，则主板上电后取下短接 DIS eMMC 和 GND 引脚的跳线帽或杜邦线

<img src="/img/rock3/3b/rock3b-maskrom-pins.webp" alt="ROCK 3B maskrom pins" width="1200" />

    </TabItem>
    <TabItem value="ROCK 3B+">

1. 短接 **DIS SPI** 和 **GND** 引脚，**DIS eMMC** 和 **GND** 引脚

2. 将 USB 3.0 接口下方的开关拨到 Device 侧

3. 使用电源适配器供电，电源绿灯常亮说明成功进入 Maskrom 模式

4. 使用 USB-A 转 USB-A 数据线连接主板 OTG 口和 PC

说明：

- 若需要清除 SPI Flash，则主板上电后取下短接 DIS SPI 和 GND 引脚的跳线帽或杜邦线
- 若需要清除 eMMC 模块，则主板上电后取下短接 DIS eMMC 和 GND 引脚的跳线帽或杜邦线

<img src="/img/rock3/3b/rock3b-plus-maskrom-pins.webp" alt="ROCK 3B+ maskrom pins" width="1200" />

    </TabItem>

</Tabs>

</ERASE>
