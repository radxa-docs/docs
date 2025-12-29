---
sidebar_position: 5
---

# DX-RT Runtime

**DX-RT (runtime software)** is the runtime used to interact with DEEPX NPU hardware. It provides pre/post-processing during inference and manages NPU inputs and outputs.
DX-RT supports running inference with DXNN models compiled by DX-COM.

## Installation

### Clone the DX-ALL-SUITE Repository

:::tip
Clone the specified DX-ALL-SUITE version following [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite).
:::

### Build DX-RT

Enter the `dx-all-suite/dx-runtime/dx_rt` directory.

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt
```

</NewCodeBlock>

#### Create a Python Virtual Environment

This virtual environment is used to install the DXRT Python API. You can create a Python virtual environment in any directory.

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv
source .venv/bin/activate
pip3 install --upgrade pip
```

</NewCodeBlock>

#### Install Required Dependencies

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

#### Build and Install DX-RT

:::tip
The DX-RT installation script will automatically install the dx-engine Python API.
:::

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --install /usr/local
```

</NewCodeBlock>

### Register the dxrt-service

DX-RT supports background multi-threading. To enable this feature, you need to register `dxrt-service`.

<NewCodeBlock tip="Host" type="device">

```bash
sudo cp ./service/dxrt.service /etc/systemd/system
sudo systemctl start dxrt.service
sudo systemctl enable dxrt.service
```

</NewCodeBlock>

### Install the DX-RT Python Package

:::tip
The DX-RT installation script will automatically install the dx-engine Python API.
:::

<NewCodeBlock tip="Host" type="device">

```bash
cd python_package
pip3 install .
```

</NewCodeBlock>

### Uninstall DX-RT

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt
./build.sh --uninstall
```

</NewCodeBlock>

## Usage

### dxrt-cli

`dxrt-cli` reads the Radxa AI Core DX-M1 device status. Source: `dx_rt/cli/dxrt-cli.cpp`.

```bash
dxrt-cli <option> <argument>
```

| Parameter                           | Description                                                                                                                      |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `-s`, `--status`                    | Get device status information.                                                                                                   |
| `-i`, `--info`                      | Get detailed device information.                                                                                                 |
| `-m`, `--monitor <seconds>`         | Monitor device status at the specified interval.                                                                                 |
| `-r`, `--reset <option>`            | Reset device:<br/> `0` - reset NPU only (default)<br/> `1` - reset the whole device                                              |
| `-d`, `--device <device_id>`        | Specify device ID. If omitted, the command will be sent to all devices (default: `-1`).                                          |
| `-u`, `--fwupdate <firmware_file>`  | Update firmware using a DeepX firmware file. Options:<br/> `force` - force update<br/> `unreset` - do not reset (default resets) |
| `-g`, `--fwversion <firmware_file>` | Read firmware version information from a specified DeepX firmware file.                                                          |
| `-C`, `--fwconfig_json <json_file>` | Update firmware configuration from a JSON file.                                                                                  |
| `-v`, `--version`                   | Print the minimum required versions for driver, firmware, and model compiler.                                                    |
| `-h`, `--help`                      | Show help and usage.                                                                                                             |

#### Examples

##### Check Radxa AI Core DX-M1 Device Status

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

##### Reset Radxa AI Core DX-M1 NPU

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

##### Print Radxa AI Core DX-M1 NPU Temperature Every Second

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

##### Update Radxa AI Core DX-M1 Firmware

:::info
If the DX-M1 firmware version is lower than v2.4.0, please upgrade to v2.4.0. Use `dxrt-cli -s` to check the current firmware version.
:::

:::tip
The latest firmware is available in the [dx-fw](https://github.com/DEEPX-AI/dx_fw/tree/v2.4.0) repository. Upgrade carefully.
:::

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_fw
```

</NewCodeBlock>

Check firmware file version information.

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

Update DX-M1 firmware.

<NewCodeBlock tip="Host" type="device">

```bash
dxrt-cli -u m1/latest/mdot2/fw.bin
```

</NewCodeBlock>

### parse_model

`parse_model` parses a DXNN model and prints detailed model information.

Source: `dx_rt/cli/parse_model.cpp`

```bash
parse_model -m <dxnn_model_path>
```

| Parameter             | Description                                      |
| --------------------- | ------------------------------------------------ |
| `-m`, `--model FILE`  | DXNN model path (required)                       |
| `-v`, `--verbose`     | Show detailed task dependencies and memory usage |
| `-o`, `--output FILE` | Save output to a file                            |
| `-j`, `--json`        | Save binary data (graph_info, rmap_info) as JSON |
| `-h`, `--help`        | Show help and usage                              |

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

`run_model` runs inference on DXNN models, measures inference time, and checks model outputs. It can be used to benchmark DXNN models.

Source: `dx_rt/cli/run_model.cpp`

| Parameter                 | Description                                  |
| ------------------------- | -------------------------------------------- |
| `-m`, `--model FILE`      | DXNN model path (required)                   |
| `-b`, `--benchmark`       | Run benchmark                                |
| `-s`, `--single`          | Run a single test                            |
| `-v`, `--verbose`         | Show NPU processing time and latency         |
| `-n`, `--npu arg`         | NPU core (default: 0)                        |
| `-l`, `--loops arg`       | Number of inference loops (default: 30)      |
| `-t`, `--time arg`        | Inference duration (seconds)                 |
| `-w`, `--warmup-runs arg` | Warm-up runs (default: 0)                    |
| `-d`, `--devices arg`     | Specify NPU device(s) (default: all)         |
| `-f`, `--fps arg`         | Target FPS                                   |
| `--use-ort`               | Enable ONNX Runtime to execute CPU subgraphs |
| `-h`, `--help`            | Show help and usage                          |

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

`dxtop` is a device monitoring tool for DeepX devices. It monitors each NPU status in real time, including NPU memory usage, per-core utilization, temperature, voltage, and frequency.

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

## C++/Python Example Code

DXRT C++/Python example code can be found under `dx-all-suite/dx-runtime/dx_rt/examples` in the `cpp` or `python` directories.

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

## C++ API Reference

The C++ API reference can be generated using Doxygen.

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

The generated API docs will be saved under `./html` and `./latex`. Open `./html/index.html` in a browser to view the API docs.

## Build DX-RT Documentation

:::tip
For more details on DX-RT usage and the DX-RT Python API, please build the full documentation and refer to it.
:::

### Install MkDocs

<NewCodeBlock tip="Host" type="device">

```bash
pip install mkdocs mkdocs-material mkdocs-video pymdown-extensions mkdocs-with-pdf markdown-grid-tables
```

</NewCodeBlock>

### Build Documentation

<NewCodeBlock tip="Host" type="device">

```bash
cd docs
mkdocs build
```

</NewCodeBlock>

After the build completes, `DEEPX_DX-APP_UM_v2.1.0.pdf` will be generated in the current directory.

### Start the Documentation Server

You can access the documentation in a web browser.

<NewCodeBlock tip="Host" type="device">

```bash
mkdocs serve
```

</NewCodeBlock>
