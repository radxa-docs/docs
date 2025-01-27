---
sidebar_position: 5
---

# Debian User Guide

This guide focuses on the Debian12 Desktop system built by Radxa.

## Default username and password

```
username : radxa
password : radxa
```

## Accessing Devices

### Option 1: Use HDMI monitor, USB keyboard and mouse

The desktop system can be seen on the HDMI monitor.

### Option two: SSH

SSH service is enabled by default.
You can view the IP of the device in the router management interface; or you can find the IP of the device by [angryip](https://angryip.org/) of the computer host.

```

$ ping ip-of-device
$ ssh radxa@ip-of-device

```

## Displays

The Orion O6 has five display ports, namely

- HDMI
- DP
- USBC 0
- USBC 1
- eDP

The hardware interfaces correspond to the system DRM Card as follows:

| System DRM Card            | hardware interface |
| -------------------------- | ------------------ |
| /sys/class/drm/card0-DP-1  | USBC 0             |
| /sys/class/drm/card1-DP-2  | HDMI               |
| /sys/class/drm/card2-eDP-1 | eDP                |
| /sys/class/drm/card3-DP-3  | USBC 1             |
| /sys/class/drm/card4-DP-4  | DP                 |

## Audio

### Desktop mode

The sound setting interface of the desktop system displays the currently available audio output devices.

#### Correspondence between audio output devices and hardware interfaces

| Audio Output Device  | Hardware interface |
| -------------------- | ------------------ |
| Headphone            | Headphone          |
| Speaker              | Speaker            |
| HDMI / DisplayPort 2 | USBC 0             |
| HDMI / DisplayPort 3 | HDMI               |
| HDMI / DisplayPort 4 | USBC 1             |
| HDMI / DisplayPort 5 | DP                 |

### Command line mode

#### List Playback Device

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

#### List Capture Device

```
root@orion-o6:~# arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: cixsky1 [cix,sky1], device 0: hda hda-audio-codec-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

#### System audio card and hardware interface

The physical interfaces correspond to the system audio card as follows:

| Audio Device           | Hardware interface        |
| ---------------------- | ------------------------- |
| had had-audio-codec-0  | Headphone/Speaker/F_AUDIO |
| dptx0_audio i2s-hifi-1 | USBC 0                    |
| dptx1_audio i2s-hifi-2 | HDMI                      |
| dptx3_audio i2s-hifi-3 | USBC 1                    |
| dptx4_audio i2s-hifi-4 | DP                        |

#### F_AUDIO capture command

```
amixer cset iface=MIXER,name='Line1 Mic Switch' 1
arecord -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_line1_mic.wav
```

#### F_AUDIO playback command

```
amixer cset iface=MIXER,name='ClassD AMP Mute' 1
amixer cset iface=MIXER,name='HP Out Mute' 1
amixer cset iface=MIXER,name='Line2 Out Mute' 0
amixer cset iface=MIXER,name='Line2 Switch' 1
aplay -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_line1_mic.wav
```

#### Headphone capture command

```
amixer cset iface=MIXER,name='Headset Mic Switch' 1
arecord -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_hs_mic.wav
```

#### Headphone playback command

```
amixer cset iface=MIXER,name='ClassD AMP Mute' 1
amixer cset iface=MIXER,name='HP Out Mute' 0
amixer cset iface=MIXER,name='Line2 Out Mute' 1
amixer cset iface=MIXER,name='Headset Switch' 1
aplay -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_hs_mic.wav
```

#### Speaker playback command

```
amixer cset iface=MIXER,name='ClassD AMP Mute' 0
amixer cset iface=MIXER,name='HP Out Mute' 1
amixer cset iface=MIXER,name='Line2 Out Mute' 1
aplay -Dhw:0,0 -c 2 -r 48000 -f S16_LE hda_hs_mic.wav
```

#### USBC 0 playback command

```
aplay -Dhw:0,1 playback-songs.wav
```

#### HDMI playback command

```
aplay -Dhw:0,2 playback-songs.wav
```

#### USBC 1 playback command

```
aplay -Dhw:0,3 playback-songs.wav
```

#### DP playback command

```
aplay -Dhw:0,4 playback-songs.wav
```

## WiFi/BT module

Supported list

- Radxa Wireless Module A8
