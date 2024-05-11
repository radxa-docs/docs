---
sidebar_position: 2
---

# NPU 使用

Teflon TFLite delegate 是一款 [Mesa](https://docs.mesa3d.org/teflon.html) 开源用于在 Amlogic A311D SoC 上使用 NPU 进行神经网络硬件加速推理的 Tensorflow Lite 委托加速器

用户若需使用 teflon delegate 进行 NPU 硬件加速神经网络推理，需使用 radxa 提供的 [Armbian 6.8.7_xfce](https://dl.radxa.com/zero2pro/images/armbian/Armbian-unofficial_24.5.0-trunk_Radxa-zero2_bookworm_edge_6.8.7_xfce_desktop.img.gz) 系统，
请根据 [安装操作系统](../getting-started/install-os) 安装此系统

## 安装 Teflon TFLite delegate

### 下载预编译好的 delegate 文件

Teflon TFLite delegate 已经预编译好，用户可以直接下载使用

```bash
wget https://github.com/zifeng-radxa/zero2pro_NPU_example/releases/download/v1.0/libteflon.so
```

### 手动编译（可选）

- 克隆仓库

```bash
git clone https://gitlab.freedesktop.org/tomeu/mesa.git -b teflon-staging --single-branch --depth=1
cd mesa
```

- 准备编译环境

```bash
sudo apt install -y python3-pip python3.11-venv libdrm-dev libwayland-dev libwayland-egl-backend-dev libx11-dev libxext libxfixes-dev libxcb-glx0-dev libxcb-shm0-dev libx11-xcb-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxshmfence-dev libxxf86vm-dev libxrandr-dev
python3 -m venv .venv
source .venv/bin/activate
pip3 install meson ninja mako pycparser
```

- 编译 Teflon

```bash
meson setup build -Dgallium-drivers=etnaviv -Dvulkan-drivers= -Dteflon=true
meson compile -C build
```

- 编译成功的 libteflon.so 路径

```bash
mesa/build/src/gallium/targets/teflon/libteflon.so
```

## 使用 Teflon TLite delegate

用户可先参考 [TensorFlow Lite delegate](https://www.tensorflow.org/lite/performance/delegates) 文档和 [delegate 使用文档](https://www.tensorflow.org/lite/api_docs/python/tf/lite/experimental/load_delegate?hl=en)了解 delegate 的工作原理和使用方法，
使用 NPU 加速需以 root 用户登陆运行推理脚本

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
pip3 install numpy pillow tflite-runtime
```

- 运行示例代码

  将 -e 换成 libteflon.so 路径

```bash
python3 classification.py -i ./grace_hopper.bmp -m ./mobilenet_v1_1.0_224_quant.tflite =l labels_mobilenet_quant_v1_224.txt -e ./libteflon.so
```

```bash
(.venv) root@radxa-zero2:~/zero2pro_npu_example# python3 classification.py -i ./grace_hopper.bmp -m ./mobilenet_v1_1.0_224_quant.tflite -l labels_mobilenet_quant_v1_224.txt -e ./libteflon.so
Loading external delegate from ./libteflon.so with args: {}
0.909804: military uniform
0.019608: Windsor tie
0.007843: bulletproof vest
0.007843: mortarboard
0.003922: cornet
time: 6.256ms
```

- 对比 CPU 推理速度提高 16 倍

```bash
(.venv) root@radxa-zero2:~/zero2pro_npu_example# python3 classification.py -i ./grace_hopper.bmp -m ./mobilenet_v1_1.0_224_quant.tflite -l labels_mobilenet_quant_v1_224.txt
0.917647: military uniform
0.015686: Windsor tie
0.007843: mortarboard
0.007843: bulletproof vest
0.003922: bow tie
time: 101.621ms
```
