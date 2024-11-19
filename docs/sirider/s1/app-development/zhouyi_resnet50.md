---
sidebar_position: 2
---

# Resnet50 目标识别

此文档将详细讲解如何在 Sirider S1 利用 NPU 硬件加速推理 [Resnet50](https://github.com/mlcommons/inference) 模型。

文档分为两部分：
[快速体验](#快速体验)， [详细教程](#详细教程)

## 快速体验

radxa 提供一个开箱即用的 resnet50 目标分类例子，旨在用户可以直接在 sirider s1 使用 AIPU 推理 resnet50 模型，免去复杂的模型编译和执行代码编译，
这对想快速使用 AIPU 而不想从头编译模型的用户是最佳的选择，如您对完整工作流程感兴趣可以参考 [详细教程](#详细教程)

- 克隆仓库代码
  ```bash
  git clone https://github.com/zifeng-radxa/siriders1_NPU_example.git
  ```
- 安装依赖
  :::tip
  建议使用 virtualenv
  :::
  ```bash
  cd siriders1_NPU_example
  pip3 install -r requirements.txt
  ```
- 生成用于模型输入的文件

  ```bash
  python3 input_gen.py --img_path <your_image_path>
  ```

- 模型推理
  ```bash
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/libs
  ./aipu_test aipu_mlperf_resnet50.bin input_3_224_224.bin
  ```

## 详细教程

要使用周易 Z2 AIPU 部署目标模型，需要分三步走，模型转换，编译推理文件，应用层程序设计

### 模型转换

:::tip
此过程在 x86 主机上完成，进行模型转换前，请根据 [**周易 AIPU SDK 安装教程**](./zhouyi_npu#周易-aipu-sdk-安装教程) 安装 周易SDK 并完成 [**配置 nn-compiler 环境**](./zhouyi_npu#配置-nn-compiler-环境)
:::
nn-compiler 可以将 TensorFlow、ONNX 等框架模型转换成可以在周易 AIPU 进行硬件加速推理的模型文件

- 进入 siengine nn-compiler-user-case-example 目录

  如没配置好 nn-compiler 环境， 请按照 [配置 nn-compiler 环境](./zhouyi_npu#配置-nn-compiler-环境)进行配置

  ```bash
  cd siengine/nn-compiler-user-case-example/onnx
  ```

- 生成量化校准集
  ```bash
  python3 generate_calibration_data.py
  ```
- 生成用于模型推理的照片文件

  ```bash
  python3 generate_input_binary.py
  ```

  文件在 ./resnet50/input_3_224_224.bin

- (可选) 配置 build.cfg （开箱即用案例已提供）
  ```bash
  vim ./resnet50/build.cfg
  ```
- 生成 aipu 模型

  ```bash
  cd ./restnet50
  aipubuild build.cfg
  ```

  在 ./restnet50 中得到 aipu_mlperf_resnet50.bin

  :::tip
  如果找不到 `aipubuild` 命令，可尝试 `export PATH=$PATH:/root/.local/bin`
  :::

### 板端使用周易 Z2 推理 AIPU 模型

在使用周易 Z2 AIPU 推理前需要在 x86 主机进行交叉编译生成用于模型推理的可执行文件 `aiputest`，然后拷贝到 Sirider S1 中执行

#### 在 x86 PC 端交叉编译二进制可执行文件

- 安装 [gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu](https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/) 交叉编译工具链
  ```bash
  tar -xvf gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar
  cp -r gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu /opt
  ```
- 编译 aiputest

  - 修改 UMDSRC 路径变量

  ```bash
  cd siengine/nn-runtime-user-case-example
  vim CMakeLists.txt
  #set(UMDSRC "${CMAKE_SOURCE_DIR}/../AI610-SDK-${AIPU_VERSION}-00eac0/AI610-SDK-1012-${AIPU_VERSION}-eac0/Linux-driver/driver/umd")
  set(UMDSRC "${CMAKE_SOURCE_DIR}/../../AI610-SDK-${AIPU_VERSION}-AIoT/AI610-SDK-r1p3-00eac0/AI610-SDK-1012-${AIPU_VERSION}-eac0/Linux-driver/driver/umd")
  ```

  - 交叉编译

  ```bash
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
  ```

  编译生成的文件在 `siengine/nn-runtime-user-case-example/out/linux/aipu_test`

#### 在 Sirider S1 进行板端推理

- 将生成的 `aipu_mlperf_resnet50.bin` 模型文件，`input_3_224_224.bin` 照片文件，`aipu_test` 可执行文件，`out/linux/libs` 动态库文件夹复制到 Sirider S1 中
- 执行 aipu_test

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

  两次的推理总时间

  ```bash
  real	0m0.043s
  user	0m0.008s
  sys	0m0.023s
  ```

  这里结果仅显示 推理结果的标签值，最大置信度 637 即对应 [imagenet1000](https://gist.github.com/yrevar/942d3a0ac09ec9e5eb3a) 中的 `mailbag, postbag`

  ![input.webp](/img/sirider/s1/aipu_1.webp)
