---
sidebar_position: 4
---

import USBSystem from '../../../../../common/radxa-os/install-system/qualcomm/\_usb_flash_system.mdx';

# Flash System Image to NVMe SSD

This guide explains how to flash a system image to an NVMe SSD using a USB Type-A to Type-A cable.

## Prerequisites

1. Install the NVMe SSD into the board's M.2 M Key 2230 NVMe SSD slot

2. Put the board into EDL mode and connect it to your computer using a USB Type-A to Type-A cable --> Refer to the [Entering EDL Mode](./edl-mode) guide

3. Set up the EDL tool environment --> Refer to the [Using EDL Tool](./set-edl-variable) guide

<USBSystem download_page="../../../download" board="dragon-q6a" spi_path="\flat_build\spinor\dragon-q6a\" loader="prog_firehose_ddr.elf" storage_type="nvme" start_sector="0" image_file="radxa-dragon-q6a_noble_kde_t4.output_512.img"/>
