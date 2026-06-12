---
sidebar_position: 4
---

# 视频编解码测试指南

本文介绍如何在 Radxa Dragon Q8B 上使用 FFmpeg 生成测试视频，并通过 GStreamer 验证硬件编解码能力。

:::tip
建议使用最新 BIOS 固件和系统进行测试。测试资源中的部分视频文件无法通过 GStreamer 正常播放，为保证测试条件一致，建议统一使用 FFmpeg 生成测试视频，再使用 GStreamer 调用硬件解码器进行验证。
:::

## 前置准备

### 安装 GStreamer

<NewCodeBlock tip="Device" type="device">

```bash
sudo apt update
sudo apt install gstreamer1.0-tools
```

</NewCodeBlock>

### 安装 FFmpeg

<NewCodeBlock tip="Device" type="device">

```bash
sudo apt install ffmpeg
```

</NewCodeBlock>

## 解码示例

以下示例统一使用 FFmpeg 生成 10 秒 1080p 30FPS 测试视频，再用 GStreamer 调用硬件解码器验证。

### AVC / H.264 解码

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libx264 -pix_fmt yuv420p -preset fast -crf 18 1080p-AVC-8bit-30FPS.mp4
gst-launch-1.0 filesrc location=./1080p-AVC-8bit-30FPS.mp4 ! qtdemux ! h264parse ! v4l2h264dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

### HEVC / H.265 解码

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libx265 -preset fast -pix_fmt yuv420p -crf 14 1080p-HEVC-8bit-30FPS.mp4
gst-launch-1.0 filesrc location=./1080p-HEVC-8bit-30FPS.mp4 ! qtdemux ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

### VP9 解码

<NewCodeBlock tip="Device" type="device">

```bash
ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -c:v libvpx-vp9 -pix_fmt yuv420p -b:v 0 -crf 30 -row-mt 1 -threads 8 1080p-VP9-8bit-30FPS.webm
gst-launch-1.0 -e filesrc location=./1080p-VP9-8bit-30FPS.webm ! matroskademux ! v4l2vp9dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>

## GStreamer 硬件编码验证

当前仅保留 HEVC / H.265 1080p 30FPS 编码验证示例：

<NewCodeBlock tip="Device" type="device">

```bash
gst-launch-1.0 -e videotestsrc num-buffers=150 ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! v4l2h265enc ! h265parse ! mp4mux ! filesink location=1080p-HEVC-8bit-30FPS.mp4
gst-launch-1.0 filesrc location=./1080p-HEVC-8bit-30FPS.mp4 ! qtdemux ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>
