---
sidebar_position: 4
---

# 视频编解码测试指南

本文档用于记录 Radxa Dragon Q6A 在指定镜像与内核版本下的视频编解码测试方法和结果。

:::info 测试环境

- 系统镜像：[radxa-dragon-q6a rsdk-r2](https://github.com/radxa-build/radxa-dragon-q6a/releases/tag/rsdk-r2)
- 内核版本：[linux-6.18.2](https://github.com/radxa/kernel/tree/linux-6.18.2)
- SPI 固件：[dragon-q6a_flat_build_wp_260120.zip](https://dl.radxa.com/dragon/q6a/images/dragon-q6a_flat_build_wp_260120.zip)
  :::

:::tip
测试资源中的部分视频文件无法通过 GStreamer 正常播放。为保证测试条件一致，建议统一使用 FFmpeg 生成测试视频，再使用 GStreamer 调用硬件解码器进行验证。
:::

## 前置准备

### 硬件编码器 BIOS 配置

在使用硬件编码器前，需要先在 BIOS 中启用以下选项：

`Hypervisor Settings -> Hypervisor Override in UEFI Setup`

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

## 通用解码命令

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

## 解码能力矩阵

### AVC / H.264

| 测试文件                   | 结果       |
| -------------------------- | ---------- |
| `8k-AVC-8bit-60FPS.mp4`    | 不可以解码 |
| `8k-AVC-8bit-30FPS.mp4`    | 不可以解码 |
| `4k-AVC-8bit-60FPS.mp4`    | 不可以解码 |
| `4k-AVC-8bit-30FPS.mp4`    | 可以解码   |
| `2k-AVC-8bit-60FPS.mp4`    | 可以解码   |
| `2k-AVC-8bit-30FPS.mp4`    | 可以解码   |
| `1080p-AVC-8bit-60FPS.mp4` | 可以解码   |
| `1080p-AVC-8bit-30FPS.mp4` | 可以解码   |

### HEVC / H.265

| 测试文件                    | 结果       |
| --------------------------- | ---------- |
| `8k-HEVC-8bit-60FPS.mp4`    | 不可以解码 |
| `8k-HEVC-8bit-30FPS.mp4`    | 不可以解码 |
| `4k-HEVC-8bit-60FPS.mp4`    | 可以解码   |
| `4k-HEVC-8bit-30FPS.mp4`    | 可以解码   |
| `2k-HEVC-8bit-60FPS.mp4`    | 可以解码   |
| `2k-HEVC-8bit-30FPS.mp4`    | 可以解码   |
| `1080p-HEVC-8bit-60FPS.mp4` | 可以解码   |
| `1080p-HEVC-8bit-30FPS.mp4` | 可以解码   |

### VP9

| 测试文件                    | 结果       |
| --------------------------- | ---------- |
| `8k-VP9-8bit-60FPS.webm`    | 不可以解码 |
| `8k-VP9-8bit-30FPS.webm`    | 不可以解码 |
| `4k-VP9-8bit-60FPS.webm`    | 可以解码   |
| `4k-VP9-8bit-30FPS.webm`    | 可以解码   |
| `2k-VP9-8bit-60FPS.webm`    | 可以解码   |
| `2k-VP9-8bit-30FPS.webm`    | 可以解码   |
| `1080p-VP9-8bit-60FPS.webm` | 可以解码   |
| `1080p-VP9-8bit-30FPS.webm` | 可以解码   |

## FFmpeg 生成测试视频

### AVC / H.264

<details>
<summary>展开 AVC / H.264 生成命令</summary>

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
<summary>展开 HEVC / H.265 生成命令</summary>

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
<summary>展开 VP9 生成命令</summary>

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

## GStreamer 硬件编码验证

当前验证命令如下，用于测试 HEVC 1080p 30FPS 编码：

<NewCodeBlock tip="Device" type="device">

```bash
gst-launch-1.0 -e videotestsrc num-buffers=150 ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! v4l2h265enc ! h265parse ! mp4mux ! filesink location=1080p-HEVC-8bit-30FPS.mp4
gst-launch-1.0 filesrc location=./1080p-HEVC-8bit-30FPS.mp4 ! qtdemux ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! waylandsink fullscreen=true
```

</NewCodeBlock>
