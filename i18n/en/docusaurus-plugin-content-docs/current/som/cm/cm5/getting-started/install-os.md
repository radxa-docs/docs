---
sidebar_position: 2

doc_kind: wrapper
source_of_truth: local
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/som/cm/cm5/radxa-os/install-os.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/som/cm/cm5/android/install-os.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/som/_install_uninstall_coreboard_guide.mdx
---

import Installdebian from "../radxa-os/install-os.mdx";
import Installandroid from "../android/install-os.mdx";

import InstallCoreBoard from "../../../\_install_uninstall_coreboard_guide.mdx";

# System Installation

## assembly

<InstallCoreBoard/>

## Installation

<Tabs queryString="target">
  <TabItem value="Radxa-OS" label="Radxa-os">

<Installdebian />

  </TabItem>
  <TabItem value="Android" label="Android">

<Installandroid />

  </TabItem>
</Tabs>

## Login

There are two default users for official system.

1. username: radxa password: radxa

2. username: rock password: rock

More info please refer to [RadxaOS](../radxa-os)
