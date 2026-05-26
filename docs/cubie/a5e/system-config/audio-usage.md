---
sidebar_position: 7

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/radxa-os/system-config/_audio_usage.mdx
---

import AUDIO from '../../../common/radxa-os/system-config/\_audio_usage.mdx';

# 音频管理

<AUDIO debian_version="debian11" board="cubie-a5e" />

:::note Cubie A5E 音频接口说明
Cubie A5E 主板**未配备 3.5mm 耳机接口**。系统默认音频输出优先级为「蓝牙音频 > 耳机 > HDMI 音频」，其中「耳机」选项将在连接 USB 耳机或通过 40 Pin GPIO 接口连接外部 USB 声卡时生效。

如需通过 40 Pin GPIO 接口使用数字音频，可使用 I2S2 接口（需外接 DAC 芯片转换为模拟音频）。
:::
