---
sidebar_position: 13
---

# AXCL SDK FFmpeg

This document describes how to use the FFmpeg hardware encoder/decoder in the AXCL SDK, based on FFmpeg 7.1.

## Overview

AXCL SDK provides a hardware encode/decode solution based on FFmpeg 7.1, with built-in support for hardware decoding/encoding on AX650N and other devices. The shared libraries and executables are pre-compiled and ready to use.

| Item             | Path                          |
| ---------------- | ----------------------------- |
| Shared Libraries | `/usr/lib/axcl/ffmpeg/`       |
| Executable       | `/usr/bin/axcl/ffmpeg/ffmpeg` |

**Supported Hardware Decoders**:

| Decoder      | Format     | Output Pixel Format |
| ------------ | ---------- | ------------------- |
| `h264_axdec` | H.264      | NV12                |
| `hevc_axdec` | HEVC/H.265 | NV12                |

**Supported Hardware Encoders** (if available):

| Encoder      | Format     | Input Pixel Format |
| ------------ | ---------- | ------------------ |
| `h264_axenc` | H.264      | NV12               |
| `hevc_axenc` | HEVC/H.265 | NV12               |

## Environment Setup

### Set Shared Library Path

Before using AXCL FFmpeg, you must set `LD_LIBRARY_PATH`, otherwise the runtime will fail to find the `.so` files:

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
```

</NewCodeBlock>

:::tip
It is recommended to add this line to `~/.bashrc` or your startup script.
:::

### Verify Installation

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
/usr/bin/axcl/ffmpeg/ffmpeg -version
```

</NewCodeBlock>

You should see FFmpeg 7.1 version information.

### List Available Codecs

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
/usr/bin/axcl/ffmpeg/ffmpeg -decoders | grep ax
/usr/bin/axcl/ffmpeg/ffmpeg -encoders | grep ax
```

</NewCodeBlock>

## Command Line Usage

### Hardware Decoding

#### H.264 Local File Decoding

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  -frames:v 10 \
  output_%03d.yuv
```

</NewCodeBlock>

#### HEVC Local File Decoding

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v hevc_axdec \
  -i input.hevc \
  -frames:v 10 \
  output_%03d.yuv
```

</NewCodeBlock>

#### RTSP Stream Decoding

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -rtsp_transport tcp \
  -c:v h264_axdec \
  -i rtsp://192.168.1.100:8554/stream \
  -frames:v 100 \
  -pix_fmt nv12 \
  output.yuv
```

</NewCodeBlock>

:::tip
For RTSP, TCP transport (`-rtsp_transport tcp`) is recommended for better stability.
:::

#### Decoding to Raw Pixel Files

<NewCodeBlock tip="Host" type="device">

```bash
# Output NV12 format YUV
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  -frames:v 10 \
  -pix_fmt nv12 \
  output.yuv

# Output RGB24
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  -frames:v 10 \
  -pix_fmt rgb24 \
  output.rgb
```

</NewCodeBlock>

#### Decoding to Image Sequence

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  output_%04d.jpg
```

</NewCodeBlock>

#### Verify Decoding Correctness (null output)

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  -frames:v 5 \
  -f null -
```

</NewCodeBlock>

### Hardware Encoding

#### H.264 Encoding

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -framerate 30 \
  -s 1920x1080 \
  -pix_fmt nv12 \
  -i input.yuv \
  -c:v h264_axenc \
  -b:v 2M \
  output.mp4
```

</NewCodeBlock>

#### HEVC Encoding

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -framerate 30 \
  -s 1920x1080 \
  -pix_fmt nv12 \
  -i input.yuv \
  -c:v hevc_axenc \
  -b:v 2M \
  output.mp4
```

</NewCodeBlock>

#### Encoding Parameter Tuning

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -i input.yuv \
  -c:v h264_axenc \
  -b:v 4M \
  -maxrate 6M \
  -bufsize 8M \
  -g 30 \
  -preset fast \
  output.mp4
