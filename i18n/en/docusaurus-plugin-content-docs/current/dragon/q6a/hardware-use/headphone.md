---
sidebar_position: 14
---

# Headphone Jack

The Radxa Dragon Q6A has a built-in 3.5mm four-segment headphone jack that supports audio input and output.

## Hardware Connection

Plug the 3.5mm headphone jack into the headphone jack on the Radxa Dragon Q6A.

:::tip
You can refer to the [Hardware Information](./hardware-info) tutorial to find the corresponding hardware interface location.
:::

## Audio Testing

### Viewing Audio Devices

Use the `aplay -l` command to view audio playback devices (speakers), and use the `arecord -l` command to view audio recording devices (microphones).

- Viewing Audio Playback Devices

<NewCodeBlock tip="radxa@device$" type="device">

```bash
aplay -l
```

</NewCodeBlock>

The terminal outputs similar information:

```text
**** List of PLAYBACK Hardware Devices ****
card 0: QCS6490RadxaDra [QCS6490-Radxa-Dragon-Q6A], device 0: MultiMedia1 Playback (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: QCS6490RadxaDra [QCS6490-Radxa-Dragon-Q6A], device 1: MultiMedia2 Playback (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

- View audio recording devices

<NewCodeBlock tip="radxa@device$" type="device">

```bash
arecord -l
```

</NewCodeBlock>

Output information similar to the following:

<NewCodeBlock tip="radxa@device$" type="device">

```bash
**** List of CAPTURE Hardware Devices ****
card 0: QCS6490RadxaDra [QCS6490-Radxa-Dragon-Q6A], device 2: MultiMedia3 Capture (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

</NewCodeBlock>

### Recording audio

This feature requires headphones that support microphone functionality and uses the `arecord` command to record audio.

<NewCodeBlock tip="radxa@device$" type="device">

```bash
sudo arecord -Dhw:0,2 -d 20 -f cd -r 44100 -c 2 -t wav  /tmp/tmp.wav
```

</NewCodeBlock>

- Dhw:0,2: Indicates using `device 2` with `card 0: QCS6490RadxaDra`
- d 20: Indicates recording for 20 seconds
- f cd: Indicates using CD audio format
- r 44100: Indicates using a sampling rate of 44.1kHz
- c 2: Indicates using stereo
- t wav: Indicates using WAV format
- /tmp/tmp.wav: Indicates the output file path

Note: If you are unsure of the device name, you can modify the `-Dhw:0,2` parameter in the command to locate the corresponding recording device.

### Play audio

Use the `aplay` command to play audio.

<NewCodeBlock tip="radxa@device$" type="device">

```bash
sudo aplay -Dhw:0,1 /tmp/tmp.wav
```

</NewCodeBlock>

- Dhw:0,1: Indicates using `device 1` with `card 0: QCS6490RadxaDra`
- /tmp/tmp.wav: Indicates the input file path

Note: If you are unsure of the device name, you can change the `-Dhw:0,1` parameter in the command to find the corresponding playback device.

## Interface Pin Definitions

You can refer to the hardware schematic diagram on the [Resource Summary Download](../download) page.
