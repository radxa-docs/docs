---
sidebar_position: 3
---

# Radxa Display 8 HD

![Display Installation-01](/img/rock5b/rock5b-display-8hd-FPC.webp)  
![Display Installation-02](/img/rock5b/rock5b-display-8hd-connected.webp)

- Prepare the Radxa Display 8HD or Radxa Display 10HD and connect it to the ROCK 5B via the FPC cable.

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the `rsetup` command:

```bash
radxa@rock-5b:~$ rsetup
```

- Pass the [device tree configuration] (../os-config/rsetup#overlays) to enable Overlay for the Radxa 8" touchscreen.

:::caution [Caution]

1. Please enable the `[] Enable Radxa Display 8 HD` item Overlay. 2.
2. Quit and reboot after successfully enabling the display of `[*] Enable Radxa Display 8 HD` for the configuration to take effect.

:::
