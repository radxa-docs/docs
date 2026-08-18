---
sidebar_position: 1
---

# RF Antenna

Radxa ZERO 3W has an onboard Radxa D8 / AP6212 WiFi&BT module, an onboard antenna and an external antenna holder. The onboard antenna is used by default. You can freely choose to use the onboard antenna or an external antenna through the overlay.

![zero3w antenna1 ](/img/zero/zero3/zero3w-antenna1.webp)

- **1: Onboard antenna**
- **2: External antenna**

## External antenna connector specifications

| Item | Specification |
| ---- | ------------- |
| Connector type | U.FL (compatible with IPEX MHF1 / 1st-gen IPEX) |
| Characteristic impedance | 50Ω |
| Compatible antenna | U.FL / IPEX MHF1 antenna (WiFi 2.4GHz / 5GHz dual-band) |

## Use external antenna

If you need to use an external antenna, you need to enable the external antenna overlay, Use rsetup [Device Tree Configuration](../os-config/rsetup#overlays).

```bash
sudo rsetup
```

![zero3w antenna2 ](/img/zero/zero3/zero3w-antenna2.webp)
