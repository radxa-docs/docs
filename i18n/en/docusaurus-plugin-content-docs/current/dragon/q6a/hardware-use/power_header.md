---
sidebar_position: 2
---

# Power Interface

The Dragon Q6A supports three power supply methods:

① Power supply via standard 12V Type-C interface (recommended)

② Power supply via 12V external power input interface

③ Power supply via PoE+ HAT (not described here)

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_power.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

## Hardware Connection

### Power supply via 12V USB Type-C port (recommended)

Use a standard 12V USB Type-C power adapter (compatible with PD protocol) to connect to the USB Type-C port on the motherboard.

:::tip Recommended accessories

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard 12V Type-C power adapter, recommended current 2A or above
  :::

### Powered by a 12V external power supply input interface

Connect the positive and negative terminals of the 12V power supply to the 12V and GND pins on the motherboard.

:::danger
Please do not connect the power supply incorrectly or backwards, as improper operation may result in damage to the device hardware.
:::

## Normal startup

After the system starts up normally, the green power indicator light stays on and the blue power indicator light flashes.

## Interface Pin Definitions

Please refer to the hardware schematic diagram on the [Resource Summary Download](../download) page.
