---
sidebar_position: 2
---

# Radxa 10-inch HD Touch Screen User Guide

You'll need to use a dedicated FPC cable to connect the motherboard and touch screen. After confirming the hardware connection is correct, use the Rsetup tool to enable the 10-inch display.

## Hardware Requirements

- FPC cable
- Radxa 10-inch HD touch screen
- Compatible single-board computer

## Hardware Connection

Connect the touch screen using the motherboard's MIPI DSI interface. The connection method is as follows (using ROCK 4D as an example, other motherboards are similar):

①: Connect to the motherboard's MIPI DSI interface with the gold fingers (metal contacts) facing toward the motherboard

②: Connect to the display's interface with the gold fingers (metal contacts) facing toward the display

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-dsi.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Software Configuration

Enter the `rsetup` command in the terminal to configure the display settings using the Rsetup tool.

<NewCodeBlock tip="radxa@device$" type="device">
```
rsetup
```
</NewCodeBlock>

1. Use the arrow keys to select the `Overlays` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-overlays-dsi-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Use the arrow keys to select the `Manage overlays` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-overlays-dsi-2.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Use the arrow keys to select the `Enable Radxa Display 10 HD` option, then press the Spacebar to check the `Enable Radxa Display 10HD` option, and finally press Enter to confirm.

:::tip
A `*` in the checkbox indicates the option is enabled.
:::

4. Reboot the system for the changes to take effect. The display should now work properly.