```

</NewCodeBlock>

| Parameter      | Description                  |
| -------------- | ---------------------------- |
| `-b:v 4M`      | Target bitrate 4Mbps         |
| `-maxrate 6M`  | Maximum bitrate              |
| `-bufsize 8M`  | Rate control buffer          |
| `-g 30`        | GOP size (keyframe interval) |
| `-preset fast` | Encoding speed preset        |

## Version Notes

The FFmpeg in AXCL SDK is based on **FFmpeg 7.1**. Pay attention to the following version compatibility issues:

### Header Files Must Match the Runtime Version

The AXCL FFmpeg runtime library (`.so` files) is **v61 (FFmpeg 7.1)**. If you compile your C/C++ code using **v59 (FFmpeg 5.x)** header files, the struct layouts are incompatible between versions, which will cause runtime crashes (e.g., accessing `AVStream.codecpar` fails).

**Recommended approach**: Download the corresponding source code (n7.1) from the [FFmpeg website](https://ffmpeg.org/download.html#releases), and add the header directory to your compile include path:

<NewCodeBlock tip="Host" type="device">

```bash
wget https://ffmpeg.org/releases/ffmpeg-7.1.tar.xz
tar xf ffmpeg-7.1.tar.xz
# Compile with -I/path/to/ffmpeg-7.1
```

</NewCodeBlock>

### API Changes

Some FFmpeg 7.x API parameter types differ from 5.x. Note the following:

| Function               | v5.x                                        | v7.x                                         |
| ---------------------- | ------------------------------------------- | -------------------------------------------- |
| `avcodec_free_context` | `avcodec_free_context(AVCodecContext* ctx)` | `avcodec_free_context(AVCodecContext** ctx)` |
| `av_frame_free`        | `av_frame_free(AVFrame* frame)`             | `av_frame_free(AVFrame** frame)`             |
| `av_packet_free`       | `av_packet_free(AVPacket* pkt)`             | `av_packet_free(AVPacket** pkt)`             |

:::caution
Note the address-of operator (`&`) is required in v7.x.
:::

## Recompiling FFmpeg

If you need to customize and recompile FFmpeg, follow the steps below.

### Obtain Source Code

Download FFmpeg n7.1 source from GitHub:

<NewCodeBlock tip="Host" type="device">

```bash
wget https://github.com/FFmpeg/FFmpeg/releases/download/n7.1/FFmpeg-n7.1.tar.gz
```

</NewCodeBlock>

Copy the source package to the SDK directory:

<NewCodeBlock tip="Host" type="device">

```bash
cp FFmpeg-n7.1.tar.gz ${AXCL_SDK}/axcl/3rdparty/ffmpeg/
cd ${AXCL_SDK}/axcl/3rdparty/ffmpeg
tar -zxvf FFmpeg-n7.1.tar.gz
```

</NewCodeBlock>

### Apply Patch

The SDK provides a patch for AX650N hardware adaptation:

<NewCodeBlock tip="Host" type="device">

```bash
cd ${AXCL_SDK}/axcl/3rdparty/ffmpeg
patch -p3 < FFmpeg-n7.1.patch
```

</NewCodeBlock>

### Build

**ARM64 target** (for AX650N):

<NewCodeBlock tip="Host" type="device">

```bash
cd ${AXCL_SDK}/axcl/3rdparty/ffmpeg
make host=arm64 clean all install
```

</NewCodeBlock>

Output files:

```bash
lib: ${AXCL_SDK}/axcl/out/axcl_linux_arm64/lib/ffmpeg/
bin: ${AXCL_SDK}/axcl/out/axcl_linux_arm64/bin/ffmpeg
```

**x86 target** (for development host cross-compilation):

<NewCodeBlock tip="Host" type="device">

```bash
cd ${AXCL_SDK}/axcl/3rdparty/ffmpeg
make host=x86 clean all install
```

</NewCodeBlock>

Output files:

```bash
lib: ${AXCL_SDK}/axcl/out/axcl_linux_x86/lib/ffmpeg/
bin: ${AXCL_SDK}/axcl/out/axcl_linux_x86/bin/ffmpeg
```

## FAQ

### Q1: `error while loading shared libraries` at runtime

Shared library not found. Verify `LD_LIBRARY_PATH` is set:

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
```

</NewCodeBlock>

### Q2: RTSP stream connection timeout

- Verify the RTSP URL is accessible (test with VLC or similar)
- Try specifying TCP transport: `-rtsp_transport tcp`
- Increase timeout: `-timeout 10000000` (microseconds)

### Q3: Decoded video looks abnormal (corruption/green screen)

- Verify the input file codec matches the decoder (use `h264_axdec` for H.264, `hevc_axdec` for HEVC)
- Verify the output pixel format is correctly specified (`h264_axdec` outputs NV12)

### Q4: Struct access crash at compile time

This is likely caused by a mismatch between header file and runtime library versions. Use FFmpeg 7.1 header files for compilation. See Section 5.1 of this document.

### Q5: Compile error `undefined reference to swr_*`

Library linking order issue. The order of FFmpeg libraries affects symbol resolution. Ensure `-lswresample` comes after `-lavcodec`:

```bash
-lavcodec -lavformat -lavutil -lswscale -lswresample
```
