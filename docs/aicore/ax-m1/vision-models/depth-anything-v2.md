---
sidebar_position: 0
---

# Depth-Anything-V2

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 [**Depth-Anything-V2**](https://depth-anything-v2.github.io/) 示例应用。

预编译模型量化方式：**w8a16**。

## 创建虚拟环境

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv && source .venv/bin/activate
```

</NewCodeBlock>

## 下载示例应用仓库

<NewCodeBlock tip="Host" type="device">

```bash
pip3 install -U "huggingface_hub"
hf download AXERA-TECH/Depth-Anything-V2 --local-dir ./Depth-Anything-V2
cd Depth-Anything-V2
```

</NewCodeBlock>

## 示例使用

### 安装 python 依赖

<NewCodeBlock tip="Host" type="device">

```bash
pip3 install argparse numpy opencv-python
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc1/axengine-0.1.3-py3-none-any.whl

```

</NewCodeBlock>

### 模型推理

<NewCodeBlock tip="Host" type="device">

```bash
python3 python/infer.py --model depth_anything_v2_vits_ax650.axmodel --img examples/demo01.jpg
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/Depth-Anything-V2$ python3 python/infer.py --model depth_anything_v2_vits_ax650.axmodel --img examples/demo01.jpg
[INFO] Available providers:  ['AXCLRTExecutionProvider']
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-ax-m1/depth-anything-v2.webp"/>
   depth-anything-v2 demo output
</div>
