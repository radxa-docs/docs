---
sidebar_position: 2
---

# HDMI Interface

- Switching Desktop Resolution

  1. Open System Settings and find Display.

  2. Click on Resolution to switch between different resolutions.

- Switching Resolutions via Command Line

  1. Use the xrandr -q command to check the currently supported resolutions for your screen.

  ```bash
  $ xrandr -q
  Screen 0: minimum 320 x 200, current 3840 x 2160, maximum 16384 x 16384
  HDMI-1 connected primary 3840x2160+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
     3840x2160     30.00*+
     1920x1080     60.00    59.94
     1680x1050     59.88
     1600x900      60.00
     1280x1024     60.02
     1440x900      59.90
     1280x800      59.91
     152x864      75.00
     1280x720      60.00    60.00    59.94
     1024x768      60.00
     800x600       60.32
     720x480       59.94    59.94
  ```

  2. Use the xrandr -s 0 command to restore the screen to its original resolution.

  3. Use the xrandr -s command followed by the desired resolution size to set the screen resolution.

  For example:

  ```bash
  xrandr -s 1920x1080
  ```

- Repeatedly plugging and unplugging the HDMI cable

  Repeatedly plugging and unplugging the HDMI cable—does it display normally?
