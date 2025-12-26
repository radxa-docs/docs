---
sidebar_position: 5
---

# DX-RT 运行时

**DX-RT（运行时软件）** 是用户与 DEEPX NPU 硬件进行交互的运行时，可实现推理过程中的前后处理，管理 NPU 的输入与输出。
DX-RT 支持推理使用 DX-COM 编译后的 dxnn 格式模型。

## 安装方法

### 克隆 DX-ALL-SUITE 仓库

:::tip
请按照 [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) 克隆指定版本的 DX-ALL-SUITE 仓库
:::

### 编译 DX-RT

进入 `dx-all-suite/dx-runtime/dx_rt` 目录

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt
```

</NewCodeBlock>

#### 创建 python 虚拟环境

此虚拟环境用于安装 DXRT Python API, 用户可自行在任意目录下创建 Python 虚拟环境

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv
source .venv/bin/activate
pip3 install --upgrade pip
```

</NewCodeBlock>

#### 安装必要依赖

<NewCodeBlock tip="Host" type="device">

```bash
./install.sh --all
```

</NewCodeBlock>

```bash
Usage: ./install.sh [OPTIONS]
Install necessary components and libraries for the project.

System Requirements:
  • Architecture: x86_64 or aarch64
  • RAM: 8GB or more

Options:
  --help                       Display this help message and exit.
  --arch <ARCH>                Specify the target CPU architecture. Valid options: [x86_64, aarch64].
  --dep                        Install core dependencies such as cmake, gcc, ninja, etc and python3.
  --onnxruntime                (Optional) Install the ONNX Runtime library.
  --all                        Install all dependencies and the ONNX Runtime library.

  --python_version <VERSION>   Specify the Python version to install (e.g., 3.10.4).
                                 * Minimum supported version: .
                                 * If not specified:
                                     - For Ubuntu 20.04+, the OS default Python 3 will be used.
                                     - For Ubuntu 18.04, Python  will be source-built.
  --venv_path <PATH>          Specify the path for the virtual environment.
                                 * If this option is omitted, no virtual environment will be created.
  --help                      Display this help message and exit.
```

#### 编译并安装 DX-RT

:::tip
DX-RT 安装脚本会自动安装 dx-engine Python API
:::

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --install /usr/local
```

</NewCodeBlock>

### 注册 dxrt-service 服务

DX-RT 支持后台多线程操作，启用多线程特性需要注册 dxrt-service

<NewCodeBlock tip="Host" type="device">

```bash
sudo cp ./service/dxrt.service /etc/systemd/system
sudo systemctl start dxrt.service
sudo systemctl enable dxrt.service
```

</NewCodeBlock>

### 安装 DX-RT Python 库

:::tip
DX-RT 安装脚本会自动安装 dx-engine Python API
:::

<NewCodeBlock tip="Host" type="device">

```bash
cd python_package
pip3 install .
```

</NewCodeBlock>

### 卸载 DX-RT

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt
./build.sh --uninstall
```

</NewCodeBlock>

## 使用方法

### dxrt-cli

`dxrt-cli` 可读取瑞萨 AIcore DX-M1 设备状态，源码位置 `dx_rt/cli/dxrt-cli.cpp`

```bash
dxrt-cli <option> <argument>
```

| 参数                                | 说明                                                                                                        |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `-s`, `--status`                    | 获取设备状态信息                                                                                            |
| `-i`, `--info`                      | 获取设备的详细信息                                                                                          |
| `-m`, `--monitor <秒数>`            | 每隔指定秒数监控设备状态                                                                                    |
| `-r`, `--reset <参数>`              | 重置设备：<br/> `0` - 仅重置 NPU（默认）<br/> `1` - 重置整个设备                                            |
| `-d`, `--device <设备ID>`           | 指定设备编号执行命令，若不指定，则命令将发送至所有设备（默认：`-1`）                                        |
| `-u`, `--fwupdate <固件文件>`       | 使用 DeepX 固件文件更新固件。支持子选项：<br/> `force` - 强制更新<br/> `unreset` - 不重置设备（默认会重置） |
| `-g`, `--fwversion <固件文件>`      | 读取指定 DeepX 固件文件中的固件版本信息                                                                     |
| `-C`, `--fwconfig_json <json 文件>` | 从 json 文件更新固件设置                                                                                    |
| `-v`, `--version                    | 打印所需驱动，固件，模型编译器最小版本信息                                                                  |
| `-h`, `--help`                      | 显示帮助信息与命令使用说明                                                                                  |

#### 使用示例

##### 查看瑞莎 AICore DX-M1 设备状态

<NewCodeBlock tip="Host" type="device">

```bash
dxrt-cli -s
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ dxrt-cli -s
DXRT v3.1.0
=======================================================
 * Device 0: M1, Accelerator type
