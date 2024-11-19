---
sidebar_position: 3
---

# YOLOv4 Object Detection

This document explains in detail how to utilize NPU hardware acceleration on the Sirider S1 to infer the [YOLOv4](https://github.com/hunglc007/tensorflow-yolov4-tflite) model.

The document is divided into two parts:
[Quick Start](#quick-start) and [Detailed Tutorial](#detailed-tutorial).

## Quick Start

Radxa provides a ready-to-use YOLOv4 object detection example, allowing users to run the `yolov4_tiny` model on the Sirider S1 using AIPU for inference. This eliminates the need for complex model compilation and execution code setup, making it an ideal choice for those who want to quickly use AIPU without building models from scratch. For those interested in the full workflow, refer to the [Detailed Tutorial](#detailed-tutorial) section.

- Clone the repository:

  ```bash
  git clone https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo.git
  ```

- Install dependencies:
  :::tip
  It is recommended to use `virtualenv`.
  :::

  ```bash
  cd siriders1_NPU_yolov4_tiny_demo/demo
  pip3 install -r requirements.txt
  ```

- Run the YOLOv4 demo program:

  ```bash
  python3 yolov4_aipu.py -m [mode] -i [your_input_path] -r
  # Example: python3 yolov4_aipu.py -m camera -r
  ```

  Parameter details:

        `-h`, `--help`: Print parameter information.

        `-m`, `--mode`: Select input mode, supports ['camera', 'video', 'image'].

        `-i`, `--input`: Input file path, required when mode is ['video', 'image'].

        `-r`, `--real_time`: Real-time preview.

        `-s`, `--save`: Save the output to the `output` folder.

  ![input.webp](/img/sirider/s1/yolov4_1.webp)

## Detailed Tutorial

To deploy the target model on the Zhouyi Z2, there are three main steps: model conversion, compiling the inference file, and application-level programming.

### Model Conversion

:::tip
This step is completed on an x86 host. Before starting model conversion, install the Zhouyi SDK according to the [**Zhouyi AIPU SDK Installation Guide**](./zhouyi_npu#zhouyi-aipu-sdk-installation-guide) and complete the [**Configure the nn-compiler Environment**](./zhouyi_npu#configure-the-nn-compiler-environment).
:::

- Clone the repository:

  ```bash
  git clone https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo.git
  ```

- Generate quantization data:

  ```bash
  cd siriders1_NPU_yolov4_tiny_demo/convert
  python3 preprocess.py
  ```

- Generate the AIPU model:
  ```bash
  aipubuild tflite_yolo_v4_tinybuild.cfg
  ```
  :::tip  
  If the `aipubuild` command is not found, try adding it to your path:
  ```bash
  export PATH=$PATH:/root/.local/bin
  ```
  :::
  The target model is generated at `./aipu_yolov4_tiny.bin`.

### Compile AIPU Executable Inference File

Compile an executable file for inferring the Zhouyi Z2 AIPU model.

- Copy the `compile` folder from the [repository](https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo) to the Zhouyi SDK.

  Copy the `compile` folder from the `siriders1_NPU_yolov4_tiny_demo` repository to `YOUR_SDK_PATH/siengine`. **Make sure to replace YOUR_SDK_PATH with your actual path.**

  ```bash
  cp -r compile YOUR_SDK_PATH/siengine
  ```

- Cross-compile:

  :::tip
  Modify the `Linux_Tool_ROOT` in `CMakeLists.txt` to match your cross-compilation toolchain path. The default path is `/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin`.

  Download the cross-compilation toolchain: [gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu](https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/).
  :::

  ```bash
  cd YOUR_SDK_PATH/siengine/compile
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release .. && make
  cd ..
  ```

  The output files are located in the `out` folder.

### Testing on the Board

Transfer the generated `aipu_yolov4_tiny.bin` model file and the files under `out/linux` to the Sirider S1.

Use [yolov4_aipu.py](https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo/blob/main/demo/yolov4_aipu.py) to test the results:

```bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:linux/libs
python3 yolov4_aipu.py -m image -i YOUR_IMAGE_PATH -r
```
