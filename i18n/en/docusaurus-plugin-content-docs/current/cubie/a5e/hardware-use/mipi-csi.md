---
sidebar_position: 6
---

# MIPI CSI Interface

The Radxa Cubie A5E features one onboard 4-lane MIPI CSI interface (which can be split into two 2-lane MIPI CSI interfaces) for connecting CSI cameras.

## Compatibility List

| Board | CSI Camera |
| ----- | ---------- |
|       |            |

:::tip Interface Location
You can refer to the [Hardware Information](./hardware-info.md) tutorial to locate the corresponding hardware interface.
:::

## Hardware Connection

To connect a camera using the MIPI CSI interface, follow these steps:

1. Connect to the board's MIPI CSI interface with the golden fingers (metal contacts) facing toward the board

2. Connect to the display interface with the golden fingers (metal contacts) facing toward the display

## Software Enablement

Enter the `rsetup` command in the terminal to configure display options using the Rsetup tool.

<NewCodeBlock tip="radxa@device$" type="device">

```bash
rsetup
```

</NewCodeBlock>

1. Use the arrow keys to select the "Overlays" option, then press Enter to confirm.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/rsetup-overlays.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

2. Use the arrow keys to select the "Manage overlays" option, then press Enter to confirm.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/rsetup-overlays-manage.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

3. Use the arrow keys to select the corresponding Display option, press Space to enable it (indicated by a `*`), then press Enter to confirm.

4. Reboot the system for the changes to take effect.

## Interface Pin Definition

For the hardware schematic, please refer to the [Resource Downloads](../download.md) page.
