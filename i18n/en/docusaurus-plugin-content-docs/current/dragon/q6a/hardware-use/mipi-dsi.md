---
sidebar_position: 11
---

# MIPI DSI Interface

The Dragon Q6A has one 4-lane MIPI DSI interface on board for connecting MIPI displays.

## Supported Displays

|                                    Model                                     | Size (in inches) | Resolution |
| :--------------------------------------------------------------------------: | :--------------: | :--------: |
| [Radxa Display 10 FHD](https://radxa.com/products/accessories/display-10fhd) |       10.1       | 1200\*1920 |
|   [Radxa Display 8 HD](https://radxa.com/products/accessories/display-8hd)   |        8         | 800\*1280  |

:::note
Only the Radxa official displays listed above are supported. Third-party displays (e.g., the Raspberry Pi 7\" touchscreen) are not officially adapted: even if a physical connection is made with an adapter cable, display and touch functionality depend on whether the system image includes a matching panel driver / device tree, and compatibility cannot be guaranteed.
:::

## Hardware Connection

Connect the MIPI display to the Dragon Q6A's MIPI DSI interface (39-Pin / 0.3mm pitch FPC connector) via an FPC ribbon cable.

:::tip Interface Location
Refer to the [Hardware Information](./hardware-info) tutorial to locate the corresponding hardware interface.
:::

## Interface Pin Definition

Refer to the hardware schematic diagram on the [Resource Summary Download](../download) page.
