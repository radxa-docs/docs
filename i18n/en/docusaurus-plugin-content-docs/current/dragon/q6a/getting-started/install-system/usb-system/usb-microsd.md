---
sidebar_position: 3

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/radxa-os/install-system/qualcomm/_usb_flash_system.mdx
---

import USBSystem from '../../../../../common/radxa-os/install-system/qualcomm/\_usb_flash_system.mdx';

# Flash System Image to MicroSD Card

This guide explains how to flash a system image to a MicroSD card using a USB Type-A to Type-A cable.

## Prerequisites

1. Insert the MicroSD card into the board's MicroSD card slot

2. Put the board into EDL mode and connect it to your computer using a USB Type-A to Type-A cable --> Refer to the [Entering EDL Mode](./edl-mode) guide

3. Set up the EDL tool environment --> Refer to the [Using EDL Tool](./set-edl-variable) guide

<USBSystem download_page="../../../download" board="dragon-q6a" spi_path="\flat_build\spinor\dragon-q6a\" loader="prog_firehose_ddr.elf" storage_type="Sdcc --slot 1" start_sector="0" image_file="radxa-dragon-q6a_noble_kde_t4.output_512.img"/>
