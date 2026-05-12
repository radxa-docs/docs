---
sidebar_position: 3
description: 介绍 Host 端 NP Converter 工具的安装和使用
---

# Host 模型转换工具

想要将各种格式的模型转换为符合设备端要求的 tflite 格式，需要包含 NeuroPilot Converter 的工具链。

进入 [Mediatek NeuroPilot 网站](https://neuropilot.mediatek.com/)，点击 `Get Started`

![Mediatek NeuroPilot 网站](/img/nio/nio12l/ai_mediatek_neuropilot_website.webp)

找到下方的 `Sign up` 入口

![Mediatek NeuroPilot 网站](/img/nio/nio12l/ai_mediatek_developer_center_signup.webp)

注册帐号，然后回到该界面，点击 `document list`，就可以看到 NeuroPilot 8 Public 的文档了

![NeuroPilot8 Public 工具链](/img/nio/nio12l/ai_mediatek_neuropilot8_public.webp)

进入[下载界面](https://neuropilot-developer.mediatek.com/resources/downloads/cdaa6811-d5ee-4da8-876d-314759dc9799)获取 SDK 压缩包。

推荐使用 python 3.10：

<NewCodeBlock tip="Host PC" type="host">

```bash
cd mtk_converter-8.13.0_packages/
conda create -n np8 python=3.10
conda activate np8
pip install mtk_converter-8.13.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
```

</NewCodeBlock>

验证是否安装成功：

<NewCodeBlock tip="Host PC" type="host">

```bash
python3 -c 'import mtk_converter; print(mtk_converter.__version__)'
```

</NewCodeBlock>
