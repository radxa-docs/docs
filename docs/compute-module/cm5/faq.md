---
sidebar_position: 20
---

# FAQ

### 1. Radxa CM5 能直接在 Radxa CM3 IO 上使用吗

不能，因为CM3的第3个连接器的94/96/98pin USB_5V_IN 在 CM3 IO上接的是5V，而 CM5 这几个PIN对应的是 GPIO 口
![cm3 vs cm5](/img/cm5/radxa_cm3_vs_cm5.webp)

### 2. 我们之前基于Radxa CM3 做的底板，后面想进行硬件升级，是否可以用 Radxa CM5 来替换 Radxa CM3 ?

1. 首先确认下当前 **CM3 + 底板**的硬件设计上，CM3的3个PIN(下图中2指向的位置) 94/96/98 (USB_5V_IN) 是否连接到 5V 上了，如果接到5V上，那就**不能替换**为CM5，
   否则会烧板子
![cm3 vs cm5](/img/cm5/radxa_cm3_vs_cm5.webp)

2. 如果上面1中提到的3个PIN没有连接5V，那么把CM3 替换成 CM5，更换之后，会有以下功能变化.

   - 不支持SPI Flash
   - SD卡检测脚有差异：CM3是在第1个连接器的76pin，CM5是在第3个连接器的74 pin，如果要兼容RPI的CM4 IO板(SD卡启动)，IO板第3个连接器的90pin需要接地
   - 不支持 HDMI TX的ARC功能:由于CM3的第二个连接器145/149pin没有连接SBDP/SBDN信号
   - MIPI_CSI:不支持4lane+2lane，仅支持2lane+2lane
   - MIPI_DSI0：不支持4lane+4lane，仅支持4lane+2lane
   - 不支持3.5耳机音频，需要外加CODEC
   - 不支持EDP:15/17/21/23/27/29/33/35 pin,CM3是支持EDP，而CM5是TYPE C
   - USB2_HOST3不支持：69/71 PIN CM3是USB，而CM5是I2C
