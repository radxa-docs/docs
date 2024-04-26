---
sidebar_position: 1
sidebar_class_name: hidden
---

# Install the system to EMMC

## Preparation

- ROCK 5C main board
- eMMC module
- 1x USB cable (USB A)
- Power adapter(recommended [Radxa Power PD30W](../accessories/pd-30w))

## Image Download

Please go to [Resource Download Summary](../download) to download the corresponding image file.

## Enter Maskrom mode

- Shorting the **Maskrom key** with DuPont cable
- Plug the USB A-A cable into the top port of the ROCK 5C's dual-layer USB 3.0 port and the other end into your computer.
- Confirm that the ROCK 5C is in Maskrom mode.

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

## Frequently Asked Questions

Q:Cannot enter Maskrom mode<br/>
Verify that you are properly shorting to `maskrom key` instead of `recovery key`.

Q:Installation fails<br/>
Verify that the emmc is in place.
