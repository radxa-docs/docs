---
sidebar_position: 5
---

# Debian 用户指南

这篇指南主要是介绍 Radxa 构建的 Debian12 Desktop 系统。

## 默认用户名和密码

```
username : radxa
password : radxa
```

## 访问设备

### 选项一：使用 HDMI 显示器，USB 键盘和鼠标

可以在 HDMI 显示器看到桌面系统。

### 选项二：SSH

SSH 服务默认是使能的。
可以在路由器管理界面查看设备的 IP；或者是通过电脑主机的 [angryip](https://angryip.org/) 来找到设备的 IP。

```
$ ping ip-of-device
$ ssh radxa@ip-of-device
```

## 显示

Orion O6 有5个显示接口，分别是

- HDMI
- DP
- USBC 0
- USBC 1
- eDP

物理接口与系统 DRM Card 的对应关系如下：

| 系统 DRM Card              | 物理接口 |
| -------------------------- | -------- |
| /sys/class/drm/card0-DP-1  | USBC 0   |
| /sys/class/drm/card1-DP-2  | HDMI     |
| /sys/class/drm/card2-eDP-1 | eDP      |
| /sys/class/drm/card3-DP-3  | USBC 1   |
| /sys/class/drm/card4-DP-4  | DP       |

## 音频

### 桌面模式

桌面系统的声音设置界面，有显示当前可使用的的音频输出设备。

#### 音频输出设备与硬件接口的对应关系

| 音频输出设备         | 硬件接口 |
| -------------------- | -------- |
| Headphone            | 耳机插孔 |
| Speaker              | Speaker  |
| HDMI / DisplayPort 2 | USBC 0   |
| HDMI / DisplayPort 3 | HDMI     |
| HDMI / DisplayPort 4 | USBC 1   |
| HDMI / DisplayPort 5 | DP       |

### 命令行模式

#### 查看播音设备

```
root@orion-o6:~# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: cixsky1 [cix,sky1], device 0: hda hda-audio-codec-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: cixsky1 [cix,sky1], device 1: dptx0_audio i2s-hifi-1 [dptx0_audio i2s-hifi-1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: cixsky1 [cix,sky1], device 2: dptx1_audio i2s-hifi-2 [dptx1_audio i2s-hifi-2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: cixsky1 [cix,sky1], device 3: dptx3_audio i2s-hifi-3 [dptx3_audio i2s-hifi-3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: cixsky1 [cix,sky1], device 4: dptx4_audio i2s-hifi-4 [dptx4_audio i2s-hifi-4]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

#### 查看录音设备

```
root@orion-o6:~# arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: cixsky1 [cix,sky1], device 0: hda hda-audio-codec-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

#### 系统音频设备与硬件接口的对应关系

| 音频设备               | 硬件接口                 |
| ---------------------- | ------------------------ |
| had had-audio-codec-0  | 耳机插孔/Speaker/F_AUDIO |
| dptx0_audio i2s-hifi-1 | USBC 0                   |
| dptx1_audio i2s-hifi-2 | HDMI                     |
| dptx3_audio i2s-hifi-3 | USBC 1                   |
| dptx4_audio i2s-hifi-4 | DP                       |

#### F_AUDIO 录音

```
amixer cset iface=MIXER,name='Line1 Mic Switch' 1
arecord -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_line1_mic.wav
```

#### F_AUDIO 播音

```
amixer cset iface=MIXER,name='ClassD AMP Mute' 1
amixer cset iface=MIXER,name='HP Out Mute' 1
amixer cset iface=MIXER,name='Line2 Out Mute' 0
amixer cset iface=MIXER,name='Line2 Switch' 1
aplay -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_line1_mic.wav
```

#### 耳机口录音

```
amixer cset iface=MIXER,name='Headset Mic Switch' 1
arecord -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_hs_mic.wav
```

#### 耳机口播音

```
amixer cset iface=MIXER,name='ClassD AMP Mute' 1
amixer cset iface=MIXER,name='HP Out Mute' 0
amixer cset iface=MIXER,name='Line2 Out Mute' 1
amixer cset iface=MIXER,name='Headset Switch' 1
aplay -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_hs_mic.wav
```

#### Speaker 播音

```
amixer cset iface=MIXER,name='ClassD AMP Mute' 0
amixer cset iface=MIXER,name='HP Out Mute' 1
amixer cset iface=MIXER,name='Line2 Out Mute' 1
aplay -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_hs_mic.wav
```

#### USBC 0 播音

```
aplay -Dhw:0,1 playback-songs.wav
```

#### HDMI 播音

```
aplay -Dhw:0,2 playback-songs.wav
```

#### USBC 1 播音

```
aplay -Dhw:0,3 playback-songs.wav
```

#### DP 播音

```
aplay -Dhw:0,4 playback-songs.wav
```

## WiFi/BT 模块

支持列表

- Radxa Wireless Module A8

## 以太网

当使用 iperf3 测试吞吐量时，先使用如下指令，修改中断分配

```
echo 40 > /proc/irq/$(cat /proc/interrupts | grep eth0-0 | cut -d ":" -f 1)/smp_affinity

echo 40 > /proc/irq/$(cat /proc/interrupts | grep eth1-0 | cut -d ":" -f 1)/smp_affinity
```
