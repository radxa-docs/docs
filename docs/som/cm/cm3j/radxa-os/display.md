---
sidebar_position: 7
---

import Display from "../../../../common/radxa-os/\_display.mdx";

# 显示设置

## 系统设置-显示设置

显示设置只有在你在显示器上操作时可用，你可以通过以下方式进行显示设置。

在 XFCE 桌面上，左键点击左上角的 `Applications`，就可以看到 `Settings`, 点击 `Display` 进入显示设置

![Display settings](/img/zero/zero3/radxa-display-xfce-1.webp)

![Display settings](/img/zero/zero3/radxa-display-xfce-2.webp)

## 命令行设置

我们还提供了`xrandr`用于显示设置。
通过以下命令，你可以检查当前的显示状态：

```bash
xrandr
```

举例：

```bash
radxa@radxa-cm3j-rpi-cm4-io:~$ xrandr
Screen 0: minimum 320 x 200, current 1280 x 720, maximum 16384 x 16384
HDMI-1 connected primary 1280x720+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
   1280x720      60.00*+  60.00    50.00    59.94
   4096x2160     60.00    50.00    59.94    30.00    25.00    24.00    29.97    23.98
   3840x2160     60.00    50.00    59.94    30.00    25.00    24.00    29.97    23.98
   1920x1080     60.00    50.00    59.94
   1920x1080i    60.00    50.00    59.94
   1600x1200     60.00
   1680x1050     59.88
   1400x1050     59.95
   1280x1024     75.02    60.02
   1440x900      59.90
   1280x960      60.00
   1366x768      59.79
   1360x768      60.02
   1280x800      59.91
   1280x768      59.87
   1024x768      75.03    70.07    60.00
   800x600       60.32
   720x576       50.00    50.00
   720x576i      50.00    50.00
   720x480       60.00    60.00    59.94    59.94    59.94
   720x480i      60.00    60.00    59.94    59.94
   640x480       60.00    59.94
```

你可以检查连接了哪些显示器，以及对应的分辨率。

## 显示旋转

你可以通过修改[Display Settings](display#system-settings-display-settings)-Orientation来旋转你的屏幕显示。
或者你也可以通过命令实现：

```bash
Single Screen:
   xrandr -o left     # Rotate 90 degrees to the left
   xrandr -o right    # Rotate 90 degrees to the right
   xrandr -o inverted # Flip up and down, rotate 180 degrees
   xrandr -o normal   # Back to the normal angle
   xrandr -s 1024x768 # Set the resolution
   xrandr -s 0        # Set the default resolution, which generally defaults to the highest resolution
   xrandr -rate       # Set refresh rate
```

更多信息请查看[X.Org Server RandR](https://en.wikipedia.org/wiki/X.Org_Server#Other_DDX_components)。
