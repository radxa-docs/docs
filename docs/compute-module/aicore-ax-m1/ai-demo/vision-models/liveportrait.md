---
sidebar_position: 1
---

# LivePortrait

此文档讲解如何在安装了瑞莎 AICore AX-M1 的 host 设备上运行 [LivePortrait](https://huggingface.co/KwaiVGI/LivePortrait) 示例应用。

预编译模型量化方式：**w8a16**

## 下载示例应用仓库

使用 `huggingfcae-cli` 下载示例应用仓库。

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/LivePortrait --local-dir ./LivePortrait
cd LivePortrait
```

</NewCodeBlock>

## 示例使用

### 安装系统依赖

<NewCodeBlock tip="Host" type="Device">

```bash
sudo apt install ffmpeg

```

</NewCodeBlock>
### 安装 python 依赖

<NewCodeBlock tip="Host" type="Device">

```bash
pip install -r python/requirements.txt
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc1/axengine-0.1.3-py3-none-any.whl

```

</NewCodeBlock>

### 模型推理

<NewCodeBlock tip="Host" type="Device">

```bash
python3 ./python/infer.py --source ./assets/examples/source/s0.jpg --driving ./assets/examples/driving/d8.jpg --models ./python/axmodels/ --output-dir ./axmodel_infer
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/LivePortrait$ python3 ./python/infer.py --source ./assets/examples/source/s0.jpg --driving ./assets/examples/driving/d8.jpg --models ./python/axmodels/ --output-dir ./axmodel_infer
[INFO] Available providers:  ['AXCLRTExecutionProvider']
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.3 144960ad
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.3 144960ad
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.3 0f7260e8
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.3 144960ad
FaceAnalysisDIY warmup time: 0.391s
[03:10:43] LandmarkRunner warmup time: 0.156s                                                                    human_landmark_runner.py:95
2025-07-24 03:10:43.584 | INFO     | __main__:main:727 - Start making driving motion template...
/mnt/ssd/axera/LivePortrait/python/utils/dependencies/insightface/utils/transform.py:68: FutureWarning: `rcond` parameter will change to the default of machine precision times ``max(M, N)`` where M and N are the input matrix dimensions.
To use the future default and silence this warning we advise to pass `rcond=None`, to keep using the old, explicitly pass `rcond=-1`.
  P = np.linalg.lstsq(X_homo, Y)[0].T # Affine matrix. 3 x 4
2025-07-24 03:10:44.898 | INFO     | __main__:main:747 - Prepared pasteback mask done.
2025-07-24 03:10:46.240 | INFO     | __main__:main:787 - The output of image-driven portrait animation is an image.
2025-07-24 03:10:55.345 | DEBUG    | __main__:warp_decode:647 - warp time: 9.102s
2025-07-24 03:10:55.639 | INFO     | __main__:main:881 - Animated image: ./axmodel_infer/s0--d8.jpg
2025-07-24 03:10:55.639 | INFO     | __main__:main:882 - Animated image with concat: ./axmodel_infer/s0--d8_concat.jpg
2025-07-24 03:10:55.684 | DEBUG    | __main__:<module>:894 - LivePortrait axmodel infer time: 16.407s
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-ax-m1/liveportrait.webp"/>
   liveportrait demo output
</div>
