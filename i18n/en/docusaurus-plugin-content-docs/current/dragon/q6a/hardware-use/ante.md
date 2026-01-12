---
sidebar_position: 12
---

# Antenna Interface

The Dragon Q6A board features built-in WiFi 6 and Bluetooth 5.4 antenna interfaces, with two additional antenna interfaces reserved to enhance signal reception capabilities.

## Hardware Connection

Install the antenna into the Dragon Q6A's antenna interface.

:::tip Interface Location
Refer to the [Hardware Information](./hardware-info) tutorial to locate the corresponding hardware interface.
:::

## Check Signal Strength

After installing the antenna, open the terminal and use the command to compare signal strength before and after installation:

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli device wifi list
```
</NewCodeBlock>
