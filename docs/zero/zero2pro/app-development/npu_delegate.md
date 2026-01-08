---
sidebar_position: 2
---

# NPU 使用

Teflon TFLite delegate 是一款 [Mesa](https://docs.mesa3d.org/teflon.html) 开源用于在 Amlogic A311D SoC 上使用 NPU 进行神经网络硬件加速推理的 Tensorflow Lite 委托加速器

用户若需使用 teflon delegate 进行 NPU 硬件加速神经网络推理，需使用 Radxa OS Debian 13 系统，
请根据 [安装操作系统](../getting-started/install-os) 安装此系统

## 安装 Teflon TFLite delegate

```bash
sudo apt-get install mesa-teflon-delegate
```

## 使用 Teflon TLite delegate

用户可先参考 [TensorFlow Lite delegate](https://www.tensorflow.org/lite/performance/delegates) 文档和 [delegate 使用文档](https://www.tensorflow.org/lite/api_docs/python/tf/lite/experimental/load_delegate?hl=en)了解 delegate 的工作原理和使用方法。

### MobileNet V1 目标识别示例

这里以 MobileNet V1 目标是识别为例子，利用 Teflon delegate 委托 NPU 进行加速推理识别以下图片内容
<img width="300" src="/img/zero/zero2pro/grace_hopper.webp" />

- 获取示例代码与模型文件

```bash
git clone https://github.com/zifeng-radxa/zero2pro_NPU_example.git
cd zero2pro_NPU_example
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz
tar -xvf mobilenet_v1_1.0_224_quant.tgz
```

- 配置环境

```bash
python3 -m venv .venv
source .venv/bin/activate
pip3 install numpy pillow ai_edge_litert
```

- 运行示例代码

  将 -e 换成 libteflon.so 路径

```bash
python3 classification.py -i ./grace_hopper.bmp -m ./mobilenet_v1_1.0_224_quant.tflite =l labels_mobilenet_quant_v1_224.txt -e ./libteflon.so
```

```bash
python3 classification.py -i ./grace_hopper.bmp -m ./mobilenet_v1_1.0_224_quant.tflite -l labels_mobilenet_quant_v1_224.txt -e /usr/lib/teflon/libteflon.so
Loading external delegate from /usr/lib/teflon/libteflon.so with args: {}
INFO: Created TensorFlow Lite XNNPACK delegate for CPU.
0.909804: military uniform
0.019608: Windsor tie
0.007843: bulletproof vest
0.007843: mortarboard
0.003922: cornet
time: 7.320ms
```

- 对比 CPU 推理速度提高 11 倍

```bash
(.venv) root@radxa-zero2:~/zero2pro_npu_example# python3 classification.py -i ./grace_hopper.bmp -m ./mobilenet_v1_1.0_224_quant.tflite -l labels_mobilenet_quant_v1_224.txt
INFO: Created TensorFlow Lite XNNPACK delegate for CPU.
0.901961: military uniform
0.023529: Windsor tie
0.007843: bulletproof vest
0.007843: mortarboard
0.003922: cornet
time: 76.558ms
```
