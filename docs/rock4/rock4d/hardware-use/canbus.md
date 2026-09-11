---
sidebar_position: 6

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_canbus.mdx
---

# Canbus 使用

import CANBUS from '../../../common/dev/\_canbus.mdx';

<CANBUS rsetup_link="../system-config/rsetup#overlays" />

:::tip
ROCK 4D 的 CAN 控制器支持 CAN FD（CAN with Flexible Data-Rate），可以使用示例命令中的 `fd on` 与 `dbitrate` 配置数据段波特率。

ROCK 4D 主板**不板载 CAN 收发器**，需要外接 CAN 收发器模块；如果要使用 CAN FD 较高的数据段速率，请确认外接的收发器模块本身支持 CAN FD。
:::
