---
sidebar_position: 11
---

# 耳机插孔

瑞莎 Cubie A7A 板载 3.5mm 四段式耳机插孔，支持音频的输入和输出。

:::tip
耳机插孔具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 使用指南

使用 3.5 mm 耳机线连接 Cubie A7A 的耳机插孔和耳机,然后在 Cubie A7A 上播放音频测试是否有声音。

如果无法播放音频，可以尝试插拔耳机线或者检查音频输出设备是否设置正确。

:::tip

最新生产的批次 Cubie A7A 使用的是 AC101B 音频编解码器，使用最新系统镜像可以正常播放音频。

若使用旧版本的 AC101 音频编解码器，需要通过 Rsetup 使能 AC101 音频编解码器。

- 区分音频解码器

可以观察主板背面的芯片丝印判断音频解码器型号。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/radxa-cubie-a7a-codec.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- 软件使能

使用瑞莎系统自带的 Rsetup 工具使能 AC101 音频编解码器。

在终端命令行运行 `rsetup` 命令启动 Rsetup 工具：

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```
rsetup
```

</NewCodeBlock>

在 Rsetup 工具中依次进入 `Overlays` -> `Manage overlays`。

1. 通过方向键找到 [ ] Enable Allwinner AC101 Codec 选项
2. 按空格出现 [*] Enable Allwinner AC101 Codec 说明已选中该功能
3. 按 `Enter` 确认并保存设置。
4. 重启系统，使配置生效。

:::

### 查看音频设备

使用 `aplay -l` 命令查看音频播放设备（扬声器），使用 `arecord -l` 命令查看音频录制设备（麦克风）。

- 查看音频播放设备

<NewCodeBlock tip="radxa@device$" type="device">

```
aplay -l
```

</NewCodeBlock>

终端输出类似信息：其中 `card 0: sndi2s0` 板载的 AC101B 音频编解码器，通常用于 3.5mm 耳机接口的输入（麦克风）和输出（音频播放）。

```
**** List of PLAYBACK Hardware Devices ****
card 0: sndi2s0 [sndi2s0], device 0: sunxi-snd-plat-i2s-ac101-codec sunxi-ac101.15-001a-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: sndhdmi [sndhdmi], device 0: sunxi-snd-plat-i2s-sunxi-snd-codec-hdmi soc@3000000:hdmi_codec- []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

- 查看音频录制设备

<NewCodeBlock tip="radxa@device$" type="device">

```
arecord -l
```

</NewCodeBlock>

输出类似如下信息：其中 `card 0: sndi2s0` 板载的 AC101B 音频编解码器，通常用于 3.5mm 耳机接口的输入（麦克风）和输出（音频播放）。

<NewCodeBlock tip="radxa@device$" type="device">

```
**** List of CAPTURE Hardware Devices ****
card 0: sndi2s0 [sndi2s0], device 0: sunxi-snd-plat-i2s-ac101-codec sunxi-ac101.15-001a-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: sndhdmi [sndhdmi], device 0: sunxi-snd-plat-i2s-sunxi-snd-codec-hdmi soc@3000000:hdmi_codec- []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

</NewCodeBlock>

### 录制音频

该功能需要耳机支持麦克风功能，使用 `arecord` 命令录制音频。

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo arecord -Dhw:0,0 -d 20 -f cd -r 44100 -c 2 -t wav  /tmp/tmp.wav
```

</NewCodeBlock>

- Dhw:0,0: 表示使用 `card 0: sndi2s0` 的 `device 0`
- d 20: 表示录制 20 秒
- f cd: 表示使用 CD 音频格式
- r 44100: 表示使用 44.1kHz 的采样率
- c 2: 表示使用立体声
- t wav: 表示使用 WAV 格式
- /tmp/tmp.wav: 表示输出文件路径

### 播放音频

使用 `aplay` 命令播放音频。

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo aplay -Dhw:0,0 /tmp/tmp.wav
```

</NewCodeBlock>

- Dhw:0,0: 表示使用 `card 0: sndi2s0` 的 `device 0`
- /tmp/tmp.wav: 表示输入文件路径

## 接口规格

:::info 技术参考
完整的技术规格和引脚定义可参考下载专区的 [硬件设计：原理图](../download) 文档
:::
