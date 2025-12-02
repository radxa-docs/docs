---
sidebar_position: 5
---

# Radxa Display 8 HD

![Radxa Display 8 HD](/img/accessories/display/display-8-hd.webp)

## Overview

Radxa Display 8 HD is a color active matrix LCD module with touch panel designed specifically for Radxa Single Board Computers. This 8.0 inch display lets you create interactive projects such as tablets, industrial HMI, information dashboards and so on. With a single cable for power, display and touch, and enabled software on‑screen keyboard, the Radxa Display 8 HD gives you full human computer interface without the need to connect a keyboard or mouse. Additionally, a built‑in gensor on the display can be used for automatically potrail or landscape rotation. It has the following features:

- 8.0 inch LCD
- 800 x 1280, 16.7M colors resolution
- Full angle viewing LCD
- 5‑Point capacitive touch panel
- Support PWM brightness control
- Support Color enhancement
- Built‑in g‑sensor for potrail/landscape rotation

## LCD

### Features

- Active area: 107.64(H) x 172.224(V) mm
- Pixel Pitch: 0.04485(W) x 3 x 0.13455(H)
- Pixels arrangement：RGB vertical stripe
- Display color: 16.7M
- Display Mode: Normally Black
- Viewing Direction: All angle viewing
- Luminance (cd/㎡): 300 type cd/㎡
- Contrast Ratio: 1000(typical)
- Surface Treatment: Anti‑glare
- Interface: MIPI
- Backlight: White LED
- Input voltage: 1.8 V
- Operation Temperature: ‑20 to 60℃
- Storage Temperature: ‑30 to 60℃

## Touch

The Radxa Display 8 HD touch panel is powered by GT911, a new‑generation 5‑point capacitive touch solution designed for 7” to 8” panels, consists of up to 26 transmitter electrodes and 14 receiver electrodes to provide higher touch accuracy. GT911 supports up to 5 concurrent touches with real‑time tracking of accurate position and motion trajectory as well as touch area. Furthermore, it is able to report such information to the host as required.

### Features

- Built‑in capacitive sensing circuit and high‑performance MPU
  - Report rate: 100Hz
  - Outputs touch coordinates in real time
  - Unified software applicable to capacitive touch screens of various sizes
- Capacitive touch sensor
- Channels: 26 (Tx channels) \* 14 (Rx channels)
  - Cover Lens thickness supported: 0.55mm ≦ Glass ≦ 2mm,0.5mm ≦ PMMA ≦ 1.2mm
  - Adaptive frequency hopping
  - Supports OGS full lamination
- Environmental adaptability
  - Self‑calibration during initialization
  - Automatic drift compensation
- Response time
  - Green mode: \<48ms
  - Sleep mode: \<200ms
  - Initialization: \<200ms

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

## Mechanical Specification

![Radxa Display 8 HD](/img/accessories/display/display-8-hd-spec.webp)
