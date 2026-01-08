---
sidebar_position: 2
---

# NPU Usage

Teflon TFLite delegate is an [Mesa](https://docs.mesa3d.org/teflon.html) open-source Tensorflow Lite delegate used for hardware-accelerated inference on the Amlogic A311D SoC NPU.

To utilize the teflon delegate for NPU hardware-accelerated neural network inference, users need to use the Radxa OS Debian 13 system. Please follow the [install OS](../getting-started/install-os) guide to install this system.

## Install Teflon TFLite delegate

### Download precompiled delegate file

```bash
sudo apt-get install mesa-teflon-delegate
```

## Using Teflon TFLite delegate

Users can refer to the [TensorFlow Lite delegate](https://www.tensorflow.org/lite/performance/delegates) documentation and [delegate usage documentation](https://www.tensorflow.org/lite/api_docs/python/tf/lite/experimental/load_delegate?hl=en) to understand the principles and usage of delegates.

### MobileNet V1 Object Recognition Example

Here is an example of using Teflon delegate to use NPU inference MobileNet V1 object recognition model to recognite the contents of the following image.
<img width="300" src="../../../img/zero/zero2pro/grace_hopper.webp" />

- Get example code and model files

```bash
git clone https://github.com/zifeng-radxa/zero2pro_NPU_example.git
cd zero2pro_NPU_example
wget http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz
tar -xvf mobilenet_v1_1.0_224_quant.tgz
```

- Set up environment

```bash
python3 -m venv .venv
source .venv/bin/activate
pip3 install numpy pillow ai_edge_litert
```

- Run example code

  Replace -e with the path to libteflon.so

```bash
python3 classification.py -i ./grace_hopper.bmp -m ./mobilenet_v1_1.0_224_quant.tflite -l labels_mobilenet_quant_v1_224.txt -e ./libteflon.so
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

- Compare the inference speed of the CPU to the NPU, NPU improves by 11 times

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
