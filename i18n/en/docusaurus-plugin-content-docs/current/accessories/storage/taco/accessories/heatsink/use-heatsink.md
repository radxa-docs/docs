---
sidebar_position: 5
---

# Using the Heatsink

Since the Raspberry Pi CM5 has strong performance, it generates a lot of heat during long-term high-load operation. The heatsink can improve cooling performance and ensure stable operation of the device.

## Install Heatsink

Refer to the [Install Heatsink](./install-heatsink.md) guide to complete the heatsink installation.

## Temperature-Controlled Fan

### Modify Configuration File

Edit the `/boot/firmware/usercfg.txt` file and add the following content:

```text
dtoverlay=gpio-fan,gpiopin=13,temp=55000
```

Parameter description:

- `gpiopin=13`: GPIO pin number, corresponding to Raspberry Pi GPIO 13 pin
- `temp=55000`: Temperature threshold in millidegrees Celsius, 55000 means 55°C

After saving the file, reboot the device for the configuration to take effect.

### Verify Fan Operation

When the fan temperature reaches the configured threshold, the fan will automatically start.
