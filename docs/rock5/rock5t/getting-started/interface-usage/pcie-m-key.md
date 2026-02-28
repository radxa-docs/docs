---
sidebar_position: 6

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/accessories/_pcie-m-key.mdx
---

import PCIe_M from "../../../../common/accessories/\_pcie-m-key.mdx";

# PCIe M Key

<PCIe_M model="rock-5t" read_test_img="/img/rock5b/rock5bp_pcie_m_read.webp" write_test_img="/img/rock5b/rock5b_pcie_m_write.webp" boot_from_nvme_by_sd="../install-os/nvme" flash_by_rkdevtool="../../low-level-dev/maskrom/windows"/>

## SSD 兼容列表

<div className='gpio_style'>

| 品牌     | 型号                   | 容量       | 额定电压电流 | 测试环境         | 兼容性       | 读写速率                         | 备注                                               |
| -------- | ---------------------- | ---------- | ------------ | ---------------- | ------------ | -------------------------------- | -------------------------------------------------- |
| 三星     | 980 EVO                | 512GB      | 3.3V/1.9A    | Radxa OS         | 可识别       | Read:1.0GB/s<br/>Write:991MB/s   |                                                    |
| 三星     | PM9A1 (MZVL2256HCHQ)   | 256GB      | 3.3V/2.8A    | Armbian          | 可识别       | Read:14.8MB/s<br/>Write:9.72MB/s |                                                    |
| 三星     | 970 EVO Plus           | 1TB        | 3.3V/1.9A    | Radxa OS         | 可识别       |                                  |                                                    |
| 三星     | PM983a                 | 1TB        | 3.3V/3.9A    |                  | **不可识别** |                                  |                                                    |
| 金士顿   | OM8PDP3256B-A01        | 256GB      | 3.3V/1A      | Radxa OS         | 可识别       |                                  |                                                    |
| 金士顿   | A2000 (SA2000M8/1000G) | 1TB        | 3.3V/3A      | Radxa OS/Armbian | 可识别       | Read:980MB/s<br/>Write:888MB/s   |                                                    |
| 英特尔   | Optane Memory M10      | 32GB       | 3.3V/1.2A    | Radxa OS         | 可识别       |                                  |                                                    |
| 英特尔   | Optane Memory M10      | 16GB       | 3.3V/1.2A    | Radxa OS         | 可识别       |                                  |                                                    |
| 英特尔   | Optane Memory H10      | 16GB+256GB | 3.3V/2.5A    | Radxa OS         | 可识别       | Read:910MB/s<br/>Write:170MB/s   | 默认配置下仅可识别 16G，PCI-E 分离后可识别全部容量 |
| 影驰     | 黑将Pro                | 250GB      | 3.3V/1.8A    | Radxa OS         | 可识别       | Read:2.1GB/s<br/>Write:680MB/s   |                                                    |
| 西部数据 | SN730                  | 512GB      | 3.3v/2.8A    | Radxa OS         | 可识别       | Read:1.4GB/s<br/>Write:670MB/s   |                                                    |
| 致态     | TiPlus5000             | 512GB      | 3.3V/2.5A    | Radxa OS         | 可识别       |                                  |                                                    |
| 致态     | TiPlus5000             | 2TB        | 3.3V/2.5A    | Radxa OS/Armbian | 可识别       | Read:1.3GB/s<br/>Write:745MB/s   |                                                    |
| 致态     | TiPlus7100             | 1TB        | 3.3V/2.5A    | Radxa OS         | 可识别       | Read:2.9GB/s<br/>Write:2.2GB/s   |                                                    |
| 宏碁     | VT500M                 | 256GB      |              | Armbian          | **不可识别** |                                  |                                                    |
| 江波龙   | XP1000                 | 1TB        |              |                  | 可识别       | Read:2.0GB/s<br/>Write:2.0GB/s   |                                                    |

</div>
