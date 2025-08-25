---
sidebar_position: 2
---

# Real-ESRGAN

This document explains how to run the [Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN) example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a8**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/Real-ESRGAN --local-dir ./Real-ESRGAN
cd Real-ESRGAN
```

</NewCodeBlock>

## Example Usage

### Install Python Dependencies

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc1/axengine-0.1.3-py3-none-any.whl
pip3 install argparse numpy opencv-python
```

</NewCodeBlock>

### Model Inference

<NewCodeBlock tip="Host" type="Device">

```bash
python3 main.py --input test_256.jpeg  --output test_256_20e.jpeg --model ax650/realesrgan-x4-256.axmodel
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/Real-ESRGAN$ python3 main.py --input test_256.jpeg  --output test_256_20e.jpeg --model ax650/realesrgan-x4-256.axmodel
[INFO] Available providers:  ['AXCLRTExecutionProvider']
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.4 3dfd5692
input.1 [1, 256, 256, 3] uint8
1895 [1, 1024, 1024, 3] float32
Original Image Shape: (243, 243, 3)
Preprocessed Image Shape: (1, 256, 256, 3)
Inference Time: 465.12 ms
Output Shape: (1, 1024, 1024, 3)
Final Output Image Shape: (1024, 1024, 3)
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-ax-m1/real-esrgan_original.webp"/>
   real-esrgan demo input
</div>

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-ax-m1/real-esrgan_out.webp"/>
   real-esrgan demo output
</div>
