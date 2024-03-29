---
sidebar_position: 3
---

# RPI 7 inch Display

Radxa CM5 IO LCD0 interface, using reverse 15pin cable, compatible with 5" and 7" screens.

## Take connecting a Raspberry Pi 7 inch Display as an example:

- Prepare the RPI 7 inch Display and connect it to the Radxa CM5 IO via the 15pin reverse FPC cable.

![display-install-01](/img/cm5/cm5io-rpi-display-7inch-FPC.webp)  
![Display Installation-02](/img/cm5/cm5io-rpi-display-7inch-connected.webp)

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the `rsetup` command:

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- Via [device tree configuration](../radxa-os/sys-config/rsetup#overlays) to enable Overlay on the Raspberry Pi 7" screen.

:::caution [Caution]

1. Please enable the `[] Enable Raspberry Pi 7-inch Touchscreen on DSI0` item Overlay.
2. Exit reboot after `[*] Enable Raspberry Pi 7-inch Touchscreen on DSI0` is successfully displayed for the configuration to take effect.

:::
