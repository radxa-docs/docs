---
sidebar_position: 1
---

# 周易Z2 AIPU

“周易” AIPU 是由安谋中国针对深度学习而自主研发的创新性 AI 专用处理器，它采用了创新性的架构设计，提供完整的硬件和软件生态，并且具有 PPA 最佳平衡。
安谋中国还为“周易” AIPU 的客户提供很多工具来帮助他们进行开发，包括仿真器、编译器和调试器等进行数据的采集、分析。
“周易” AIPU 也支持业界主流的 AI 规模框架，包括 TensorFlow、ONNX 等，未来也将支持更多不同的扩展框架。

“周易” Z2 AIPU 将主要面向中高端安防、智能座舱和 ADAS、边缘服务器等应用场景。

## 快速例子

radxa 提供一个开箱即用的目标分类例子，旨在用户可以直接在 sirider s1 使用 AIPU 推理 resnet50 模型，免去复杂的模型编译和执行代码编译，
这对想快速使用 AIPU 而不想从头编译模型的用户是最佳的选择，如您对完整工作流程感兴趣可以参考 [周易 Z2 AIPU 使用教程](zhouyi_npu#周易-z2-aipu-使用教程)

- 克隆仓库代码
  ```bash
  git clone https://github.com/zifeng-radxa/siriders1_NPU_example.git
  ```
- 安装依赖
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

## 周易 Z2 AIPU 使用教程

### x86 PC 端安装周易 AIPU SDK

周易 SDK 是一个全栈平台，可为用户提供快速上市的开发和部署能力。
![image](https://user-images.githubusercontent.com/85479712/198521602-49e13a31-bb49-424f-b782-5108274d63c3.png)

- 准备一个 python3.8 的环境

  - （可选）安装 [Anaconda](https://www.anaconda.com/)

    如果系统中没有安装 Python 3.8（必要版本），或者同时有多个版本的 Python 环境，建议使用 [Anaconda](https://www.anaconda.com/) 创建新的 Python 3.8 环境

    - 安装 Anaconda

      在计算机的终端窗口中执行以下命令，检查是否安装 Anaconda，若已安装则可省略此节步骤

      ```bash
      $ conda --version
      conda 23.10.0
      ```

      如出现 conda: command not found, 则表示未安装 anaconda, 请参考 [Anaconda](https://www.anaconda.com/) 官网进行安装

    - 创建 conda 环境
      ```bash
      conda create -n aipu python=3.8
      ```
    - 进入 aipu conda 环境

      ```bash
      conda activate aipu
      ```

    - 退出环境
      ```bash
      conda deactivate
      ```

- 在[瑞莎下载站](https://dl.radxa.com/sirider/s1/)下载周易 Z2 SDK 安装包后解压安装
  ```bash
  tar -xvf Zhouyi_Z2.tar.gz
  cd Zhouyi_Z2 && bash +x SETUP.SH
  ```
- 安装后得到的完整 SDK 文件如下

  - `AI610-SDK-r1p3-AIoT` : ARM ZhouYi Z2 工具包

  - `siengine` : siengine 提供的 ARM ZhouYi Z2 模型编译(nn-compiler-user-case-example)及板子部署(nn-runtime-user-case-example)的 demos

- 配置 nn-compiler 环境

  ```bash
  cd AI610-SDK-r1p3-AIoT/AI610-SDK-r1p3-00eac0/Out-Of-Box/out-of-box-nn-compiler
  pip3 install -r lib_dependency.txt
  ```

  因为此 SDK 不包含模拟功能, 故安装过程会出现安装 AIPUSimProfiler 的报错，可以忽略

  若使用 venv 的用户请在 env_setup.sh 中 pip3 install 部分去掉 --user 选项

  ```bash
  source env_setup.sh
  ```

### x86 PC 端模型转换

nn-compiler 可以将 TensorFlow、ONNX 等框架模型转换成可以在周易 AIPU 进行硬件加速推理的模型文件
:::tip
此案例中将介绍开箱即用案例：resnet50 目标分类

完整 SDK 文档请参 `AI610-SDK-r1p3-AIoT/AI610-SDK-r1p3-00eac0/AI610-DOC-1001-r1p3-eac0`
:::

- 进入 siengine nn-compiler-user-case-example 目录

  如没配置好 nn-compiler 环境， 请按照 [x86 PC 端安装 AIPU SDK](#x86-pc-端安装-aipu-sdk)进行配置

  ```bash
  cd  siengine/nn-compiler-user-case-example/onnx
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

在使用周易 Z2 AIPU 推理前需要在 x86 主机进行交叉编译生成可执行文件 `aiputest`，然后拷贝到 Sirider S1 中执行

#### 在 x86 PC 端交叉编译二进制可执行文件

- 安装 [gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu](https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/) 交叉编译工具链
  ```bash
  tar -xvf gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar
  cp -r gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu /opt
  ```
- 编译 aiputest

  - 修改 UMDSRC 变量

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
