---
sidebar_position: 2
---

# HDMI 接口

- 桌面切换分辨率

  1. 打开系统设置，找到 `Display`

  2. 点击 `Resolution` 切换不同分辨率

  切换不同的分辨率不会出现屏幕闪烁、花屏、条纹、撕裂等异常现象

- 命令行切换不同分辨率

  1. xrandr -q 参数来查看你的屏幕目前支持的分辨率的情况

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

  2. xrandr -s 0 命令来将屏幕恢复到原来的分辨率

  3. xrandr -s 指定屏幕的分辨率大小

  例如：

  ```bash
  xrandr -s 1920x1080
  ```

  切换不同的分辨率不会出现屏幕闪烁、花屏、条纹、撕裂等异常现象

- 多次拔插 HDMI 线

  多次拔插 HDMI 线，是否能正常显示

