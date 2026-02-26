---
sidebar_position: 8
---

# Audio Management

This guide explains how to use audio devices on the Radxa ROCK 4D.

## Audio Devices

The default audio output priority is: Bluetooth Audio > Headphones > HDMI Audio.

After manually selecting an audio output device, that device will have the highest priority.

## Audio Settings

You can configure audio devices through either a graphical interface or command line.

<Tabs queryString="interface-mode">

<TabItem value="Graphical Interface">

Click the audio icon in the bottom-right corner of the desktop, select your desired audio output device, and adjust the volume by sliding the volume bar.

① : Click the audio icon

② : Select the corresponding audio device and adjust the volume by sliding the volume bar

Note: `Headphones` are for speakers, and `Headset Microphone` is for the microphone.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-audio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Command Line Mode">

Use the `alsamixer` command-line tool to configure audio devices. Enter the following command in the terminal to open the `alsamixer` UI interface.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
alsamixer
```
</NewCodeBlock>

Use the `up` and `down` arrow keys to adjust the volume.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-audio-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>
