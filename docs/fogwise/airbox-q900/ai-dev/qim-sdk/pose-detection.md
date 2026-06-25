---
sidebar_position: 3
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 姿态检测

`gst-ai-pose-detection` 对视频流逐帧执行人体姿态检测，在人体关键点之间绘制骨架连线。

使用 HRNet 模型。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认所需文件

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/hrnet_pose_quantized.tflite
ls -l /etc/labels/hrnet_pose.json
ls -l /etc/labels/hrnet_settings.json
```

</NewCodeBlock>

> `hrnet_settings.json` 定义人体关节之间的连接关系。缺少该文件会导致 `Invalid pose settings path` 错误。

### 2. 查看配置

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_pose.json
```

</NewCodeBlock>

关键字段：

| 字段                 | 默认值                                    | 说明         |
| -------------------- | ----------------------------------------- | ------------ |
| `file-path`          | `/etc/media/video.mp4`                    | 输入视频路径 |
| `ml-framework`       | `tflite`                                  | 推理框架     |
| `model`              | `/etc/models/hrnet_pose_quantized.tflite` | 模型文件     |
| `labels`             | `/etc/labels/hrnet_pose.json`             | 标签文件     |
| `pose-settings-path` | `/etc/labels/hrnet_settings.json`         | 关节连接配置 |
| `runtime`            | `dsp`                                     | 推理硬件     |

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-pose-detection --config-file=/etc/configs/config_pose.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/hrnet_pose_quantized.tflite and labels: /etc/labels/hrnet_pose.json and settings /etc/labels/hrnet_settings.json
Using DSP Delegate
VERBOSE: Replacing 518 out of 518 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放测试视频，人体关键点之间绘制骨架连线。

## 验证

- `Using DSP Delegate`：推理在 NPU 上运行
- `Replacing 518 out of 518 node(s)`：全部 518 个算子委派到 DSP
- Pipeline 进入 `PLAYING` 状态
- 显示器正确显示人体骨架

## 排障

### Invalid pose settings path

确认 `hrnet_settings.json` 存在于 `/etc/labels/`：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/labels/hrnet_settings.json
```

</NewCodeBlock>

如果缺失，重新运行下载脚本：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo ./download_artifacts.sh -v GA1.6-rel -c QCS9075
```

</NewCodeBlock>
