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

## Decode Examples

The following examples use FFmpeg to generate a 10-second 1080p 30FPS test video, and then use GStreamer to validate hardware decoding.

### AVC / H.264 Decode

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 1080p-AVC-8bit-30FPS.mp4
gst-launch-1.0 filesrc location=./1080p-AVC-8bit-30FPS.mp4 ! qtdemux ! h264parse ! v4l2h264dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

### HEVC / H.265 Decode

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 1080p-HEVC-8bit-30FPS.mp4
gst-launch-1.0 filesrc location=./1080p-HEVC-8bit-30FPS.mp4 ! qtdemux ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

### VP9 Decode

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 1080p-VP9-8bit-30FPS.webm
gst-launch-1.0 -e filesrc location=./1080p-VP9-8bit-30FPS.webm ! matroskademux ! v4l2vp9dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

## GStreamer Hardware Encode Validation

Only the HEVC / H.265 1080p 30FPS encode validation example is kept below:

<NewCodeBlock tip="Device" type="device">

```bash
gst-launch-1.0 -e videotestsrc num-buffers=150 ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! v4l2h265enc ! h265parse ! mp4mux ! filesink location=1080p-HEVC-8bit-30FPS.mp4
gst-launch-1.0 filesrc location=./1080p-HEVC-8bit-30FPS.mp4 ! qtdemux ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>
