---
sidebar_position: 3
---

# Radxa Display 8 HD
Prepare the Radxa Display 8HD, Radxa Display 10HD or Radxa Display 10FHD and connect it to the LCD1 connector of the Radxa CM5 IO board via FPC cable.

## Take the example of connecting a radxd 8 inch display

![display-install-01](/img/rock5b/rock5b-display-8hd-FPC.webp)  
![Display Installation-02](/img/cm5/cm5io-display-8hd-connected.webp)

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the ``rsetup`` command:

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- Via [device tree configuration](../radxa-os/sys-config/rsetup#overlays) to enable Overlay for the Renesas 8" touchscreen.

:::caution [Note]

1. Please enable the `[] Enable Radxa Display 8HD on DSI1` item Overlay.
2. Exit and reboot after enabling the `[*] Enable Radxa Display 8HD on DSI1` successfully for the configuration to take effect.

:::
