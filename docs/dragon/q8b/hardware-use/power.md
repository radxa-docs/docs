---
sidebar_position: 13
---

# 电源按键 / 引脚

瑞莎 Dragon Q8B 板载电源按键（PER_BTN）和引出电源（PWR）引脚，用于控制主板电源的开关。

① : 电源按键

② : PWR 引脚

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q8b/q8b_power_header.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

## 使用指南

### 电源按键

主板在关机状态，按下电源按键，主板启动。

主板在开机状态，按下电源按键，系统默认进入睡眠模式。

说明：按下电源按键触发的状态可以在系统设置中修改：`Power` -> `Power Button Behavior`，可选择的状态有：`Suspend`、`Power off`、`Nothing`。

### PWR 引脚

主板在关机状态，PWR 引脚和 GND 引脚短接一下，主板启动。

主板在开机状态，PWR 引脚和 GND 引脚短接一下，系统默认进入睡眠模式。

说明：短接电源引脚触发的状态可以在系统设置中修改：`Power` -> `Power Button Behavior`，可选择的状态有：`Suspend`、`Power off`、`Nothing`。