---
sidebar_position: 1
---

# 硬件信息

## 芯片框图

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/rk3588s_block_diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<Tabs queryString="board interface">

<TabItem value="瑞莎 NX5">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明            | 序号 | 说明           | 序号 | 说明      |
| :--: | :-------------- | :--: | :------------- | :--: | :-------- |
|  1   | LPDDR4X         |  2   | 瑞芯微 RK3588S |  3   | 板载 eMMC |
|  4   | 260-pin SO-DIMM |  5   | SPI Flash      |      |           |

</TabItem>

<TabItem value="瑞莎 NX5 载板">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-io-board-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                   | 序号 | 说明                           | 序号 | 说明                       |
| :--: | :--------------------- | :--: | :----------------------------- | :--: | :------------------------- |
|  1   | 2x USB 3.1 Gen1 Type-A |  2   | 上：DP 输出 <br/>下：HDMI 输出 |  3   | DC5525 供电接口（5V 输入） |
|  4   | 风扇接口               |  5   | MIPI 摄像头接口                |  6   | MIPI 摄像头接口            |
|  7   | 电源按键               |  8   | Maskrom 按键                   |  9   | microSD 卡槽               |
|  10  | M.2 E Key 2230 插槽    |  11  | 40-Pin GPIO 排针               |  12  | 260-pin SO-DIMM 插槽       |
|  13  | micro USB 接口（OTG）  |  14  | 千兆以太网接口                 |  15  | 2x USB 3.1 Gen1 Type-A     |

</TabItem>

<TabItem value="瑞莎 NX5 开发套件">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-devkit-interface.webp" alt="瑞莎 NX5 开发套件接口图" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明          | 序号 | 说明     |
| :--: | :------------ | :--: | :------- |
|  1   | 瑞莎 NX5 载板 |  2   | 瑞莎 NX5 |

</TabItem>

</Tabs>

- 瑞莎 NX5

瑞莎 NX5 板载一个系统状态指示灯，绿色常亮说明供电正常，绿色闪烁说明系统启动正常。

- 瑞莎 NX5 载板

瑞莎 NX5 载板板载电源指示灯和系统状态指示灯，电源指示灯绿色常亮说明供电正常，系统状态指示灯蓝色闪缩说明系统启动正常。
