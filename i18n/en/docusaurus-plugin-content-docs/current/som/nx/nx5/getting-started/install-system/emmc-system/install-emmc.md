---
sidebar_position: 10

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/radxa-os/rkdevtool/_emmc.mdx
---

import EMMC from '../../../../../../common/radxa-os/rkdevtool/\_emmc.mdx';

# Install System to Onboard eMMC

## Flash System

<EMMC download_page="../../../download"/>

## Boot the System

After the system installation is complete, connect the HDMI display, then re-plug the power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-emmc-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

①: Connect the display and the board using an HDMI or DP cable

②: Connect a mouse or keyboard using the USB-A interface

③: Power the board using a 5V DC power adapter

If the board is powered normally, the Radxa NX5 system indicator LED and the Radxa NX5 IO Board power indicator LED will light up green. If the system boots normally, the Radxa NX5 system indicator LED will blink green, and the Radxa NX5 IO Board status indicator LED will blink blue.

## Log In

When you first boot the system, you need to log in using the default username and password.

The default credentials for Radxa OS are:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |
