---
sidebar_position: 5
---

# DX-RT Runtime

**DX-RT (Runtime Software)** is the runtime for users to interact with DEEPX NPU hardware, enabling pre-processing and post-processing during inference, managing NPU input and output.
DX-RT supports inference using dxnn format models compiled by DX-COM.

## Installation

### Clone DX-ALL-SUITE Repository

:::tip
Please follow [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) to clone the specified version of the DX-ALL-SUITE repository
:::

### Compile DX-RT

Navigate to the `dx-all-suite/dx-runtime/dx_rt` directory

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt
```

</NewCodeBlock>

#### Create Python Virtual Environment

This virtual environment is used to install DXRT Python API. Users can create Python virtual environment in any directory

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv
source .venv/bin/activate
pip3 install --upgrade pip
```

</NewCodeBlock>

#### Install onnxruntime

<NewCodeBlock tip="Host" type="device">

```bash
./install.sh --arch aarch64 --onnxruntime
```

</NewCodeBlock>

#### Compile and Install DX-RT

:::tip
DX-RT installation script will automatically install dx-engine Python API
:::

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --install /usr/local
```

</NewCodeBlock>

### Register dxrt-service Service

DX-RT supports background multi-threaded operations. To enable multi-threading features, you need to register dxrt-service

<NewCodeBlock tip="Host" type="device">

```bash
sudo cp ./service/dxrt.service /etc/systemd/system
sudo systemctl start dxrt.service
sudo systemctl enable dxrt.service
```

</NewCodeBlock>

### Install DX-RT Python Library

:::tip
DX-RT installation script will automatically install dx-engine Python API
:::

<NewCodeBlock tip="Host" type="device">

```bash
cd python_package
pip3 install .
```

</NewCodeBlock>

## Usage

### dxrt-cli

`dxrt-cli` can read Radxa AICore DX-M1 device status
Source code location: `dx_rt/cli/dxrt-cli.cpp`

```bash
dxrt-cli <option> <argument>
```

| Parameter                           | Description                                                                                                                                            |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `-s`, `--status`                    | Get device status information                                                                                                                          |
| `-i`, `--info`                      | Get detailed device information                                                                                                                        |
| `-m`, `--monitor <seconds>`         | Monitor device status at specified intervals                                                                                                           |
| `-r`, `--reset <parameter>`         | Reset device:<br/> `0` - Reset NPU only (default)<br/> `1` - Reset entire device                                                                       |
| `-d`, `--device <deviceID>`         | Specify device number to execute command. If not specified, command will be sent to all devices (default: `-1`)                                        |
| `-u`, `--fwupdate <firmware_file>`  | Update firmware using DeepX firmware file. Supports sub-options:<br/> `force` - Force update<br/> `unreset` - Do not reset device (default will reset) |
| `-w`, `--fwupload <firmware_file>`  | Upload firmware file (supports `2and_boot` or `rtos` files)                                                                                            |
| `-g`, `--fwversion <firmware_file>` | Read firmware version information from specified DeepX firmware file                                                                                   |
| `-p`, `--dump <file_path>`          | Export device internal status information to specified file                                                                                            |
| `-l`, `--fwlog <file_path>`         | Extract firmware logs and save to specified file                                                                                                       |
| `-h`, `--help`                      | Display help information and command usage instructions                                                                                                |

#### Usage Examples

Check Radxa AICore DX-M1 device status

```bash
rock@rock-5b-plus:~$ dxrt-cli -s
DXRT v2.9.5
=======================================================
 * Device 0: M1, Accelator type
---------------------   Version   ---------------------
 * RT Driver version   : v1.5.0
 * PCIe Driver version : v1.4.0
-------------------------------------------------------
 * FW version          : v2.1.5
--------------------- Device Info ---------------------
 * Memory : LPDDR5 5600 MHz, 3.92GiB
 * Board  : M.2, Rev 1.5
 * Chip Offset : 0
 * PCIe   : Gen3 X2 [17:00:00]

NPU 0: voltage 750 mV, clock 1000 MHz, temperature 40'C
NPU 1: voltage 750 mV, clock 1000 MHz, temperature 40'C
NPU 2: voltage 750 mV, clock 1000 MHz, temperature 40'C
dvfs Disabled
=======================================================
```

Reset Radxa AICore DX-M1 NPU

```bash
rock@rock-5b-plus:~$ dxrt-cli --reset 0
DXRT v2.6.3
    Device 0 reset by option 0
Please wait until the device reset is complete.(1 seconds remaining)
[DXRT][Reset] Device reset is complete!
```

Print Radxa AICore DX-M1 NPU temperature every second

```bash
rock@rock-5b-plus:~$ dxrt-cli -m 1
DXRT v2.6.3
NPU 0: voltage 750 mV, clock 1000 MHz, temperature 35'C
NPU 1: voltage 750 mV, clock 1000 MHz, temperature 35'C
NPU 2: voltage 750 mV, clock 1000 MHz, temperature 35'C
dvfs Disabled
```

Update Radxa AICore DX-M1 firmware

:::tip
Latest firmware is stored in the [dx-fw](https://github.com/DEEPX-AI/dx_fw/tree/ebb1e45bed2a6a7f431e6665b2b8171a96e45468) repository. Users should upgrade with caution
:::

```bash
dxrt-cli -u fw.bin
```

### parse_model

`parse_model` is used to parse dxnn models and print detailed model information

Source code location: `dx_rt/cli/parse_model.cpp`

```bash
parse_model -m <dxnn_model_path>
```

| Parameter       | Description                                             |
| --------------- | ------------------------------------------------------- |
| `-m`, `--model` | dxnn model path                                         |
| `-h`, `--help`  | Display help information and command usage instructions |

```bash
rock@rock-5b-plus:~$ parse_model -m EfficientNetB0_4.dxnn
modelPath: EfficientNetB0_4.dxnn
DXNN Model Ver. : 6
{"version": 6, "signature": "DXNN", "size": 8192, "encode_type": "utf-8", "bytes_order": "little", "hw_config": null, "data": {"merged_model": {"type": "bytes", "offset": 0, "size": 0}, "npu_models": {"npu_0": {"type": "bytes", "offset": 19751, "size": 5602912}}, "cpu_models": {"cpu_0": {"type": "bytes", "offset": 5623487, "size": 7632}}, "graph_info": {"type": "str", "offset": 5631119, "size": 1036}, "compile_config": {"type": "str", "offset": 5622663, "size": 824}, "compiled_data": {"M1A_4K": {"npu_0": {"rmap": {"type": "bytes", "offset": 5632155, "size": 360960}, "weight": {"type": "bytes", "offset": 5993115, "size": 5683904}, "rmap_info": {"type": "str", "offset": 11677019, "size": 1512}, "bitmatch": {"type": "bytes", "offset": 11678531, "size": 0}, "sim_info": {"type": "bytes", "offset": 11678531, "size": 23}}}}, "vis_npu_models": {"npu_0": {"type": "bytes", "offset": 0, "size": 19751}}, "vis_cpu_models": {}}, "cipher_manager": {"_serializer": {"use_pickle": false}, "_cipher": "DXCipherV2"}}
[  ] -> cpu_0 -> [npu_0,  ]
  inputs
     -> cpu_0
      Im2col_input
  outputs
    cpu_0 -> npu_0
      data
[ cpu_0,  ] -> npu_0 -> [ ]
  inputs
    cpu_0 -> npu_0
      data
  outputs
    npu_0 ->
      argmax_output
  Task[0] npu_0, NPU, 8209728 bytes (input 157696, output 2)
    inputs
      data, UINT8, [1, 224, 224, 3 ], 0
    outputs
      argmax_output, UINT16, [1 ], 0
