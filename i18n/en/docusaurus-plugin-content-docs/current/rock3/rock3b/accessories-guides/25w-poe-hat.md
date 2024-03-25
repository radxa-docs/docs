---
sidebar_position: 55
---

# 25W PoE HAT Usage

## List of Accessories

- As shown

![25W PoE pkg](/img/accessories/poe-hat/25w-poe-pkg.webp)

## Installation Procedure

Please refer to [Radxa 25W PoE HAT](/i18n/en/docusaurus-plugin-content-docs/current/accessories/radxa-25w-poe.md)

## Fan Speed Adjustment

### Enable 25W PoE Overlay

If you need to enable the fan and temperature sensor, you need to enable the corresponding Overlay.

Please refer to [Device Tree Configuration](../os-config/rsetup#overlays) to enable the overlay named "Enable Radxa 25W PoE HAT".

```bash
  [*] Enable Radxa 25W PoE HAT
```

Finally, reboot the device to enable the overlay.

:::info
If you cannot find the corresponding Overlay in `rsetup`, please refer to [System Update Guide](../os-config/rsetup#system-update) to update the system first and then do the steps above.
:::

### Check the Temperature Sensor's function

After executing the following command, the second line outputs `t=XXYYYY` which is the current temperature (XX.YYY degrees Celsius):

```bash
cat /sys/bus/w1/devices/28-*/w1_slave
```
