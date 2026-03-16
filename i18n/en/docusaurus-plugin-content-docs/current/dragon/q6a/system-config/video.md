---
sidebar_position: 4
---

# Video Codec Test Guide

This document records the video codec test methods and results for Radxa Dragon Q6A under the specified image and kernel versions.

:::info Test Environment

- System image: [radxa-dragon-q6a rsdk-r2](https://github.com/radxa-build/radxa-dragon-q6a/releases/tag/rsdk-r2)
- Kernel version: [linux-6.18.2](https://github.com/radxa/kernel/tree/linux-6.18.2)
- SPI firmware: [dragon-q6a_flat_build_wp_260120.zip](https://dl.radxa.com/dragon/q6a/images/dragon-q6a_flat_build_wp_260120.zip)
  :::

:::tip
Some sample videos in the test resources cannot be played correctly with GStreamer. To keep the test conditions consistent, it is recommended to generate all test videos with FFmpeg first, and then validate hardware decoding with GStreamer.
:::

## Preparation

### BIOS Setting for Hardware Encoder

Before using the hardware encoder, enable the following BIOS option:

`Hypervisor Settings -> Hypervisor Override in UEFI Setup`

### Install GStreamer

<NewCodeBlock tip="Device" type="device">

```bash
sudo apt update
sudo apt install gstreamer1.0-tools
```

</NewCodeBlock>

### Install FFmpeg

<NewCodeBlock tip="Device" type="device">

```bash
sudo apt install ffmpeg
```

</NewCodeBlock>

## Generic Decode Commands

### AVC / H.264

<NewCodeBlock tip="Device" type="device">

```bash
gst-launch-1.0 filesrc location=./<file>.mp4 ! qtdemux ! h264parse ! v4l2h264dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

### HEVC / H.265

<NewCodeBlock tip="Device" type="device">

```bash
gst-launch-1.0 filesrc location=./<file>.mp4 ! qtdemux ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

### VP9

<NewCodeBlock tip="Device" type="device">

```bash
gst-launch-1.0 -e filesrc location=./<file>.webm ! matroskademux ! v4l2vp9dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

## Decode Capability Matrix

### AVC / H.264

| Test File                  | Result        |
| -------------------------- | ------------- |
| `8k-AVC-8bit-60FPS.mp4`    | Decode failed |
| `8k-AVC-8bit-30FPS.mp4`    | Decode failed |
| `4k-AVC-8bit-60FPS.mp4`    | Decode failed |
| `4k-AVC-8bit-30FPS.mp4`    | Decode passed |
| `2k-AVC-8bit-60FPS.mp4`    | Decode passed |
| `2k-AVC-8bit-30FPS.mp4`    | Decode passed |
| `1080p-AVC-8bit-60FPS.mp4` | Decode passed |
| `1080p-AVC-8bit-30FPS.mp4` | Decode passed |

### HEVC / H.265

| Test File                   | Result        |
| --------------------------- | ------------- |
| `8k-HEVC-8bit-60FPS.mp4`    | Decode failed |
| `8k-HEVC-8bit-30FPS.mp4`    | Decode failed |
| `4k-HEVC-8bit-60FPS.mp4`    | Decode passed |
| `4k-HEVC-8bit-30FPS.mp4`    | Decode passed |
| `2k-HEVC-8bit-60FPS.mp4`    | Decode passed |
| `2k-HEVC-8bit-30FPS.mp4`    | Decode passed |
| `1080p-HEVC-8bit-60FPS.mp4` | Decode passed |
| `1080p-HEVC-8bit-30FPS.mp4` | Decode passed |

### VP9

| Test File                   | Result        |
| --------------------------- | ------------- |
| `8k-VP9-8bit-60FPS.webm`    | Decode failed |
| `8k-VP9-8bit-30FPS.webm`    | Decode failed |
| `4k-VP9-8bit-60FPS.webm`    | Decode passed |
| `4k-VP9-8bit-30FPS.webm`    | Decode passed |
| `2k-VP9-8bit-60FPS.webm`    | Decode passed |
| `2k-VP9-8bit-30FPS.webm`    | Decode passed |
| `1080p-VP9-8bit-60FPS.webm` | Decode passed |
| `1080p-VP9-8bit-30FPS.webm` | Decode passed |

## Generate Test Videos with FFmpeg

### AVC / H.264

<details>
<summary>Expand AVC / H.264 generation commands</summary>

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=7680x4320:rate=60 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 8k-AVC-8bit-60FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=7680x4320:rate=30 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 8k-AVC-8bit-30FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=3840x2160:rate=60 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 4k-AVC-8bit-60FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=3840x2160:rate=30 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 4k-AVC-8bit-30FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=2560x1440:rate=60 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 2k-AVC-8bit-60FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=2560x1440:rate=30 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 2k-AVC-8bit-30FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=60 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 1080p-AVC-8bit-60FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 1080p-AVC-8bit-30FPS.mp4
```

</NewCodeBlock>

</details>

### HEVC / H.265

<details>
<summary>Expand HEVC / H.265 generation commands</summary>

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=7680x4320:rate=60 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 8k-HEVC-8bit-60FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=7680x4320:rate=30 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 8k-HEVC-8bit-30FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=3840x2160:rate=60 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 4k-HEVC-8bit-60FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=3840x2160:rate=30 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 4k-HEVC-8bit-30FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=2560x1440:rate=60 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 2k-HEVC-8bit-60FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=2560x1440:rate=30 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 2k-HEVC-8bit-30FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=60 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 1080p-HEVC-8bit-60FPS.mp4
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 1080p-HEVC-8bit-30FPS.mp4
```

</NewCodeBlock>

</details>

### VP9

<details>
<summary>Expand VP9 generation commands</summary>

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=7680x4320:rate=60 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 8k-VP9-8bit-60FPS.webm
ffmpeg -f lavfi -i testsrc=duration=10:size=7680x4320:rate=30 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 8k-VP9-8bit-30FPS.webm
ffmpeg -f lavfi -i testsrc=duration=10:size=3840x2160:rate=60 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 4k-VP9-8bit-60FPS.webm
ffmpeg -f lavfi -i testsrc=duration=10:size=3840x2160:rate=30 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 4k-VP9-8bit-30FPS.webm
ffmpeg -f lavfi -i testsrc=duration=10:size=2560x1440:rate=60 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 2k-VP9-8bit-60FPS.webm
ffmpeg -f lavfi -i testsrc=duration=10:size=2560x1440:rate=30 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 2k-VP9-8bit-30FPS.webm
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=60 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 1080p-VP9-8bit-60FPS.webm
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 1080p-VP9-8bit-30FPS.webm
```

</NewCodeBlock>

</details>

## GStreamer Hardware Encode Validation

The following commands are currently used to validate HEVC 1080p 30FPS encoding:

<NewCodeBlock tip="Device" type="device">

```bash
gst-launch-1.0 -e videotestsrc num-buffers=150 ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! v4l2h265enc ! h265parse ! mp4mux ! filesink location=1080p-HEVC-8bit-30FPS.mp4
gst-launch-1.0 filesrc location=./1080p-HEVC-8bit-30FPS.mp4 ! qtdemux ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>
