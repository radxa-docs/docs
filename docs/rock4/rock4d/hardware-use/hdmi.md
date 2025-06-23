---
sidebar_position: 3
---

# HDMI 2.1 接口

瑞莎 ROCK 4D 板载 1 个 HDMI 2.1 接口，可以使用 HDMI 2.1 接口进行视频输出，支持最高 4Kp120 输出。

## 使用指南

使用显示器连接 ROCK 4D 的 HDMI 接口，可以测试视频输出是否正常。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-hdmi.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::tip
部分显示器可能存在不兼容情况，可以尝试更换其他显示器测试
:::

## 配置显示器

主要从图形界面和命令行模式介绍如何修改显示器分辨率。

<Tabs queryString="web-mode">

<TabItem value="图形界面">

我们可以使用系统自带的显示器设置功能来修改显示器分辨率。

① ： 选择 `System Settings` ，进入系统设置界面

② ： 选择 `Display and Monitor`，进入显示器设置界面

③ ： 选择 `Resolution`，可以修改显示器分辨率

④ ： 选择 `Global Scale`，可以修改显示器缩放比例

⑤ ： 选择 `Apply`，可以应用显示器的修改参数

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-hdmi-use.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="命令行模式">

我们可以使用命令行模式来修改显示器分辨率。

- xrandr 工具

xrandr 是 Linux 系统中用于配置显示器的命令行工具，主要用于调整屏幕分辨率、刷新率、旋转方向、多显示器布局等。

- 查看当前显示配置

直接运行 xrandr（不带参数）会列出所有连接的显示设备（如 HDMI-1, DP-1 等）及其支持的分辨率和刷新率。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
xrandr
```
</NewCodeBlock>

终端输出示例：查看当前显示器配置

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

- 设置显示器分辨率和刷新率

设置 HDMI-1 分辨率为 1920x1080，刷新率为 60Hz:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
xrandr --output HDMI-1 --mode 1920x1080 --rate 60
```
</NewCodeBlock>

</TabItem>

</Tabs>

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
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