---------------------   Version   ---------------------
 * RT Driver version   : v1.8.0
 * PCIe Driver version : v1.6.0
-------------------------------------------------------
 * FW version          : v2.4.0
--------------------- Device Info ---------------------
 * Memory : LPDDR5 5600 Mbps, 3.92GiB
 * Board  : M.2, Rev 1.0
 * Chip Offset : 0
 * PCIe   : Gen3 X2 [17:00:00]

NPU 0: voltage 750 mV, clock 1000 MHz, temperature 41'C
NPU 1: voltage 750 mV, clock 1000 MHz, temperature 41'C
NPU 2: voltage 750 mV, clock 1000 MHz, temperature 41'C
=======================================================
```

##### 重置瑞莎 AICore DX-M1 NPU

<NewCodeBlock tip="Host" type="device">

```bash
dxrt-cli --reset
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ dxrt-cli --reset
DXRT v3.1.0
    Device 0 reset by option 0
```

##### 每格一秒打印瑞莎 AICore DX-M1 NPU 温度

<NewCodeBlock tip="Host" type="device">

```bash
dxrt-cli -m 1
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ dxrt-cli -m 1
DXRT v3.1.0
====================== Device 0 =======================
NPU 0: voltage 750 mV, clock 1000 MHz, temperature 41'C
NPU 1: voltage 750 mV, clock 1000 MHz, temperature 40'C
NPU 2: voltage 750 mV, clock 1000 MHz, temperature 40'C
=======================================================
```

##### 更新瑞莎 AICore DX-M1 固件

:::info
如 DX-M1 固件低于 v2.4.0， 请升级至 v2.4.0, 请使用 `dxrt-cli -s` 查看当前固件版本
:::

:::tip
最新固件存放在 [dx-fw](https://github.com/DEEPX-AI/dx_fw/tree/v2.4.0) 仓库中，用户谨慎升级
:::

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_fw
```

</NewCodeBlock>

查看固件文件版本信息

<NewCodeBlock tip="Host" type="device">

```bash
dxrt-cli -g m1/latest/mdot2/fw.bin
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/dx-all-suite/dx-runtime/dx_fw$ dxrt-cli -g m1/latest/mdot2/fw.bin
DXRT v3.1.0
fwFile:m1/latest/mdot2/fw.bin
============ FW Binary Information ============
Signature   : DEEPX GENESIS-M
Board Type  : M.2
DDR Type    : LPDDR5
Firmware Ver: 2.4.0
```

更新 DX-M1 固件

<NewCodeBlock tip="Host" type="device">

```bash
dxrt-cli -u m1/latest/mdot2/fw.bin
```

</NewCodeBlock>

### parse_model

`parse_model` 用于解析 dxnn 模型，打印模型详细信息

源码位置 `dx_rt/cli/parse_model.cpp`

```bash
parse_model -m <dxnn_model_path>
```

| 参数                  | 说明                                                  |
| --------------------- | ----------------------------------------------------- |
| `-m`, `--model FILE`  | dxnn 模型路径 (必要)                                  |
| `-v`, `--verbose`     | 显示详细的任务依赖关系和内存使用情况                  |
| `-o`, `--output FILE` | 将输出保存到文件                                      |
| `-j`, `--json`        | 将二进制数据（graph_info、rmap_info）以 JSON 格式保存 |
| `-h`, `--help`        | 显示帮助信息与命令使用说明                            |

<NewCodeBlock tip="Host" type="device">

```bash
parse_model -m ResNet50-1.dxnn
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:/mnt/ssd/deepx/v2.1.0/model_zoo_v2.1.0$ parse_model -m ResNet50-1.dxnn

===================== Model Information ======================
 Model File Path        : ResNet50-1.dxnn
 .dxnn Format Version   : v7
 DX-COM Version         : v2.0.0-rc-20250814

 Model Input Tensors:
  - input.1

 Model Output Tensors:
  - 495

 Model Memory Usage:
  - Total             : 34.79 MB (36,477,760 bytes)
  - Buffers           : 10.11 MB (10,604,544 bytes)
  - NPU Tasks Count   : 1
  - Buffer Pool Size  : x6

================== Task Graph Information ====================

-------------------- Task Dependencies -----------------------

  npu_0 [NPU] (model input) (model output)

---------------------- Task Details --------------------------

Task[0]: npu_0 [NPU] (model input) (model output)
  +- Inputs:
  |  +- input.1
  +- Outputs:
     +- 495
```

### run_model

