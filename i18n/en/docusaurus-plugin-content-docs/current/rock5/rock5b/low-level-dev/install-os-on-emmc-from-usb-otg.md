---
sidebar_position: 21
---

# Install the system to EMMC

## Preparation

- ROCK 5B main board
- eMMC module
- 1x USB cable (USB C on one end, USB A on the other)
- 1x 9V/2A or 12V/2A, 15V/2A and 20V/2A power adapter(recommended [Radxa Power PD30W](../accessories/pd-30w))

## Image Download

Please go to [Resource Download Summary](/rock5/rock5b/getting-started/download.md) to download the corresponding image file.

## Enter Maskrom mode

- Press and hold the **Maskrom button**.
- Plug the USB A-C cable into the Type-C port of the ROCK 5B and the other end into your computer.
- Confirm that the ROCK 5B is in Maskrom mode.

```bash
# MacOS side.
	Result after running lsusb
Output:Bus 000 Device 004: ID 2207:350b Fuzhou Rockchip Electronics Co.

# Linux.
	Result after executing lsusb
Output:Bus 001 Device 030: ID 2207:350b Fuzhou Rockchip Electronics Company

# Windows: Open RKDevTool.
Open RKDevTool and you will see that the device is in the Found One MASKROM Device state.
```

## Install system to eMMC

[Installation in Windows environment](../low-level-dev/rkdevtool)

[Installation on Linux](../low-level-dev/rkdeveloptool)

## Booting the system

- Power up the board and start the system with the status light blinking.

:::tip
ROCK 5B supports `5V/12V/20V` power supply. Radxa recommends using [Radxa Power PD30W](../accessories/pd-30w).
:::

## Login

There are two default users for official system.

1. username: radxa password: radxa

2. username: rock password: rock

More info please refer to [RadxaOS](../radxa-os)

## Frequently Asked Questions
