---
sidebar_position: 3
---

# AV Out Interface

## Video Testing

Use a MINI AV to HDMI video converter to connect the AV Out on the ROCK 2A to an HDMI display.

<img src="/img/rock2a/rock-2a-av-out.webp" width="800" alt="rock 2a pack" />

- Enable Overlay

  1. Open the Kconsole terminal and run the rsetup command:

  <pre> $ rsetup </pre>

  2. Through [Device Tree Configuration](../../radxa-os/rsetup) to enable the "Enable analog video output" overlay.

  :::tip

  Please enable the [Enable analog video output] overlay item.<br/>
  After successfully enabling [*] Enable analog video output, exit and reboot to apply the configuration.

  :::

  3. Reboot the system.

- Testing

  After rebooting, the HDMI screen should successfully display the system interface.

## Audio Testing

- Insert Headphones

  Insert the headphones into the headphone jack of the ROCK 2A.

  <img src="/img/rock2a/rock-2a-headphone.webp" width="800" alt="rock 2a pack" />

- Confirm Hardware Connection

  Ensure the headphones are properly inserted into the headphone jack, with a secure connection and no looseness.

- Check Sound Settings

  Open the system's sound settings, which can usually be found in the system settings or control panel. Make sure the audio output device is correctly set to headphones.

- Play Audio

  Play an audio file, such as music, video, or other media files, to ensure the sound can be output through the headphones.

- Check Volume Control

  Ensure the system volume and application volume settings are appropriate and not muted.

- Test Using Terminal Commands

  Use command-line tools in the terminal to test audio output. You can use the aplay or speaker-test commands, for example:

  To play an audio file using aplay:

  ```bash
  aplay test.wav
  ```

  Check if the playback is normal and if there is any noise.
