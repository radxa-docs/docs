---
sidebar_position: 3
doc_kind: page
---

# 搭配树莓派 4B 使用

在树莓派 4B 上使用瑞莎 4K HDMI IN 转 MIPI CSI-2 转接板，通过 2-lane MIPI CSI-2 采集 HDMI 视频。需要采集声音时，在视频接线的基础上连接 I2S，并启用音频参数。

上游驱动 README 列出的 Pi 4 测试环境为 Debian 13.7（trixie，`aarch64`），内核 `6.18.60+rpt-rpi-v8`。以下步骤面向 64 位 Raspberry Pi OS，其他系统或内核版本需要单独验证。

转接板最高可接收 4K @ 30 fps 的 HDMI 输入。Pi 4B 使用 2-lane CSI-2，驱动项目标注该链路最高可采集 2560 × 1440 @ 30 fps。首次调试建议将 HDMI 信号源设为 1920 × 1080 @ 60 fps。采集音频时，请将 HDMI 音频设为双声道 PCM。

## 硬件连接

关闭树莓派并断开电源后接线。准备一根 HDMI 线、一根 AC014 异面 FPC 排线（两端均为 15 针、1.0 mm 间距），以及用于 INT、DET 和可选 I2S 的杜邦线。

1. 将 HDMI 信号源的输出口连到转接板的 HDMI IN。
2. 使用 AC014 把转接板的 15 针 2-lane CSI 接口连到 Pi 4B 印有 `CAMERA` 的接口。两端排线的露铜面各自对准连接器触点，插到底后扣紧卡扣。
3. 从转接板的 7 针排针连接 `INT` 和 `DET`。下表的数字为树莓派 40 针排针的物理针脚号。

| 转接板信号 | Pi 4B 物理针脚 | BCM GPIO |
| ---------- | -------------- | -------- |
| `INT`      | 11             | GPIO17   |
| `DET`      | 22             | GPIO25   |

