---
sidebar_position: 12
---

# Fan Interface

The Radxa Fogwise® AIRbox Q900 features an onboard fan interface for connecting cooling fans.

:::tip Metal Enclosure

The Radxa Fogwise® AIRbox Q900 metal enclosure comes with a built-in PWM fan.

:::

## Hardware Connection

Connect the PWM fan interface of the metal enclosure to the fan interface on the Radxa Fogwise® AIRbox Q900.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-fan-connect.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Software Enablement

Use the built-in Rsetup tool in Radxa OS to enable the fan, and it is recommended to control the fan with a thermal governor.

:::tip Rsetup Usage Guide

- Highlight an option: the selected item is highlighted
- Confirm: press `Enter`
- Cancel: press `ESC`
- Navigate: use `Up`, `Down`, `Left`, `Right`
- Multi-select: press `Space` to select and `Enter` to confirm; after enabling a function, a `*` appears in the option box

:::

Run `rsetup` in the terminal to start the Rsetup tool:

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```bash
rsetup
```

</NewCodeBlock>

In Rsetup, go to `Hardware` -> `Thermal governor`.

1. Use the arrow keys to find the [ ] `step_wise` option
2. Press `Space` until it shows [*] `step_wise` to select it
3. Press `Enter` to confirm and save the settings to enable thermal fan control.
