---
sidebar_position: 4
---

# Micro HDMI Interface

The Radxa Cubie A7A features one onboard HDMI port for video output, supporting up to 4K@60fps resolution.

:::info Interface Location
For the specific location of the HDMI interface, please refer to the interface description section in the [Hardware Interface](./hardware-info) tutorial!
:::

## Usage Guide

Connect a display to the Cubie A7A's HDMI port to test the video output.

:::tip
Some displays may have compatibility issues. If you encounter problems, try using a different display for testing.
:::

## Display Configuration

This section explains how to modify display resolution through both graphical interface and command line.

<Tabs queryString="web-mode">

<TabItem value="Graphical Interface">

You can use the system's built-in display settings to modify the display resolution.

① : Select `Applications` to enter the system applications interface

② : Select `Settings` to access system settings

③ : Select `Display` to enter the display settings interface

④ : Select `Resolution` to modify the display resolution

⑤ : Select `Scale` to adjust the display scaling

⑥ : Select `Apply` to confirm and apply the display settings

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-hdmi-display.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Command Line">

You can use the command line to modify display settings.

- xrandr Tool

xrandr is a command-line tool in Linux for configuring displays, primarily used to adjust screen resolution, refresh rate, rotation, and multi-display layouts.

- View Current Display Configuration

Running xrandr (without parameters) lists all connected display devices (such as HDMI-1, DP-1, etc.) along with their supported resolutions and refresh rates.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
xrandr
```
</NewCodeBlock>

Example terminal output showing current display configuration:

<NewCodeBlock tip="radxa@device$" type="device">
```bash
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

- Set Display Resolution and Refresh Rate

Set HDMI-1 resolution to 1920x1080 with a refresh rate of 60Hz:

<NewCodeBlock tip="radxa@device$" type="device">
```bash
xrandr --output HDMI-1 --mode 1920x1080 --rate 60
```
</NewCodeBlock>

</TabItem>

</Tabs>

## Interface Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
:::
