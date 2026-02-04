---
sidebar_position: 1
---

import BalenaEtcherUse from '../../../../common/radxa-os/install-system/\_use_etcher_sd.mdx';

# Install the System to a microSD card

<BalenaEtcherUse />

## Boot the system

① Insert the microSD card into the microSD slot

② Connect a monitor using a USB‑C to HDMI/DP cable

③ Connect keyboard/mouse via USB‑A (use a USB hub if needed)

④ Power the board with a 5V USB‑C power adapter

If power is OK, the power LED turns green. If the system boots, the status LED blinks blue.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7s/a7s-quickly-start.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After booting successfully, you should see the desktop. Log in using the credentials below.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/common/radxa-os/system-config/vnc-debian11-succ.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Default credentials

For official system images:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Log in

Log in with the default credentials.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-desktop.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Use the system

After booting successfully, you can start using Radxa OS on Cubie A7S. See [System configuration](../../system-config) for basic usage.
