---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/general/_etcherV2.mdx
---

import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install OS to eMMC Module

This article explains how to install the operating system to an eMMC Module and boot the system from it on ROCK 3B.

## File Download

Download the [ROCK 3B system image](../../download) from the resource download page.

## eMMC Module preparation

Insert the [eMMC Module](../../../../accessories/emmc_module) into the [eMMC Reader](accessories/emmc_reader), and then insert the reader into the USB port of your PC.

## Image burning

<Etcher/>

## Boot the system

After successfully burning the eMMC Module according to the above steps, insert the eMMC Module into the eMMC Module slot (as shown in the picture below), then power on the system, the system will start booting and HDMI will display the desktop.

<img
src="/img/rock3/3b/rock3b_with_emmc_module.webp"
alt="emmc slot"
style={{ width: "60%"}}
/>

## Logging in to the system

After the system boots up, log in using the radxa account with the password radxa.

:::tip
The whole process lasts about 40 seconds from powering on the system to booting it up, and then entering the system desktop.
:::
