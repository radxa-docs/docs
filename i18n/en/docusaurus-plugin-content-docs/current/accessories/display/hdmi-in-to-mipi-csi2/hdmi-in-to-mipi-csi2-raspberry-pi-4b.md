---
sidebar_position: 3
doc_kind: page
---

# Use with Raspberry Pi 4B

Use the Radxa 4K HDMI IN to MIPI CSI-2 Adapter to capture HDMI video on a Raspberry Pi 4B through its 2-lane MIPI CSI-2 interface. To capture audio as well, connect I2S and enable the overlay's `audio` option.

The driver project lists Debian 13.7 (trixie, `aarch64`) with kernel `6.18.60+rpt-rpi-v8` as its tested Pi 4 environment. The steps below are for 64-bit Raspberry Pi OS. Verify compatibility if you use a different operating system or kernel version.

The adapter accepts HDMI input up to 4K at 30 fps. The driver project lists a capture limit of 2560 × 1440 at 30 fps for the Pi 4B's 2-lane CSI-2 link. For the first test, set your HDMI source to 1920 × 1080 at 60 fps. For audio capture, set the source to output stereo PCM over HDMI.

## Hardware connections

Shut down the Raspberry Pi and disconnect its power before wiring. You need an HDMI cable, an AC014 opposite-side FPC cable (15 pins and 1.0 mm pitch at each end), and jumper wires for INT, DET, and optional I2S audio.

1. Connect the HDMI source to HDMI IN on the adapter.
2. Use the AC014 cable to connect the adapter's 15-pin 2-lane CSI port to the `CAMERA` connector on the Pi 4B. Align the exposed contacts at each end with the connector contacts. Insert the cable fully and close both latches.
3. Connect `INT` and `DET` from the adapter's 7-pin header. Use the physical pin numbers on the Pi 4B's 40-pin header.

| Adapter signal | Pi 4B physical pin | BCM GPIO |
| -------------- | ------------------ | -------- |
| `INT`          | 11                 | GPIO17   |
| `DET`          | 22                 | GPIO25   |

