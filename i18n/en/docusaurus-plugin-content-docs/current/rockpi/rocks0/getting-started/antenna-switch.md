---
sidebar_position: 10
---

# Antenna Switch

ROCK S0 has AP6212(WiFi&BT) module on board, there is one on-board antenna and one external antenna connector, you can choose to use on-board antenna or external antenna by overlay.

** The default is to use the on-board antenna. **

![rocks0 antenna1](/img/rockpi/s0/rock-s0-antenna.webp)

- **1: On-board antenna**
- **2: External antenna**

## Using External Antenna

If you need to use external antenna, you need to enable the overlay of the external antenna, using [rsetup](../os-config/rsetup.md)。

```bash
sudo rsetup
```

![rocks0 antenna2](/img/rockpi/s0/rock-s0-antenna2.webp)
