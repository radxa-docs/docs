---
sidebar_position: 10
---

# MIPI CSI Interface

The Dragon Q6A board features **3** MIPI CSI interfaces for connecting MIPI cameras:

- **1 x 4-lane MIPI CSI**: Radxa 31-Pin / 0.3mm pitch FPC connector
- **2 x 2-lane MIPI CSI**: Raspberry Pi 15-Pin / 1.0mm pitch FPC connector (pin-compatible with the official Raspberry Pi 15P CSI camera standard)

## Interface Overview

| Interface  | Lanes | Connector Type                  | Notes                                                                               |
| :--------- | :---: | :------------------------------ | :---------------------------------------------------------------------------------- |
| 4-lane CSI |   4   | Radxa 31-Pin / 0.3mm FPC        | For high-resolution cameras (4K / 12M 577 / 13M 214)                                |
| 2-lane CSI |   2   | Raspberry Pi 15-Pin / 1.0mm FPC | Pin-compatible with the official Raspberry Pi 15P CSI camera standard; 2 connectors |

## Compatible Cameras

- [Radxa Camera 4K](../accessories/camera-4k.md)
- [Radxa Camera 8M 219](../accessories/camera-8m-219.md)
- [Radxa Camera 12M 577](../accessories/camera-12m-577.md)
- [Radxa Camera 13M 214](../accessories/camera-13m-214.md)

The [Q6A connection guide](../accessories/camera-4k.md) for Radxa Camera 4K uses the 31-pin, 4-lane connector. Raspberry Pi pin compatibility on the 15-pin, 2-lane connectors does not mean that this 31-pin module can connect directly. The guide does not provide an adapter, power arrangement, or software configuration for connecting it to the 15-pin connectors (CAM2/CAM3). Do not infer module compatibility with those connectors from the IMX415 sensor's 2-lane capability alone.

## Interface Pin Definition

Refer to the hardware schematic diagram on the [Resource Summary Download](../download) page.
