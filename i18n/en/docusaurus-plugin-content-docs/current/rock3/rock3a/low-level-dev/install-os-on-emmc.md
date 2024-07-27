---
sidebar_position: 1
---

# Install System to eMMC

## Preparations

- Radxa ROCK 3A Motherboard
- eMMC module
- 1x USB cable (USB C on one end, USB A on the other)
- 1x 5V power adapter (recommended [Radxa Power PD30W](../accessories/pd-30w))

## Image Download

Please go to [Download Summary](/rock3/rock3a/getting-started/download) to download the corresponding image file.

## Enter Maskrom mode

- Disconnect power to the board
- Remove the SD card and insert the eMMC module.
- Connect the USB3.0 port of the Radxa ROCK 3A to the PC with USB A-A.
- Short the following pins
- Power up the board.
- Remove the right yellow jumper cap, keep the left yellow jumper cap.

<img src="/img/rock3/3a/rock3a-maskrom.webp" alt="rock 3a maskrom" width="500" />

- Check for USB devices
  _ Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  _ Windows: Open RKDevTool and you will see the device in "maskrom mode".
  <img src="/img/rock3/3a/rock3a-select-loader-bin.webp" alt="rock 3a select loader bin" width="500" />

## Installing the system to eMMC

[Installation in Windows environment](../low-level-dev/rkdeveloptool)

[Installation for Linux](../low-level-dev/rkdeveloptool)

## Booting the system

- Power up the board and start the system with the status light blinking.

:::tip
Radxa ROCK 3A supports `5V/12V` power supply. Radxa recommends using [Radxa Power PD30W](../accessories/pd-30w).
:::

## Frequently Asked Questions
