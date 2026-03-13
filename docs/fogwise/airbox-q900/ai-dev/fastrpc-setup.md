---
sidebar_position: 0

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/ai/_fastrpc_setup.mdx
---

# 板端启用 NPU

import FASTRPCSETUP from '../../../common/ai/\_fastrpc_setup.mdx';

:::caution 使用前提

本页中的 `fastrpc` 软件包来自 Radxa APT 源，建议先刷写并启动官方 **RadxaOS** 镜像。
如果当前系统不是官方 RadxaOS，可能会出现 `apt install fastrpc` 无法找到软件包或依赖不满足的情况。

- 官方镜像下载：[`Fogwise® AIRbox Q900` 资源汇总下载](../../download)
- 刷写安装说明：[安装系统到板载 UFS](../getting-started/install-system/onboard-ufs)

:::

<FASTRPCSETUP tag="qcs9075" />
