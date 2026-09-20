---
sidebar_position: 1
---

# Radxa 4K HDMI IN to MIPI CSI-2 Adapter

## Introduction

The **Radxa 4K HDMI IN to MIPI CSI-2 Adapter** is based on the Rockchip RK628H video bridge chip. It converts HDMI video signals into MIPI CSI-2 signals and extracts I2S digital audio from the HDMI signal.

The adapter provides both 2-lane and 4-lane MIPI CSI-2 connectors, allowing development boards to quickly interface with HDMI cameras, computers and other high-definition video sources. It is suitable for video capture, image processing and embedded vision applications.

<div style={{textAlign: 'center'}}>
    <img src="/img/accessories/display/hdmi-in-to-mipi-csi2/hdmi-in-to-mipi-csi2-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Features

- **4K HDMI input**

Supports HDMI video input up to 4K@30fps, meeting high-definition video capture requirements.

- **MIPI CSI-2 output**

Provides 2-lane and 4-lane MIPI CSI-2 connectors, and the 4-lane connector supports video output up to 4K@30fps.

- **RK628H video bridge**

Based on the Rockchip RK628H, it converts HDMI signals into MIPI CSI-2 video signals.

- **HDMI audio extraction**

Extracts audio from the HDMI input signal and outputs digital audio through a dedicated I2S connector.

- **EDID management**

Declares supported video formats to the HDMI source through EDID, improving compatibility with different HDMI sources.

- **Compatible with Radxa Z form factor**

It can be mounted directly on Radxa Z form factor mini boards. For other form factors, the extension part can be cut along the reserved break line to fit different installation spaces.

- **Built for vision development**

Suitable for HDMI video capture, image processing, video analysis and embedded vision applications.

## Specifications

| Item             | Specification                                                                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Processor        | Rockchip RK628H                                                                                                                     |
| Video input      | HDMI input, up to 4K@30fps                                                                                                          |
| Video output     | 1x 2-lane MIPI CSI (15-Pin, 1.0 mm pitch); 1x 4-lane MIPI CSI (31-Pin, 0.3 mm pitch), up to 4K@30fps output                        |
| Audio output     | I2S digital audio output; pins: DOUT, LRCK, SCLK, MCLK                                                                              |
| Auxiliary signal | HDMI detection and system interrupt; signals: DET, INT                                                                              |
| Dimensions       | 30 x 65 mm                                                                                                                          |
| Compatible with  | ROCK 3C / ROCK 4D / ROCK 5A / ROCK 5B / ROCK 5B+ / ROCK 5C / ROCK 5T                                                                |

## Mechanical dimensions

<div style={{textAlign: 'center'}}>
    <img src="/img/accessories/display/hdmi-in-to-mipi-csi2/hdmi-in-to-mipi-csi2-dimension.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Pinout

The adapter provides three connectors: 31-Pin MIPI CSI (4-lane), 15-Pin MIPI CSI (2-lane) and a 7-Pin header (I2S).

### 31-Pin MIPI CSI (4-lane)

| Pin | Signal           | Level | Description             |
| --- | ---------------- | ----- | ----------------------- |
| 1   | GND              | -     | Ground                  |
| 2   | MIPI_D3N         | -     | Data lane 3 negative    |
| 3   | MIPI_D3P         | -     | Data lane 3 positive    |
| 4   | GND              | -     | Ground                  |
| 5   | MIPI_D2N         | -     | Data lane 2 negative    |
| 6   | MIPI_D2P         | -     | Data lane 2 positive    |
| 7   | GND              | -     | Ground                  |
| 8   | NC               | -     | Not connected           |
| 9   | NC               | -     | Not connected           |
| 10  | GND              | -     | Ground                  |
| 11  | MIPI_D1N         | -     | Data lane 1 negative    |
| 12  | MIPI_D1P         | -     | Data lane 1 positive    |
| 13  | GND              | -     | Ground                  |
| 14  | MIPI_D0N         | -     | Data lane 0 negative    |
| 15  | MIPI_D0P         | -     | Data lane 0 positive    |
| 16  | GND              | -     | Ground                  |
| 17  | MIPI_CLKN        | -     | MIPI CSI clock negative |
| 18  | MIPI_CLKP        | -     | MIPI CSI clock positive |
| 19  | GND              | -     | Ground                  |
| 20  | NC               | -     | Not connected           |
| 21  | GND              | -     | Ground                  |
| 22  | NC               | -     | Not connected           |
| 23  | RK628_INT        | 1.8V  | RK628 interrupt output  |
| 24  | I2C_SCL          | 1.8V  | I2C clock               |
| 25  | I2C_SDA          | 1.8V  | I2C data                |
| 26  | RK628_Plugin_DET | 1.8V  | Adapter presence detect |
| 27  | RK628_Reset      | 1.8V  | RK628 reset             |
| 28  | 3.3V             | 3.3V  | Power                   |
| 29  | 3.3V             | 3.3V  | Power                   |
| 30  | 5V               | 5V    | Not used                |
| 31  | 5V               | 5V    | Not used                |

### 15-Pin MIPI CSI (2-lane)

| Pin | Signal      | Level | Description             |
| --- | ----------- | ----- | ----------------------- |
| 1   | 3.3V        | 3.3V  | Power                   |
| 2   | I2C_SDA     | 3.3V  | I2C data                |
| 3   | I2C_SCL     | 3.3V  | I2C clock               |
| 4   | NC          | -     | Not connected           |
| 5   | RK628_Reset | 3.3V  | RK628 reset             |
| 6   | GND         | -     | Ground                  |
| 7   | MIPI_CLKP   | -     | MIPI CSI clock positive |
| 8   | MIPI_CLKN   | -     | MIPI CSI clock negative |
| 9   | GND         | -     | Ground                  |
| 10  | MIPI_D1P    | -     | Data lane 1 positive    |
| 11  | MIPI_D1N    | -     | Data lane 1 negative    |
| 12  | GND         | -     | Ground                  |
| 13  | MIPI_D0P    | -     | Data lane 0 positive    |
| 14  | MIPI_D0N    | -     | Data lane 0 negative    |
| 15  | GND         | -     | Ground                  |

### 7-Pin header

| Pin | Signal           | Level | Description                    |
| --- | ---------------- | ----- | ------------------------------ |
| 1   | I2S_D0           | -     | I2S data output (DOUT)         |
| 2   | I2S_LRCK         | -     | I2S frame clock (LRCK)         |
| 3   | I2S_SCLK         | -     | I2S bit clock (SCLK)           |
| 4   | I2S_MCLK         | -     | I2S master clock (MCLK)        |
| 5   | RK628_Plugin_DET | 3.3V  | Adapter presence detect        |
| 6   | RK628_INT        | 3.3V  | RK628 interrupt output         |
| 7   | GND              | -     | Ground                         |

:::note Note

- The 31-Pin connector carries MIPI CSI video only. HDMI audio must be wired separately from the I2S pins on the 7-Pin header.
- `RK628_Plugin_DET` and `RK628_INT` are 1.8V on the 31-Pin connector but 3.3V on the 7-Pin header, so check level compatibility when wiring.
- Pins marked `NC` are not connected; leave them floating and do not short them to other signals.

:::

## Package contents

- 1x Radxa 4K HDMI IN to MIPI CSI-2 Adapter
- 1x AC006 (31P 0.3 mm to 31P 0.3 mm, opposite side FPC cable)
- 1x AC014 (15P 1.0 mm to 15P 1.0 mm, opposite side FPC cable)
