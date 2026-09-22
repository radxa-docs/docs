---
sidebar_position: 6

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_canbus.mdx
---

# Canbus Usage

import CANBUS from '../../../common/dev/\_canbus.mdx';

<CANBUS rsetup_link="../system-config/rsetup#overlays" />

:::tip
The CAN controller on ROCK 4D supports CAN FD (CAN with Flexible Data-Rate), and you can use `fd on` and `dbitrate` in the example commands to configure the data phase bitrate.

ROCK 4D **does not have an on-board CAN transceiver**, so an external CAN transceiver module is required. If you need the higher data phase bitrates of CAN FD, make sure the external transceiver module itself supports CAN FD.
:::
