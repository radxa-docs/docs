---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/general/_etcherV2.mdx
---

import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install OS to microSD Card

This article explains how to install the operating system to a microSD card and boot the system from it on ROCK 3B.

## File Download

Download the [ROCK 3B system image](../../download) from the resource download page.

## microSD card preparation

Insert the microSD card into the SD card reader, and then insert the card reader into the USB port of your PC.

## Image burning

<Etcher/>

## Boot the system

After successfully burning the microSD Card according to the above steps, insert the microSD Card into the microSD Card slot (as shown in the picture below), then power on the system, the system will start booting and HDMI will display the desktop.

<img
src="/img/rock3/3b/rock3b-sd-slot.webp"
alt="sd slot"
style={{ width: "60%"}}
/>

## Logging in to the system

After the system boots up, log in using the radxa account with the password radxa.

:::tip
The whole process lasts about 40 seconds from powering on the system to booting it up, and then entering the system desktop.
:::
