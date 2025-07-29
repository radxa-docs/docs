---
sidebar_position: 0
---

# Depth-Anything-V2

This document explains how to run the [Depth-Anything-V2](https://depth-anything-v2.github.io/) example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/Depth-Anything-V2 --local-dir ./Depth-Anything-V2
cd Depth-Anything-V2
```

</NewCodeBlock>

## Example Usage

### Install Python Dependencies

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install argparse numpy opencv-python
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc1/axengine-0.1.3-py3-none-any.whl

```

</NewCodeBlock>

### Model Inference

<NewCodeBlock tip="Host" type="Device">

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
   <img src="/en/img/aicore-ax-m1/depth-anything-v2.webp"/>
   depth-anything-v2 demo output
</div>
