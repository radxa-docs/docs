---
sidebar_position: 5
---

# DX-RT 运行时

**DX-RT（运行时软件）** 是用户与 DEEPX NPU 硬件进行交互的运行时，可实现推理过程中的前后处理，管理 NPU 的输入与输出。
DX-RT 支持推理使用 DX-COM 编译后的 dxnn 格式模型。

## 安装方法

请在 DX-M1 SDK [资源下载](../download.md)页面下载 DX-RT 安装包并解压

<NewCodeBlock tip="Host" type="device">

```bash
tar -xvf dx_rt_v2.6.3.tar.gz && cd dx_rt
```

</NewCodeBlock>

### 编译 DX-RT

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --install /usr/local
```

</NewCodeBlock>

### 注册 dxrt-service 服务

<NewCodeBlock tip="Host" type="device">

```bash
sudo cp ./service/dxrt.service /etc/systemd/system
sudo systemctl start dxrt.service
sudo systemctl enable dxrt.service
```

</NewCodeBlock>

### 安装 DX-RT Python 库

<NewCodeBlock tip="Host" type="device">

```bash
cd python_package
pip3 install .
```

</NewCodeBlock>

## 使用方法

### dxrt-cli

`dxrt-cli` 可读取瑞萨 AIcore DX-M1 设备转态
源码位置 `dx_rt/cli/dxrt-cli.cpp`

```bash
dxrt-cli <option> <argument>
```

| 参数                           | 说明                                                                                                        |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------- |
| `-s`, `--status`               | 获取设备状态信息                                                                                            |
| `-i`, `--info`                 | 获取设备的详细信息                                                                                          |
| `-m`, `--monitor <秒数>`       | 每隔指定秒数监控设备状态                                                                                    |
| `-r`, `--reset <参数>`         | 重置设备：<br/> `0` - 仅重置 NPU（默认）<br/> `1` - 重置整个设备                                            |
| `-d`, `--device <设备ID>`      | 指定设备编号执行命令，若不指定，则命令将发送至所有设备（默认：`-1`）                                        |
| `-u`, `--fwupdate <固件文件>`  | 使用 DeepX 固件文件更新固件。支持子选项：<br/> `force` - 强制更新<br/> `unreset` - 不重置设备（默认会重置） |
| `-w`, `--fwupload <固件文件>`  | 上传固件文件（支持 `2and_boot` 或 `rtos` 文件）                                                             |
| `-g`, `--fwversion <固件文件>` | 读取指定 DeepX 固件文件中的固件版本信息                                                                     |
| `-p`, `--dump <文件路径>`      | 导出设备内部状态信息至指定文件                                                                              |
| `-l`, `--fwlog <文件路径>`     | 提取固件日志并保存至指定文件                                                                                |
| `-h`, `--help`                 | 显示帮助信息与命令使用说明                                                                                  |

#### 使用示例

查看瑞莎 AICore DX-M1 设备状态

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

重置瑞莎 AICore DX-M1 NPU

```bash
rock@rock-5b-plus:~$ dxrt-cli --reset 0
DXRT v2.6.3
    Device 0 reset by option 0
Please wait until the device reset is complete.(1 seconds remaining)
[DXRT][Reset] Device reset is complete!
```

每格一秒打印瑞莎 AICore DX-M1 NPU 温度

```bash
rock@rock-5b-plus:~$ dxrt-cli -m 1
DXRT v2.6.3
NPU 0: voltage 750 mV, clock 1000 MHz, temperature 35'C
NPU 1: voltage 750 mV, clock 1000 MHz, temperature 35'C
NPU 2: voltage 750 mV, clock 1000 MHz, temperature 35'C
dvfs Disabled
```

### parse_model

`parse_model` 用于解析 dxnn 模型，打印模型详细信息

源码位置 `dx_rt/cli/parse_model.cpp`

```bash
parse_model -m <dxnn_model_path>
```

| 参数            | 说明                       |
| --------------- | -------------------------- |
| `-m`, `--model` | dxnn 模型路径              |
| `-h`, `--help`  | 显示帮助信息与命令使用说明 |

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

`run_model` 用于推理 dxnn 格式模型，测量模型推理时间和检查模型输出。可用于对 dxnn 模型进行 benchmark。

源码位置 `dx_rt/cli/run_model.cpp`

| 参数            | 说明                                     |
| --------------- | ---------------------------------------- |
| `-c` `--config` | 指定配置文件（JSON 格式）路径。          |
| `-m ` `--model` | 指定模型文件路径。                       |
| `-i` `--input`  | 指定输入数据文件路径。                   |
| `-o` `--output` | 指定输出结果保存文件路径。               |
| `-r` `--ref`    | 指定参考输出数据文件路径，用于比对结果。 |
| `-l` `--loop`   | 启用循环测试模式。                       |
| `-h` `--help`   | 显示帮助信息。                           |

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

## API 参考手册

API 参考手册使用 doxygen 进行构建

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
