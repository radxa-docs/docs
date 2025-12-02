---
sidebar_position: 4
---

# HDMI 2.1 Interface

The Radxa CM4 IO Board features an onboard HDMI 2.1 interface that can connect to displays, TVs, and other devices for video output, supporting up to 4K@120fps.

## Hardware Connection

Connect your display to the HDMI port on the board.

:::tip
Some displays may have compatibility issues. If you encounter problems, try using a different display.

Refer to the [Hardware Information](./hardware_info.md) guide to locate the HDMI interface.
:::

## Display Configuration

This section explains how to modify display resolution through both graphical interface and command line.

<Tabs queryString="web-mode">

<TabItem value="graphical-interface" label="Graphical Interface">

You can use the system's built-in display settings to modify the display resolution.

① : Select `System Settings` to open the system settings interface

② : Choose `Display and Monitor` to access the display settings

③ : Select `Resolution` to change the display resolution

④ : Choose `Global Scale` to adjust the display scaling

⑤ : Click `Apply` to confirm your display settings

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rock4d-hdmi-use.webp" alt="HDMI Display Settings" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="command-line" label="Command Line">

You can also modify the display resolution using the command line.

### xrandr Tool

xrandr is a command-line tool in Linux systems for configuring displays. It's primarily used to adjust screen resolution, refresh rate, rotation, and multi-display layouts.

### View Current Display Configuration

Running xrandr (without parameters) lists all connected display devices (e.g., HDMI-1, DP-1) along with their supported resolutions and refresh rates.

<NewCodeBlock tip="radxa@device$" type="device">
```
xrandr
```
</NewCodeBlock>

Example output showing current display configuration:

<NewCodeBlock tip="radxa@device$" type="device">
```
Screen 0: minimum 320 x 200, current 3840 x 2160, maximum 16384 x 16384
HDMI-1 connected primary 3840x2160+0+0 (normal left inverted right x axis y axis) 597mm x 336mm
   3840x2160     60.00*+  60.00    50.00    59.94    30.00    25.00    24.00    29.97    23.98  
   1920x2160     60.00  
   2560x1440     59.95  
   2048x1152     60.00  
   1920x1200     59.95  
   1920x1080     60.00    60.00    50.00    59.94  
   1920x1080i    60.00    59.94  
   1680x1050     59.88  
   1600x900      60.00  
   1440x900      59.90  
   1280x800      59.91  
   1280x720      60.00    50.00    59.94  
   1024x768      60.00  
   800x600       60.32  
   720x576       50.00  
   720x480       60.00    59.94  
   640x480       60.00    59.94
```
</NewCodeBlock>

### Set Display Resolution and Refresh Rate

To set HDMI-1 to 1920x1080 resolution at 60Hz refresh rate:

<NewCodeBlock tip="radxa@device$" type="device">
```
xrandr --output HDMI-1 --mode 1920x1080 --rate 60
```
</NewCodeBlock>

</TabItem>

</Tabs>

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
