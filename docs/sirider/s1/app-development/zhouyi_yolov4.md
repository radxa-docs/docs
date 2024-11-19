---
sidebar_position: 3
---

# YOLOv4 目标检测

此文档将详细讲解如何在 Sirider S1 利用 NPU 硬件加速推理 [YOLOv4](https://github.com/hunglc007/tensorflow-yolov4-tflite) 模型。

文档分为两部分：
[快速体验](#快速体验)， [详细教程](#详细教程)

## 快速体验

radxa 提供一个开箱即用的 YOLOv4 目标检测例子，旨在用户可以直接在 sirider s1 使用 AIPU 推理 yolov4_tiny 模型，
免去复杂的模型编译和执行代码编译， 这对想快速使用 AIPU 而不想从头编译模型的用户是最佳的选择，
如您对完整工作流程感兴趣可以参考 [详细教程](#详细教程) 章节。

- 克隆仓库代码

  ```bash
  git clone https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo.git
  ```

- 安装依赖
  :::tip
  建议使用 virtualenv
  :::

  ```bash
  cd siriders1_NPU_yolov4_tiny_demo/demo
  pip3 install -r requirements.txt
  ```

- 运行 yolov4 demo 程序

  ```bash
  python3 yolov4_aipu.py -m [mode] -i [your_input_path] -r
  # python3 yolov4_aipu,py -m camera -r
  ```

  参数解析:

        `-h`, `--help`: 打印参数信息

        `-m`, `--mode`: 输入模式选择，支持['camera', 'video', 'image']

        `-i`, `--input`: 输入文件路径, 当 mode 为 ['video', 'image'] 时请提供文件路径

        `-r`, `--real_time`: 实时预览

        `-s`, `--save`: 保存输出，保存在 `output` 文件夹

  ![input.webp](/img/sirider/s1/yolov4_1.webp)

## 详细教程

要使用周易 Z2 部署目标模型，需要分三步走，模型转换，编译推理文件，应用层程序设计

### 模型转换

:::tip
此过程在 x86 主机上完成，进行模型转换前，请根据 [**周易 AIPU SDK 安装教程**](./zhouyi_npu#周易-aipu-sdk-安装教程) 安装 周易SDK 并完成 [**配置 nn-compiler 环境**](./zhouyi_npu#配置-nn-compiler-环境)
:::

- 克隆仓库代码

  ```bash
  git clone https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo.git
  ```

- 生成量化数据
  ```bash
  cd siriders1_NPU_yolov4_tiny_demo/convert
  python3 preprocess.py
  ```
- 生成 aipu 模型
  ```bash
  aipubuild tflite_yolo_v4_tinybuild.cfg
  ```
  生成目标模型路径 ./aipu_yolov4_tiny.bin

### 编译 AIPU 模型可执行推理文件

编译可用于推理 周易Z2 AIPU 模型的可执行文件

- 复制[仓库](https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo)例子中 `compile` 文件夹到 周易 SDK

  将 [siriders1_NPU_yolov4_tiny_demo](https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo) 仓库下的 `compile` 文件夹复制到 `YOUR_SDK_PATH/siengine`, **注意修改 YOUR_SDK_PATH 为您的实际路径**

  ```bash
  cp -r compile YOUR_SDK_PATH/siengine
  ```

- 交叉编译

  :::tip
  请根据您的交叉编译工具链条路径修改 CMakeList.txt 中的 Linux_Tool_ROOT， 默认为 `/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin`

  交叉编译工具链下载地址： [gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu](https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/)
  :::

  ```bash
  cd YOUR_SDK_PATH/siengine/compile
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release .. && make
  cd ..
  ```

  生成的输出文件在 `out` 文件夹中

### 板端测试

将生成的 `aipu_yolov4_tiny.bin` 模型文件和 `out/linux` 下的文件到 sirider s1 上。

利用 [yolov4_aipu.py](https://github.com/zifeng-radxa/siriders1_NPU_yolov4_tiny_demo/blob/main/demo/yolov4_aipu.py) 测试结果

```bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:linux/libs
python3 yolov4_aipu.py -m image -i YOUR_IMAGE_PATH -r
```
