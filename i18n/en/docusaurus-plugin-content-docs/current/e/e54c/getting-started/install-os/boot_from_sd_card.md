---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: local
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/e/e54c/_image.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/common/general/_etcherV2.mdx
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Installing the System to a MicroSD Card

## File Download

Please go to the [Image Download Page](../../download) to download the corresponding operating system image.

## MicroSD Card Preparation

Insert the MicroSD card into an SD card reader, then plug the reader into a USB port on your PC.

## Image Flashing

<Etcher/>

## Starting the System

After successfully flashing the MicroSD Card following the steps above, insert the MicroSD Card into the MicroSD Card slot (the SD card slot is shown on the right side of the image below), then power on the device. The system will begin to boot and the power indicator light will start flashing.

<img src="/img/e/e54c/radxa-e54c-insert-sd.webp" width="500" alt="radxa-e54c pack" />

## Logging into the System

If you're booting with a Debian system, the default username is radxa and the password is radxa.

If you're booting with an iStoreOS system, the default username is root and the password is password.
