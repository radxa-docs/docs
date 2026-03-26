---
sidebar_position: 13
---

# AXCL SDK FFmpeg

本文档介绍 AXCL SDK 中 FFmpeg 硬件编解码器的使用方法，基于 FFmpeg 7.1 版本。

## 概述

AXCL SDK 提供了一套基于 FFmpeg 7.1 封装的硬件编解码方案，内置支持 AX650N 等硬件解码/编码能力。动态库和可执行文件均已编译完成，可直接使用。

| 项目       | 路径                          |
| ---------- | ----------------------------- |
| 动态库     | `/usr/lib/axcl/ffmpeg/`       |
| 可执行程序 | `/usr/bin/axcl/ffmpeg/ffmpeg` |

**支持的硬件解码器**：

| 解码器       | 格式       | 输出像素格式 |
| ------------ | ---------- | ------------ |
| `h264_axdec` | H.264      | NV12         |
| `hevc_axdec` | HEVC/H.265 | NV12         |

**支持的硬件编码器**（如有）：

| 编码器       | 格式       | 输入像素格式 |
| ------------ | ---------- | ------------ |
| `h264_axenc` | H.264      | NV12         |
| `hevc_axenc` | HEVC/H.265 | NV12         |

## 环境准备

### 设置动态库路径

使用 AXCL FFmpeg 前必须设置 `LD_LIBRARY_PATH`，否则运行时找不到 `.so` 文件：

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
```

</NewCodeBlock>

:::tip
建议将此行加入 `~/.bashrc` 或启动脚本中。
:::

### 验证安装

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
/usr/bin/axcl/ffmpeg/ffmpeg -version
```

</NewCodeBlock>

应看到 FFmpeg 7.1 相关版本信息。

### 查看可用编解码器

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
/usr/bin/axcl/ffmpeg/ffmpeg -decoders | grep ax
/usr/bin/axcl/ffmpeg/ffmpeg -encoders | grep ax
```

</NewCodeBlock>

## 命令行使用

### 硬件解码

#### H.264 本地文件解码

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

#### HEVC 本地文件解码

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v hevc_axdec \
  -i input.hevc \
  -frames:v 10 \
  output_%03d.yuv
```

</NewCodeBlock>

#### RTSP 流拉流解码

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
RTSP 建议使用 TCP 传输（`-rtsp_transport tcp`），更稳定。
:::

#### 解码到原始像素文件

<NewCodeBlock tip="Host" type="device">

```bash
# 输出 NV12 格式 YUV
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  -frames:v 10 \
  -pix_fmt nv12 \
  output.yuv

# 输出 RGB24
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  -frames:v 10 \
  -pix_fmt rgb24 \
  output.rgb
```

</NewCodeBlock>

#### 解码为图片序列

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  output_%04d.jpg
```

</NewCodeBlock>

#### 验证解码正确性（null 输出）

<NewCodeBlock tip="Host" type="device">

```bash
/usr/bin/axcl/ffmpeg/ffmpeg \
  -c:v h264_axdec \
  -i input.mp4 \
  -frames:v 5 \
  -f null -
