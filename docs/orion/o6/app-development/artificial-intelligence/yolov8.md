---
sidebar_position: 4
---

# YOLOv8 完整示例

此文档介绍如何使用 CIX P1 NPU SDK 将  [YOLOv8](https://github.com/ultralytics/ultralytics/tree/v8.1.43) 转换为 CIX SOC NPU 上可以运行的模型。

整体来讲有四个步骤：
:::tip
步骤1~3 在 x86 主机 Linux 环境下执行
:::
1. 下载 NPU SDK 并安装 NOE Compiler
2. 下载模型文件 (代码和脚本)
3. 编译模型
4. 部署模型到 Orion O6

## 下载 NPU SDK 并安装 NOE Compiler

请参考 [安装 NPU SDK](./npu-introduction#npu-sdk-安装) 进行 NPU SDK 和 NOE Compiler 的安装.

## 下载模型文件

在 CIX AI Model Hub 中包含了 YOLOv8 的所需文件， 请用户按照 [下载 CIX AI Model Hub](./ai-hub#下载-cix-ai-model-hub) 下载，然后到对应的目录下查看

```bash
cd ai_model_hub/models/ComputeVision/Object_Detection/onnx_yolov8_l
```
请确认目录结构是否同下图所示。

```bash
.
├── cfg
│   └── yolov8_lbuild.cfg
├── datasets
│   ├── calibration_data.npy
│   └── input0.bin
├── graph.json
├── inference_npu.py
├── inference_onnx.py
├── ReadMe.md
└── test_data
    ├── 1.jpeg
    └── ILSVRC2012_val_00004704.JPEG
```

## 编译模型
:::tip
用户可无需从头编译模型，radxa 提供预编译好的 yolov8_l.cix 模型（可用下面步骤下载），如果使用预编译好的模型，可以跳过“编译模型” 这一步

```bash
wget https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Object_Detection/onnx_yolov8_l/yolov8_l.cix
```
:::

### 准备 onnx 模型

- 下载 onnx 模型

  [yolov8l.onnx](https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Object_Detection/onnx_yolov8_l/model/yolov8l.onnx)

- 简化模型

  这里使用 onnxsim 进行模型输入固化和模型简化

  ```bash
  pip3 install onnxsim onnxruntime
  onnxsim yolov8l.onnx yolov8l-sim.onnx --overwrite-input-shape 1,3,640,640
  ```

### 编译模型

CIX SOC NPU 支持 INT8 计算，在编译模型前，我们需要使用 NOE Compiler 对模型进行 INT8 量化

- 准备校准集

  - 使用 `datasets` 现有校准集

    ```bash
    .
    └── calibration_data.npy
    ```

  - 自行准备校准集

    在 `test_data` 目录下已经包含多张校准集的图片文件

    ```bash
    .
    ├── 1.jpeg
    └── ILSVRC2012_val_00004704.JPEG
    ```

    参考以下脚本生成校准文件

    ```python
    import sys
    import os
    import numpy as np
    _abs_path = os.path.join(os.getcwd(), "../../../../")
    sys.path.append(_abs_path)
    from utils.image_process import preprocess_object_detect_method1
    from utils.tools import get_file_list
    # Get a list of images from the provided path
    images_path = "test_data"
    images_list = get_file_list(images_path)
    data = []
    for image_path in images_list:
        input = preprocess_object_detect_method1(image_path, (640, 640))[3]
        data.append(input)
    # concat the data and save calib dataset
    data = np.concatenate(data, axis=0)
    np.save("datasets/calib_data_tmp.npy", data)
    print("Generate calib dataset success.")
    ```

- 使用 NOE Compiler 量化与编译模型

  - 制作量化 cfg 配置文件, 请参考以下配置

    ```bash
    [Common]
    mode = build

    [Parser]
    model_type = ONNX
    model_name = yolov8_l
    detection_postprocess =
    model_domain = OBJECT_DETECTION
    input_data_format = NCHW
    input_model = ./yolov8l-sim.onnx
    input = images
    input_shape = [1, 3, 640, 640]
    output_dir = ./

    [Optimizer]
    dataset = numpydataset
    calibration_data = datasets/calib_data_tmp.npy
    calibration_batch_size = 1
    output_dir = ./
    dump_dir = ./
    quantize_method_for_activation = per_tensor_asymmetric
    quantize_method_for_weight = per_channel_symmetric_restricted_range
    save_statistic_info = True
    trigger_float_op = disable & <[(258, 272)]:float16_preferred!>
    weight_bits = 8& <[(273,274)]:16>
    activation_bits = 8& <[(273,274)]:16>
    bias_bits = 32& <[(273,274)]:48>

    [GBuilder]
    target = X2_1204MP3
    outputs = yolov8_l.cix
    tiling = fps
    profile = True
    ```

  - 量化模型
    :::tip
    如果遇到 cixbuild 报错 `[E] Optimizing model failed! CUDA error: no kernel image is available for execution on the device ...`
    这意味着当前版本的 torch 不支持此 GPU，请完全卸载当前版本的 torch, 然后在 torch 官网下载最新版本。
    :::
    ```bash
    cixbuild ./yolov8_lbuild.cfg
    ```

## 模型部署

### NPU 推理

将使用 NOE Compiler 编译好的 .cix 格式的模型复制到 Orion O6 开发板上进行模型验证

```bash
python3 inference_npu.py --image_path ./test_data/ --model_path ./yolov8_l.cix
```

```bash
v) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Object_Detection/onnx_yolov8_l$ time python3 inference_npu.py --image_path ./test_data/ --model_path ./yolov8_l.cix
npu: noe_init_context success
npu: noe_load_graph success
Input tensor count is 1.
Output tensor count is 1.
npu: noe_create_job success
100%|█████████████████████████████████████████████████████████████████████████████████████████████████████| 2/2 [00:00<00:00,  8.08it/s]
npu: noe_clean_job success
npu: noe_unload_graph success
npu: noe_deinit_context success

real	0m3.884s
user	0m3.391s
sys	0m0.400s
```

结果保存在 `output_npu` 文件夹中

![yolov8_npu1](/img/o6/yolov8_npu1.webp)

![yolov8_npu1](/img/o6/yolov8_npu2.webp)

### CPU 推理

使用 CPU 对 onnx 模型进行推理验证正确性，可在 X86 主机上或 Orion O6 上运行

```bash
python3 inference_onnx.py --image_path ./test_data/ --onnx_path ./yolov8l.onnx
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Object_Detection/onnx_yolov8_l$ time python3 inference_onnx.py --image_path ./test_data/ --onnx_path ./yolov8l.onnx
/usr/local/lib/python3.11/dist-packages/onnxruntime/capi/onnxruntime_inference_collection.py:69: UserWarning: Specified provider 'CUDAExecutionProvider' is not in available provider names.Available providers: 'ZhouyiExecutionProvider, CPUExecutionProvider'
  warnings.warn(
100%|█████████████████████████████████████████████████████████████████████████████████████████████████████| 2/2 [00:03<00:00,  1.86s/it]

real	0m6.671s
user	0m37.881s
sys	0m0.616s
```

结果保存在 `output_onnx` 文件夹中
![yolov8_omnx1](/img/o6/yolov8_onnx1.webp)

![yolov8_onnx1](/img/o6/yolov8_onnx2.webp)
可以看到 NPU 和 CPU 上推理的结果一致,但运行速度大幅缩短

## 参考文档

论文链接： [What is YOLOv8: An In-Depth Exploration of the Internal Features of the Next-Generation Object Detector](https://arxiv.org/abs/2408.15857)
