---
sidebar_position: 8
---

# 音频管理

主要介绍如何在 瑞莎 ROCK 4D 上使用音频设备。

## 音频设备

系统默认声音输出优先级为：蓝牙音频 > 耳机 > HDMI 音频。

手动选择音频输出设备后，则该音频设备为最高优先级。

## 音频设置

通过图形界面和命令行两种方式来对音频设备进行设置。

<Tabs queryString="interface-mode">

<TabItem value="图形界面">

点击桌面右下角的音频图标，选择需要的音频输出设备，滑动音频设备的音量条来调整音量。

① : 点击音频图标

② : 选择对应音频设备，滑动音频设备的音量条来调整音量

说明：`Headphones` 为扬声器，`Headset Microphone` 为麦克风。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-audio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="命令行模式">

通过 `alsamixer` 命令行工具来设置音频设备,终端输入下面命令即可打开 `alsamixer` UI 界面。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
alsamixer
```
</NewCodeBlock>

通过方向键 `up` 和 `down` 来调整音量。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-audio-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>
