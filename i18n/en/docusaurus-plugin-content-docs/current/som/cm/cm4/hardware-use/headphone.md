---
sidebar_position: 11
---

# 3.5mm Headphone Jack

The Radxa CM4 IO Board features a built-in 3.5mm 4-pole headphone jack that supports both audio input and output.

## Hardware Connection

Insert your 3.5mm headphone plug into the headphone jack on the Radxa CM4 IO Board.

:::tip
Refer to the [Hardware Information](./hardware_info.md) guide to locate the headphone jack.
:::

## Audio Testing

### View Audio Devices

Use the `aplay -l` command to view audio playback devices (speakers), and `arecord -l` to view audio recording devices (microphone).

- View Playback Devices

<NewCodeBlock tip="radxa@device$" type="device">

```
aplay -l
```

</NewCodeBlock>

Terminal output example: The onboard ES8388 audio codec (`card 1: rockchipes8388`) is typically used for both input (microphone) and output (audio playback) through the 3.5mm headphone jack.

```
card 0: rockchiphdmi0 [rockchip-hdmi0], device 0: rockchip-hdmi0 i2s-hifi-0 [rockchip-hdmi0 i2s-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: rockchipes8388 [rockchip-es8388], device 0: dailink-multicodecs ES8323 HiFi-0 [dailink-multicodecs ES8323 HiFi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

- View Recording Devices

<NewCodeBlock tip="radxa@device$" type="device">

```
arecord -l
```

</NewCodeBlock>

Example output: The onboard ES8388 audio codec (`card 1: rockchipes8388`) is typically used for both input (microphone) and output (audio playback) through the 3.5mm headphone jack.

<NewCodeBlock tip="radxa@device$" type="device">

```
card 0: rockchiphdmi0 [rockchip-hdmi0], device 0: rockchip-hdmi0 i2s-hifi-0 [rockchip-hdmi0 i2s-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: rockchipes8388 [rockchip-es8388], device 0: dailink-multicodecs ES8323 HiFi-0 [dailink-multicodecs ES8323 HiFi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

</NewCodeBlock>

### Record Audio

This feature requires headphones with microphone support. Use the `arecord` command to record audio.

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo arecord -Dhw:1,0 -d 20 -f cd -r 44100 -c 2 -t wav /tmp/tmp.wav
```

</NewCodeBlock>

- `-Dhw:1,0`: Use `device 0` of `card 1: rockchipes8388`
- `-d 20`: Record for 20 seconds
- `-f cd`: Use CD audio format (16-bit little-endian, 44100 Hz, stereo)
- `-r 44100`: Use 44.1kHz sample rate
- `-c 2`: Use stereo (2 channels)
- `-t wav`: Output in WAV format
- `/tmp/tmp.wav`: Output file path

### Play Audio

Use the `aplay` command to play audio.

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo aplay -Dhw:1,0 /tmp/tmp.wav
```

</NewCodeBlock>

- `-Dhw:1,0`: Use `device 0` of `card 1: rockchipes8388`
- `/tmp/tmp.wav`: Input file path to play

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
