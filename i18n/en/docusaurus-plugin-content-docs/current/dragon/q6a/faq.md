---
sidebar_position: 7
---

# Frequently Asked Questions (FAQ)

## Failed to Open the Serial Port Device

If you encounter the error message `Error: Permission denied, cannot open /dev/ttyUSB0` when trying to open the serial port!

You can follow these steps to troubleshoot the issue:

1.  Check if the serial port device is properly connected to the PC.

2.  Check the permissions of the serial port device.

    Taking a Linux system as an example, if the serial port device has insufficient permissions, you need to run the following command in the terminal to grant all users permission to access the serial port device.

<NewCodeBlock tip="Linux$" type="host">

```
sudo chmod 777 /dev/ttyUSB0
```

</NewCodeBlock>

3. Check if the serial port device is being used by another program.
