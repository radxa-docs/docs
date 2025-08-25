---
sidebar_position: 3
---

# ResNet50 Example

This document introduces how to use the CIX P1 NPU SDK to convert [ResNet50](https://github.com/onnx/models/blob/main/validated/vision/classification/resnet/model/resnet50-v1-12.onnx) into a model that can run on the CIX SOC NPU.

There are four main steps:
:::tip
Steps 1-3 should be executed in an x86 Linux environment.
:::

1. Download the NPU SDK and install the NOE Compiler
2. Download the model files (code and scripts)
3. Compile the model
4. Deploy the model to Orion O6

## Download the NPU SDK and Install the NOE Compiler

Refer to [Install NPU SDK](./npu-introduction#install-npu-sdk-x86-linux-environment) for the installation of the NPU SDK and NOE Compiler.

## Download Model Files

The CIX AI Model Hub includes all necessary files for ResNet50. Please follow the instructions in [Download the CIX AI Model Hub Repository](./ai-hub#download-the-cix-ai-model-hub-repository) and navigate to the corresponding directory.

```bash
cd ai_model_hub/models/ComputeVision/Image_Classification/onnx_resnet_v1_50
```

Ensure that the directory structure matches the following:

```bash
.
├── cfg
│   └── onnx_resnet_v1_50build.cfg
├── datasets
│   └── calib_data.npy
├── graph.json
├── inference_npu.py
├── inference_onnx.py
├── ReadMe.md
├── test_data
│   ├── ILSVRC2012_val_00002899.JPEG
│   ├── ILSVRC2012_val_00004704.JPEG
│   ├── ILSVRC2012_val_00021564.JPEG
│   ├── ILSVRC2012_val_00024154.JPEG
│   ├── ILSVRC2012_val_00037133.JPEG
│   └── ILSVRC2012_val_00045790.JPEG
└── Tutorials.ipynb
```

## Compile the Model

:::tip
Users do not need to compile the model from scratch. Radxa provides a precompiled `resnet_v1_50.cix` model, which can be downloaded using the following command. If you use the precompiled model, you can skip the "Compile the Model" step.

```bash
wget https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Image_Classification/onnx_resnet_v1_50/resnet_v1_50.cix
```

:::

### Prepare the ONNX Model

- Download the ONNX model

  [resnet50-v1-12.onnx](https://github.com/onnx/models/blob/main/validated/vision/classification/resnet/model/resnet50-v1-12.onnx)

- Simplify the model

  Use `onnxsim` for model input fixation and simplification:

  ```bash
  pip3 install onnxsim onnxruntime
  onnxsim resnet50-v1-12.onnx resnet50-v1-12-sim.onnx --overwrite-input-shape 1,3,224,224
  ```

### Compile the Model

CIX SOC NPU supports INT8 computation. Before compiling the model, we need to use the NOE Compiler for INT8 quantization.

- Prepare the calibration dataset

  - The `test_data` directory already contains several calibration images:

    ```bash
    ├── test_data
    │   ├── ILSVRC2012_val_00002899.JPEG
    │   ├── ILSVRC2012_val_00004704.JPEG
    │   ├── ILSVRC2012_val_00021564.JPEG
    │   ├── ILSVRC2012_val_00024154.JPEG
    │   ├── ILSVRC2012_val_00037133.JPEG
    │   └── ILSVRC2012_val_00045790.JPEG
    ```

  - Generate the calibration dataset using the following script:

    ```python
    import sys
    import os
    import numpy as np
    from utils.image_process import imagenet_preprocess_method1
    from utils.tools import get_file_list

    images_path = "test_data"
    images_list = get_file_list(images_path)
    data = []
    for image_path in images_list:
        input = imagenet_preprocess_method1(image_path)
        data.append(input)

    data = np.concatenate(data, axis=0)
    print(data.shape)
    np.save("datasets/calib_data_tmp.npy", data)
    print("Generate calib dataset success.")
    ```

- Use NOE Compiler for quantization and compilation

  - Create a quantization and compilation configuration file:

    ```bash
    [Common]
    mode = build

    [Parser]
    model_type = onnx
    model_name = resnet_v1_50
    model_domain = image_classification
    input_model = ./resnet50-v1-12-sim.onnx
    output_dir = ./
    input_shape = [1, 3, 224, 224]
    input = data

    [Optimizer]
    output_dir = ./
    calibration_data = datasets/calib_data_tmp.npy
    calibration_batch_size = 16
    dataset = numpydataset

    [GBuilder]
    target = X2_1204MP3
    outputs = resnet_v1_50.cix
    tiling = fps
    profile = True
    ```

  - Compile the model
    :::tip
    If `cixbuild` reports an error like `[E] Optimizing model failed! CUDA error: no kernel image is available for execution on the device ...`, it means the current version of `torch` does not support your GPU. Fully uninstall `torch` and install the latest version from the official PyTorch website.
    :::

    ```bash
    cixbuild ./onnx_resnet_v1_50build.cfg
    ```

## Model Deployment

### NPU Inference

Copy the compiled `.cix` model to the Orion O6 development board for validation:

```bash
python3 inference_npu.py --images test_data --model_path ./resnet_v1_50.cix
```

### CPU Inference

Use the ONNX model for CPU inference to verify correctness. This can be run on an x86 host or Orion O6.

```bash
python3 inference_onnx.py --images test_data --onnx_path ./resnet50-v1-12-sim.onnx
```

The results of NPU and CPU inference are consistent, but the execution speed is significantly faster on the NPU.

## Reference Documents

Research paper: [Deep Residual Learning for Image Recognition](https://arxiv.org/abs/1512.03385)
