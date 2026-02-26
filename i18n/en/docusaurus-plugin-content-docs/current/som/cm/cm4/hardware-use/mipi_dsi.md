---
sidebar_position: 6
---

# MIPI DSI Interface

The Radxa CM4 IO Board features one 4-lane MIPI DSI interface for connecting DSI displays.

## Compatibility List

| Board              | DSI Display                                                           |
| ------------------ | --------------------------------------------------------------------- |
| Radxa CM4 IO Board | [Display 8HD](https://radxa.com/products/accessories/display-8hd)     |
| Radxa CM4 IO Board | [Display 10FHD](https://radxa.com/products/accessories/display-10fhd) |

:::tip Interface Location
You can refer to the [Hardware Information](./hardware_info.md) guide to find the corresponding hardware interface locations.
:::

## Hardware Connection

Connect your DSI display to the motherboard's MIPI DSI interface as follows:

1. Connect to the motherboard's MIPI DSI interface with the gold fingers (metal contacts) facing toward the motherboard.

2. Connect to the display interface with the gold fingers (metal contacts) facing toward the display.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/cm4/cm4_io_display.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Software Configuration

Enter the following command in the terminal to use the Rsetup tool for display configuration:

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

2. Use the arrow keys to select "Manage overlays" and press Enter to confirm.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/rsetup-overlays-manage.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

3. Use the arrow keys to select the corresponding Display option, press Space to enable it (indicated by a `*`), then press Enter to confirm.

   - For Display 8HD → Select `Enable Radxa Display 8HD` option
   - For Display 10FHD → Select `Enable Radxa Display 10FHD` option

4. Reboot the system for the changes to take effect.

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
