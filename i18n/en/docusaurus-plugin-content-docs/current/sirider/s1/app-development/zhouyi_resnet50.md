---
sidebar_position: 2
---

# ResNet50 Object Recognition

This document provides a detailed guide on how to use the NPU hardware acceleration on Sirider S1 to infer the [ResNet50](https://github.com/mlcommons/inference) model.

The document is divided into two parts: [Quick Start](#quick-start) and [Detailed Tutorial](#detailed-tutorial)

## Quick Start

Radxa provides a ready-to-use example for ResNet50 object classification. This allows users to directly run the ResNet50 model on Sirider S1 using AIPU, eliminating the need for complex model and code compilation.  
This is ideal for users who want to quickly use AIPU without building the model from scratch. If you're interested in the full workflow, refer to the [Detailed Tutorial](#detailed-tutorial).

- Clone the repository:
  ```bash
  git clone https://github.com/zifeng-radxa/siriders1_NPU_example.git
  ```
- Install dependencies:
  :::tip
  It is recommended to use `virtualenv`.
  :::
  ```bash
  cd siriders1_NPU_example
  pip3 install -r requirements.txt
  ```
- Generate input files for the model:

  ```bash
  python3 input_gen.py --img_path <your_image_path>
  ```

- Run model inference:
  ```bash
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/libs
  ./aipu_test aipu_mlperf_resnet50.bin input_3_224_224.bin
  ```

## Detailed Tutorial

To deploy the target model on the Zhouyi Z2 AIPU, you need to follow three steps: model conversion, inference file compilation, and application-level program design.

### Model Conversion

:::tip  
This step is completed on an x86 host. Before starting model conversion, install the Zhouyi SDK according to the [**Zhouyi AIPU SDK Installation Guide**](./zhouyi_npu#zhouyi-aipu-sdk-installation-guide) and complete the [**Configure the nn-compiler Environment**](./zhouyi_npu#configure-the-nn-compiler-environment).
:::

The `nn-compiler` can convert models from TensorFlow, ONNX, etc., into model files optimized for hardware-accelerated inference on the Zhouyi AIPU.

- Navigate to the `nn-compiler-user-case-example` directory:

  ```bash
  cd siengine/nn-compiler-user-case-example/onnx
  ```

- Generate quantization calibration data:

  ```bash
  python3 generate_calibration_data.py
  ```

- Generate binary input files for model inference:

  ```bash
  python3 generate_input_binary.py
  ```

  Output: `./resnet50/input_3_224_224.bin`

- (Optional) Edit `build.cfg` if needed (default provided in the example):

  ```bash
  vim ./resnet50/build.cfg
  ```

- Build the AIPU model:
  ```bash
  cd ./resnet50
  aipubuild build.cfg
  ```
  Output: `aipu_mlperf_resnet50.bin`

:::tip  
If the `aipubuild` command is not found, try adding it to your path:

```bash
export PATH=$PATH:/root/.local/bin
```

:::

### Inference on the Sirider S1 Board

Before running inference on the Zhouyi Z2 AIPU, you need to cross-compile an executable file (`aiputest`) on an x86 host and transfer it to Sirider S1.

#### Cross-Compiling Executables on x86 Host

- Install the cross-compilation toolchain ([gcc-linaro-7.5.0](https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/)):

  ```bash
  tar -xvf gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar
  cp -r gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu /opt
  ```

- Compile `aiputest`:

  - Modify the `UMDSRC` path variable in `CMakeLists.txt`:

    ```bash
    cd siengine/nn-runtime-user-case-example
    vim CMakeLists.txt
    # Example: Update the path for your SDK installation
    set(UMDSRC "${CMAKE_SOURCE_DIR}/../../AI610-SDK-${AIPU_VERSION}-AIoT/Linux-driver/driver/umd")
    ```

  - Build the executable:
    ```bash
    mkdir build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
    ```
    Output: `siengine/nn-runtime-user-case-example/out/linux/aipu_test`

#### Inference on Sirider S1 Board

- Transfer the following files to Sirider S1:

  - `aipu_mlperf_resnet50.bin` (model file)
  - `input_3_224_224.bin` (input file)
  - `aipu_test` (executable)
  - `libs` directory (dynamic libraries)

- Run the `aiputest` program:

  ```bash
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:<your_libs_path>
  ./aipu_test aipu_mlperf_resnet50.bin input_3_224_224.bin
  ```

- Sample Output:

  ```bash
  (aiot-focal_overlayfs)root@linux:~/ssd# ./aipu_test aipu_mlperf_resnet50.bin input_3_224_224.bin
  usage: ./aipu_test aipu.bin input0.bin
  aipu_init_context success
  aipu_load_graph_helper success: aipu_mlperf_resnet50.bin
  aipu_create_job success
  Frame #0
  aipu_finish_job success
  No profiler data
  get output tensor 0 success (1/1)
  output_desc zero_point: 0.0000 scale: 5.5835
  idx: 637  fval: 21.4919
  idx: 749  fval: 19.8800
  idx: 415  fval: 16.1189
  idx: 412  fval: 15.0443
  idx: 791  fval: 14.1488
  Frame #1
  aipu_finish_job success
  No profiler data
  get output tensor 0 success (1/1)
  output_desc zero_point: 0.0000 scale: 5.5835
  idx: 637  fval: 21.4919
  idx: 749  fval: 19.8800
  idx: 415  fval: 16.1189
  idx: 412  fval: 15.0443
  idx: 791  fval: 14.1488
  aipu_clean_job success
  aipu_unload_graph success
  aipu_deinit_ctx success
  ```

  In this case, the highest confidence index `637` corresponds to "mailbag, postbag" in the [ImageNet 1000 categories](https://gist.github.com/yrevar/942d3a0ac09ec9e5eb3a).

  ![input.webp](/img/sirider/s1/aipu_1.webp)
