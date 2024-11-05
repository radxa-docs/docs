---
sidebar_position: 2
---

# YOLOv4 Object Detection

This document provides a detailed guide on how to use NPU hardware acceleration for inference with the [YOLOv4](https://github.com/hunglc007/tensorflow-yolov4-tflite) model on the Sirider S1.

The document is divided into two sections:
[Quick Start](#quick-start) and [Detailed Tutorial](#detailed-tutorial).

## Quick Start

Radxa provides a ready-to-use YOLOv4 object detection example that allows users to run the yolov4_tiny model with AIPU on the Sirider S1 directly. This example eliminates the need for complex model and execution code compilation, making it ideal for users who want to use the AIPU quickly without compiling from scratch. If you're interested in the full workflow, please refer to the [Detailed Tutorial](#detailed-tutorial) section.

- Clone the repository:

  ```bash
  git clone https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo.git
  ```

- Install dependencies:
  :::tip
  It is recommended to use virtualenv.
  :::

  ```bash
  cd siriders1_NPU_yolov4_tiny_demo/demo
  pip3 install -r requirements.txt
  ```

- Run the yolov4 demo program:

  ```bash
  python3 yolov4_aipu.py -m [mode] -i [your_input_path] -r
  # python3 yolov4_aipu,py -m camera -r
  ```

  Parameters:

        `-h`, `--help`: Print parameter information.

        `-m`, `--mode`: Input mode selection, supports ['camera', 'video', 'image'].

        `-i`, `--input`: Input file path; please provide the file path when mode is set to ['video', 'image'].

        `-r`, `--real_time`: Real-time preview.

        `-s`, `--save`: Save output to the `output` folder.

  ![input.webp](/img/sirider/s1/yolov4_1.webp)

## Detailed Tutorial

### Model Conversion

:::tip
This process is done on an x86 host machine. Before converting the model, install the Zhouyi SDK and complete the **nn-compiler environment setup** as described in the [**Zhouyi Z2 AIPU Usage Guide**](./zhouyi_npu#zhouyi-z2-aipu-user-guide).
:::

- Generate quantization data:

  ```bash
  cd siriders1_NPU_yolov4_tiny_demo/convert
  python3 preprocess.py
  ```

- Generate the aipu model:
  ```bash
  aipubuild tflite_yolo_v4_tinybuild.cfg
  ```
  The generated model is saved in `./aipu_yolov4_tiny.bin`.

### Compile the AIPU Executable Inference File

Compile an executable file for inference with the Zhouyi Z2 AIPU model.

- Copy the `compile` folder from the [repository](https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo) to the Zhouyi SDK:

  Copy the `compile` folder from the [siriders1_NPU_yolov4_tiny_demo](https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo) repository to `YOUR_SDK_PATH/siengine`. **Be sure to replace YOUR_SDK_PATH with your actual path.**

  ```bash
  cp -r compile YOUR_SDK_PATH/siengine
  ```

- Cross-compilation:

  :::tip
  Modify the `Linux_Tool_ROOT` path in `CMakeList.txt` according to your cross-compilation toolchain path. The default is `/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin`.
  :::

  ```bash
  cd YOUR_SDK_PATH/siengine/compile
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release .. && make
  cd ..
  ```

  The output file is saved in the `out` folder.

- Transfer to the board and test

  Transfer the generated `aipu_yolov4_tiny.bin` model file and the files in `out/linux` to the Sirider S1.

  Test the results using [yolov4_aipu.py](https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo/blob/main/demo/yolov4_aipu.py):

  ```bash
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:linux/libs
  python3 yolov4_aipu.py -m image -i YOUR_IMAGE_PATH -r
  ```
