---
sidebar_position: 20
---

# Getting Started

- This Preparation guide is designed for Radxa ROCK 5 Model A(Rock 5A) enthusiast. The purpose is to learn about ROCK 5A as well as how to prepare and set up for basic use. When you get a board, you need to know what model it is and which hardware version it is. The information is printed in the top side of the board. We will introduce the board information as much as possible.

## Necessary

- Radxa ROCK 5 Model A(Rock 5A)

- microSD, larger than 8GB

- Power Supply: The ROCK 5A supports various power supply technologies including smart power adapter as well as fixed voltage:

USB Type-C PD Version 2.0 with 9V/2A, 12V/2A, 15V/2A and 20V/2A.
Qualcomm Quick Charge 2.0 QC 3.0/2.0 adapter, 9V/2A, 12V/2A
Power adapter with fixed voltage in 5.2V to 20V range on the USB Type-C port  
5V Power applied to the GPIO PIN 2 & 4

**The official recommendation is to use [Radxa Power PD30W](../../../accessories/pd_30w)**

- USB Keyboard and Mouse

With 2x USB-A 2.0 HOST connectors, ROCK 5A can be equipped with a full sized keyboard and mouse.

- Monitor and Micro HDMI Cable

ROCK 5A is equipped with a Micro HDMI connector. HDMI capable monitor is recommended.  
HDMI EDID display data is used to determine the best display resolution. On monitors and TVs that support 1080p (or 4K/8K) this resolution will be selected.  
If 1080p is not supported the next available resolution reported by EDID will be used. This selected mode will work with MOST but not all monitors/TVs.

- MicroSD Card Reader

For flashing the image to the microSD Card

## Optional

- [eMMC module](/accessories/emmc_module), larger than 8GB

- eMMC reader **(<font color='red'> Note: The eMMC reader is not suitable for SPI Flash</font> )**

**The official recommendation is to use [Radxa eMMC reader](../../../accessories/emmc_reader)**

When you receive ROCK 5A, its B2B connector is installed with SPI Flash. If you want to use eMMC, you need to remove the SPI Flash before you can use eMMC.

![ROCK5A Using eMMC](/img/rock5a/rock5a-use-emmc.webp)

- Ethernet cable

ROCK 5A supports internet access via Ethernet.  
An Ethernet cable is used to connect your ROCK 5A to a local network and the Internet.

- USB type A to type C cable

This is needed for fastboot/adb commands and the maskrom mode for advanced flashing.

- USB to TTL serial cable

This is needed for serial console.

- Camera Module

ROCK 5A supports camera function.

**The official recommendation is to use [Radxa Camera 4K](../../../accessories/camera_4k)**

- LCD Module

ROCK 5A supports LCD display function.

**The official recommendation is to use [Radxa Display 8 HD](../../../accessories/lcd-8-hd) or [Radxa Display 10 FHD](../../../accessories/lcd-10-fhd)**

- Audio cable

Audio can be played through speaker or headphones using a standard 3.5mm jack.

- WiFi/BT Cards

**The official recommendation is to use [Radxa Wireless Module A8](../../../accessories/wireless-a8)**
