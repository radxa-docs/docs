---
sidebar_position: 1
---

import BIOS from '../../../common/orion-common/low-level-dev/\_bios.mdx';

# Quick Start

To use the Android system, you need to update the Android system BIOS firmware first, and then flash the Android system to an NVMe SSD.

<BIOS board="Orion O6N" power="DC 12V Power Adapter" download_page="../../download" tag="o6n" />

## Installing the System

After successfully updating the BIOS firmware, follow the tutorial below to flash the latest Android system to an NVMe SSD.

- [Install System to NVMe SSD](../getting-started/install-system/nvme-system/nvme_reader)

:::tip Notes

When installing the Android system to an NVMe SSD, pay attention to the following points:

- The capacity of the NVMe SSD should be greater than or equal to 128GB
- Before installing the system, the NVMe SSD should be formatted as the FAT format
- After installing the system, the NVMe SSD should be installed in the front M.2 M Key 2280 slot of the Orion O6N, and it cannot boot the Android system on the back M.2 M Key 2280 slot

:::
