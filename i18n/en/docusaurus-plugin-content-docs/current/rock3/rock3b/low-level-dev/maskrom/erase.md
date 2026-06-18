---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_erase-spi-emmc.mdx
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Clear eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock3/images/loader/rock-3b/rk356x_spl_loader_ddr1056_v1.10.111.bin" loader_name="rk356x_spl_loader_ddr1056_v1.10.111.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<Tabs queryString="board">
    <TabItem value="ROCK 3B">

1. Short the **DIS SPI** and **GND** pins, and the **DIS eMMC** and **GND** pins.

2. Toggle the dip switch below the USB 3.0 port to the Device side.

3. Power the board with the power adapter. A steady green power LED indicates successful entry into Maskrom mode.

4. Connect the OTG port on the board to the PC using a USB-A to USB-A data cable.

Notes:

- If no eMMC module is installed, there is no need to short the DIS eMMC and GND pins.
- To clear SPI Flash, remove the jumper cap or jumper wire shorting the DIS SPI and GND pins after powering on the board.
- To clear the eMMC module, remove the jumper cap or jumper wire shorting the DIS eMMC and GND pins after powering on the board.

<img src="/img/rock3/3b/rock3b-maskrom-pins.webp" alt="ROCK 3B maskrom pins" width="500" />

    </TabItem>
    <TabItem value="ROCK 3B+">

1. Short the **DIS SPI** and **GND** pins, and the **DIS eMMC** and **GND** pins.

2. Toggle the dip switch below the USB 3.0 port to the Device side.

3. Power the board with the power adapter. A steady green power LED indicates successful entry into Maskrom mode.

4. Connect the OTG port on the board to the PC using a USB-A to USB-A data cable.

Notes:

- To clear SPI Flash, remove the jumper cap or jumper wire shorting the DIS SPI and GND pins after powering on the board.
- To clear the eMMC module, remove the jumper cap or jumper wire shorting the DIS eMMC and GND pins after powering on the board.

<img src="/img/rock3/3b/rock3b-plus-maskrom-pins.webp" alt="ROCK 3B+ maskrom pins" width="500" />

    </TabItem>

</Tabs>

</ERASE>
