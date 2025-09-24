---
sidebar_position: 6
---

# MIPI DSI Interface

The Radxa Cubie A5E features one onboard 4-lane MIPI DSI interface for connecting DSI displays.

## Compatibility List

| Board | DSI Display |
| ----- | ----------- |
|       |             |

:::tip Interface Location
You can refer to the [Hardware Information](./hardware_info.md) tutorial to locate the corresponding hardware interface.
:::

## Hardware Connection

To connect a display using the MIPI DSI interface, follow these steps:

①. Connect to the board's MIPI DSI interface with the golden fingers (metal contacts) facing toward the board

②. Connect to the display interface with the golden fingers (metal contacts) facing toward the display

## Software Enablement

Enter the `rsetup` command in the terminal to configure display options using the Rsetup tool.

<NewCodeBlock tip="radxa@device$" type="device">

```
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
