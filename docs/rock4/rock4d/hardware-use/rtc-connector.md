---
sidebar_position: 10
---

# RTC 接口

Radxa ROCK 4D 板载 RTC 电池接口，可以通过该接口连接 RTC 电池，为主板上的实时时钟（RTC）芯片在断电时持续供电，从而实现系统时钟的持续计时，保障系统时间在断电情况下也能保持准确。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-rtc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

使用 RTC 接口连接 RTC 电池，电池电压为 3.3V，连接接口 XH1.25mm。

## 接口规格

| Pin# | Name      | Pin# | Name               |
| :--: | :-------- | :--: | :----------------- |
|  1   | OSCI      |  5   | I2C2_SDA_M0_CC_RTC |
|  2   | OSCO      |  6   | I2C2_SCL_M0_CC_RTC |
|  3   | RTC_INT_L |  7   | 32KOUT_RTC         |
|  4   | GND       |  8   | VCC_RTC            |
