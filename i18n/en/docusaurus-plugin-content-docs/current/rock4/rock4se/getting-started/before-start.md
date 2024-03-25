---
sidebar_position: 20
---

# Getting Started

This Preparation guide is designed for Radxa ROCK 4SE enthusiast. The purpose is to learn about ROCK 4SE as well as how to prepare and set up for basic use.
When you get a board, you need to know what model it is and which hardware version it is.
The information is printed in the top side of the board. We will introduce the board information as much as possible.

## Necessary

- Radxa ROCK 4SE board

- microSD card, larger than 8GB

- Power Supply: The ROCK 4SE supports various power supply technologies including smart power adapter as well as fixed voltage:

USB PD, support USB Type-C PD 2.0, 9V/2A, 12V/2A.  
Qualcomm® Quick ChargeTM: Supports QC 3.0/2.0 adapter, 9V/2A, 12V/1.5A

:::tip
The official recommendation is to use [Radxa Power PD30W](/accessories/pd_30w).
:::

- USB Keyboard and Mouse

With 2x USB-A 2.0 HOST connectors, ROCK 4SE can be equipped with a full sized keyboard and mouse.

- Monitor and HDMI Cable

ROCK 4SE is equipped with a HDMI connector and supports up to 4k@60. HDMI capable monitor is recommended.

- MicroSD Card Reader

For flashing the image to the microSD Card.

## Optional

- eMMC module, larger than 8GB

:::tip
You can learn about the information through [eMMC module](/accessories/emmc_module)
:::

- eMMC reader

:::tip
The official recommendation is to use [Radxa eMMC reader](/accessories/emmc_reader).
:::

- Ethernet cable

ROCK 4SE supports internet access via Ethernet.  
An Ethernet cable is used to connect your ROCK 4SE to a local network and the Internet.

- USB type A to type C cable

This is needed for fastboot/adb commands and the maskrom mode for advanced flashing.

- USB to TTL serial cable

This is needed for [serial console](../low-level-dev/serial).

- Camera Module

ROCK 4SE supports camera function.

:::tip
The official recommendation is to use [Radxa Camera 4K](/accessories/camera_4k).
:::

- LCD Module

ROCK 4SE supports LCD display function.

:::tip
The official recommendation is to use [Radxa Display 8 HD](/accessories/lcd-8-hd) or [Radxa Display 10 FHD](/accessories/lcd-10-fhd).
:::

- Audio device

Audio can be played through speaker or headphones using a standard 3.5mm jack.

## OS Installation

First, please download the official images of ROCK 4SE on the [ROCK 4 Official Images Download](/rock4/official-images).  
Then, you can install the OS by referring the [OS Installation Guide](install-os).  
Finally, insert the system storage media, microSD Card or eMMC Module into the socket on the board and power on ROCK 4SE by adapter with Type-C port.
