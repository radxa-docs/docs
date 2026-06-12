---
sidebar_position: 4
---

# 视频编解码测试指南

本文档用于记录 Radxa Dragon Q8B 在指定镜像与内核版本下的视频编解码测试方法和结果。

:::info 测试环境

- 系统镜像：[radxa-dragon-midstream rsdk-t2](https://github.com/radxa-build/radxa-dragon-midstream/releases/tag/rsdk-t2)
- 内核版本：[linux-6.18.2](https://github.com/radxa/kernel/tree/linux-6.18.2)
- SPI 固件：参考 [Dragon Q8B 资源汇总下载](../download) 中的 SPI 启动固件
  :::

:::tip
测试资源中的部分视频文件无法通过 GStreamer 正常播放。为保证测试条件一致，建议统一使用 FFmpeg 生成测试视频，再使用 GStreamer 调用硬件解码器进行验证。
:::

## 前置准备

### 硬件编码器 BIOS 配置

在使用硬件编码器前，需要先在 BIOS 中启用以下选项：

`Radxa Platform Configuration -> Hypervisor Settings -> Hypervisor Override in UEFI Setup`

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
