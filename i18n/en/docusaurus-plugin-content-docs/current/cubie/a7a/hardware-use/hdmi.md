---
sidebar_position: 3
---

# HDMI Interface

Radxa Cubie A7A features one onboard HDMI interface, which can be used for video output and supports up to 4K@60fps output.

:::tip
For the exact location of the HDMI interface, please refer to the interface description section in the [Hardware Interfaces](./hardware-info) guide!
:::

## Usage Guide

Connect a monitor to the HDMI interface of the Cubie A7A to test whether video output is working properly.

:::tip
Some monitors may have compatibility issues. If you encounter problems, try using a different monitor.
:::

## Configure Display

This section introduces how to modify the display resolution from both the graphical interface and command line.

<Tabs queryString="web-mode">

<TabItem value="Graphical Interface">

You can use the system's built-in display settings to modify the display resolution.

① : Select `Applications` to enter the system applications interface

② : Select `Settings` to enter the system settings options

③ : Select `Display` to enter the display settings interface

④ : Select `Resolution` to modify the display resolution

⑤ : Select `Scale` to modify the display scaling ratio

⑥ : Select `Apply` to apply the modified display parameters

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-hdmi-display.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Command Line">

You can use the command line to modify the display resolution.

- xrandr Tool

xrandr is a command-line tool in Linux for configuring displays, mainly used to adjust screen resolution, refresh rate, rotation, multi-display layout, and more.

- View Current Display Configuration

Running xrandr without parameters will list all connected display devices (such as HDMI-1, DP-1, etc.) and their supported resolutions and refresh rates.

<NewCodeBlock tip="radxa@device$" type="device">
```
xrandr
```
</NewCodeBlock>

Sample terminal output: View current display configuration

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
```
</NewCodeBlock>

- Set Display Resolution and Refresh Rate

To set the resolution of HDMI-1 to 1920x1080 and the refresh rate to 60Hz:

<NewCodeBlock tip="radxa@device$" type="device">
```
xrandr --output HDMI-1 --mode 1920x1080 --rate 60
```
</NewCodeBlock>

</TabItem>

</Tabs>

## Interface Specifications

:::info Technical Reference
For the complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematics](../download) document in the download section.
:::
