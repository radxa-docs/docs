---
sidebar_position: 7
---

# VDSR Example

This document introduces how to use the CIX P1 NPU SDK to convert [VDSR](https://github.com/twtygqyy/pytorch-vdsr) into a model that can run on the CIX SOC NPU.

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

The CIX AI Model Hub includes all necessary files for VDSR. Please follow the instructions in [Download the CIX AI Model Hub Repository](./ai-hub#download-the-cix-ai-model-hub-repository) and navigate to the corresponding directory.

```bash
cd ai_model_hub/models/ComputeVision/Super_Resolution/onnx_vdsr
```

Please confirm that the directory structure is as shown below.

```bash
.
├── cfg
│   └── onnx_vdsr_build.cfg
├── datasets
│   └── calib_dataset.npy
├── graph.json
├── inference_npu.py
├── inference_onnx.py
├── output
│   └── butterfly_comparison.png
├── ReadMe.md
└── test_data
    ├── butterfly_GT.bmp
    ├── butterfly_GT_scale_2.bmp
    ├── butterfly_GT_scale_3.bmp
    └── butterfly_GT_scale_4.bmp
```

## Compile the Model

:::tip
Users do not need to compile the model from scratch; Radxa provides a precompiled vdsr.cix model (which can be downloaded using the steps below). If you use the precompiled model, you can skip the “Compile the Model” step.

```bash
wget https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Super_Resolution/onnx_vdsr/vdsr.cix
```

:::

### Prepare the ONNX Model

- Download the ONNX model

  [vdsr.onnx](https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Super_Resolution/onnx_vdsr/model/vdsr.onnx)

- Simplify the Model

  Use `onnxsim` to solidify the model inputs and simplify the model.

  ```bash
  pip3 install onnxsim onnxruntime
  onnxsim vdsr.onnx vdsr-sim.onnx --overwrite-input-shape 1,1,256,256
  ```

### Compile the Model

CIX SOC NPU supports INT8 computation, and before compiling the model, we need to perform INT8 quantization using the NOE Compiler.

- Prepare the Calibration Set

  - Use the existing calibration set from `datasets`.

    ```bash
    .
    └── calibration_data.npy
    ```

  - Prepare your own calibration set.

    The `test_data` directory already contains several images for the calibration set.

    ```bash
    .
    ├── 1.jpeg
    └── 2.jpeg
    ```

    Refer to the following script to generate the calibration file.

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
        image_gray = cv2.cvtColor(image_numpy, cv2.COLOR_BGR2GRAY)
        image_ex = np.expand_dims(image_gray, 0)
        input = normalize_image(image_ex)
        data.append(input)
    # concat the data and save calib dataset
    data = np.concatenate(data, axis=0)
    np.save("datasets/calib_data_tmp.npy", data)
    print("Generate calib dataset success.")
    ```

- Quantize and Compile the Model with NOE Compiler

  - Create the quantization and compilation configuration file. Please refer to the following configuration.

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

  - Compile the Model
    :::tip
    If you encounter the cixbuild error `[E] Optimizing model failed! CUDA error: no kernel image is available for execution on the device ...`, it means that the current version of torch does not support this GPU. Please completely uninstall the current version of torch and download the latest version from the torch website.
    :::
    ```bash
    cixbuild ./onnx_deeplab_v3_build.cfg
    ```

## Model Deployment

### NPU Inference

Copy the .cix format model compiled with the NOE Compiler to the Orion O6 development board for model validation.

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

real    0m2.837s
user    0m3.270s
sys     0m0.223s
```

Results are saved in the `output_npu` folder.

![vdsr_npu.webp](/img/o6/vdsr_npu.webp)

### CPU Inference

Use the CPU to verify the correctness of the ONNX model inference, which can be run on an x86 host or on Orion O6.

```bash
python3 inference_onnx.py --images ./test_data/ --onnx_path ./deeplabv3_resnet50-sim.onnx
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Semantic_Segmentation/onnx_deeplab_v3$ time python3 inference_onnx.py --images ./test_data/ --onnx_path ./deeplabv3_resnet50-sim.onnx
save output: onnx_ILSVRC2012_val_00004704.JPEG

real    0m7.605s
user    0m33.235s
sys     0m0.558s
```

Results are saved in the `output_onnx` folder.
![vdsr_onnx.webp](/img/o6/vdsr_onnx.webp)

It can be seen that the inference results on both NPU and CPU are consistent, but the running time is significantly reduced.

## References

Paper link: [Accurate Image Super-Resolution Using Very Deep Convolutional Networks](https://arxiv.org/abs/1511.04587)
