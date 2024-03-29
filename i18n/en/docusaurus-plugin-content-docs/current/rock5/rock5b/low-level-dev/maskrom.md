---
sidebar_position: 1
---

### What is Maskrom Mode

Maskrom mode, also known as Loader mode, is a special boot mode that generally used to recover or repair faulty devices.
This mode allows the user to interact directly with the device's hardware without going through the operating system. In Maskrom mode,
the user can communicate with the device through a computer or other device and execute a series of commands to fix the device's problems.
You can see if the device is in Maskrom mode by using the following command (the return value below is the return value in Maskrom state).

```bash
# MacOS side.
    The result of running lsusb
Output:Bus 000 Device 004: ID 2207:350b Composite Device of Fuzhou Rockchip Electronics Co.
# Linux.
    Result after executing lsusb
Output:Bus 001 Device 030: ID 2207:350b Fuzhou Rockchip Electronics Company
# Windows: Open RKDevTool.
Open RKDevTool and you will see that the device is in Found One MASKROM Device state.
```

### How to enter Maskrom state

- Press and hold [**Maskrom button**](../README.md).
- Plug the USB A-C cable into the Type-C port of the ROCK 5B and the other end into your computer. This will normally enter the MaskROM state.
