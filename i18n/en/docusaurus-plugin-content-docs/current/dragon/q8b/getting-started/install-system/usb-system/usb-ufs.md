---
sidebar_position: 5

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/radxa-os/install-system/qualcomm/_usb_flash_system.mdx
---

import USBSystem from '../../../../../common/radxa-os/install-system/qualcomm/\_usb_flash_system.mdx';

# Flash System Image to UFS

This guide explains how to flash a system image to UFS storage using a USB Type-C cable.

## Prerequisites

1. Install the UFS module into the board's UFS module slot

2. Put the board into EDL mode and connect it to your computer using a USB Type-C cable --> Refer to the [Entering EDL Mode](./edl-mode) guide

3. Set up the EDL tool environment --> Refer to the [Using EDL Tool](./set-edl-variable) guide

<USBSystem download_page="../../../download" board="dragon-q8b" spi_path="\flat_build\spinor\dragon-q8b\" loader="prog_firehose_ddr.elf" storage_type="ufs" start_sector="0" image_file="radxa-dragon-midstream_resolute_gnome_r5.output_4096.img"/>
