---
sidebar_position: 5
---

# OpenPose Example

This document introduces how to use the CIX P1 NPU SDK to convert [OpenPose](https://github.com/Daniil-Osokin/lightweight-human-pose-estimation.pytorch) into a model that can run on the CIX SOC NPU.

In general, there are four steps:
:::tip
Steps 1 to 3 are executed in the x86 host Linux environment
:::
1. Download the NPU SDK and install the NOE Compiler
2. Download the model files (code and scripts)
3. Compile the model
4. Deploy the model to Orion O6

## Download the NPU SDK and Install the NOE Compiler

Please refer to [Install NPU SDK](./npu-introduction#npu-sdk-installation) for the installation of NPU SDK and NOE Compiler.

## Download the Model Files

The CIX AI Model Hub includes the necessary files for OpenPose. Please download according to [Download CIX AI Model Hub](./ai-hub#download-cix-ai-model-hub), and then check in the corresponding directory

```bash
cd ai_model_hub/models/ComputeVision/Pose_Estimation/onnx_openpose
```
Please confirm whether the directory structure is as shown in the figure below

```bash
.
├── cfg
│   ├── human-pose-estimationbuild.cfg
│   └── opt_template.json
├── datasets
│   └── calib_data_my.npy
├── inference_npu.py
├── inference_onnx.py
├── output_onnx.jpg
├── ReadMe.md
└── test_data
    ├── 1.jpeg
    └── 2.jpeg
```

## Compile the Model
:::tip
Users do not need to compile the model from scratch. Radxa provides a precompiled human-pose-estimation.cix model (which can be downloaded using the steps below). If you use the precompiled model, you can skip the "Compile the Model" step
```bash
wget https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Pose_Estimation/onnx_openpose/human-pose-estimation.cix
```
:::

### Prepare the ONNX Model

- Download the ONNX model

  [human-pose-estimation.onnx](https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Pose_Estimation/onnx_openpose/model/human-pose-estimation.onnx)

- Simplify the model

  Here, we use onnxsim to solidify the model input and simplify the model

  ```bash
  pip3 install onnxsim onnxruntime
  onnxsim human-pose-estimation.onnx human-pose-estimation-sim.onnx --overwrite-input-shape 1,3,256,360
  ```

### Compile the Model

The CIX SOC NPU supports INT8 computation. Before compiling the model, we need to use the NOE Compiler to quantize the model to INT8.

- Prepare the calibration set

  - Use the existing calibration set in `datasets`

    ```bash
    .
    └── calib_data_my.npy
    ```

  - Prepare your own calibration set

    The `test_data` directory already contains multiple calibration set image files

    ```bash
    .
    ├── 1.jpeg
    └── 2.jpeg
    ```

    Refer to the following script to generate the calibration file

    ```python
    import sys
    import os
    import numpy as np
    import cv2
    _abs_path = os.path.join(os.getcwd(), "../../../../")
    sys.path.append(_abs_path)
    from utils.image_process import preprocess_openpose
    from utils.tools import get_file_list
    # Get a list of images from the provided path
    images_path = "test_data"
    images_list = get_file_list(images_path)
    data = []
    for image_path in images_list:
        img_numpy = cv2.imread(image_path)
        input = preprocess_openpose(img_numpy, 256)[0]
        data.append(input)
    # concat the data and save calib dataset
    data = np.concatenate(data, axis=0)
    np.save("datasets/calib_data_tmp.npy", data)
    print("Generate calib dataset success.")
    ```

- Use the NOE Compiler to quantize and compile the model

  - Create a quantization cfg configuration file, please refer to the following configuration

    ```bash
    [Common]
    mode = build

    [Parser]
    model_type = ONNX
    model_name = human-pose-estimation
    detection_postprocess =
    model_domain = OBJECT_DETECTION
    input_data_format = NCHW
    input_model = ./human-pose-estimation-sim.onnx
    input = images
    input_shape = [1, 3, 256, 360]
    output_dir = ./

    [Optimizer]
    dataset = numpydataset
    calibration_data = ./datasets/calib_data_tmp.npy
    calibration_batch_size = 1
    output_dir = ./
    quantize_method_for_activation = per_tensor_asymmetric
    quantize_method_for_weight = per_channel_symmetric_restricted_range
    save_statistic_info = True
    opt_config = cfg/opt_template.json
    cast_dtypes_for_lib = True

    [GBuilder]
    target = X2_1204MP3
    outputs = human-pose-estimation.cix
    tiling = fps
    ```

  - Quantize the model
    :::tip
    If you encounter the error `[E] Optimizing model failed! CUDA error: no kernel image is available for execution on the device ...` when running cixbuild, it means that the current version of torch does not support this GPU. Please completely uninstall the current version of torch, and then download the latest version from the torch official website.
    :::
    ```bash
    cixbuild ./human-pose-estimationbuild.cfg
    ```

## Model Deployment

### NPU Inference

Copy the compiled .cix format model to the Orion O6 development board for model validation

```bash
python3 inference_npu.py --image_path ./test_data/ --model_path human-pose-estimation.cix
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Pose_Estimation/onnx_openpose$ time python3 inference_npu.py --image_path ./test_data/ --model_path human-pose-estimation.cix
npu: noe_init_context success
npu: noe_load_graph success
Input tensor count is 1.
Output tensor count is 4.
npu: noe_create_job success
npu: noe_clean_job success
npu: noe_unload_graph success
npu: noe_deinit_context success

real	0m2.788s
user	0m3.158s
sys	0m0.276s
```

The results are saved in the `output` folder

![openpose_npu1](/img/o6/openpose_npu1.webp)

![openpose_npu1](/img/o6/openpose_npu2.webp)

### CPU Inference

Use the CPU to perform inference on the ONNX model to verify correctness, which can be run on the X86 host or Orion O6

```bash
python3 inference_onnx.py --image_path ./test_data/ --onnx_path ./yolov8l.onnx
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Pose_Estimation/onnx_openpose$ time python3 inference_onnx.py --image_path ./test_data/ --onnx_path human-pose-estimation.onnx

real	0m3.138s
user	0m6.961s
sys	0m0.318s
```

The results are saved in the `output` folder
![openpose_omnx1](/img/o6/openpose_onnx1.webp)

![openpose_omnx1](/img/o6/openpose_onnx2.webp)

It can be seen that the inference results on NPU and CPU are consistent, but the operating speed has been significantly reduced


## Reference Document

Paper link: [Real-time 2D Multi-Person Pose Estimation on CPU: Lightweight OpenPose](https://arxiv.org/abs/1811.12004)
