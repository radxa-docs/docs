---
sidebar_position: 13
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-29
---

# 多流批量推理

`gst-ai-multistream-batch-inference` 同时对多路视频流执行批量 AI 推理（目标检测或图像分割），将流批量化后进行一次推理，提高吞吐量。

Q900 (QCS9075) 最多支持 24 路并发输入（6 批次 × batch-size 4）。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装)
- YOLOv8 TFLite 模型，batch-size=4（需通过 Qualcomm AI Hub 导出，详见 [模型导出](./model-export.md#方式二qualcomm-ai-hub-导出-yolov8目标检测多流批量推理)）

## 步骤

### 1. 导出批量模型

使用 `--batch-size 4` 导出 YOLOv8 模型，命令详见 [模型导出](./model-export.md#4-导出批量模型batch4用于多流批量推理)。

将模型和标签推送到设备：

<NewCodeBlock tip="host$" type="device">

```bash
scp yolov8_det.tflite radxa@<device-ip>:/etc/models/
```

</NewCodeBlock>

### 2. 创建配置文件

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "
import json
with open('/etc/configs/config-multistream-batch-inference.json') as f:
    base = json.load(f)
entry = base['pipeline-info'][0]
entry['model-path'] = '/etc/models/yolov8_det.tflite'
entry['labels-path'] = '/etc/labels/yolov8.json'
# 生成 6 批次 × 4 流 = 24 路（id 最大 5）
base['pipeline-info'] = []
for i in range(6):
    e = json.loads(json.dumps(entry))
    e['id'] = i
    base['pipeline-info'].append(e)
with open('/tmp/cfg_batch.json', 'w') as f:
    json.dump(base, f, indent=2)
print('24-stream config written')
"
```

</NewCodeBlock>

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-multistream-batch-inference --config-file=/tmp/cfg_batch.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
VERBOSE: Replacing 282 out of 282 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from NULL to READY:
Pipeline state changed from READY to PAUSED:
Pipeline state changed from PAUSED to PLAYING:
```

显示器上同时显示 24 路检测画面。

## 验证

- 全部算子委派到 DSP
- Pipeline 进入 `PLAYING` 状态
- 24 路画面同时正确显示边界框

## 配置说明

| 字段                                  | 说明                                                 | 默认值            |
| ------------------------------------- | ---------------------------------------------------- | ----------------- |
| `output-type`                         | 输出类型：`wayland` / `filesink`                     | `wayland`         |
| `pipeline-info[].id`                  | 批次 ID（0-5）                                       | `0`               |
| `pipeline-info[].input-type`          | 输入源类型                                           | `file`            |
| `pipeline-info[].input-file-path`     | 输入文件（每批次 4 路）                              | 见配置文件        |
| `pipeline-info[].mlframework`         | 推理框架                                             | `tflite`          |
| `pipeline-info[].model-path`          | 模型路径                                             | 需替换为导出模型  |
| `pipeline-info[].labels-path`         | 标签路径                                             | 需替换            |
| `pipeline-info[].constants`           | LiteRT 量化常数                                      | 模型相关          |
| `pipeline-info[].post-process-plugin` | 后处理插件：`qtimlvdetection` / `qtimlvsegmentation` | `qtimlvdetection` |

## Pipeline 流程

```text
filesrc × 4 → qtdemux → h264parse → v4l2h264dec → qtibatch (组批)
                                                          ↓
                                                 qtimlvconverter
                                                          ↓
                                               qtimltflite (DSP 批量推理)
                                                          ↓
                                                  qtimldemux (解复用)
                                                          ↓
                                             qtimlvdetection / qtimlvsegmentation
                                                          ↓
                                                   qtivcomposer
                                                          ↓
                                                    waylandsink
```
