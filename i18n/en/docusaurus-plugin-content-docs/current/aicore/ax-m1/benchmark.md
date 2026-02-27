---
sidebar_position: 8
---

# Performance Benchmark

Benchmarking is the best way to understand how fast neural network models run on the hardware platform.

:::info
Benchmark results may vary depending on the specific application scenario and the degree of model optimization. The data below is for reference only.
:::

## Test notes

- Test tool: axcl_run_model
- Batch size: 1 or 8
- Unit: FPS (Frames/Second)

:::info
Due to differences in memcopy/PCIe performance across hosts, `axcl_run_model` only measures the inference time on the device.
:::

## Vision models

| Vision model | Input size | FPS (single) | FPS (batch=8) |
| ------------ | ---------- | ------------ | ------------- |
| Inceptionv1  | 224        | 1073         | 2494          |
| Inceptionv3  | 224        | 478          | 702           |
| MobileNetv1  | 224        | 1508         | 4854          |
| MobileNetv2  | 224        | 1366         | 5073          |
| ResNet18     | 224        | 1066         | 2254          |
| ResNet50     | 224        | 576          | 1045          |
| SqueezeNet11 | 224        | 1560         | 5961          |
| Swin-T       | 224        | 342          | 507           |
| ViT-B/16     | 224        | 162          | 207           |
| YOLOv5s      | 640        | 326          | 394           |
| YOLOv6s      | 640        | 282          | 322           |
| YOLOv8s      | 640        | 248          | 279           |
| YOLOv9s      | 640        | 237          |               |
| YOLOv10s     | 640        | 298          |               |
| YOLOv11n     | 640        | 860          |               |
| YOLOv11s     | 640        | 305          |               |
| YOLOv11m     | 640        | 114          |               |
| YOLOv11l     | 640        | 87           |               |
| YOLOv11x     | 640        | 41           |               |

## Audio models

| Audio model   | Real-time factor |
| ------------- | ---------------- |
| Whisper-Tiny  | 0.03             |
| Whisper-Small | 0.18             |
| MeloTTS       | 0.04             |

## Large language models

| Model        | Prompt length (tokens) | First token latency (ms) | Generation speed (tokens/s) |
| ------------ | ---------------------- | ------------------------ | --------------------------- |
| Qwen2.5-0.5B | 128                    | 188                      | 28                          |

## Vision-language models

| Model        | Input size | Image encoder time (ms) | Prompt length (tokens) | First token latency (ms) | Generation speed (tokens/s) |
| ------------ | ---------- | ----------------------- | ---------------------- | ------------------------ | --------------------------- |
| InternVL2-1B | 448\*448   | 4200                    | 320                    | 425                      | 29                          |
