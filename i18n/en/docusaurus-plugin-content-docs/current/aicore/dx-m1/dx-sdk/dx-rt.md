---
sidebar_position: 5
---

# DX-RT Runtime

**DX-RT (Runtime Software)** is the runtime that enables interaction between users and DEEPX NPU hardware, facilitating pre-processing and post-processing during inference, as well as managing NPU input and output.
DX-RT supports inference with dxnn format models compiled by DX-COM.

## Installation Method

Please download the DX-RT installation package from the DX-M1 SDK [Resource Download](../download.md) page and extract it:

<NewCodeBlock tip="Host" type="device">

```bash
tar -xvf dx_rt_v2.6.3.tar.gz && cd dx_rt
```

</NewCodeBlock>

### Compile DX-RT

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --install /usr/local
```

</NewCodeBlock>

### Register dxrt-service

<NewCodeBlock tip="Host" type="device">

```bash
sudo cp ./service/dxrt.service /etc/systemd/system
sudo systemctl start dxrt.service
sudo systemctl enable dxrt.service
```

</NewCodeBlock>

### Install DX-RT Python Library

<NewCodeBlock tip="Host" type="device">

```bash
cd python_package
pip3 install .
```

</NewCodeBlock>

## Usage

### dxrt-cli

`dxrt-cli` can read the status of Radxa AICore DX-M1 devices.
Source code location: `dx_rt/cli/dxrt-cli.cpp`

```bash
dxrt-cli <option> <argument>
```

| Parameter                      | Description                                                                                                                                        |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-s`, `--status`               | Get device status information                                                                                                                      |
| `-i`, `--info`                 | Get detailed device information                                                                                                                    |
| `-m`, `--monitor <seconds>`    | Monitor device status at specified intervals                                                                                                       |
| `-r`, `--reset <parameter>`    | Reset device:<br/> `0` - Reset NPU only (default)<br/> `1` - Reset entire device                                                                   |
| `-d`, `--device <device ID>`   | Execute command on specified device. If not specified, command is sent to all devices (default: `-1`)                                              |
| `-u`, `--fwupdate <firmware>`  | Update firmware using DeepX firmware file. Supports sub-options:<br/> `force` - Force update<br/> `unreset` - Don't reset device (default: resets) |
| `-w`, `--fwupload <firmware>`  | Upload firmware file (supports `2and_boot` or `rtos` files)                                                                                        |
| `-g`, `--fwversion <firmware>` | Read firmware version information from specified DeepX firmware file                                                                               |
| `-p`, `--dump <file path>`     | Export internal device status information to specified file                                                                                        |
| `-l`, `--fwlog <file path>`    | Extract firmware logs and save to specified file                                                                                                   |
| `-h`, `--help`                 | Display help information and command usage                                                                                                         |

#### Usage Examples

Check Radxa AICore DX-M1 device status:

```bash
rock@rock-5b-plus:~$ dxrt-cli --status
DXRT v2.6.3
=======================================================
 * Device 0: M1, Accelator type
---------------------   Version   ---------------------
 * RT Driver version   : v1.3.1
 * PCIe Driver version : v1.2.0
-------------------------------------------------------
 * FW version          : v1.6.0
--------------------- Device Info ---------------------
 * Memory : LPDDR5 5800 MHz, 3.92GiB
 * Board  : M.2, Rev 10.0
 * PCIe   : Gen3 X2 [01:00:00]

NPU 0: voltage 750 mV, clock 1000 MHz, temperature 35'C
NPU 1: voltage 750 mV, clock 1000 MHz, temperature 35'C
NPU 2: voltage 750 mV, clock 1000 MHz, temperature 35'C
dvfs Disabled
=======================================================
```

Reset Radxa AICore DX-M1 NPU:

```bash
rock@rock-5b-plus:~$ dxrt-cli --reset 0
DXRT v2.6.3
    Device 0 reset by option 0
Please wait until the device reset is complete.(1 seconds remaining)
[DXRT][Reset] Device reset is complete!
```

Print Radxa AICore DX-M1 NPU temperature every second:

```bash
rock@rock-5b-plus:~$ dxrt-cli -m 1
DXRT v2.6.3
NPU 0: voltage 750 mV, clock 1000 MHz, temperature 35'C
NPU 1: voltage 750 mV, clock 1000 MHz, temperature 35'C
NPU 2: voltage 750 mV, clock 1000 MHz, temperature 35'C
dvfs Disabled
```

### parse_model

`parse_model` is used to parse dxnn models and print detailed model information.

Source code location: `dx_rt/cli/parse_model.cpp`

```bash
parse_model -m <dxnn_model_path>
```

| Parameter       | Description           |
| --------------- | --------------------- |
| `-m`, `--model` | Path to dxnn model    |
| `-h`, `--help`  | Show help information |

```bash
rock@rock-5b-plus:~$ parse_model -m EfficientNetB0_4.dxnn
modelPath: EfficientNetB0_4.dxnn
DXNN Model Ver. : 6
{"version": 6, "signature": "DXNN", "size": 8192, "encode_type": "utf-8", "bytes_order": "little", "hw_config": null, "data": {"merged_model": {"type": "bytes", "offset": 0, "size": 0}, "npu_models": {"npu_0": {"type": "bytes", "offset": 19751, "size": 5602912}}, "cpu_models": {"cpu_0": {"type": "bytes", "offset": 5623487, "size": 7632}}, "graph_info": {"type": "str", "offset": 5631119, "size": 1036}, "compile_config": {"type": "str", "offset": 5622663, "size": 824}, "compiled_data": {"M1A_4K": {"npu_0": {"rmap": {"type": "bytes", "offset": 5632155, "size": 360960}, "weight": {"type": "bytes", "offset": 5993115, "size": 5683904}, "rmap_info": {"type": "str", "offset": 11677019, "size": 1512}, "bitmatch": {"type": "bytes", "offset": 11678531, "size": 0}, "sim_info": {"type": "bytes", "offset": 11678531, "size": 23}}}}}, "vis_npu_models": {"npu_0": {"type": "bytes", "offset": 0, "size": 19751}}, "vis_cpu_models": {}}, "cipher_manager": {"_serializer": {"use_pickle": false}, "_cipher": "DXCipherV2"}}
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

`run_model` is used to perform inference on dxnn format models, measure inference time, and check model output. Can be used for benchmarking dxnn models.

Source code location: `dx_rt/cli/run_model.cpp`

| Parameter        | Description                                               |
| ---------------- | --------------------------------------------------------- |
| `-c`, `--config` | Path to configuration file (JSON format).                 |
| `-m`, `--model`  | Path to model file.                                       |
| `-i`, `--input`  | Path to input data file.                                  |
| `-o`, `--output` | Path to save output results.                              |
| `-r`, `--ref`    | Path to reference output data file for result comparison. |
| `-l`, `--loop`   | Enable loop testing mode.                                 |
| `-h`, `--help`   | Show help information.                                    |

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

## API Reference Manual

The API reference manual is built using Doxygen.

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install doxygen graphviz
```

</NewCodeBlock>

<NewCodeBlock tip="Host" type="device">

```bash
cd docs/cpp_api
doxygen Doxyfile
```

</NewCodeBlock>
