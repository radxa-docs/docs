---
sidebar_position: 12
---

# Frigate NVR for Axera

[Frigate](https://frigate.video/) 是一个 专门为 [Home Assistant](https://www.home-assistant.io/) 设计的 NVR 项目。
它能够充分调用本地硬件算力，并通过 AI 模型对监控画面进行实时的目标检测、识别与物体分类（如区分行人、车辆、宠物等）。

:::tip
Home Assistant，目前全球最流行的开源智能家居控制中心。
:::

更多相关内容参考[官方文档](https://docs.frigate.video/)或者[官方中文文档](https://docs.frigate-cn.video/)。

本文档介绍如何使用 Radxa Rock5b+ 搭配 Radxa AX-M1 M.2 加速卡部署该项目。

## 准备环节

- 硬件：一块 Rock5b+ 和一张 AX-M1
- 系统：Debian 12（Radxa官方镜像）
- 驱动：参考[环境安装](./getting-started/env_install.md)安装驱动
- 工具：参考 [Docker 官方文档](https://docs.docker.com/engine/install/debian/#install-using-the-repository)配置好 Docker 环境

## 克隆仓库

使用 huggingface 命令行工具克隆仓库

<NewCodeBlock tip="Device">

```bash
mkdir frigate && cd frigate
python3 -m venv .venv
source .venv/bin/activate
pip3 install huggingface_hub
hf download AXERA-TECH/frigate-resource --revision v0.16-rk-axcl --local-dir ./
```

</NewCodeBlock>

## 模拟推流

如果你暂时没有 IP 摄像头（有当然最好，直接使用即可），使用 FFmpeg + MediaMTX 模拟推流是一个很好的验证方式。

使用方式也很简单，参考下面的步骤。

### MediaMTX

<NewCodeBlock tip='Device'>

```bash
mkdir mediamtx && cd mediamtx
wget https://github.com/bluenviron/mediamtx/releases/download/v1.16.0/mediamtx_v1.16.0_linux_arm64.tar.gz
tar -xvf mediamtx_v1.16.0_linux_arm64.tar.gz
./mediamtx
```

</NewCodeBlock>

然后就会在当前终端开启一个 RTSP 服务器，等待接收视频流信息。

接下来新打开一个终端，使用 FFmpeg 进行推流。

### FFmpeg

<NewCodeBlock tip='Device'>

```bash
sudo apt install ffmpeg
```

</NewCodeBlock>

然后你需要准备一个视频，这里需要你自己准备并重命名为 test.mp4 。

<NewCodeBlock tip='Device'>

```bash
ffmpeg -re -stream_loop -1 -i test.mp4 -c copy -f rtsp rtsp://localhost:8554/mystream
```

</NewCodeBlock>

参数解释：

- `-re`：以“本地速度”读取。如果不加这个，FFmpeg 会以极快的速度把视频塞给服务器，导致画面像快进一样。
- `-stream_loop -1`：让视频无限循环。这对测试 Frigate 非常有用，不用担心视频播完就断开。
- `-i test.mp4`：指定你的视频源文件。
- `-c copy`：直接复制视频和音频编码，不重新编码。这最省 CPU，直接把原始数据包封装进 RTSP。
- `-f rtsp`：指定输出格式为 RTSP。
- `rtsp://localhost:8554/mystream`：推流地址。mystream 是你给这个流起的 ID。

## 启动 Frigate

修改 docker-compose.yml 中的端口号（这里修改端口号是因为模拟推理的 MediaMTX 默认占用8554端口，如果使用摄像头则不需要修改。）：

```yaml
services:
  frigate:
    container_name: frigate
    privileged: true
    restart: unless-stopped
    stop_grace_period: 30s
    image: frigate:rk-axcl-d80bb4d
    shm_size: "1024mb"
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./config:/config
      - ./storage:/media/frigate
      - type: tmpfs
        target: /tmp/cache
        tmpfs:
          size: 1000000000
    ports:
      - "8971:8971"
      # - "5000:5000" # 内部未认证访问。谨慎暴露。
      - "8556:8554" # RTSP视频流                 <-- 改成8556防止冲突
      - "8555:8555/tcp" # 基于TCP的WebRTC
      - "8555:8555/udp" # 基于UDP的WebRTC
    environment:
      TZ: "Asia/Shanghai"
```

启动 Frigate ：

<NewCodeBlock tip="Device">

```bash
docker compose up -d
```

</NewCodeBlock>

点击左侧 `设置` --> `配置编辑器` 修改配置文件如下：

```yaml
mqtt:
  enabled: false

cameras:
  camera: # <--- 此处改为你摄像头的名称，仅支持英文数字下划线与连接符
    enabled: true
    ffmpeg:
      inputs:
        - path: rtsp://192.168.2.245:8554/mystream # <--- 此处改为你摄像头的rtsp地址
          roles:
            - detect

detectors:
  axengine:
    type: axengine

model:
  path: yolov5s_320
  width: 320
  height: 320
  input_pixel_format: bgr
  labelmap_path: /labelmap/coco-80.txt

detect:
  enabled: true
version: 0.16-0
```

重启 Frigate ：

![](/img/common/frigate-ai-detection-case.webp)

![](/img/rock5b/ai/frigate-axera-debug-result.webp)

于是你成功将 Frigate 部署到使用 AX-M1 推理的 Rock5b+ 上。
