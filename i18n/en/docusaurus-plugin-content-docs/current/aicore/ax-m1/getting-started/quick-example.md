---
sidebar_position: 4
doc_kind: page
last_verified: 2026-08-19
---

# Quick validation

After completing [environment setup](./env_install), use the AXCL `axcl_run_model` tool with a precompiled YOLOv8s triple-core model to confirm that the Radxa AICore AX-M1 NPU is working.

This flow downloads only about 11 MB of model data. You do not need a Python virtual environment, and you do not need to compile sample programs.

:::tip
For detailed device information, see [AXCL-SMI tool usage](../axcl-smi). For object-detection samples with post-processing, compile [AXCL-Samples](../axcl-samples) first, then see [Vision models](../vision-models/).
:::

## Confirm the device is online

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi
```

</NewCodeBlock>

```text
+------------------------------------------------------------------------------------------------+
| AXCL-SMI  V3.6.5_20250908154509                                  Driver  V3.6.5_20250908154509 |
+-----------------------------------------+--------------+---------------------------------------+
| Card  Name                     Firmware | Bus-Id       |                          Memory-Usage |
| Fan   Temp                Pwr:Usage/Cap | CPU      NPU |                             CMM-Usage |
|=========================================+==============+=======================================|
|    0  AX650N                     V3.6.5 | 0001:11:00.0 |                149 MiB /      945 MiB |
|   --   79C                      -- / -- | 1%        0% |                 18 MiB /     7040 MiB |
+-----------------------------------------+--------------+---------------------------------------+

+------------------------------------------------------------------------------------------------+
| Processes:                                                                                     |
| Card      PID  Process Name                                                   NPU Memory Usage |
|================================================================================================|
```

The device name should be `AX650N`, and the firmware and driver versions should be present. Temperature and memory usage vary with load.

:::tip
If `axcl-smi` or `axcl_run_model` is not found, run `export PATH=$PATH:/usr/bin/axcl`, or open a new login terminal.
:::

## Download a precompiled model

The Radxa AICore AX-M1 uses AX650N, so download the triple-core (`npu3`) model from [AXERA-TECH/YOLOv8](https://huggingface.co/AXERA-TECH/YOLOv8):

<NewCodeBlock tip="Host" type="device">

```bash
wget -O yolov8s_640x640_npu3.axmodel https://huggingface.co/AXERA-TECH/YOLOv8/resolve/main/AX650/yolov8s_640x640_npu3.axmodel
```

</NewCodeBlock>

## Run the benchmark

`axcl_run_model` runs the specified model on the device repeatedly and prints latency statistics.

<NewCodeBlock tip="Host" type="device">

```bash
axcl_run_model --model yolov8s_640x640_npu3.axmodel -r 100
```

</NewCodeBlock>

```text
   Run AxModel:
         model: yolov8s_640x640_npu3.axmodel
          type: 3 Core
          vnpu: Disable
        warmup: 1
        repeat: 100
         batch: { auto: 1 }
    axclrt ver: 1.0.0
   pulsar2 ver: 6.0-dirty a498e20d-dirty
      tool ver: 0.0.1
      cmm size: 11857538 Bytes
  ---------------------------------------------------------------------------
  min =   3.815 ms   max =   4.759 ms   avg =   4.406 ms  median =   4.449 ms
   5% =   4.048 ms   90% =   4.648 ms   95% =   4.672 ms     99% =   4.759 ms
  ---------------------------------------------------------------------------
```

A successful run shows `type: 3 Core`. The `avg` time is about 4 ms; the exact value varies with host PCIe performance and SoC temperature.

## Next steps

- [AXCL-Samples build examples](../axcl-samples)
- [Vision models](../vision-models/)
- [Performance benchmark](../benchmark)
