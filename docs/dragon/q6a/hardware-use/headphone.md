---
sidebar_position: 14
---

# 耳机插孔

瑞莎 Dragon Q6A 板载 3.5mm 四段式耳机插孔，支持音频的输入和输出。

## 硬件连接

将 3.5 mm 耳机的接口插入瑞莎 Dragon Q6A 的耳机插孔。

:::tip
可以参考 [硬件信息](./hardware-info) 教程找到对应硬件接口位置。
:::

## 音频测试

### 查看音频设备

使用 `aplay -l` 命令查看音频播放设备（扬声器），使用 `arecord -l` 命令查看音频录制设备（麦克风）。

- 查看音频播放设备

<NewCodeBlock tip="radxa@device$" type="device">

```
aplay -l
```

</NewCodeBlock>

终端输出类似信息：

```
**** List of PLAYBACK Hardware Devices ****
card 0: QCS6490RadxaDra [QCS6490-Radxa-Dragon-Q6A], device 0: MultiMedia1 Playback (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: QCS6490RadxaDra [QCS6490-Radxa-Dragon-Q6A], device 1: MultiMedia2 Playback (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

- 查看音频录制设备

<NewCodeBlock tip="radxa@device$" type="device">

```
arecord -l
```

</NewCodeBlock>

输出类似如下信息：

<NewCodeBlock tip="radxa@device$" type="device">

```
**** List of CAPTURE Hardware Devices ****
card 0: QCS6490RadxaDra [QCS6490-Radxa-Dragon-Q6A], device 2: MultiMedia3 Capture (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

</NewCodeBlock>

### 录制音频

该功能需要耳机支持麦克风功能，使用 `arecord` 命令录制音频。

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo arecord -Dhw:0,2 -d 20 -f cd -r 44100 -c 2 -t wav  /tmp/tmp.wav
```

</NewCodeBlock>

- Dhw:0,2: 表示使用 `card 0: QCS6490RadxaDra` 的 `device 2`
- d 20: 表示录制 20 秒
- f cd: 表示使用 CD 音频格式
- r 44100: 表示使用 44.1kHz 的采样率
- c 2: 表示使用立体声
- t wav: 表示使用 WAV 格式
- /tmp/tmp.wav: 表示输出文件路径

注意：若不确定设备名称，可以更改命令的 `-Dhw:0,2` 参数来找到对应的录制设备。

### 播放音频

使用 `aplay` 命令播放音频。

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo aplay -Dhw:0,1 /tmp/tmp.wav
```

</NewCodeBlock>

- Dhw:0,1: 表示使用 `card 0: QCS6490RadxaDra` 的 `device 1`
- /tmp/tmp.wav: 表示输入文件路径

注意：若不确定设备名称，可以更改命令的 `-Dhw:0,1` 参数来找到对应的播放设备。

## 接口引脚定义

可以参考 [资源汇总下载](../download) 页面的硬件原理图。
