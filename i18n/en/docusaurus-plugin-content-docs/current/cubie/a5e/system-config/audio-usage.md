---
sidebar_position: 7

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/radxa-os/system-config/_audio_usage.mdx
---

import AUDIO from '../../../common/radxa-os/system-config/\_audio_usage.mdx';

# Audio Management

<AUDIO debian_version="debian11" board="cubie-a5e" />

:::note Cubie A5E Audio Interface Note
The Cubie A5E board **does not have a 3.5mm headphone jack**. The default audio output priority listed as "Bluetooth Audio > Headphones > HDMI Audio" means the "Headphones" entry will appear when a USB headphone or external USB audio card connected via the 40 Pin GPIO is detected.

To use digital audio via the 40 Pin GPIO interface, you can use the I2S2 interface (requires an external DAC chip to convert to analog audio).
:::
