---
sidebar_position: 1
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 图像分类

`gst-ai-classification` 对视频流逐帧执行图像分类，识别画面主体并叠加分类标签和置信度。

与 [目标检测](./object-detection.md) 的区别：分类回答"这是什么"，给出整张图的类别；检测回答"哪里有什么"，框出每个物体的位置和类别。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型和标签

`download_artifacts.sh` 已自动下载所需文件：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/inception_v3_quantized.tflite
ls -l /etc/labels/classification.json
```

</NewCodeBlock>

### 2. 查看配置

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_classification.json
```

</NewCodeBlock>

默认配置使用 InceptionV3 量化模型、LiteRT 框架、DSP 推理。关键字段：

| 字段           | 默认值                                      | 说明                                |
| -------------- | ------------------------------------------- | ----------------------------------- |
| `file-path`    | `/etc/media/video.mp4`                      | 输入视频路径                        |
| `ml-framework` | `tflite`                                    | 推理框架：`tflite` / `snpe` / `qnn` |
| `model`        | `/etc/models/inception_v3_quantized.tflite` | 模型文件                            |
| `labels`       | `/etc/labels/classification.json`           | 标签文件                            |
| `threshold`    | `40`                                        | 置信度阈值 (1-100)                  |
| `runtime`      | `dsp`                                       | 推理硬件：`cpu` / `gpu` / `dsp`     |
| `output-type`  | `waylandsink`                               | 输出方式                            |

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-classification --config-file=/etc/configs/config_classification.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/inception_v3_quantized.tflite and labels: /etc/labels/classification.json
Using DSP Delegate
VERBOSE: Replacing 142 out of 142 node(s) with delegate (TfLiteQnnDelegate) node, yielding 1 partitions for the whole graph.
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放测试视频，画面顶部叠加分类结果（如 "goldfish"）及置信度百分比。

## 验证

- `Using DSP Delegate`：推理在 NPU 上运行
- `Replacing 142 out of 142 node(s)`：全部 142 个算子委派到 DSP，无 CPU 回退
- Pipeline 进入 `PLAYING` 状态
- 显示器正确显示分类标签

## 切换输入源

修改配置文件中的输入源字段：

```json
// 切换视频文件
"file-path": "/etc/media/video1.mp4"

// 或使用 RTSP 流
"rtsp-ip-port": "rtsp://192.168.1.100:8554/live.mkv"
```

## 切换推理硬件

修改 `runtime` 字段：

```json
"runtime": "cpu"   // CPU 推理
"runtime": "gpu"   // GPU 推理
"runtime": "dsp"   // NPU 推理（默认，推荐）
```

## Pipeline 流程

```text
filesrc → qtdemux → h264parse → v4l2h264dec → qtimlvconverter
                                                       ↓
                                              (张量预处理)
                                                       ↓
                                          qtimltflite (DSP 推理)
                                                       ↓
                                          qtimlvclassification
                                          (阈值/标签映射)
                                                       ↓
                                                qtivcomposer
                                                       ↓
                                                 waylandsink
```
