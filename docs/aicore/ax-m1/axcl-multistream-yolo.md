---
sidebar_position: 14
---

# AXCL Multistream YOLO

此文档介绍基于 Radxa AX-M1 的多路视频流 YOLO 实时识别项目 **axera-multistream-yolo**。

:::tip
本项目依赖 AXCL SDK 和 FFmpeg 硬件解码能力，使用前请确保已配置好：

- [**AXCL 驱动**](./getting-started/env_install)
- [**AXCL FFmpeg 硬件解码**](./axcl-ffmpeg-guide)
  :::

## 硬件环境

| 项目   | 规格                                      |
| ------ | ----------------------------------------- |
| DEVICE | 瑞莎 AX-M1（Rock 5B+ Host）               |
| NPU    | AX8850（AXCL SDK V3.6.5）                 |
| 解码   | FFmpeg 7.1（`h264_axdec` / `hevc_axdec`） |

## 项目结构

```bash
axera-multistream-yolo/
├── src/                     # 核心实现
│   ├── inference_engine.cpp # NPU 推理封装（letterbox + AXCL + NMS）
│   ├── pipeline.cpp         # StreamWorker × N 编排
│   ├── stream_source.cpp    # FFmpeg 硬件解码（RTSP / 本地文件）
│   └── ...
├── include/app/             # 头文件
├── tools/npu_bench.cpp      # NPU 性能基准测试工具
├── configs/                 # JSON 配置文件
└── yolo26_demo/             # AXCL SDK 参考实现（仅供查阅）
```

## 快速开始

### 克隆仓库

<NewCodeBlock tip="Host" type="device">

```bash
git clone https://github.com/Ronin-1124/axera-multistream-yolo.git
cd axera-multistream-yolo/
```

</NewCodeBlock>

### 编译

<NewCodeBlock tip="Host" type="device">

```bash
mkdir build && cd build
cmake .. && make -j$(nproc)
```

</NewCodeBlock>

### 配置

编辑 `configs/app_config.json`：

```json
{
  "streams": [
    { "id": 0, "url": "./data/test_videos_360P/test1.mp4", "enabled": true },
    {
      "id": 1,
      "url": "rtsp://user:pass@192.168.1.100:554/stream",
      "enabled": true
    }
  ],
  "model": {
    "path": "./models/yolo26n.axmodel",
    "input_h": 640,
    "input_w": 640
  },
  "output": { "display": true, "mosaic_cols": 2, "queue_depth": 4 }
}
```

### 运行

<NewCodeBlock tip="Host" type="device">

```bash
LD_LIBRARY_PATH="/usr/lib/axcl/ffmpeg:/usr/lib/axcl:$LD_LIBRARY_PATH" \
./build/axera_multistream_yolo --config ./configs/app_config.json
```

</NewCodeBlock>

![axcl-multistream-yolo demo output](/img/aicore-ax-m1/axcl-multistream-yolo-show.webp)

:::tip
`display=false` 时仅输出帧率监控日志：

```text
[Collector] S0:14.0 S1:13.0 S2:14.0 S3:13.0 fps (1s)
[Collector] S0:15.0 S1:14.0 S2:14.0 S3:14.0 fps (1s)
```

:::

## NPU 性能测试工具

<NewCodeBlock tip="Host" type="device">

```bash
# 阶段时间分解（H2D / NPU kernel / D2H / Post）
./build/tools/npu_bench <model> <image> --stages [N]

# 线程并行性能测试（1..N 线程）
./build/tools/npu_bench <model> <image> --sweep <max_threads> <iters>

# 指定并行线程数测试
./build/tools/npu_bench <model> <image> --mt <threads> <iters>
```

</NewCodeBlock>

**示例：**

```text
  Stage breakdown (SDK)  (100 iterations, 640x640 input)
               avg       min       max
  Pre          5.69      3.82     16.86  ms
  H2D          3.27      2.94      3.83  ms
  NPU          1.97      1.75      2.20  ms
  D2H          6.47      5.38      7.51  ms
  Post         5.31      2.20     12.31  ms
  Total       22.71  ms
```

## 架构

**1:1 固定配比**：每路 = 1 读取线程 + 1 推理线程，完全独立。

```text
StreamWorker × N（每路独立）
  ├─ StreamSource（FFmpeg 解码）→ ThreadSafeQueue → InferenceThread
  └─────────────────────────────────────────────────────► ResultQueue
                                                         │
                                                   ResultCollector
                                                         └─ MosaicRenderer → imshow
```

## 性能数据（YOLO26n，640×640）

| 配置                    | 帧率                     |
| ----------------------- | ------------------------ |
| 单路端到端              | ~40 fps                  |
| 8 路并发（mosaic 显示） | 53-57 fps mosaic         |
| AXCL 多线程扩展上限     | ~120 fps（3 线程后停滞） |
