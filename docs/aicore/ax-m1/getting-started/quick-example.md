---
sidebar_position: 4
doc_kind: page
last_verified: 2026-08-19
---

# 快速验证

完成 [环境安装](./env_install) 后，可以用 AXCL 自带的 `axcl_run_model` 跑一个预编译的 YOLOv8s 三核模型，确认瑞莎智核 AX-M1 的 NPU 工作正常。

该流程只下载约 11 MB 的模型文件，不需要创建 Python 虚拟环境，也不需要编译示例程序。

:::tip
查看设备详情请参考 [AXCL-SMI 工具使用](../axcl-smi)。若要进行带后处理的目标检测示例，请先编译 [AXCL-Samples](../axcl-samples)，再参考 [视觉模型](../vision-models/)。
:::

## 确认设备在线

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

能看到设备名称为 `AX650N`，且固件、驱动版本正常即可。温度和内存占用会随负载变化。

:::tip
如果提示找不到 `axcl-smi` 或 `axcl_run_model`，执行 `export PATH=$PATH:/usr/bin/axcl`，或重新打开一个登录终端。
:::

## 下载预编译模型

瑞莎智核 AX-M1 使用 AX650N，对应三核（npu3）模型。从 [AXERA-TECH/YOLOv8](https://huggingface.co/AXERA-TECH/YOLOv8) 下载：

<NewCodeBlock tip="Host" type="device">

```bash
wget -O yolov8s_640x640_npu3.axmodel https://huggingface.co/AXERA-TECH/YOLOv8/resolve/main/AX650/yolov8s_640x640_npu3.axmodel
```

</NewCodeBlock>

## 运行 Benchmark

`axcl_run_model` 会在 Device 上循环推理指定模型，并输出耗时统计。

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

成功时应看到 `type: 3 Core`。`avg` 约为 4 ms，具体数值会随宿主 PCIe 性能和芯片温度变化。

## 下一步

- [AXCL-Samples 编译示例](../axcl-samples)
- [视觉模型](../vision-models/)
- [性能基准测试](../benchmark)
