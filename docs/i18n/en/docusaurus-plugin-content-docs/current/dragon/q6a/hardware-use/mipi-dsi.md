---
sidebar_position: 11
---

# MIPI DSI Interface

Radxa Dragon Q6A features one 4-lane MIPI DSI interface for connecting MIPI displays.

## Supported Displays

| Model | Size (inches) | Resolution |
| :--- | :---: | :---: |
| [Radxa Display 10 FHD](https://radxa.com/products/accessories/display-10fhd) | 10.1 | 1200×1920 |
| [Radxa Display 8 HD](https://radxa.com/products/accessories/display-8hd) | 8 | 800×1280 |

## Hardware Connection

Connect the MIPI display to Dragon Q6A's MIPI DSI interface using an FPC ribbon cable.

:::tip Interface Location
Refer to the [Hardware Information](./hardware-info) tutorial to locate the corresponding hardware interface.
:::

## Interface Pin Definition

Refer to the hardware schematic in the [Resource Download](../download) page.

## Known Issues and Solutions

### Radxa Display 8 HD Boot Issue

Some users have encountered boot failure issues (blue light stays on then blinks, no display output) after enabling the Radxa Display 8 HD DSI overlay.

**Cause:**
This is a known compatibility issue related to specific kernel versions.

**Affected versions:**
- `linux-image-6.18.2-3-qcom` and earlier versions

**Solution:**
1. Check current kernel version:
   ```bash
   apt policy linux-image-6.18.2-4-qcom
   ```
2. If `linux-image-6.18.2-4-qcom` is available, update the system:
   ```bash
   sudo apt update
   sudo apt upgrade
   ```
3. Reboot the system

**If the issue persists:**
- Temporarily disable DSI overlay and wait for [linux-qcom](https://github.com/radxa-pkg/linux-qcom/releases) to release a fix
- You can access the system via serial port or recovery mode to disable the overlay

**Note:** This issue only affects the DSI overlay for Radxa Display 8 HD. Radxa Display 10 FHD and other functions are not affected.