---
sidebar_position: 4
---

# Power Key

Radxa Cubie A7A features an onboard power key, used to control the power of the Cubie A7A.

:::tip
For the exact location of the power key, please refer to the interface description section in the [Hardware Interfaces](./hardware-info) guide!
:::

## Usage Guide

When the Cubie A7A is powered on, the power indicator (green) will light up; when powered off or shut down, the power indicator (green) will turn off.

- Short press the power key:

  - Default behavior:
    - If no display is connected, a short press will directly shut down the device.
    - If a display is connected, a short press will bring up the power menu options.
  - Custom behavior: - You can customize the power key function via `① : System Settings` -> `② : Power Management` -> `③ : Energy Saving` -> `④ : Button events handling`, then click `⑤ : Apply` to save the settings.
  <div style={{ textAlign: "center" }}>
    <img
      src="/en/img/common/radxa-os/system-config/power-button-function.webp"
      style={{ width: "100%", maxWidth: "1200px" }}
    />
  </div>

- Long press the power key:

Triggers a reboot of the Cubie A7A.

## Port Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
