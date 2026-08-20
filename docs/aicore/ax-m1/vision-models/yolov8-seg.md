---
sidebar_position: 7
doc_kind: page
last_verified: 2026-08-19
---

# YOLOv8-Seg

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 YOLOv8-seg 示例应用。

:::tip
可执行程序的编译方法请参考 [**AXCL-Samples 编译示例**](../axcl-samples.md)。Python 推理依赖 [PyAXEngine](https://github.com/AXERA-TECH/pyaxengine)。
:::

预编译模型量化方式：**w8a16**

## 创建虚拟环境

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv && source .venv/bin/activate
```

</NewCodeBlock>

## 下载示例应用仓库

只下载 AX-M1 需要的三核模型和推理脚本：

<NewCodeBlock tip="Host" type="device">

```bash
pip3 install -U "huggingface_hub"
hf download AXERA-TECH/YOLOv8-Seg \
  AX650/yolov8s-seg_640x640_npu3.axmodel \
  ax_infer.py \
  bus.jpg \
  --local-dir ./YOLOv8-Seg
cd YOLOv8-Seg
```

</NewCodeBlock>

## 示例使用

### 安装 Python 依赖

<NewCodeBlock tip="Host" type="device">

```bash
pip3 install opencv-python-headless
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc3/axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

### 模型推理

瑞莎智核 AX-M1 是 M.2 算力卡，需要指定 `AXCLRTExecutionProvider`。

<NewCodeBlock tip="Host" type="device">

```bash
python3 ax_infer.py --model-path AX650/yolov8s-seg_640x640_npu3.axmodel --test-img bus.jpg --providers AXCLRTExecutionProvider
```

</NewCodeBlock>

```text
[YOLOv8-Seg] [10:51:49.774] [DEBUG] Load model time = 635.89 ms
[YOLOv8-Seg] [10:51:49.801] [DEBUG] Pre-process time = 5.27 ms
[YOLOv8-Seg] [10:51:49.840] [DEBUG] Forward time = 38.11 ms
[YOLOv8-Seg] [10:51:49.846] [DEBUG] Post-process time = 5.90 ms
[YOLOv8-Seg] [10:51:49.847] [DEBUG] Proto shape: (32, 160, 160)
[YOLOv8-Seg] [10:51:49.883] [INFO] Draw Results (5 objects):
[YOLOv8-Seg] [10:51:49.883] [INFO] (51, 398, 243, 903) -> person: 0.89
[YOLOv8-Seg] [10:51:49.922] [INFO] (221, 407, 345, 860) -> person: 0.88
[YOLOv8-Seg] [10:51:49.931] [INFO] (669, 393, 809, 879) -> person: 0.88
[YOLOv8-Seg] [10:51:49.937] [INFO] (24, 228, 799, 751) -> bus: 0.86
[YOLOv8-Seg] [10:51:49.953] [INFO] (0, 545, 76, 874) -> person: 0.74
[YOLOv8-Seg] [10:51:49.969] [INFO] Saved to result_yolov8_seg.jpg
[INFO] Available providers:  ['AXCLRTExecutionProvider']
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 6.0-dirty a498e20d-dirty
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-ax-m1/yolov8_seg_out.webp"/>
   yolov8-seg demo output
</div>
