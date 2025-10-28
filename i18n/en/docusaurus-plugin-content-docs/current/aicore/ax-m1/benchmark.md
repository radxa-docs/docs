---
sidebar_position: 11
---

# Performance Benchmark

Performance benchmark is the best way to understand the performance of the hardware platform.

:::info
The benchmark test results may differ due to specific application scenarios and model optimization levels, and are for reference only.
:::

## Test Description

- Test tool: axcl_run_model
- Batch Size: 1 or 8
- Unit: FPS (Frame/Second)

:::info
**Note:** Due to performance differences in memory copy (`memcopy`) and PCIe across different host platforms, `axcl_run_model` only measures the inference time of the neural network model on the **Device side** (excluding host-side operations).
:::

## Vision Model

| Vision Model | Input Size | Batch 1(IPS) | Batch 8(IPS) |
| ------------ | ---------- | ------------ | ------------ |
| Inceptionv1  | 224        | 1073         | 2494         |
| Inceptionv3  | 224        | 478          | 702          |
| MobileNetv1  | 224        | 1508         | 4854         |
| MobileNetv2  | 224        | 1366         | 5073         |
| ResNet18     | 224        | 1066         | 2254         |
| ResNet50     | 224        | 576          | 1045         |
| SqueezeNet11 | 224        | 1560         | 5961         |
| Swin-T       | 224        | 342          | 507          |
| ViT-B/16     | 224        | 162          | 207          |
| YOLOv5s      | 640        | 326          | 394          |
| YOLOv6s      | 640        | 282          | 322          |
| YOLOv8s      | 640        | 248          | 279          |
| YOLOv9s      | 640        | 237          |              |
| YOLOv10s     | 640        | 298          |              |
| YOLOv11n     | 640        | 860          |              |
| YOLOv11s     | 640        | 305          |              |
| YOLOv11m     | 640        | 114          |              |
| YOLOv11l     | 640        | 87           |              |
| YOLOv11x     | 640        | 41           |              |

## Audio Model

| Audio Model   | RTF  |
| ------------- | ---- |
| Whisper-Tiny  | 0.03 |
| Whisper-Small | 0.18 |
| MeloTTS       | 0.04 |

## LLM

| LLM          | Prompt length(tokens) | TTFT(ms) | Generate(tokens/s) |
| ------------ | --------------------- | -------- | ------------------ |
| Qwen2.5-0.5B | 128                   | 188      | 28                 |

## VLM

| VLM          | Input Image | Image Encoder (ms) | Prompt length (tokens) | TTFT (ms) | Generate (tokens/s) |
| ------------ | ----------- | ------------------ | ---------------------- | --------- | ------------------- |
| InternVL2-1B | 448\*448    | 4200               | 320                    | 425       | 29                  |