`run_model` 用于推理 dxnn 格式模型，测量模型推理时间和检查模型输出。可用于对 dxnn 模型进行 **benchmark**。

源码位置 `dx_rt/cli/run_model.cpp`

| 参数                      | 说明                               |
| ------------------------- | ---------------------------------- |
| `-m`, `--model FILE`      | dxnn 模型路径 (必要)               |
| `-b`, `--benchmark`       | 执行 benchmark 测试                |
| `-s`, `--single`          | 执行单次测试                       |
| `-v`, `--verbose`         | 显示NPU处理时间和延迟              |
| `-n`, `--npu arg`         | NPU 核心（默认值：0）              |
| `-l`, `--loops arg`       | 要执行的推理循环次数（默认值：30） |
| `-t`, `--time arg`        | 推理持续时间 (秒)                  |
| `-w`, `--warmup-runs arg` | 预热运行次数（默认值：0）          |
| `-d`, `--devices arg`     | 指定 NPU 设备 （默认值： all）     |
| `-f`, `--fps arg`         | 目标 FPS                           |
| `--use-ort`               | 启用 ONNX 运行时执行 CPU 算子图    |
| `-h`, `--help`            | 显示帮助信息与命令使用说明         |

<NewCodeBlock tip="Host" type="device">

```bash
run_model -m ./ResNet50-1.dxnn -b -l 100 -v
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:/mnt/ssd/deepx/v2.1.0/model_zoo_v2.1.0$ run_model -m ./ResNet50-1.dxnn -b -l 100 -v
Runtime Framework Version: v3.1.0
Device Driver Version: v1.8.0
PCIe Driver Version: v1.6.0

--- CPU Information ---
  Architecture:                         aarch64
  CPU(s):                               8
  Vendor ID:                            ARM
  Model name:                           -

--- Architecture Information ---
  System Name: Linux
  Node Name:   rock-5b-plus
  Release:     6.1.84-7-rk2410
  Version:     #7 SMP Wed Jun 18 13:39:58 UTC 2025
  Machine:     aarch64

--- Memory Information ---
  Total Physical Memory: 7.75 GB
  Available Physical Memory: 6.30 GB
  Total Swap Space: 3.88 GB
  Free Swap Space: 3.88 GB

modelFile: ./ResNet50-1.dxnn
inputFile:
outputFile: output.bin
benchmark: 1
loops: 100
Device specification: 'all' (default)
Run model target mode : Benchmark Mode
Inference by loops: count=100

=== Model File: /mnt/ssd/deepx/v2.1.0/model_zoo_v2.1.0/ResNet50-1.dxnn ===

Model Input Tensors:
  - input.1
Model Output Tensors:
  - 495

Tasks:
  [ ] -> npu_0 -> []
  Task[0] npu_0, NPU, NPU memory usage 36477760 bytes (input 150528 bytes, output 4000 bytes)
  Inputs
     -  input.1, UINT8, [1, 224, 224, 3 ]
  Outputs
    -  495, FLOAT, [1, 1000 ]


=====================================================================================================================================
* Benchmark Result (100 inputs)
  - NPU Processing Time Average : 2.900 ms   (Actual NPU core computation time for a single request)
  - Latency Average             : 6.415 ms   (End-to-end time per request including data transfer and overheads)
  - FPS                         : 915.25     (Overall user-observed inference throughput (inputs/second), reflecting perceived speed)
=====================================================================================================================================
```

### dxtop

`dxtop` 是 deepx 设备状态监控工具。实时监控每个 NPU 状态，包括 NPU 设备内存使用状态，每个 NPU 核心利用率，温度，电压与频率。

<NewCodeBlock tip="Host" type="device">

```bash
dxtop
```

</NewCodeBlock>

```bash
[DX-TOP]  (q) Quit   (n) Next Page   (p) Prev Page   (h) Help
Thu Dec 25 07:24:04 2025
DX-RT: v3.1.0     NPU Device driver: v1.8.0     DX-TOP: v1.0.1
--------------------------------------------------------------------------------------------------------------------------------------------
  Device :0      Variant:    M1      PCIe Bus Number:  17:00:00    Firmware:  v2.4.0
  NPU Memory:  [                    ] 3.56 KiB / 3.92 GiB (0.00%)
    Core :0   Util:   0.0%   Temp: 41 °C   Voltage: 750 mV   Clock: 1000 MHz
    Core :1   Util:   0.0%   Temp: 40 °C   Voltage: 750 mV   Clock: 1000 MHz
    Core :2   Util:   0.0%   Temp: 40 °C   Voltage: 750 mV   Clock: 1000 MHz
--------------------------------------------------------------------------------------------------------------------------------------------
```

