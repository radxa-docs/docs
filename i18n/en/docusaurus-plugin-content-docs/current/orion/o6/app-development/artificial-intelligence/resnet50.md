---
sidebar_position: 3
---

# ResNet50 Example

This document introduces how to use the CIX P1 NPU SDK to convert [ResNet50](https://github.com/onnx/models/blob/main/validated/vision/classification/resnet/model/resnet50-v1-12.onnx) into a model that can run on the CIX SOC NPU.

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

The CIX AI Model Hub includes the necessary files for ResNet50. Please download according to [Download CIX AI Model Hub](./ai-hub#download-cix-ai-model-hub), and then check in the corresponding directory

```bash
cd ai_model_hub/models/ComputeVision/Image_Classification/onnx_resnet_v1_50
```
Please confirm whether the directory structure is as shown in the figure below.

```bash
.
├── cfg
│   └── onnx_resnet_v1_50build.cfg
├── datasets
│   └── calib_data.npy
├── graph.json
├── inference_npu.py
├── inference_onnx.py
├── ReadMe.md
├── test_data
│   ├── ILSVRC2012_val_00002899.JPEG
│   ├── ILSVRC2012_val_00004704.JPEG
│   ├── ILSVRC2012_val_00021564.JPEG
│   ├── ILSVRC2012_val_00024154.JPEG
│   ├── ILSVRC2012_val_00037133.JPEG
│   └── ILSVRC2012_val_00045790.JPEG
└── Tutorials.ipynb
```

## Compile the Model
:::tip
Users do not need to compile the model from scratch. Radxa provides a precompiled resnet_v1_50.cix model (which can be downloaded using the steps below). If you use the precompiled model, you can skip the "Compile the Model" step
```bash
wget https://modelscope.cn/models/cix/ai_model_hub_24_Q4/resolve/master/models/ComputeVision/Image_Classification/onnx_resnet_v1_50/resnet_v1_50.cix
```
:::

### Prepare the ONNX Model

- Download the ONNX model

  [resnet50-v1-12.onnx](https://github.com/onnx/models/blob/main/validated/vision/classification/resnet/model/resnet50-v1-12.onnx)

- Simplify the model

  Here, we use onnxsim to solidify the model input and simplify the model

  ```bash
  pip3 install onnxsim onnxruntime
  onnxsim resnet50-v1-12.onnx resnet50-v1-12-sim.onnx --overwrite-input-shape 1,3,224,224
  ```

### Compile the Model

The CIX SOC NPU supports INT8 computation. Before compiling the model, we need to use the NOE Compiler to quantize the model to INT8.

- Prepare the calibration set

  - Prepare your own calibration set

    The `test_data` directory already contains multiple calibration set image files

    ```bash
    ├── test_data
    │   ├── ILSVRC2012_val_00002899.JPEG
    │   ├── ILSVRC2012_val_00004704.JPEG
    │   ├── ILSVRC2012_val_00021564.JPEG
    │   ├── ILSVRC2012_val_00024154.JPEG
    │   ├── ILSVRC2012_val_00037133.JPEG
    │   └── ILSVRC2012_val_00045790.JPEG
    ```

    Refer to the following script to generate the calibration file

    ```python
    import sys
    import os
    import numpy as np
    _abs_path = os.path.join(os.getcwd(), "../../../../")
    sys.path.append(_abs_path)
    from utils.image_process import imagenet_preprocess_method1

    from utils.tools import get_file_list
    # Get a list of images from the provided path
    images_path = "test_data"
    images_list = get_file_list(images_path)
    data = []
    for image_path in images_list:
        input = imagenet_preprocess_method1(image_path)
        data.append(input)
    # concat the data and save calib dataset
    data = np.concatenate(data, axis=0)
    print(data.shape)
    np.save("datasets/calib_data_tmp.npy", data)
    print("Generate calib dataset success.")
    ```

- Use the NOE Compiler to quantize and compile the model

  - Create a quantization cfg configuration file, please refer to the following configuration

    ```bash
    [Common]
    mode = build

    [Parser]
    model_type = onnx
    model_name = resnet_v1_50
    detection_postprocess =
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
    save_statistic_info = True
    cast_dtypes_for_lib = True
    global_calibration = adaround[10, 10, 32, 0.01]

    [GBuilder]
    target = X2_1204MP3
    outputs = resnet_v1_50.cix
    tiling = fps
    profile = True
    ```

  - Quantize the model
    :::tip
    If you encounter the error `[E] Optimizing model failed! CUDA error: no kernel image is available for execution on the device ...` when running cixbuild, it means that the current version of torch does not support this GPU. Please completely uninstall the current version of torch, and then download the latest version from the torch official website.
    :::
    ```bash
    cixbuild ./onnx_resnet_v1_50build.cfg
    ```

## Model Deployment

### NPU Inference

Copy the compiled .cix format model to the Orion O6 development board for model validation

```bash
python3 inference_npu.py --images test_data --model_path ./resnet_v1_50.cix
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Image_Classification/onnx_resnet_v1_50$ time python3 inference_npu.py --images test_data --model_path ./resnet_v1_50.cix
npu: noe_init_context success
npu: noe_load_graph success
Input tensor count is 1.
Output tensor count is 1.
npu: noe_create_job success
image path : test_data/ILSVRC2012_val_00004704.JPEG
plunger, plumber's helper
image path : test_data/ILSVRC2012_val_00021564.JPEG
coucal
image path : test_data/ILSVRC2012_val_00024154.JPEG
Ibizan hound, Ibizan Podenco
image path : test_data/ILSVRC2012_val_00037133.JPEG
ice bear, polar bear, Ursus Maritimus, Thalarctos maritimus
image path : test_data/ILSVRC2012_val_00002899.JPEG
rock python, rock snake, Python sebae
image path : test_data/ILSVRC2012_val_00045790.JPEG
Yorkshire terrier
npu: noe_clean_job success
npu: noe_unload_graph success
npu: noe_deinit_context success

real	0m2.963s
user	0m3.266s
sys	0m0.414s
```

### CPU Inference

Use the CPU to perform inference on the ONNX model to verify correctness, which can be run on the X86 host or Orion O6

```bash
python3 inference_onnx.py --images test_data --onnx_path ./resnet50-v1-12-sim.onnx
```

```bash
(.venv) radxa@orion-o6:~/NOE/ai_model_hub/models/ComputeVision/Image_Classification/onnx_resnet_v1_50$ time python3 inference_onnx.py --images test_data --onnx_path ./resnet50-v1-12-sim.onnx
image path : test_data/ILSVRC2012_val_00004704.JPEG
plunger, plumber's helper
image path : test_data/ILSVRC2012_val_00021564.JPEG
coucal
image path : test_data/ILSVRC2012_val_00024154.JPEG
Ibizan hound, Ibizan Podenco
image path : test_data/ILSVRC2012_val_00037133.JPEG
ice bear, polar bear, Ursus Maritimus, Thalarctos maritimus
image path : test_data/ILSVRC2012_val_00002899.JPEG
rock python, rock snake, Python sebae
image path : test_data/ILSVRC2012_val_00045790.JPEG
Yorkshire terrier

real	0m3.757s
user	0m11.789s
sys	0m0.396s
```

It can be seen that the inference results on NPU and CPU are consistent, but the operating speed has been shortened

## Reference Document

Paper link: [Deep Residual Learning for Image Recognition](https://arxiv.org/abs/1512.03385)