```

### run_model

`run_model` is used to infer dxnn format models, measure model inference time and check model output. Can be used to benchmark dxnn models.

Source code location: `dx_rt/cli/run_model.cpp`

| Parameter       | Description                                                    |
| --------------- | -------------------------------------------------------------- |
| `-c` `--config` | Specify configuration file (JSON format) path.                 |
| `-m ` `--model` | Specify model file path.                                       |
| `-i` `--input`  | Specify input data file path.                                  |
| `-o` `--output` | Specify output result save file path.                          |
| `-r` `--ref`    | Specify reference output data file path for result comparison. |
| `-l` `--loop`   | Enable loop test mode.                                         |
| `-h` `--help`   | Display help information.                                      |

```bash
run_model -m <model_dir> -i <input bin.> -o <output bin.> -r <reference output bin.> -l <number of loops>
```

```bash
rock@rock-5b-plus:~$ run_model -m ./EfficientNetB0_4.dxnn -l 100
modelFile: ./EfficientNetB0_4.dxnn
inputFile:
outputFile: output.bin
benchmark: 0
loops: 100
DXNN Model Ver. : 6
{"version": 6, "signature": "DXNN", "size": 8192, "encode_type": "utf-8", "bytes_order": "little", "hw_config": null, "data": {"merged_model": {"type": "bytes", "offset": 0, "size": 0}, "npu_models": {"npu_0": {"type": "bytes", "offset": 19751, "size": 5602912}}, "cpu_models": {"cpu_0": {"type": "bytes", "offset": 5623487, "size": 7632}}, "graph_info": {"type": "str", "offset": 5631119, "size": 1036}, "compile_config": {"type": "str", "offset": 5622663, "size": 824}, "compiled_data": {"M1A_4K": {"npu_0": {"rmap": {"type": "bytes", "offset": 5632155, "size": 360960}, "weight": {"type": "bytes", "offset": 5993115, "size": 5683904}, "rmap_info": {"type": "str", "offset": 11677019, "size": 1512}, "bitmatch": {"type": "bytes", "offset": 11678531, "size": 0}, "sim_info": {"type": "bytes", "offset": 11678531, "size": 23}}}}, "vis_npu_models": {"npu_0": {"type": "bytes", "offset": 0, "size": 19751}}, "vis_cpu_models": {}}, "cipher_manager": {"_serializer": {"use_pickle": false}, "_cipher": "DXCipherV2"}}
DXRT v2.6.3
argmax_output
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_app/example/EfficientNetB0_4/EfficientNetB0_4.dxnn
  Task[0] npu_0, NPU, 8209728bytes (input 157696, output 2)
    inputs
      data, UINT8, [1, 224, 224, 3 ], 0
    outputs
      argmax_output, UINT16, [1 ], 0


Run model target mode : Benchmark Mode
===========================
* Benchmark Result(3 Cores)
  - FPS : 1645.738403
===========================
Profiler data has been written to profiler.json
```

### dxtop

`dxtop` is a deepx device status monitoring tool. Real-time monitoring of each NPU status, including NPU device memory usage status, each NPU core utilization, temperature, voltage and frequency.

```bash
[DX-TOP]  (q) Quit   (n) Next Page   (p) Prev Page   (h) Help
Tue Nov 11 09:06:49 2025
RT framework version : v2.9.6 | RT driver version : v1.5.0 | PCIe driver version : v1.4.0
--------------------------------------------------------------------------------------------------------------------------------------------
   Device #0 | M1B, ACC Type | firmware version : v2.1.5 | DRAM Usage:     0.00 MB
     Core #0 - util:   0.0%  temp:  39 C  voltage:  750 mV  clock: 1000 MHz
     Core #1 - util:   0.0%  temp:  39 C  voltage:  750 mV  clock: 1000 MHz
     Core #2 - util:   0.0%  temp:  39 C  voltage:  750 mV  clock: 1000 MHz
--------------------------------------------------------------------------------------------------------------------------------------------
```

## API Reference Manual

API reference manual is built using doxygen

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

## DXRT Detailed Usage Documentation

- [**DEEPX_DX-RT_UM_v2.9.5.pdf**](https://github.com/DEEPX-AI/dx_rt/blob/a9ca6163915676969208b478c1ddded6e852b1fe/docs/DEEPX_DX-RT_UM_v2.9.5.pdf)
