---
sidebar_position: 11
---

# Headphone Jack

Radxa Cubie A7A features an onboard 3.5mm 4-pole headphone jack, supporting both audio input and output.

:::tip
For the exact location of the headphone jack, please refer to the interface description section in the [Hardware Interfaces](./hardware-info) guide!
:::

## Usage Guide

Connect a 3.5mm headphone cable to the headphone jack of the Cubie A7A and your headphones, then play audio on the Cubie A7A to test if there is sound.

If you cannot play audio, try unplugging and replugging the headphone cable or check if the audio output device is set correctly.

### Check Audio Devices

Use the `aplay -l` command to view audio playback devices (speakers), and use the `arecord -l` command to view audio recording devices (microphones).

- View audio playback devices

<NewCodeBlock tip="radxa@device$" type="device">

```
aplay -l
```

</NewCodeBlock>

Sample terminal output: `card 0: sndi2s0` is the onboard AC101 audio codec, usually used for input (microphone) and output (audio playback) of the 3.5mm headphone jack.

```
**** List of PLAYBACK Hardware Devices ****
card 0: sndi2s0 [sndi2s0], device 0: sunxi-snd-plat-i2s-ac101-codec sunxi-ac101.15-001a-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: sndhdmi [sndhdmi], device 0: sunxi-snd-plat-i2s-sunxi-snd-codec-hdmi soc@3000000:hdmi_codec- []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

- View audio recording devices

<NewCodeBlock tip="radxa@device$" type="device">

```
arecord -l
```

</NewCodeBlock>

Sample output: `card 0: sndi2s0` is the onboard AC101 audio codec, usually used for input (microphone) and output (audio playback) of the 3.5mm headphone jack.

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

### Record Audio

This function requires the headset to support a microphone. Use the `arecord` command to record audio.

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo arecord -Dhw:0,0 -d 20 -f cd -r 44100 -c 2 -t wav  /tmp/tmp.wav
```

</NewCodeBlock>

- Dhw:0,0: Use `card 0: sndi2s0` and `device 0`
- d 20: Record for 20 seconds
- f cd: Use CD audio format
- r 44100: Use 44.1kHz sampling rate
- c 2: Use stereo
- t wav: Use WAV format
- /tmp/tmp.wav: Output file path

### Play Audio

Use the `aplay` command to play audio.

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo aplay -Dhw:0,0 /tmp/tmp.wav
```

</NewCodeBlock>

- Dhw:0,0: Use `card 0: sndi2s0` and `device 0`
- /tmp/tmp.wav: Input file path

## Port Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
:::
