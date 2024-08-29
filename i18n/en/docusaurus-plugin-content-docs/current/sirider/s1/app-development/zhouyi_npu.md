---
sidebar_position: 1
---

# Zhouyi Z2 AIPU

The "Zhouyi" AIPU is an innovative AI-specific processor independently developed by Arm China for deep learning. It features an innovative architecture design, providing a complete hardware and software ecosystem with the best balance of PPA (Performance, Power, Area).  
Arm China also provides a range of tools for "Zhouyi" AIPU customers to assist in development, including simulators, compilers, and debuggers for data collection and analysis.  
The "Zhouyi" AIPU supports mainstream AI frameworks, including TensorFlow and ONNX, and will support more extended frameworks in the future.

The "Zhouyi" Z2 AIPU is primarily targeted at high-end security, intelligent cockpits and ADAS (Advanced Driver Assistance Systems), edge servers, and other application scenarios.

## Zhouyi Z2 AIPU User Guide

### Install Zhouyi AIPU SDK on x86 PC

The Zhouyi SDK is a full-stack platform that provides users with rapid development and deployment capabilities.

![image](https://user-images.githubusercontent.com/85479712/198521602-49e13a31-bb49-424f-b782-5108274d63c3.png)

- Download the Zhouyi Z2 SDK installation package from the [Radxa Download Station](https://dl.radxa.com/sirider/s1/) and extract it for installation:
    ```bash
    tar -xvf Zhouyi_Z2.tar.gz
    cd Zhouyi_Z2 && bash +x SETUP.SH
    ```
- After installation, the complete SDK files are as follows:

  - `AI610-SDK-r1p3-AIoT`: ARM Zhouyi Z2 toolkit

  - `siengine`: Demos provided by siengine for ARM Zhouyi Z2 model compilation (nn-compiler-user-case-example) and board deployment (nn-runtime-user-case-example)

- Configure the nn-compiler environment:
    ```bash
    cd AI610-SDK-r1p3-AIoT/AI610-SDK-r1p3-00eac0/Out-Of-Box/out-of-box-nn-compiler
    pip3 install -r lib_dependency.txt
    ```
  Since this SDK does not include simulation functionality, errors may occur when installing AIPUSimProfiler. These can be ignored.

  If using a virtual environment (venv), please remove the --user option from the pip3 install part in env_setup.sh:
    ```bash
    source env_setup.sh
    ```

### Model Conversion on x86 PC

The nn-compiler can convert models from frameworks like TensorFlow and ONNX into models that can be accelerated by the Zhouyi AIPU for inference.

:::tip
This case introduces an out-of-the-box example: resnet50 for object classification.

For the complete SDK documentation, please refer to `AI610-SDK-r1p3-AIoT/AI610-SDK-r1p3-00eac0/AI610-DOC-1001-r1p3-eac0`.
:::

- Enter the siengine nn-compiler-user-case-example directory.

  If the nn-compiler environment is not configured, please follow [Install Zhouyi AIPU SDK on x86 PC](#install-zhouyi-aipu-sdk-on-x86-pc) to configure.

  ```bash
  cd  siengine/nn-compiler-user-case-example/onnx
  ```

- Generate the quantization calibration set:
  ```bash
  python3 generate_calibration_data.py
  ```
- Generate image files for model inference:
  ```bash
  python3 generate_input_binary.py
  ```
  The file is located in ./resnet50/input_3_224_224.bin.

- (Optional) Configure build.cfg (provided in out-of-the-box example):
  ```bash
  vim ./resnet50/build.cfg
  ```
- Generate the aipu model:
  ```bash
  cd ./restnet50
  aipubuild build.cfg
  ```
  The aipu model is generated in ./restnet50 as aipu_mlperf_resnet50.bin.

### Use Zhouyi Z2 for AIPU Model Inference on the Board

Before using Zhouyi Z2 AIPU for inference, a cross-compiled executable file `aiputest` needs to be generated on the x86 host and then copied to the Sirider S1 for execution.

#### Cross-compiling the Binary Executable on x86 PC

- Install the [gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu](https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/) cross-compilation toolchain:
  ```bash
  tar -xvf gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar
  cp -r gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu /opt
  ```
- Compile aiputest:

  - Modify the UMDSRC variable:
  ```bash
  cd siengine/nn-runtime-user-case-example 
  vim CMakeLists.txt
  #set(UMDSRC "${CMAKE_SOURCE_DIR}/../AI610-SDK-${AIPU_VERSION}-00eac0/AI610-SDK-1012-${AIPU_VERSION}-eac0/Linux-driver/driver/umd")
  set(UMDSRC "${CMAKE_SOURCE_DIR}/../../AI610-SDK-${AIPU_VERSION}-AIoT/AI610-SDK-r1p3-00eac0/AI610-SDK-1012-${AIPU_VERSION}-eac0/Linux-driver/driver/umd")
  ```
  - Cross-compile:
  ```bash
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
  ```
  The compiled file is located in `siengine/nn-runtime-user-case-example/out/linux/aipu_test`.

#### Inference on the Sirider S1

- Copy the generated `aipu_mlperf_resnet50.bin` model file, `input_3_224_224.bin` image file, `aipu_test` executable file, and `out/linux/libs` dynamic library folder to the Sirider S1.
- Execute aipu_test:
  ```bash
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:<your libs path>
  ./aipu_test aipu_mlperf_resnet50.bin input_3_224_224.bin
  ```
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
  The total time for two inferences:
  ```bash
  real	0m0.043s
  user	0m0.008s
  sys	0m0.023s
  ```

  The result here only shows the labels of the inference results, with the highest confidence being 637, corresponding to `mailbag, postbag` in [imagenet1000](https://gist.github.com/yrevar/942d3a0ac09ec9e5eb3a).

![input.webp](/img/sirider/s1/aipu_1.webp)

