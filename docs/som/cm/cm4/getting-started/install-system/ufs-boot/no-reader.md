---
sidebar_position: 2
---

import DDUse from '../../../../../../common/radxa-os/install-system/\_use_dd_ufs.mdx';

# 从 microSD 卡 或板载 eMMC 安装系统到 UFS 模块

<DDUse boot_device="microSD 卡或板载 eMMC" tag="ufs_module" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-r5/radxa-rk3576_bookworm_kde_r5.output_4096.img.xz" path_to_image_unxz="radxa-rk3576_bookworm_kde_r5.output_4096.img" path_to_image="radxa-rk3576_bookworm_kde_r5.output_4096.img" device_target="/dev/sda" board="cm4" />

说明：UFS 启动需要将 UFS BOOT 引脚使用跳线帽或者杜邦线短接（短接后无法从 eMMC 启动），接口位置可以参考 [其它接口](../../../hardware-use/other.md) 文档。