```

</NewCodeBlock>

### 硬件编码

#### H.264 编码

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

#### HEVC 编码

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

#### 编码参数调优

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

| 参数           | 说明                   |
| -------------- | ---------------------- |
| `-b:v 4M`      | 目标码率 4Mbps         |
| `-maxrate 6M`  | 最大码率               |
| `-bufsize 8M`  | 码率控制缓冲           |
| `-g 30`        | GOP 大小（关键帧间隔） |
| `-preset fast` | 编码速度               |

## 版本说明

AXCL SDK 的 FFmpeg 基于 **FFmpeg 7.1** 开发。需要注意以下版本兼容性问题：

### 头文件与 runtime 版本必须匹配

AXCL FFmpeg 的 runtime 库（`.so` 文件）是 **v61（FFmpeg 7.1）** 版本。如果在 C/C++ 代码中使用 **v59（FFmpeg 5.x）** 版本的头文件进行编译，由于 struct 布局在两个版本间不兼容，运行时会导致 crash（例如访问 `AVStream.codecpar` 失败）。

**推荐做法**：从 [FFmpeg 官网](https://ffmpeg.org/download.html#releases) 下载对应版本的源码（n7.1），将头文件目录加入编译路径：

<NewCodeBlock tip="Host" type="device">

```bash
wget https://ffmpeg.org/releases/ffmpeg-7.1.tar.xz
tar xf ffmpeg-7.1.tar.xz
# 编译时指定 -I/path/to/ffmpeg-7.1
```

</NewCodeBlock>

### API 变更注意

FFmpeg 7.x 的部分 API 参数类型与 5.x 不同，需注意：

| 函数                   | v5.x                                        | v7.x                                         |
| ---------------------- | ------------------------------------------- | -------------------------------------------- |
| `avcodec_free_context` | `avcodec_free_context(AVCodecContext* ctx)` | `avcodec_free_context(AVCodecContext** ctx)` |
| `av_frame_free`        | `av_frame_free(AVFrame* frame)`             | `av_frame_free(AVFrame** frame)`             |
| `av_packet_free`       | `av_packet_free(AVPacket* pkt)`             | `av_packet_free(AVPacket** pkt)`             |

:::caution
使用时注意取地址。
:::

## 重新编译 FFmpeg

如需对 FFmpeg 进行定制修改，可按以下步骤重新编译。

### 获取源码

从 GitHub 下载 FFmpeg n7.1 源码：

<NewCodeBlock tip="Host" type="device">

```bash
wget https://github.com/FFmpeg/FFmpeg/releases/download/n7.1/FFmpeg-n7.1.tar.gz
```

</NewCodeBlock>

将源码包拷贝到 SDK 目录：

<NewCodeBlock tip="Host" type="device">

```bash
cp FFmpeg-n7.1.tar.gz ${AXCL_SDK}/axcl/3rdparty/ffmpeg/
cd ${AXCL_SDK}/axcl/3rdparty/ffmpeg
tar -zxvf FFmpeg-n7.1.tar.gz
```

</NewCodeBlock>

### 应用 Patch

SDK 提供了适配 AX650N 硬件的 patch：

<NewCodeBlock tip="Host" type="device">

```bash
cd ${AXCL_SDK}/axcl/3rdparty/ffmpeg
patch -p3 < FFmpeg-n7.1.patch
```

</NewCodeBlock>

### 编译

**ARM64 目标平台**：

<NewCodeBlock tip="Host" type="device">

```bash
cd ${AXCL_SDK}/axcl/3rdparty/ffmpeg
make host=arm64 clean all install
```

</NewCodeBlock>

目标文件输出到：

```bash
lib: ${AXCL_SDK}/axcl/out/axcl_linux_arm64/lib/ffmpeg/
bin: ${AXCL_SDK}/axcl/out/axcl_linux_arm64/bin/ffmpeg
```

**x86 目标平台**：

<NewCodeBlock tip="Host" type="device">

```bash
cd ${AXCL_SDK}/axcl/3rdparty/ffmpeg
make host=x86 clean all install
```

</NewCodeBlock>

目标文件输出到：

```bash
lib: ${AXCL_SDK}/axcl/out/axcl_linux_x86/lib/ffmpeg/
bin: ${AXCL_SDK}/axcl/out/axcl_linux_x86/bin/ffmpeg
```

## 常见问题

### Q1: 运行时报 `error while loading shared libraries`

动态库未找到。确认已设置 `LD_LIBRARY_PATH`：

<NewCodeBlock tip="Host" type="device">

```bash
export LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:$LD_LIBRARY_PATH"
```

</NewCodeBlock>

### Q2: RTSP 流连接超时

- 确认 RTSP URL 可用（用 VLC 等工具验证）
- 尝试指定 TCP 传输：`-rtsp_transport tcp`
- 增加超时时间：`-timeout 10000000`（微秒）

### Q3: 解码后画面异常（花屏/绿屏）

- 检查输入文件编码格式是否与解码器匹配（H.264 用 `h264_axdec`，HEVC 用 `hevc_axdec`）
- 检查输出像素格式是否正确指定（`h264_axdec` 输出 NV12）

### Q4: 编译时 struct 访问 crash

很可能是头文件版本与 runtime 库版本不匹配。请使用 FFmpeg 7.1 版本的头文件编译，参见本文档第 5.1 节。

### Q5: 编译报错 `undefined reference to swr_*`

链接顺序问题。FFmpeg 库的链接顺序会影响符号解析，确保 `-lswresample` 在 `-lavcodec` 之后：

```bash
-lavcodec -lavformat -lavutil -lswscale -lswresample
```
