---
sidebar_position: 4
---

# YOLOv8 Example

This document introduces how to use the CIX P1 NPU SDK to convert [YOLOv8](https://github.com/ultralytics/ultralytics/tree/v8.1.43) into a model that can run on the CIX SOC NPU.

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

The CIX AI Model Hub includes the necessary files for YOLOv8. Please download according to [Download CIX AI Model Hub](./ai-hub#download-cix-ai-model-hub), and then check in the corresponding directory

```bash
cd ai_model_hub/models/ComputeVision/Object_Detection/onnx_yolov8_l
```
Please confirm whether the directory structure is as shown in the figure below.

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

## Compile the Model
:::tip
Users do not need to compile the model from scratch. Radxa provides a precompiled yolov8_l.cix model (which can be downloaded using the steps below). If you use the precompiled model, you can skip the "Compile the Model" step.

```bash
wget https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Object_Detection/onnx_yolov8_l/yolov8_l.cix
```
:::

### Prepare the ONNX Model

- Download the ONNX model

  [yolov8l.onnx](https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Object_Detection/onnx_yolov8_l/model/yolov8l.onnx)

- Simplify the model

  Here, we use onnxsim to solidify the model input and simplify the model

  ```bash
  pip3 install onnxsim onnxruntime
  onnxsim yolov8l.onnx yolov8l-sim.onnx --overwrite-input-shape 1,3,640,640
  ```

### Compile the Model

The CIX SOC NPU supports INT8 computation. Before compiling the model, we need to use the NOE Compiler to quantize the model to INT8.

- Prepare the calibration set

  - Use the existing calibration set in `datasets`

    ```bash
    .
    └── calibration_data.npy
    ```

  - Prepare your own calibration set

    The `test_data` directory already contains multiple calibration set image files

    ```bash
    .
    ├── 1.jpeg
    └── ILSVRC2012_val_00004704.JPEG
    ```

    Refer to the following script to generate the calibration file

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

- Use the NOE Compiler to quantize and compile the model

  - Create a quantization cfg configuration file, please refer to the following configuration

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

  - Quantize the model
    :::tip
    If you encounter the error `[E] Optimizing model failed! CUDA error: no kernel image is available for execution on the device ...` when running cixbuild, it means that the current version of torch does not support this GPU. Please completely uninstall the current version of torch, and then download the latest version from the torch official website.
    :::
    ```bash
    cixbuild ./yolov8_lbuild.cfg
    ```

## Model Deployment

### NPU Inference

Copy the compiled .cix format model to the Orion O6 development board for model validation

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

The results are saved in the `output_npu` folder

![yolov8_npu1](/img/o6/yolov8_npu1.webp)

![yolov8_npu1](/img/o6/yolov8_npu2.webp)

### CPU Inference

Use the CPU to perform inference on the ONNX model to verify correctness, which can be run on the X86 host or Orion O6

```bash
python3 inference_onnx.py --image_path ./test_data/ --onnx_path ./yolov8l.onnx
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Object_Detection/onnx_yolov8_l$ time python3 inference_onnx.py --image_path ./test_data/ --onnx_path ./yolov8l.onnx
/usr/local/lib/python3.11/dist-packages/onnxruntime/capi/onnxruntime_inference_collection.py:69: UserWarning: Specified provider 'CUDAExecutionProvider' is not in available provider names.Available providers: 'ZhouyiExecutionProvider, CPUExecutionProvider'
  warnings.warn(
100%|█████████████████████████████████████████████████████████████████████████████████████████████████████| 2/2 [00:03<00:00,  1.8
real	0m6.671s
user	0m37.881s
sys	0m0.616s
```

The results are saved in the `output_onnx` folder

![yolov8_omnx1](/img/o6/yolov8_onnx1.webp)

![yolov8_onnx1](/img/o6/yolov8_onnx2.webp)

It can be seen that the inference results on NPU and CPU are consistent, but the operating speed has been significantly reduced

## Reference Document

Paper link: [What is YOLOv8: An In-Depth Exploration of the Internal Features of the Next-Generation Object Detector](https://arxiv.org/abs/2408.15857)
