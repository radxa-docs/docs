---
sidebar_position: 10
---

# E54C Frequently Asked Questions

1. How to restore iStoreOS to factory settings

   When the system is running normally, press and hold the USER button for 5 seconds. The system will perform a factory reset operation and then restart.

   <img src="/img/e/e54c/e54c-user-key-press.webp" width="500" alt="radxa-e54c pack" />

:::tip
Do not press the USER button immediately after powering on, as the system will enter safe mode. In this mode, operations can only be performed through the serial port.
:::

2. How to configure the four network ports on E54C

   In the iStoreOS system, you can flexibly configure the functions of the four network ports through the web interface. By default, one port is configured as a WAN port, and the remaining three are configured as LAN ports. You can change these settings as needed to implement multi-WAN load balancing or other network topologies.

3. What are the power requirements for E54C

   E54C requires a 12V/3A or higher power adapter using a 5525 DC connector. Please note that E54C only supports 12V input and does not support 5V input, which is different from E52C's power requirements.

4. How to install an NVMe SSD

   E54C supports M.2 2280 NVMe SSDs. Installation steps are as follows:

   - Ensure the device is powered off and disconnected from power
   - Insert the M.2 NVMe SSD into the M.2 M Key slot
   - Secure the SSD with screws
   - Connect power and start the device
   - After system startup, you can use the `lsblk` command to check if the SSD is recognized

5. How to use HDMI output

   E54C is equipped with an HDMI 2.1 interface that supports video output up to 8K resolution. Simply connect the E54C to a monitor or TV using an HDMI cable, and the system will automatically detect and output the video signal.

6. How to connect and use the GPIO interface

   E54C provides a 14-Pin 0.1" (2.54mm) GPIO interface that supports functions such as SPI, UART, and I2C. You can control these interfaces using Linux GPIO tools (such as gpiod). For detailed pin definitions and usage methods, please refer to the [Interface Usage Guide](./getting-started/interface-usage).
