---
sidebar_position: 5
---

# 视频硬件解码播放（MPV）

在部分 ARM / 嵌入式平台（例如高通等 SoC）上，视频硬件编解码通常采用 V4L2 M2M（Memory-to-Memory） 架构，而不是 PC 常见的 VA-API / VDPAU。因此默认使用 `hwdec=vaapi` 往往无法生效。
为了获得更流畅、更低功耗 的播放体验，建议将 mpv 的硬件解码后端设置为 `hwdec=v4l2m2m-copy`。

## 安装 mpv

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo apt update
sudo apt install mpv -y
```

</NewCodeBlock>

## 配置 mpv

创建目录并编辑配置：

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
mkdir -p ~/.config/mpv
nano ~/.config/mpv/mpv.conf
```

</NewCodeBlock>

将下面内容添加到用户配置文件内：

<NewCodeBlock tip="mpv.conf" type="device">

```
# 适用于资源受限设备的快速预设
profile=fast

# 启用 V4L2 M2M 硬件解码（推荐）
hwdec=v4l2m2m-copy

# GPU 渲染输出（兼容 OpenGL ES / Vulkan）
vo=gpu

# 提升帧提交稳定性（对嵌入式设备更友好）
swapchain-depth=8

# 快速缩放算法，降低 CPU/GPU 负担
sws-fast=yes
```

</NewCodeBlock>

参数说明：

- profile=fast：启用快速渲染预设，减少图像后处理开销，适合嵌入式设备
- hwdec=v4l2m2m-copy：指定硬件解码器为 V4L2 M2M，高通平台标准硬解接口，-copy 表示将解码帧从 GPU 内存拷贝回 CPU 可访问内存，兼容性更好
- vo=gpu：使用 GPU 渲染输出，支持 OpenGL ES（常见于 ARM Linux），是嵌入式平台推荐选项
- swapchain-depth=8：设置 GPU 帧缓冲队列深度，提高帧提交稳定性，避免卡顿（尤其在低刷新率屏上）
- sws-fast=yes：启用快速软件缩放，绕过高质量缩放算法，提升性能

:::tip 配置优先级

mpv 的配置文件优先级如下：

1. 用户配置：`~/.config/mpv/mpv.conf`（优先级最高，推荐使用）
2. 全局配置：`/etc/mpv/mpv.conf`

注意事项：

如果 `/etc/mpv/mpv.conf` 里设置了 `hwdec=vaapi`，用户级配置会覆盖它。

如果你没有创建用户配置，mpv 会直接使用 `/etc/mpv/mpv.conf`，此时需要手动修改全局配置，或用命令行临时指定参数。

:::

## 验证 mpv

可以在主板上播放任意视频来验证配置是否生效。需提前在主板上下载视频文件。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
mpv /path/to/your/video.mp4
```

</NewCodeBlock>

成功启用时，终端会显示类似 `Using hardware decoding (v4l2m2m-copy).` 的信息。

## 临时指定 mpv 参数

直接在命令行中指定 mpv 参数，例如：

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
mpv --hwdec=v4l2m2m-copy --vo=gpu --swapchain-depth=8 --sws-fast=yes /path/to/your/video.mp4
```

</NewCodeBlock>
