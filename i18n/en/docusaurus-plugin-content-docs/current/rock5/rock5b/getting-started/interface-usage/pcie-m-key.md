---
sidebar_position: 6
---

import PCIe_M from "../../../../common/accessories/\_pcie-m-key.mdx";

# PCIe M Key

<PCIe_M model="rock-5b-plus" read_test_img="/img/rock5b/rock5bp_pcie_m_read.webp" write_test_img="/img/rock5b/rock5b_pcie_m_write.webp" boot_from_nvme_by_sd="../install-system/nvme" flash_by_rkdevtool="../../low-level-dev/maskrom/windows"/>

## SSD Compatibility List

<div className='gpio_style'>

| Brands   | Model                  | Capacity   | Rated Voltage Current | Test environment | Compatibility      | Read-write rate                  | Note                                                                                                         |
| -------- | ---------------------- | ---------- | --------------------- | ---------------- | ------------------ | -------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Samsung  | 980 EVO                | 512GB      | 3.3V/1.9A             | Radxa OS         | recognizable       | Read:1.0GB/s<br/>Write:991MB/s   |                                                                                                              |
| Samsung  | PM9A1 (MZVL2256HCHQ)   | 256GB      | 3.3V/2.8A             | Armbian          | recognizable       | Read:14.8MB/s<br/>Write:9.72MB/s |                                                                                                              |
| Samsung  | 970 EVO Plus           | 1TB        | 3.3V/1.9A             | Radxa OS         | recognizable       |                                  |                                                                                                              |
| Samsung  | PM983a                 | 1TB        | 3.3V/3.9A             |                  | **unrecognizable** |                                  |                                                                                                              |
| Kingston | OM8PDP3256B-A01        | 256GB      | 3.3V/1A               | Radxa OS         | recognizable       |                                  |                                                                                                              |
| Kingston | A2000 (SA2000M8/1000G) | 1TB        | 3.3V/3A               | Radxa OS/Armbian | recognizable       | Read:980MB/s<br/>Write:888MB/s   |                                                                                                              |
| Intel    | Optane Memory M10      | 32GB       | 3.3V/1.2A             | Radxa OS         | recognizable       |                                  |                                                                                                              |
| Intel    | Optane Memory M10      | 16GB       | 3.3V/1.2A             | Radxa OS         | recognizable       |                                  |                                                                                                              |
| Intel    | Optane Memory H10      | 16GB+256GB | 3.3V/2.5A             | Radxa OS         | recognizable       | Read:910MB/s<br/>Write:170MB/s   | Only 16G can be recognized in default configuration, full capacity can be recognized after PCI-E separation. |
| Galax    | HOF Pro                | 250GB      | 3.3V/1.8A             | Radxa OS         | recognizable       | Read:2.1GB/s<br/>Write:680MB/s   |                                                                                                              |
|          | SN730                  | 512GB      | 3.3v/2.8A             | Radxa OS         | recognizable       | Read:1.4GB/s<br/>Write:670MB/s   |                                                                                                              |
| ZHITAI   | TiPlus5000             | 512GB      | 3.3V/2.5A             | Radxa OS         | recognizable       |                                  |                                                                                                              |
| ZHITAI   | TiPlus5000             | 2TB        | 3.3V/2.5A             | Radxa OS/Armbian | recognizable       | Read:1.3GB/s<br/>Write:745MB/s   |                                                                                                              |
| ZHITAI   | TiPlus7100             | 1TB        | 3.3V/2.5A             | Radxa OS         | recognizable       | Read:2.9GB/s<br/>Write:2.2GB/s   |                                                                                                              |
| Acer     | VT500M                 | 256GB      |                       | Armbian          | **unrecognizable** |                                  |                                                                                                              |
| Foresee  | XP1000                 | 1TB        |                       |                  | recognizable       | Read:2.0GB/s<br/>Write:2.0GB/s   |                                                                                                              |

</div>
