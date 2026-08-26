---
sidebar_position: 4

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/radxa-os/install-system/qualcomm/_usb_flash_system.mdx
---

import USBSystem from '../../../../../common/radxa-os/install-system/qualcomm/\_usb_flash_system.mdx';

# 线刷系统镜像到 NVMe 固态硬盘

介绍使用 USB Type-C 数据线给主板刷入 NVMe 固态硬盘系统镜像。

## 使用前提

1. 将 NVMe 固态硬盘安装到主板的 M.2 M Key 2280 NVMe 固态硬盘接口

2. 使主板进入 EDL 模式并使用 USB Type-C 数据线连接主板和电脑 --> 可参考 [进入 EDL 模式](./edl-mode.md) 教程

3. 配置 EDL 工具环境 --> 可参考 [使用 EDL 工具](./set-edl-variable.md) 教程

<USBSystem download_page="../../../download" board="dragon-q8b" spi_path="\flat_build\spinor\dragon-q8b\" loader="prog_firehose_ddr.elf" storage_type="nvme" start_sector="0" image_file="radxa-dragon-midstream_resolute_gnome_r5.output_512.img"/>
