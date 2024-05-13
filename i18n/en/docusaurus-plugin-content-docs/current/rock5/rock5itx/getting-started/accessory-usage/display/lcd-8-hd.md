---
sidebar_position: 1
---

# Radxa 8" HD touchscreen

! [Radxa Display 8 HD](/img/accessories/display-8-hd.webp)

## Overview

The Radxa Display 8 HD is a colour active matrix LCD module with touchscreen, designed for Radxa single board computers.
This 8.0-inch display allows you to create interactive projects such as tablet PCs, industrial HMIs, information dashboards, and more. With a single cable for power, display, and touch, as well as an enabled software on-screen keyboard, the Radxa Display 8 HD gives you a complete HMI without the need to connect a keyboard or mouse.
In addition, the built-in sensors on the display can be used for automatic portrait or landscape rotation. It has the following features:

- 8.0-inch LCD display
- 800 x 1280, 16.7M colour resolution
- Full viewing angle LCD
- 5-point capacitive touchscreen
- Supports PWM brightness control
- Supports colour enhancement
- Built-in gravity sensor for portrait/landscape rotation

## LCD

### Features

- Effective range: 107.64(H) x 172.224(V) mm
- Pixel Pitch: 0.04485(W) x 3 x 0.13455(H)
- Pixel arrangement: RGB vertical stripes
- Display colour: 16.7M
- Display Mode: Normal Black
- Viewing angle: full angle
- Brightness (cd/m2): 300 cd/m2
- Contrast ratio: 1000 (typical)
- Surface Finish: Anti-glare
- Interface: MIPI
- Backlight: White LED
- Input Voltage: 1.8V
- Operating Temperature: -20 to 60°C
- Storage Temperature: -30 to 60°C

## Touch

Radxa Display 8 HD touch panels are driven by the GT911, a next-generation 5-point capacitive touch solution designed for 7" to 8" panels.
It consists of up to 26 emitter electrodes and 14 receiver electrodes for greater touch accuracy.
The GT911 supports up to 5 points of concurrent touch, tracking the exact position and movement trajectory and touch area in real time. In addition, it can report this information to the host computer as needed.

### Features

- Built-in capacitive sensing circuitry and high performance MPU
  - Reporting rate: 100Hz
  - Real-time output of touch coordinates
  - Unified software for capacitive touch panels of various sizes
- Capacitive Touch Sensor
- Channel: 26 (Tx channel)\* 14 (Rx channel)
  - Supported Cover Lens Thickness: 0.55mm ≦ Glass ≦ 2mm,0.5mm ≦ PMMA ≦ 1.2mm
  - Adaptive Frequency Hopping
  - Support OGS Full Lamination
- Environmental Adaptation
  - Self-calibration during initialisation
  - Automatic drift compensation
- Response Time
  - Green mode: \<48ms
  - Sleep mode: \<200ms
  - Initialisation: \<200ms

## Pinout

| PIN | Name     | Description                    | PIN | Name     | Description                          |
| --- | -------- | ------------------------------ | --- | -------- | ------------------------------------ |
| 1   | NC       | No connection                  | 21  | MIPI_3P  | +MIPI differential data input        |
| 2   | VDD      | 3.3V                           | 22  | GND      | Ground                               |
| 3   | VCCIO    | IO VCC (1.8V-3.3V)             | 23  | GND      | Ground                               |
| 4   | NC       | INT 1                          | 24  | TP_RESET | External interrupt to the host Reset |
| 5   | Reset    | RESET                          | 25  | TP_VCC   | Power                                |
| 6   | NC       | INT 2                          | 26  | TP_INT   | External Low is active               |
| 7   | GND      | Ground                         | 27  | TP_SDA   | I2C data input and output            |
| 8   | MIPI_0N  | -MIPI differential data input  | 28  | TP_SCL   | I2C clock input                      |
| 9   | MIPI_0P  | +MIPI differential data input  | 29  | GND      | Ground                               |
| 10  | GND      | Ground                         | 30  | GND      | Ground                               |
| 11  | MIPI_1N  | -MIPI differential data input  | 31  | VDD      | VDD 3.3V                             |
| 12  | MIPI_1P  | +MIPI differential data input  | 32  | VDD      | VDD 3.3V                             |
| 13  | GND      | Ground                         | 33  | GND      | Ground                               |
| 14  | MIPI_CKN | -MIPI differential clock input | 34  | GND      | Ground                               |
| 15  | MIPI_CKP | +MIPI differential clock input | 35  | LED-     | LED Cathode                          |
| 16  | GND      | Ground                         | 36  | LED-     | LED Cathode                          |
| 17  | MIPI_2N  | -MIPI differential data input  | 37  | NC       | No connection                        |
| 18  | MIPI_2P  | +MIPI differential data input  | 38  | NC       | No connection                        |
| 19  | GND      | Ground                         | 39  | LED+     | LED Anode                            |
| 20  | MIPI_3N  | -MIPI differential data input  | 40  | LED+     | LED Anode                            |

## Physical Specifications

![Radxa Display 8 HD](/img/accessories/rock5a-display-8hd-spec.webp)

## Tutorials

### Connections

Connect the ROCK 5 ITX via FPC cable as shown in the picture:

<img src="/img/accessories/8hd-connect-fpc.webp" alt="Radxa Display 8 HD"/>

### Enabling Overlay

- Open the Kconsole terminal via the Application Launcher in the lower left corner, and run the `rsetup` command:

```bash
radxa@rock-5itx:~$ rsetup
```

- Enable Overlay for the Radxa 4K camera via the [device tree configuration](../os-config/rsetup#overlays).

:::tip

1. Please enable the `[] Enable Radxa Display 8HD on LCD0` item Overlay.
2. Quit and reboot after enabling `[*] Enable Radxa Display 8HD on LCD0` successfully for the configuration to take effect.

:::

### Test

After reboot, the Radxa 8" Full HD touchscreen is able to display the system screen and supports touch.
