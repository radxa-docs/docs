---
sidebar_position: 5
---

# Radxa eMMC Module

Radxa eMMC Module uses the eMMC 5.1 specification and offers four capacity options: 16G / 32G / 64G / 128G. At the same time, you can choose models that support industrial-grade long life. In addition, this module supports JEDEC's standard eMMC command set and is designed for high-speed read and write, making data transfer faster.

![eMMC Module](/img/accessories/storage/emmc-module.webp)

### Read / write speed test

The eMMC chip we use is branded as Foresee, by Longsys, a Shenzhen embedded storage company, who acquired Lexar Brand in 2017.

Below is the test we did on different brand eMMC chips.

| Capacity | Brand       | Read    | Write    |
| -------- | ----------- | ------- | -------- |
| 8G       | Sandisk     | 270MB/s | 39.4MB/s |
| 16G      | Sandisk     | 230MB/s | 79.6MB/s |
| 16G      | Kingston    | 160MB/s | 50.1MB/s |
| 16G      | **Foresee** | 189MB/s | 74.4MB/s |
| 16G      | **Foresee** | 241MB/s | 79.5MB/s |
| 32G      | Sandisk     | 263MB/s | 139MB/s  |
| 32G      | Samsung     | 263MB/s | 78.3MB/s |
| 32G      | Kingston    | 152MB/s | 87.2MB/s |
| 64G      | Sandisk     | 207MB/s | 100MB/s  |
| 64G      | **Foresee** | 215MB/s | 148MB/s  |
| 64G      | **Foresee** | 194MB/s | 148MB/s  |
| 128G     | Toshiba     | 217MB/s | 143MB/s  |

## Specifications

- JEDEC Standard: v5.1
- B2B Connector specification: GB042-34S-H10 (socket-34pin) + GB042-30S-H10 (socket-30pin)
- Storage Options: 16G / 32G / 64G / 128G
- Compatibility: Compatible with ROCK 3A / 3B / 3C / 4A / 4B / 4C / 4C PLUS / 4D\* / 4SE / 5A / 5B
- Dimension: 13mm x 18mm x 1.5mm

> **Note:** Due to the pin multiplexing limitation, the ROCK 4D version with SPI Flash does not support the eMMC module.

[**Buy Now**](https://radxa.com/products/accessories/emmc-module#buy)

## Pinout

### GB042-34S-H10 (Socket - 34 pin)

Primarily used for signal transmission.

| Signal      | Pin | Pin | Signal   |
| ----------- | --- | --- | -------- |
| GND         | 1   | 18  | GND      |
| EMMC D5     | 2   | 19  | GND      |
| GND         | 3   | 20  | VCC 1V8  |
| EMMC D4     | 4   | 21  | VCC 1V8  |
| GND         | 5   | 22  | VCC 3V3  |
| EMMC D0     | 6   | 23  | VCC 3V3  |
| GND         | 7   | 24  | GND      |
| EMMC CLK    | 8   | 25  | EMMC CMD |
| GND         | 9   | 26  | GND      |
| EMMC D3     | 10  | 27  | EMMC D2  |
| GND         | 11  | 28  | GND      |
| VCC 1V8     | 12  | 29  | EMMC D1  |
| GND         | 13  | 30  | GND      |
| GND         | 14  | 31  | EMMC D7  |
| EMMC STROBE | 15  | 32  | GND      |
| GND         | 16  | 33  | EMMC D6  |
| GND         | 17  | 34  | GND      |

### GB042-30S-H10 (Socket - 30 pin)

Primarily used for mechanical fixation and support.