更多接线信息见 [RK628 驱动的硬件连接说明](https://github.com/NujoulDev/rk628-rpi-driver#hardware-connections)。

若要采集音频，再按下表接线。`I2S_MCLK` 留空，`GND` 可接树莓派任一地针。

| 转接板信号           | Pi 4B 物理针脚 | BCM GPIO          |
| -------------------- | -------------- | ----------------- |
| `I2S_D0`（数据输出） | 38             | GPIO20（PCM DIN） |
| `I2S_LRCK`（帧时钟） | 35             | GPIO19            |
| `I2S_SCLK`（位时钟） | 12             | GPIO18            |
| `GND`                | 39（示例）     | —                 |

## 安装驱动并启用 overlay

先记录系统版本、架构和当前内核。

```bash
cat /etc/os-release
uname -m
uname -r
```

选择一种驱动安装方式。两种方式都使用 DKMS，都需要与当前运行内核匹配的头文件。如果 APT 找不到对应头文件，先检查软件源、已安装内核与当前运行内核是否一致。若刚更新过内核，重启进入新内核后再重新检查。

### 从 `.deb` 安装（推荐）

从驱动发布页下载 `rk628-rpi-dkms` 的 `.deb` 软件包。在下载目录执行以下命令，将 `PACKAGE.deb` 换成实际文件名。 [驱动发布页](https://github.com/NujoulDev/rk628-rpi-driver/releases)

```bash
sudo apt update
sudo apt install "linux-headers-$(uname -r)"
sudo apt install ./PACKAGE.deb
```

### 从源码安装

安装编译工具和头文件，确认最后一条检查命令成功后再继续。

```bash
sudo apt update
sudo apt install git ca-certificates build-essential dkms device-tree-compiler \
  "linux-headers-$(uname -r)"
ls -l "/lib/modules/$(uname -r)/build/Makefile"
```

下载源码并安装。需要复现固定版本时，在运行安装脚本前先切换到 Releases 对应的 tag。

```bash
git clone https://github.com/NujoulDev/rk628-rpi-driver.git
cd rk628-rpi-driver
sudo ./scripts/install.sh
```

安装结束后运行 `dkms status`，确认 RK628 模块对当前内核显示为 `installed`。若安装报错，先处理 DKMS 错误，再继续启用 overlay。

### 配置 overlay 并重启

先备份 `/boot/firmware/config.txt`，再用 `sudoedit /boot/firmware/config.txt` 编辑。在生效的 `[all]` 配置段将 `camera_auto_detect` 设为 `0`，并根据接线填写一条 `dtoverlay` 配置。

仅采集视频：

```ini
camera_auto_detect=0
dtoverlay=rk628-pi4
```

同时采集视频和音频：

```ini
camera_auto_detect=0
dtoverlay=rk628-pi4,audio
```

若已启用占用同一个 CSI 接口或 I2S 引脚的 overlay，先停用冲突项，再执行 `sudo reboot`。

## 检查设备并配置视频

```bash
sudo apt update
sudo apt install v4l-utils
ls -l /dev/rk628-*
sudo dmesg | grep -i rk628
```

`/dev/rk628-video` 是 Pi 4B 的视频采集节点，也是查询 HDMI 输入时序的节点。`/dev/rk628-subdev` 用于查询音频状态。若没有视频节点，先检查 `dkms status`、`config.txt` 和 FPC、INT、DET 接线。

### 手动配置

接通并打开 HDMI 信号源。先确认 `--query-dv-timings` 能返回有效时序，再设置采集尺寸。下例以 1920 × 1080 为例，输入不同则改为实际的 `Active width` 和 `Active height`。

```bash
v4l2-ctl -d /dev/rk628-video --query-dv-timings
v4l2-ctl -d /dev/rk628-video \
  --set-fmt-video=width=1920,height=1080,pixelformat=UYVY,field=none
v4l2-ctl -d /dev/rk628-video --get-fmt-video
```

切换信号源、修改分辨率或重新插拔 HDMI 后，先停止取流，再重新查询时序并设置格式。

### 使用 `rk628-media-initd` 自动配置（可选）

按上游说明安装服务。服务每次启动时等待 HDMI 信号稳定，并配置一次采集设备。在本次启动日志中确认有 `Ready:` 后再开始取流。切换输入源、改变分辨率或重新插拔 HDMI 后，先停止取流，再重启服务。 [media-initd 安装说明](https://github.com/NujoulDev/rk628-media-initd#readme)

```bash
systemctl status rk628-media-initd.service
sudo journalctl -u rk628-media-initd.service -b
# HDMI 输入发生变化时，停止取流后执行
sudo systemctl restart rk628-media-initd.service
```

## 验证视频采集与预览

先验证能否取流。以下命令将 300 帧写入 `/dev/null`，用于观察帧率和是否持续丢帧。命令应正常结束，帧率应接近信号源的输出帧率。若一直等待或遇到 `VIDIOC_STREAMON`，按 `Ctrl+C` 退出，检查是否有其他程序占用采集设备，并重新核对时序和格式。

```bash
v4l2-ctl -d /dev/rk628-video \
  --stream-mmap=4 --stream-count=300 --stream-to=/dev/null
```

有图形桌面时，可以打开桌面终端预览。两处预览命令均以 1920 × 1080 @ 60 fps 为例，按 HDMI 输入时序调整 `width`、`height` 和 `framerate`。

```bash
sudo apt install gstreamer1.0-tools gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good gstreamer1.0-gl

gst-launch-1.0 -e \
  v4l2src device=/dev/rk628-video io-mode=dmabuf do-timestamp=true ! \
  video/x-raw,format=UYVY,width=1920,height=1080,framerate=60/1 ! \
  queue max-size-buffers=2 max-size-bytes=0 max-size-time=0 leaky=downstream ! \
  glimagesink sync=true
```

如果 V4L2 取流通过、桌面预览却黑屏或协商失败，先确认命令在本机图形桌面终端执行。可去掉 `io-mode=dmabuf`，并在 `glimagesink` 前插入 `videoconvert !` 再试。

## 验证音频采集与播放（可选）

先确认已按接线表连接 I2S 和 GND，启用了 `dtoverlay=rk628-pi4,audio`，且信号源正在通过 HDMI 播放声音。

```bash
sudo apt install alsa-utils
arecord -l
v4l2-ctl -d /dev/rk628-subdev --get-ctrl=audio_sampling_rate,audio_present
```

`arecord -l` 应列出 `RK628HDMI`。当 `audio_present=1` 时，按 `audio_sampling_rate` 设置录音采样率。下例为 48000 Hz；若查询到 44100 Hz，则把录音命令的 `-r` 和双流示例的 `rate` 都改为 `44100`。

```bash
arecord -D hw:CARD=RK628HDMI,DEV=0 \
  -t wav -f S32_LE -r 48000 -c 2 -d 10 rk628-audio.wav
aplay rk628-audio.wav
```

如果声卡存在但录音无声，先检查 HDMI 源的音频输出设备和实际采样率，再尝试保持另一终端的视频取流运行，同时重新录音。若要用默认播放设备之外的声卡，先用 `aplay -l` 查找设备，再通过 `aplay -D` 指定。

### 同时预览视频和音频

先退出前面的取流和录音程序。在树莓派本机桌面选择音频输出设备。下例使用 `pulsesink`，需要桌面会话提供 PulseAudio 或兼容服务。若 `gst-inspect-1.0 pulsesink` 提示找不到插件，可安装 `gstreamer1.0-pulseaudio` 后重试。

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

## 升级与卸载

- **升级**：用 APT 安装新版 `rk628-rpi-dkms` 软件包，或在目标版本的源码目录运行 `sudo ./scripts/install.sh`。用 `dkms status` 确认模块已为目标内核构建，重启后重新执行取流验证。若使用 `rk628-media-initd`，按它的 Releases 单独升级。
- **卸载**：若安装了自动配置服务，先执行 `sudo apt purge rk628-media-initd`。然后按原安装方式卸载驱动：软件包用户执行 `sudo apt purge rk628-rpi-dkms`，源码用户在相应源码目录执行 `sudo ./scripts/uninstall.sh`。从 `/boot/firmware/config.txt` 删除本次添加的 `dtoverlay=rk628-pi4` 行及参数，把 `camera_auto_detect` 和先前停用的 overlay 恢复到安装前的设置，再重启。

## 扩展阅读

使用 PiKVM OS 的用户可前往 `pikvm-rk628` 项目获取树莓派 4 的预配置镜像，或按指南手动安装。 [PiKVM OS 中文安装指南](https://github.com/NujoulDev/pikvm-rk628/blob/main/README.zh-CN.md)

- [RK628 树莓派驱动和上游测试环境](https://github.com/NujoulDev/rk628-rpi-driver#tested-environments)
- [转接板接口与配件规格](./README.md)
