---
sidebar_position: 15
---

# SSD compatibility list

<div className='gpio_style'>

| Brand           | Model                  | Capacity   | Rated voltage and current | Test env        | Compatibility        | Read and write rate              | Note                                                                                                                                      |
| --------------- | ---------------------- | ---------- | ------------------------- | --------------- | -------------------- | -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Samsung         | 980 EVO                | 512GB      | 3.3V/1.9A                 | RadxaOS         | recognizable         | Read:1.0GB/s<br/>Write:991MB/s   |                                                                                                                                           |
| Samsung         | PM9A1 (MZVL2256HCHQ)   | 256GB      | 3.3V/2.8A                 | Armbian         | recognizable         | Read:14.8MB/s<br/>Write:9.72MB/s |                                                                                                                                           |
| Samsung         | 970 EVO Plus           | 1TB        | 3.3V/1.9A                 | RadxaOS         | recognizable         |                                  |                                                                                                                                           |
| Samsung         | PM983a                 | 1TB        | 3.3V/3.9A                 |                 | **not recognizable** |                                  |                                                                                                                                           |
| Kingston        | OM8PDP3256B-A01        | 256GB      | 3.3V/1A                   | RadxaOS         | recognizable         |                                  |                                                                                                                                           |
| Kingston        | A2000 (SA2000M8/1000G) | 1TB        | 3.3V/3A                   | RadxaOS/Armbian | recognizable         | Read:980MB/s<br/>Write:888MB/s   |                                                                                                                                           |
| Intel           | Optane Memory M10      | 32GB       | 3.3V/1.2A                 | RadxaOS         | recognizable         |                                  |                                                                                                                                           |
| Intel           | Optane Memory M10      | 16GB       | 3.3V/1.2A                 | RadxaOS         | recognizable         |                                  |                                                                                                                                           |
| Intel           | Optane Memory H10      | 16GB+256GB | 3.3V/2.5A                 | RadxaOS         | recognizable         | Read:910MB/s<br/>Write:170MB/s   | recognizable capacity in the default configuration is only recognizable 16 GB, but the total recognizable capacity after PCI-E separation |
| galaxy          | Black General Pro      | 250GB      | 3.3V/1.8A                 | RadxaOS         | recognizable         | Read:2.1GB/s<br/>Write:680MB/s   |                                                                                                                                           |
| Western Digital | SN730                  | 512GB      | 3.3v/2.8A                 | RadxaOS         | recognizable         | Read:1.4GB/s<br/>Write:670MB/s   |                                                                                                                                           |
| ZhiTai          | TiPlus5000             | 512GB      | 3.3V/2.5A                 | RadxaOS         | recognizable         |                                  |                                                                                                                                           |
| ZhiTai          | TiPlus5000             | 2TB        | 3.3V/2.5A                 | RadxaOS/Armbian | recognizable         | Read:1.3GB/s<br/>Write:745MB/s   |                                                                                                                                           |
| ZhiTai          | TiPlus7100             | 1TB        | 3.3V/2.5A                 | RadxaOS         | recognizable         | Read:2.9GB/s<br/>Write:2.2GB/s   |                                                                                                                                           |
| Acer            | VT500M                 | 256GB      |                           | Armbian         | **not recognizable** |                                  |                                                                                                                                           |
| Foresee         | XP1000                 | 1TB        |                           |                 | recognizable         | Read:2.0GB/s<br/>Write:2.0GB/s   |                                                                                                                                           |

</div>
