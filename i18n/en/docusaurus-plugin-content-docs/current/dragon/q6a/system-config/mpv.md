---
sidebar_position: 5
---

# Hardware-accelerated video playback (mpv)

On some ARM/embedded platforms (for example, Qualcomm SoCs), hardware video encode/decode typically uses the V4L2 M2M (Memory-to-Memory) architecture rather than the PC-style VA-API/VDPAU. As a result, the default `hwdec=vaapi` often does not work.
For smoother playback and lower power consumption, set mpv's hardware decode backend to `hwdec=v4l2m2m-copy`.

## Install mpv

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo apt update
sudo apt install mpv -y
```

</NewCodeBlock>

## Configure mpv

Create the directory and edit the config:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
mkdir -p ~/.config/mpv
nano ~/.config/mpv/mpv.conf
```

</NewCodeBlock>

Add the following to the user configuration file:

<NewCodeBlock tip="radxa@dragon-q6a" type="device">

```
# Fast preset for resource-constrained devices
profile=fast

# Enable V4L2 M2M hardware decode (recommended)
hwdec=v4l2m2m-copy

# GPU output (compatible with OpenGL ES / Vulkan)
vo=gpu

# Improve frame submission stability (more friendly to embedded devices)
swapchain-depth=8

# Fast scaling to reduce CPU/GPU load
sws-fast=yes
```

</NewCodeBlock>

Parameter notes:

- `profile=fast`: Enables a fast rendering preset to reduce post-processing overhead, suitable for embedded devices.
- `hwdec=v4l2m2m-copy`: Uses the V4L2 M2M hardware decoder (standard on Qualcomm). `-copy` copies decoded frames from GPU memory to CPU-accessible memory for better compatibility.
- `vo=gpu`: Uses GPU rendering output and supports OpenGL ES (common on ARM Linux). Recommended for embedded platforms.
- `swapchain-depth=8`: Sets the GPU frame queue depth to improve stability and reduce stutter (especially on low-refresh displays).
- `sws-fast=yes`: Enables fast software scaling to bypass high-quality scaling for better performance.

:::tip Configuration priority

mpv config file priority:

1. User config: `~/.config/mpv/mpv.conf` (highest priority, recommended)
2. Global config: `/etc/mpv/mpv.conf`

Notes:

If `/etc/mpv/mpv.conf` sets `hwdec=vaapi`, user-level config overrides it.

If you do not create a user config, mpv uses `/etc/mpv/mpv.conf` directly. In that case, edit the global config or pass parameters on the command line.

:::

## Verify mpv

Play any video on the board to verify the configuration. Download a video file to the board first.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
mpv /path/to/your/video.mp4
```

</NewCodeBlock>

When hardware decoding is enabled, the terminal will show a message like `Using hardware decoding (v4l2m2m-copy).`.

## Temporarily set mpv parameters

You can also set parameters on the command line, for example:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
mpv --hwdec=v4l2m2m-copy --vo=gpu --swapchain-depth=8 --sws-fast=yes /path/to/your/video.mp4
```

</NewCodeBlock>
