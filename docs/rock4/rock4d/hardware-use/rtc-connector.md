---
sidebar_position: 10
---

# RTC 接口

Radxa ROCK 4D 板载 RTC 电池接口，可以通过该接口连接 RTC 电池，为主板上的实时时钟（RTC）芯片在断电时持续供电，从而实现系统时钟的持续计时，保障系统时间在断电情况下也能保持准确。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-rtc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

使用 RTC 接口连接 RTC 电池，电池参数：

- 接口类型：XH1.25mm
- 电池类型：CR2032
- 电池电压：3.0V

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-rtc-install.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 查看 RTC

终端输入命令查看系统是否正确识别 RTC 电池。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo dmesg | grep rtc
```
</NewCodeBlock>

终端输出示例：`rtc information is valid`，说明 RTC 电池被正确识别。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
[    8.145303] [drm] Esmart1-win0(possible_vp_mask = 0x00000006) has no possible crtcs  
[    8.145370] [drm] Esmart3-win0(possible_vp_mask = 0x00000006) has no possible crtcs  
[    8.153133] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes  
[    8.154487] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes  
[    8.700833] rtc-hym8563 2-0051: hym8563_init_device: error read i2c data -6  
[    8.716545] rtc-hym8563 2-0051: rtc information is valid  
[    8.724597] rtc-hym8563 2-0051: registered as rtc0  
[    8.725670] rtc-hym8563 2-0051: setting system clock to 2000-01-01T00:00:23 UTC (946684823)  
```
</NewCodeBlock>

### 读取 RTC 时间

终端使用 `hwclock` 命令读取 RTC 芯片（/dev/rtc0）的当前时间。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo hwclock -r -f /dev/rtc0
```
</NewCodeBlock>

### 显示系统时间

使用 `date` 命令显示系统当前时间。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
date
```
</NewCodeBlock>

### 设置 RTC 时间

若 RTC 时间和系统时间不一致，可以使用 `hwclock` 命令将系统当前时间写入 RTC。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo hwclock -w -f /dev/rtc0
```
</NewCodeBlock>

### 验证 RTC

记录当前系统时间，然后断开瑞莎 ROCK 4D 的电源和网络，等待 10 分钟左右，然后重新连接电源，观察系统时间是否正常计时。

## 接口规格

| Pin# | Name      | Pin# | Name               |
| :--: | :-------- | :--: | :----------------- |
|  1   | OSCI      |  5   | I2C2_SDA_M0_CC_RTC |
|  2   | OSCO      |  6   | I2C2_SCL_M0_CC_RTC |
|  3   | RTC_INT_L |  7   | 32KOUT_RTC         |
|  4   | GND       |  8   | VCC_RTC            |
