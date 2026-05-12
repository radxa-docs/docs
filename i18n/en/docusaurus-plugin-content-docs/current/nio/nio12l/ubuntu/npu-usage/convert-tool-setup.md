---
sidebar_position: 3
description: Introduces the installation and usage of the Host-side NP Converter tool
---

# Host Model Conversion Tool

To convert models in various formats to the tflite format required by the device, you need a toolchain that includes the NeuroPilot Converter.

Go to the [MediaTek NeuroPilot website](https://neuropilot.mediatek.com/) and click `Get Started`

![MediaTek NeuroPilot Website](/img/nio/nio12l/ai_mediatek_neuropilot_website.webp)

Find the `Sign up` entry below

![MediaTek NeuroPilot Website](/img/nio/nio12l/ai_mediatek_developer_center_signup.webp)

Register an account, then return to this page and click `document list` to see the NeuroPilot 8 Public documentation

![NeuroPilot8 Public Toolchain](/img/nio/nio12l/ai_mediatek_neuropilot8_public.webp)

Go to the [download page](https://neuropilot-developer.mediatek.com/resources/downloads/cdaa6811-d5ee-4da8-876d-314759dc9799) to get the SDK compressed package.

Python 3.7 is recommended:

<NewCodeBlock tip="Host PC" type="host">

```bash
cd mtk_converter-8.13.0_packages/
conda create -n np8 python=3.10
conda activate np8
pip install mtk_converter-8.13.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
```

</NewCodeBlock>

Verify the installation:

<NewCodeBlock tip="Host PC" type="host">

```bash
python3 -c 'import mtk_converter; print(mtk_converter.__version__)'
```

</NewCodeBlock>
