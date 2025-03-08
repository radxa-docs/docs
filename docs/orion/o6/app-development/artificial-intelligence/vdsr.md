---
sidebar_position: 6
---

# VDSR 完整示例

此文档介绍如何使用 CIX P1 NPU SDK 将 [VDSR](https://github.com/twtygqyy/pytorch-vdsr) 转换为 CIX SOC NPU 上可以运行的模型。

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

在 CIX AI Model Hub 中包含了 VDSR 的所需文件， 请用户按照 [下载 CIX AI Model Hub](./ai-hub#下载-cix-ai-model-hub) 下载

```bash
cd ai_model_hub/models/ComputeVision/Super_Resolution/onnx_vdsr
```
请确认目录结构是否同下图所示。
```bash
.
├── cfg
│   └── onnx_vdsr_build.cfg
├── datasets
│   └── calib_dataset.npy
├── graph.json
├── inference_npu.py
├── inference_onnx.py
├── output
│   └── butterfly_comparison.png
├── ReadMe.md
└── test_data
    ├── butterfly_GT.bmp
    ├── butterfly_GT_scale_2.bmp
    ├── butterfly_GT_scale_3.bmp
    └── butterfly_GT_scale_4.bmp
```

## 编译模型

:::tip
用户可无需从头编译模型，radxa 提供预编译好的 vdsr.cix 模型（可用下面步骤下载），如果使用预编译好的模型，可以跳过“编译模型” 这一步
```bash
wget https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Super_Resolution/onnx_vdsr/vdsr.cix
```
:::

### 准备 onnx 模型

- 下载 onnx 模型

  [vdsr.onnx](https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Super_Resolution/onnx_vdsr/model/vdsr.onnx)

- 简化模型

  这里使用 onnxsim 进行模型输入固化和模型简化

  ```bash
  pip3 install onnxsim onnxruntime
  onnxsim vdsr.onnx vdsr-sim.onnx --overwrite-input-shape 1,1,256,256
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
    └── 2.jpeg
    ```

    参考以下脚本生成校准文件

    ```python
    import sys
    import os
    import numpy as np
    import cv2
    _abs_path = os.path.join(os.getcwd(), "../../../../")
    sys.path.append(_abs_path)
    from utils.image_process import normalize_image
    from utils.tools import get_file_list
    # Get a list of images from the provided path
    images_path = "test_data"
    images_list = get_file_list(images_path)
    data = []
    for image_path in images_list:
        image_numpy = cv2.imread(image_path)
        image_numpy = cv2.resize(image_numpy, (256, 256))
        image_gray = cv2.cvtColor(image_numpy,cv2.COLOR_BGR2GRAY)
        image_ex = np.expand_dims(image_gray, 0)
        input = normalize_image(image_ex)
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
    model_type = onnx
    model_name = vdsr
    input_model = ./vdsr-sim.onnx
    input = input.1
    input_shape = [1,1,256,256]
    output_dir = ./out

    [Optimizer]
    metric_batch_size = 1
    dataset = numpydataset
    calibration_data = ./datasets/calib_data_tmp.npy
    calibration_batch_size = 1
    calibration_strategy_for_activation = extrema & <[Convolution]:mean>
    quantize_method_for_weight = per_channel_symmetric_full_range
    quantize_method_for_activation = per_tensor_asymmetric
    activation_bits = 8
    weight_bits = 8
    bias_bits = 32
    cast_dtypes_for_lib = True
    output_dir = ./out
    save_statistic_info=False

    [GBuilder]
    outputs=vdsr.cix
    target=X2_1204MP3
    tiling= fps
    ```

  - 量化模型
    :::tip
    如果遇到 cixbuild 报错 `[E] Optimizing model failed! CUDA error: no kernel image is available for execution on the device ...`
    这意味着当前版本的 torch 不支持此 GPU，请完全卸载当前版本的 torch, 然后在 torch 官网下载最新版本。
    :::
    ```bash
    cixbuild ./onnx_deeplab_v3_build.cfg
    ```

## 模型部署

### NPU 推理

将使用 NOE Compiler 编译好的 .cix 格式的模型复制到 Orion O6 开发板上进行模型验证

```bash
python3 inference_npu.py --images ./test_data/ --model_path ./vdsr.cix
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Super_Resolution/onnx_vdsr$ time python3 inference_npu.py --images ./test_data/ --model_path ./vdsr.cix
npu: noe_init_context success
npu: noe_load_graph success
Input tensor count is 1.
Output tensor count is 1.
npu: noe_create_job success
Scale= 4
PSNR_bicubic= 20.777296489759777
PSNR_predicted= 25.375403931263882
npu: noe_clean_job success
npu: noe_unload_graph success
npu: noe_deinit_context success

real	0m2.837s
user	0m3.270s
sys	0m0.223s
```

结果保存在 `output_npu` 文件夹中

![vdsr_npu.webp](/img/o6/vdsr_npu.webp)

### CPU 推理

使用 CPU 对 onnx 模型进行推理验证正确性，可在 X86 主机上或 Orion O6 上运行

```bash
python3 inference_onnx.py --images ./test_data/ --onnx_path ./deeplabv3_resnet50-sim.onnx
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Semantic_Segmentation/onnx_deeplab_v3$ time python3 inference_onnx.py --images ./test_data/ --onnx_path ./deeplabv3_resnet50-sim.onnx
save output: onnx_ILSVRC2012_val_00004704.JPEG

real	0m7.605s
user	0m33.235s
sys	0m0.558s

```

结果保存在 `output_onnx` 文件夹中
![vdsr_onnx.webp](/img/o6/vdsr_onnx.webp)

可以看到 NPU 和 CPU 上推理的结果一致,但运行速度大幅缩短

## 参考文档

论文链接： [Accurate Image Super-Resolution Using Very Deep Convolutional Networks](https://arxiv.org/abs/1511.04587)
