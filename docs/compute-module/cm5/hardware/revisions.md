---
sidebar_position: 20
---

# 硬件改版记录

### CM5 X2.0：

- 核心板上增加eMMC配置
- eMMC接口改为SDMMC
- 去掉WIFI_HOST_WAKE_E网络，新增了SD_PWR_ON
- 状态指示LED从底板改到核心板

### CM5 X2.1:

- HDMI_TX0_HPD检测增加分压电阻
- SDMMC_DET_L增加MOS管控制
- 以太网PHY Config电阻更改：R90388改为NC，R90387改为4.7K
- IO板上FAN改为2 PIN 5V电路

### CM5 V2.2：

- HDMI0_TX_ON_H控制的4个MOS管和8个匹配电阻放到核心板上;
- HDMI DDC和CEC信号从IO板移动到核心板，增加电平转换UM3204H;
- 主控芯片兼容RK3588S2设计，增加2个电阻；
- I2C5 :80/82 Pin为满足RPI的3.3V I2C需求，I2C5与I2C7互换位置;

### CM5 V2.21：

- 在HDMI的4组信号线上串联220nF电容，以支持RPI的HDMI.