For additional wiring information, see the [RK628 driver hardware instructions](https://github.com/NujoulDev/rk628-rpi-driver#hardware-connections).

For audio capture, also connect the pins below. Leave `I2S_MCLK` unconnected. You can connect `GND` to any ground pin on the Pi 4B.

| Adapter signal           | Pi 4B physical pin | BCM GPIO         |
| ------------------------ | ------------------ | ---------------- |
| `I2S_D0` (data out)      | 38                 | GPIO20 (PCM DIN) |
| `I2S_LRCK` (frame clock) | 35                 | GPIO19           |
| `I2S_SCLK` (bit clock)   | 12                 | GPIO18           |
| `GND`                    | 39 (example)       | Ground           |

## Install the driver and enable the overlay

Check the operating system, architecture, and running kernel.

```bash
cat /etc/os-release
uname -m
uname -r
```

Choose one installation method. Both use DKMS and require headers that match the running kernel. If APT cannot find the matching headers, check your package sources and installed kernel version. If you just upgraded the kernel, reboot into the updated kernel and check again.

### Install from a `.deb` package

Download the `rk628-rpi-dkms` package and run the commands below from the download directory. Replace `PACKAGE.deb` with the downloaded filename. [Driver releases](https://github.com/NujoulDev/rk628-rpi-driver/releases)

```bash
sudo apt update
sudo apt install "linux-headers-$(uname -r)"
sudo apt install ./PACKAGE.deb
```

### Install from source

Install the build tools and kernel headers. Confirm that the last command finds the kernel build Makefile before continuing.

```bash
sudo apt update
sudo apt install git ca-certificates build-essential dkms device-tree-compiler \
  "linux-headers-$(uname -r)"
ls -l "/lib/modules/$(uname -r)/build/Makefile"
```

Clone the source and run the installer. For a reproducible installation, check out the desired release tag before running the script.

```bash
git clone https://github.com/NujoulDev/rk628-rpi-driver.git
cd rk628-rpi-driver
sudo ./scripts/install.sh
```

After installation, run `dkms status` and confirm the RK628 module is `installed` for the running kernel. Resolve any DKMS build errors before enabling the overlay.

### Configure the overlay and reboot

Back up `/boot/firmware/config.txt` and open it with `sudoedit /boot/firmware/config.txt`. In the active `[all]` section, set `camera_auto_detect` to `0` and use one `dtoverlay` line based on your wiring.

For video capture only, use the following settings.

```ini
camera_auto_detect=0
dtoverlay=rk628-pi4
```

For video and audio capture, add the `audio` option.

```ini
camera_auto_detect=0
dtoverlay=rk628-pi4,audio
```

Disable any other overlay that uses the same CSI connector or I2S pins, then run `sudo reboot`.

## Check devices and configure video

```bash
sudo apt update
sudo apt install v4l-utils
ls -l /dev/rk628-*
sudo dmesg | grep -i rk628
```

Use `/dev/rk628-video` to capture video and query HDMI input timings, and `/dev/rk628-subdev` to query audio status. If the video device is missing, check `dkms status`, `config.txt`, and the FPC, INT, and DET connections.

### Configure manually

Connect and turn on the HDMI source. Check that `--query-dv-timings` returns valid timings before setting the capture format. This example uses 1920 × 1080. Set the width and height to the reported `Active width` and `Active height` for your source.

```bash
v4l2-ctl -d /dev/rk628-video --query-dv-timings
v4l2-ctl -d /dev/rk628-video \
  --set-fmt-video=width=1920,height=1080,pixelformat=UYVY,field=none
v4l2-ctl -d /dev/rk628-video --get-fmt-video
```

After switching sources, changing the input resolution, or reconnecting HDMI, stop capture and repeat the timing query and format setup.

### Configure automatically with `rk628-media-initd` (optional)

The service waits for a stable HDMI signal and configures capture once per start. After installing it, look for `Ready:` in the current boot log before starting capture. After changing an HDMI input, stop capture and restart the service. [media-initd installation guide](https://github.com/NujoulDev/rk628-media-initd#readme)

```bash
systemctl status rk628-media-initd.service
sudo journalctl -u rk628-media-initd.service -b
# Restart after an HDMI input change, once capture has stopped.
sudo systemctl restart rk628-media-initd.service
```

## Verify video capture and preview

Capture 300 frames to `/dev/null` and check the reported frame rate and dropped frames. The command should finish normally at a frame rate close to the HDMI input. If it hangs or reports a `VIDIOC_STREAMON` error, press `Ctrl+C`, check whether another process is using the capture device, and verify the input timings and capture format.

```bash
v4l2-ctl -d /dev/rk628-video \
  --stream-mmap=4 --stream-count=300 --stream-to=/dev/null
```

Run the preview from a terminal on the Pi 4B desktop. Both preview examples use 1920 × 1080 at 60 fps. Adjust `width`, `height`, and `framerate` to match the HDMI input timings.

```bash
sudo apt install gstreamer1.0-tools gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good gstreamer1.0-gl

gst-launch-1.0 -e \
  v4l2src device=/dev/rk628-video io-mode=dmabuf do-timestamp=true ! \
  video/x-raw,format=UYVY,width=1920,height=1080,framerate=60/1 ! \
  queue max-size-buffers=2 max-size-bytes=0 max-size-time=0 leaky=downstream ! \
  glimagesink sync=true
```

If V4L2 capture works but the preview is blank or reports a negotiation error, check that you are running it from a local graphical session. Try removing `io-mode=dmabuf` and adding `videoconvert !` before `glimagesink`.

## Verify audio capture and playback (optional)

Confirm that the I2S and ground wires are connected, `dtoverlay=rk628-pi4,audio` is enabled, and the source is playing sound over HDMI.

```bash
sudo apt install alsa-utils
arecord -l
v4l2-ctl -d /dev/rk628-subdev --get-ctrl=audio_sampling_rate,audio_present
```

`arecord -l` should list `RK628HDMI`. When `audio_present` is `1`, use the reported `audio_sampling_rate`. The example uses 48000 Hz. If the driver reports 44100 Hz, set `-r` in the recording command and `rate` in the audio and video preview example to `44100`.

```bash
arecord -D hw:CARD=RK628HDMI,DEV=0 \
  -t wav -f S32_LE -r 48000 -c 2 -d 10 rk628-audio.wav
aplay rk628-audio.wav
```

If the sound card appears but the recording is silent, check the HDMI source's audio output and sample rate. Then try recording again while video capture is running in another terminal. To choose a different playback device, use `aplay -l` to list the devices and select one with `aplay -D`.

### Preview video and audio together

Stop the earlier capture and recording commands. On the Pi 4B desktop, select the audio output device. The example uses `pulsesink`, which requires a PulseAudio-compatible desktop service. If `gst-inspect-1.0 pulsesink` cannot find the plugin, install `gstreamer1.0-pulseaudio` and try again.

```bash
sudo apt install gstreamer1.0-alsa

gst-launch-1.0 -e \
  v4l2src device=/dev/rk628-video io-mode=dmabuf do-timestamp=true ! \
  video/x-raw,format=UYVY,width=1920,height=1080,framerate=60/1 ! \
  queue max-size-buffers=2 max-size-bytes=0 max-size-time=0 leaky=downstream ! \
  glimagesink sync=true \
  alsasrc device="hw:CARD=RK628HDMI,DEV=0" \
  buffer-time=40000 latency-time=5000 ! \
  audio/x-raw,format=S32LE,rate=48000,channels=2 ! \
  queue ! audioconvert ! audioresample ! \
  pulsesink buffer-time=40000 latency-time=5000 sync=true
```

## Upgrade and uninstall

- **Upgrade** by installing a newer `rk628-rpi-dkms` package with APT or running `sudo ./scripts/install.sh` from the desired source release. Check `dkms status`, reboot, and verify capture again. If you use `rk628-media-initd`, update it separately from its project releases.
- **Uninstall** the automatic configuration service first if installed (`sudo apt purge rk628-media-initd`). To remove a packaged driver, run `sudo apt purge rk628-rpi-dkms`. For a source installation, run `sudo ./scripts/uninstall.sh` from the corresponding source directory. Remove the `dtoverlay=rk628-pi4` line and its options from `/boot/firmware/config.txt`, restore `camera_auto_detect` and any overlays you disabled during setup, and reboot.

## Further reading

For PiKVM OS, the `pikvm-rk628` project provides a preconfigured Raspberry Pi 4 image and instructions for manual installation. [PiKVM OS installation guide](https://github.com/NujoulDev/pikvm-rk628)

- [RK628 driver and tested environments](https://github.com/NujoulDev/rk628-rpi-driver#tested-environments)
- [Adapter connectors and accessories](./README.md)
