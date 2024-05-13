---
sidebar_position: 2
---

# Radxa 10" Full HD Touchscreen

![Radxa Display 10 FHD](/img/accessories/display-10-fhd.webp)

## Overview

The Radxa Display 10 FHD supports 10-point touch and has a 10.1-inch (10:16) display area with a resolution of 1200 × 1920 pixels.

Its features are as follows:

- Size: 10.1 inches
- RoHS compliant design
- Overall dimensions: 155 mm (H) x 246.16 mm (W) x 5.95 mm (D)
- Display area: 135.36 mm (W) x 216.58 mm (H)
- Number of pixels: 1200 (horizontal) x 1920 (vertical) pixels
- Pixel Pitch: 0.0564 mm (horizontal) x 0.1692 mm (vertical)
- Pixel arrangement: RGB vertical stripes
- Colour filter array: RGB vertical stripe
- Backlight: White LED
- Interface: MIPI
- Built-in gravity sensor

## Signal Definition

| PIN | Name     | Description                                | PIN | Name     | Description                            |
| --- | -------- | ------------------------------------------ | --- | -------- | -------------------------------------- |
| 1   | NC       | No connection                              | 21  | MIPI_3P  | +MIPI differential data input          |
| 2   | VDD      | Power Voltage for digital circuit 3.3V     | 22  | GND      | Ground                                 |
| 3   | VCCIO    | Power Voltage for digital circuit 1.8V[^1] | 23  | GND      | Ground                                 |
| 4   | INT1     | INT 1                                      | 24  | TP_RESET | External interrupt to the Host Reset   |
| 5   | Reset    | Global Reset Pin 1.8V[^1]                  | 25  | TP_VCC   | Power Voltage for digital circuit 3.3V |
| 6   | INT2     | INT 2                                      | 26  | TP_INT   | External Low is active                 |
| 7   | GND      | Ground                                     | 27  | TP_SDA   | I2C data input and output              |
| 8   | MIPI_0N  | -MIPI differential data input              | 28  | TP_SCL   | I2C clock input                        |
| 9   | MIPI_0P  | +MIPI differential data input              | 29  | GND      | Ground                                 |
| 10  | GND      | Ground                                     | 30  | GND      | Ground                                 |
| 11  | MIPI_1N  | -MIPI differential data input              | 31  | VDD      | Power Voltage for digital circuit 3.3V |
| 12  | MIPI_1P  | +MIPI differential data input              | 32  | VDD      | Power Voltage for digital circuit 3.3V |
| 13  | GND      | Ground                                     | 33  | GND      | Ground                                 |
| 14  | MIPI_CKN | -MIPI differential clock input             | 34  | GND      | Ground                                 |
| 15  | MIPI_CKP | +MIPI differential clock input             | 35  | LED-     | Power for LED backlight (Cathode)      |
| 16  | GND      | Ground                                     | 36  | LED-     | Power for LED backlight (Cathode)      |
| 17  | MIPI_2N  | -MIPI differential data input              | 37  | NC       | No connection                          |
| 18  | MIPI_2P  | +MIPI differential data input              | 38  | NC       | No connection                          |
| 19  | GND      | Ground                                     | 39  | LED+     | Power for LED backlight (Anode)        |
| 20  | MIPI_3N  | -MIPI differential data input              | 40  | LED+     | Power for LED backlight (Anode)        |

[^1]: The 3 PIN and 5 PIN should be the same as 1.8v or 3.3v

## Mechanical specifications

! [Radxa Display 10 FHD](/img/accessories/display_10_fhd_01.webp)

## Tutorials

### Connections

Connect the ROCK 5 ITX via FPC cable as shown in the picture:

<img src="/img/rock5itx/rock5itx-lcd0.webp" alt="rock5itx lcd0" width="700" />

### Enabling Overlay

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the `rsetup` command:

```bash
radxa@rock-5itx:~$ rsetup
```

- Enable Overlay for the Radxa 8" touchscreen via the [Device Tree Configuration] (../../os-config/rsetup#overlays).

:::tip

1. Please enable `[] Enable Radxa Display 10FHD on LCD0` item Overlay. 2.
2. Quit and reboot after enabling `[*] Enable Radxa Display 10FHD on LCD0` successfully for the configuration to take effect.

:::

### Test

After reboot, the Radxa 10" FHD touchscreen is able to display the system screen and supports touch.