## C++/Python 示例代码

DXRT C++/Python 示例代码可以参考 `dx-all-suite/dx-runtime/dx_rt/examples` 下的 cpp 或 python 目录

```bash
.
├── CMakeLists.txt
├── cpp
│   ├── check_versions
│   │   ├── check_versions.cpp
│   │   └── CMakeLists.txt
│   ├── CMakeLists.txt
│   ├── display_async_models_1
│   │   ├── CMakeLists.txt
│   │   └── display_async_models_1.cpp
│   ├── display_async_models_2
│   │   ├── CMakeLists.txt
│   │   └── display_async_models_2.cpp
│   ├── display_async_pipe
│   │   ├── CMakeLists.txt
│   │   ├── concurrent_queue.h
│   │   ├── display_async_pipe.cpp
│   │   └── simple_circular_buffer_pool.h
│   ├── display_async_thread
│   │   ├── CMakeLists.txt
│   │   ├── concurrent_queue.h
│   │   └── display_async_thread.cpp
│   ├── display_async_wait
│   │   ├── CMakeLists.txt
│   │   ├── concurrent_queue.h
│   │   ├── display_async_wait.cpp
│   │   └── simple_circular_buffer_pool.h
│   ├── include
│   │   └── logger.h
│   ├── multi_input_model_inference
│   │   ├── CMakeLists.txt
│   │   ├── multi_input_model_inference.cpp
│   │   └── README_multi_input_model_inferenece.md
│   ├── run_async_model
│   │   ├── CMakeLists.txt
│   │   └── run_async_model.cpp
│   ├── run_async_model_bound
│   │   ├── CMakeLists.txt
│   │   └── run_async_model_bound.cpp
│   ├── run_async_model_conf
│   │   ├── CMakeLists.txt
│   │   └── run_async_model_conf.cpp
│   ├── run_async_model_output
│   │   ├── CMakeLists.txt
│   │   ├── concurrent_queue.h
│   │   ├── run_async_model_output.cpp
│   │   └── simple_circular_buffer_pool.h
│   ├── run_async_model_profiler
│   │   ├── CMakeLists.txt
│   │   └── run_async_model_profiler.cpp
│   ├── run_async_model_thread
│   │   ├── CMakeLists.txt
│   │   ├── concurrent_queue.h
│   │   └── run_async_model_thread.cpp
│   ├── run_async_model_wait
│   │   ├── CMakeLists.txt
│   │   ├── concurrent_queue.h
│   │   └── run_async_model_wait.cpp
│   ├── run_batch_model
│   │   ├── CMakeLists.txt
│   │   └── run_batch_model.cpp
│   ├── run_sync_model
│   │   ├── CMakeLists.txt
│   │   └── run_sync_model.cpp
│   ├── run_sync_model_bound
│   │   ├── CMakeLists.txt
│   │   └── run_sync_model_bound.cpp
│   └── run_sync_model_output
│       ├── CMakeLists.txt
│       ├── run_sync_model_output.cpp
│       └── simple_circular_buffer_pool.h
└── python
    ├── logger.py
    ├── multi_input_model_inference.py
    ├── run_async_model_callback.py
    ├── run_async_model_conf.py
    ├── run_async_model_profiler.py
    ├── run_async_model.py
    ├── run_async_model_thread.py
    ├── run_async_model_wait.py
    ├── run_batch_model.py
    ├── run_sync_model_bound.py
    └── run_sync_model.py
```

## C++ API 参考手册

C++ API 参考手册可使用 doxygen 进行构建

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install doxygen graphviz
```

</NewCodeBlock>

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt/docs/cpp_api
doxygen Doxyfile
```

</NewCodeBlock>

API 手册会保存在 `./html` 和 `./latex` 下，可以使用浏览器打开 `./html/index.html` 查看 API 手册

## DX-RT 文档构建

:::tip
更多关于 DX-RT 的使用方法与 DX-RT Python API，请构建详细文档查阅
:::

### 安装 MkDocs

<NewCodeBlock tip="Host" type="device">

```bash
pip install mkdocs mkdocs-material mkdocs-video pymdown-extensions mkdocs-with-pdf markdown-grid-tables
```

</NewCodeBlock>

### 构建文档

<NewCodeBlock tip="Host" type="device">

```bash
cd docs
mkdocs build
```

</NewCodeBlock>

构建完成后会在当前目录下生成 `DEEPX_DX-APP_UM_v2.1.0.pdf`

### 启动文档服务

可以使用浏览器访问网页文档

<NewCodeBlock tip="Host" type="device">

```bash
mkdocs serve
```

</NewCodeBlock>
