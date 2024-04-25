---
sidebar_position: 3
---

# Display

<img src=“/img/rock5itx/rock5itx-lcd0.webp” alt=“rock5itx lcd0” width=“700” />

- Prepare the Radxa Display 8HD or Radxa Display 10HD and connect it to the ROCK 5ITX via the FPC cable.

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the `rsetup` command:

``bash
radxa@rock-5itx:~$ rsetup
```

- Pass the [device tree configuration] (... /os-config/rsetup#overlays) to enable Overlay for the Rxa 8” touchscreen.

:::caution [Caution]

1. Please enable the `[] Enable Radxa Display 8HD on LCD0` item Overlay. 2.
2. Quit and reboot after enabling the `[*] Enable Radxa Display 8HD on LCD0` successfully for the configuration to take effect.

:::
