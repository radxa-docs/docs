---
sidebar_position: 15
---

# 其它接口

瑞莎 CM4 IO 板还引出多个的功能接口，方便用户自行选择所需功能。

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/other_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                     | 序号  | 说明                       | 序号 | 说明             |
| ---- | ---------------------------------------- | ----- | -------------------------- | ---- | ---------------- |
| ①    | 电源引脚（可触发关机、重启）             | ③     | 14 Pin GPIO 接口           | ⑥    | UFS 模块启动引脚 |
| ②    | 电源输出（提供 GND / 5V / 12V 电源输出） | ④ / ⑤ | 左右声道输出(可外接扬声器) |      |                  |

## 功能引脚

功能引脚 1 : 电源引脚

功能引脚 2 : GND

功能引脚 3 : 重启引脚

可外接按键：

- 连接功能引脚 1 和功能引脚 2，按下按键并松开可触发关机。
- 连接功能引脚 2 和功能引脚 3，按下按键并松开可触发重启。

## 电源输出

提供 12V、5V、GND 电源输出，方便给其它设备供电。

## 14 Pin GPIO 接口

<TabItem value="CM4">
     <div className='gpio_style' style={{ overflow :"auto"}} >
| Function2       | Function1 | Pin# | Pin# | Function1  | Function2       |
|-----------------|-----------|:------:|:------:|------------|-----------------|
|                 | GND       | <div className='black'>1</div>    | <div className='green'>2</div>    | RECOVERY   |                 |
|                 | GND       | <div className='black'>3</div>    | <div className='green'>4</div>    | EEPROM_nWP |                 |
| PDM1_CLK1_M1    | GPIO4_B0  | <div className='green'>5</div>    | <div className='green'>6</div>    | GPIO4_B2   | PDM1_SDI1_M1    |
|                 | GND       | <div className='black'>7</div>    | <div className='green'>8</div>    | GPIO3_D4   | UART5_RX_M0_1V8 |
| UART5_TX_M0_1V8 | GPIO3_D5  | <div className='green'>9</div>    | <div className='black'>10</div>    | GND        |                 |
| PDM1_SDI2_M1    | GPIO4_B1  | <div className='green'>11</div>    | <div className='black'>12</div>    | GND        |                 |
|                 | GND       | <div className='black'>13</div>    | <div className='green'>14</div>    | MASKROM    |                 |
     </div>

</TabItem>

## 左右声道输出

左右声道输出接口，可外接扬声器。

## UFS 模块启动引脚

使用跳线帽或者杜邦线短接，可以使用 UFS 模块作为系统启动介质。

## 接口引脚定义

可以参考 [资源汇总下载](../download.md) 页面的硬件原理图。
