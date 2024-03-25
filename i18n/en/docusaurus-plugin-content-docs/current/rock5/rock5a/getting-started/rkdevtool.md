---
sidebar_position: 36
---

# Maskrom Mode

ROCK 5 supports Maskrom mode, which is a special operation mode for CPU to wait for USB OTG port command.
The PC tools we use to communicate with ROCK 5 in Maskrom mode are the rkdeveloptool and RKDevTool.
We use the rkdeveloptool in Linux/macOS and the RKDevTool under Windows.

# Preparation

- ROCK 5A
- USB-A to USB-A cable
- eMMC Module
- Power Supply and power cable
- OS images

# Steps

- **Install Tool and Drivers on Windows:**  
  [RKDevTool V2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar)  
  [DriverAssistant V5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

- Boot the board to Maskrom mode:  
  The steps to boot ROCK 5A to Maskrom mode:

1. Power off the board.
2. Take the eMMC module and other storage off.
3. Plug the USB-A to USB-A cable to the **upper** [USB 3.0 port](../getting-started/overview)(No.8) of ROCK 5A, the other side to PC USB 3.0 port.
4. Power on the board.  
   ![ROCK 5A power on](/img/rock5a/rock5a-OTG.webp)
5. Attaching the eMMC module

Another way is to connect the two pins of [the maskrom](../getting-started/overview)(No.23) before power on, it's not necessary that take the eMMC module and other storage off.

- Open the RKdevtool:  
  This is the UI without maskrom device:  
  ![no device](/img/rock5a/no-device.webp)

This is the UI with maskrom device:  
![on maskrom](/img/rock5a/on-maskrom.webp)

- Choose the Loader and Image files:  
  Left click the rightmost cell to choose the Loader and Image files:  
  ![Choose files](/img/rock5a/choose-files.webp)

The spi loader file of ROCK 5A is here: **[RK3588 loader](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/rk3588_spl_loader_v1.08.111.bin)**  
The image can be found on [Official Image](../../official-images).  
**Note: The image needs to be decompressed after be downloaded.**

- Choose Device and flash(run):  
  Attention:

1. choose eMMC when using eMMC module
2. choose the desired device
3. tick the item  
   ![Attention Point](/img/rock5a/attention-point.webp)

- Wait for the flash to complete:  
  Progress is shown on the right, it would tip you after completion:  
  ![Flash completion](/img/rock5a/completion.webp)

# Supplementary

There are many more uses for RKDevTool, this is guide is just one of them,
for more, welcome to join our communication platforms or ask Google for help.
