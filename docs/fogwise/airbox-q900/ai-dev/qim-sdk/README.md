---
sidebar_position: 101
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# QIM SDK 开发指南

Qualcomm Intelligent Multimedia SDK (IM SDK) 是基于 GStreamer 的 AI/ML 应用开发框架，提供开箱即用的命令行工具和硬件加速插件，覆盖从视频采集、AI 推理到结果渲染的完整 pipeline。

## 与 QAIRT 的关系

QIM SDK 位于 QAIRT SDK 之上，两者的分工如下：

| 层级                 | 内容                                                  | 在 Q900 上的状态              |
| -------------------- | ----------------------------------------------------- | ----------------------------- |
| **QAIRT Runtime**    | QNN / SNPE / LiteRT 运行时库                          | 通过 apt 安装（`qairt-libs`） |
| **QIM SDK 插件**     | GStreamer ML 插件（采集、预处理、推理、后处理、渲染） | 通过 apt 安装                 |
| **QIM SDK 示例应用** | `gst-ai-*` 命令行工具                                 | 通过 apt 安装                 |

安装 QIM SDK 前需先安装 QAIRT 基础库（`sudo apt install -y qairt-libs`），详见下方安装步骤。

## 前提条件

- Radxa AIRbox Q900
- Ubuntu 24.04，已连接网络
- 显示器已连接（Wayland）

## 安装

### 步骤 1：安装 QAIRT 基础库

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y qairt-libs
```

</NewCodeBlock>

### 步骤 2：安装 QIM SDK

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y \
    gstreamer1.0-tools \
    tensorflow-lite-qcom-apps \
    gstreamer1.0-qcom-sample-apps \
    gstreamer1.0-qcom-python-examples
```

</NewCodeBlock>

所有 ML 推理插件和视频处理插件会作为依赖自动安装，无需单独指定。

### 步骤 3：验证安装

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls /usr/bin/gst-ai-*
```

</NewCodeBlock>

预期输出 20 个 `gst-ai-*` 命令行工具。

## 下载模型和测试资源

使用官方脚本一键下载模型、标签和测试视频：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y unzip
curl -L -O https://raw.githubusercontent.com/quic/sample-apps-for-qualcomm-linux/refs/heads/main/download_artifacts.sh
chmod +x download_artifacts.sh
sudo ./download_artifacts.sh -v GA1.6-rel -c QCS9075
```

</NewCodeBlock>

下载完成后：

| 目录            | 内容                                 |
| --------------- | ------------------------------------ |
| `/etc/models/`  | 10 个 `.tflite` 量化模型             |
| `/etc/labels/`  | 16 个标签和配置文件                  |
| `/etc/media/`   | 4 个测试视频                         |
| `/etc/configs/` | 38 个应用配置 JSON（包安装时已就位） |

## 快速验证

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-classification --config-file=/etc/configs/config_classification.json
```

</NewCodeBlock>

成功启动后，显示器上播放测试视频并叠加分类标签。终端输出中可见 `Using DSP Delegate` 和 `Pipeline state changed to PLAYING`。

按 `Ctrl + C` 停止。

## 可用示例应用

以下应用已在 Q900 (QCS9075) 上验证通过：

| 应用                                                         | 说明               | 模型                                     | NPU        |
| ------------------------------------------------------------ | ------------------ | ---------------------------------------- | ---------- |
| [图像分类](./classification.md)                              | 识别图像主体       | InceptionV3                              | DSP        |
| [目标检测](./object-detection.md)                            | 检测并框出物体     | YOLOX                                    | DSP        |
| [姿态检测](./pose-detection.md)                              | 人体关键点检测     | HRNet                                    | DSP        |
| [图像分割](./segmentation.md)                                | 逐像素语义分割     | DeepLabV3+                               | DSP        |
| [单目深度估计](./monodepth.md)                               | 深度热力图         | MiDaS V2                                 | DSP        |
| [视频超分辨率](./superresolution.md)                         | 低分辨率重建       | QuickSRNet                               | DSP (部分) |
| [音频分类](./audio-classification.md)                        | 音频事件分类       | YAMNet                                   | CPU        |
| [菊花链检测与分类](./daisychain-detection-classification.md) | 级联检测+分类      | YOLOX + InceptionV3                      | DSP        |
| [菊花链检测与姿态](./daisychain-detection-pose.md)           | 级联检测+姿态      | YOLOX + HRNet                            | DSP        |
| [并行 AI 融合](./parallel-inference.md)                      | 4 模型同时推理     | YOLOX + InceptionV3 + HRNet + DeepLabV3+ | DSP        |
| [事件编码器](./event-encoder.md)                             | 检测事件编码输出   | YOLOX                                    | DSP        |
| [元数据解析](./metadata-parser.md)                           | 检测结果元数据导出 | YOLOX                                    | DSP        |
| [多流推理](./multistream-inference.md)                       | 多路同步检测       | YOLOX                                    | DSP        |
| [多流批量推理](./multistream-batch-inference.md)             | 批量多路检测       | YOLOv8 (batch=4)                         | DSP        |
| [多输入多输出](./multi-input-output.md)                      | 多路输入输出检测   | YOLOv5                                   | DSP        |
| [人脸检测](./face-detection.md)                              | 人脸关键点检测     | Lightweight Face Detection               | DSP        |

> 完整列表参见 [IM SDK 参考手册](https://docs.qualcomm.com/doc/80-70020-50SC/topic/download-model-and-label-files.html) 第 3 章。

## 参考

- [Python GStreamer 应用](./python-apps.md) — Python 方式，适合自定义前后处理
- [源码编译](./build-from-source.md) — C/C++ 方式，适合深度定制插件
- [模型导出](./model-export.md) — 自行导出 YOLOv5/YOLOv8 模型

## 排障

### 显示器无画面

检查 Wayland socket 是否存在：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls $XDG_RUNTIME_DIR/wayland-0
```

</NewCodeBlock>

### DSP 推理失败

确认 FastRPC 设备节点存在：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls /dev/fastrpc-cdsp*
```

</NewCodeBlock>

如果没有输出，请参考 [板端启用 NPU](../fastrpc-setup.md)。

### 模型文件缺失

重新运行下载脚本：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo ./download_artifacts.sh -v GA1.6-rel -c QCS9075
```

</NewCodeBlock>
