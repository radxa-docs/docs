---
sidebar_position: 8
---

# U-Boot Button

The Radxa Cubie A7Z features an onboard U-Boot button for entering FEL mode.

:::info Button Location
For the specific location of the U-Boot button, please refer to the interface description section in the [Hardware Interface](./hardware-info) tutorial!
:::

## Usage Guide

FEL is a low-level boot and firmware update mode in Allwinner chips, primarily used for system recovery or debugging when the device cannot boot from conventional storage media.

### Entering FEL Mode

To enter FEL mode, press and hold the U-Boot button on the Cubie A7Z before powering on the board, then release the button after power is applied.

1. Press and hold the U-Boot button on the Cubie A7Z

2. Connect the Cubie A7Z's USB Type-C port to your PC's USB Type-A port using a USB Type-A to Type-C cable

3. Release the U-Boot button on the Cubie A7Z

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7z/a7z-fel-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Interface Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
:::
