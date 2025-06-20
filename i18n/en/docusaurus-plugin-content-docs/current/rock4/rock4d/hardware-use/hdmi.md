---
sidebar_position: 3
---

# HDMI 2.1 Interface

The Radxa ROCK 4D features one onboard HDMI 2.1 port that supports video output up to 4Kp120.

## User Guide

Connect a display to the ROCK 4D's HDMI port to test the video output functionality.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-hdmi.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::tip
Some displays may have compatibility issues. If you encounter problems, try using a different display for testing.
:::

## Display Configuration

This section explains how to modify display resolution using both the graphical interface and command line.

<Tabs queryString="web-mode">

<TabItem value="Graphical Interface">

You can use the system's built-in display settings to adjust the resolution.

①. Select `System Settings` to open the system settings interface

②. Choose `Display and Monitor` to access the display settings

③. Select `Resolution` to modify the display resolution

④. Choose `Global Scale` to adjust the display scaling

⑤. Click `Apply` to save your display settings

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-hdmi-use.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Command Line">

You can also modify display settings using the command line.

### xrandr Tool

xrandr is a command-line tool in Linux for configuring display settings, including screen resolution, refresh rate, rotation, and multi-monitor layouts.

#### View Current Display Configuration

Run xrandr (without parameters) to list all connected display devices (such as HDMI-1, DP-1, etc.) and their supported resolutions and refresh rates.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
xrandr
```
</NewCodeBlock>

Example terminal output showing current display configuration:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
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

#### Set Display Resolution and Refresh Rate

To set HDMI-1 resolution to 1920x1080 with a 60Hz refresh rate:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
xrandr --output HDMI-1 --mode 1920x1080 --rate 60
```
</NewCodeBlock>

</TabItem>
</Tabs>

## Interface Specifications

:::tip
For detailed interface specifications, please refer to the [Hardware Design: Schematics](../download) in the download section.
:::

| Pin# | Name      | Pin# | Name             | Pin# | Name                      |
| :--: | :-------- | :--: | :--------------- | :--: | :------------------------ |
|  1   | HDMI_TX2P |  9   | HDMI_TX0N        |  17  | GND                       |
|  2   | GND       |  10  | HDMI_TX3P        |  18  | VCC5V_HDMI_TX             |
|  3   | HDMI_TX2N |  11  | GND              |  19  | HDMI_TX_HPDIN/HDMITX_SBDN |
|  4   | HDMI_TX1P |  12  | HDMI_TX3N        |  20  | GND                       |
|  5   | GND       |  13  | HDMI_TX_CEC_PORT |  21  | GND                       |
|  6   | HDMI_TX1N |  14  | HDMITX_SBDP      |  22  | GND                       |
|  7   | HDMI_TX0P |  15  | HDMI_TX_SCL_PORT |  23  | GND                       |
|  8   | GND       |  16  | HDMI_TX_SDA_PORT |      |                           |
