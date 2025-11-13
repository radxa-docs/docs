---
sidebar_position: 3
---

import Kernel from '../../../../common/radxa-os/build-system/\_kernel.mdx';

# Kernel 开发

<Kernel  git_url="https://github.com/radxa-pkg/linux-a733.git" />

:::tip 内核 config 文件位置

- 推荐修改的内核 config 文件位置：`debian/patches/linux/0001-feat-Radxa-common-kernel-config.patch`
- 如果你使用的是其他操作系统，请自行修改内核 config 文件：`src/arch/arm64/configs/radxa.config`

  :::
