---
sidebar_position: 7
---

# Frequently Asked Questions (FAQ)

## Failed to Open Serial Port Device

If you encounter the error `Error: Permission denied, cannot open /dev/ttyUSB0` when trying to open the serial port!

You can troubleshoot the issue by following these steps:

1. Check if the serial device is properly connected to the PC

2. Check serial device permissions

For Linux systems, if the serial device has insufficient permissions, you need to run the following commands in the terminal to grant the current user access to the device.

- View serial device information

Using `/dev/ttyUSB0` as an example:

<NewCodeBlock tip="Linux$" type="host">

```
ls -l /dev/ttyUSB0
```

</NewCodeBlock>

If the device exists on the system, you will see output similar to:

```
crw-rw---- 1 root dialout 188, 0 Sep 10 21:24 /dev/ttyUSB0
```

- Add current user to the `dialout` group

<NewCodeBlock tip="Linux$" type="host">

```
sudo usermod -a -G dialout $USER
```

</NewCodeBlock>

- Log in again

<NewCodeBlock tip="Linux$" type="host">

```
newgrp dialout
```

</NewCodeBlock>

3. Check if the serial device is being used by another program
