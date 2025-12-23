---
sidebar_position: 0
---

# MeloTTS

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 [**MeloTTS**](https://github.com/myshell-ai/MeloTTS) 示例应用。

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
hf download AXERA-TECH/MeloTTS --local-dir ./MeloTTS
cd MeloTTS
```

</NewCodeBlock>

## 示例使用

### 安装系统依赖

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt-get install libsndfile1-dev libmecab-dev
```

</NewCodeBlock>

### 安装 python 依赖

<NewCodeBlock tip="Host" type="device">

```bash
cd python
pip3 install -r requirements.txt
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc1/axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

### 复制 nltk_data 文件

<NewCodeBlock tip="Host" type="device">

```bash
cp -r ../nltk_data ~/
```

</NewCodeBlock>

### 模型推理

<NewCodeBlock tip="Host" type="device">

```bash
python3 melotts.py -s 瑞莎计算机是一家专注于开发和制造单板计算机的中国科技公司，总部位于深圳。 -e ../encoder-onnx/encoder-zh.onnx -d ../decoder-ax650/decoder-zh.axmodel
```

</NewCodeBlock>

:::tip
请自行修改 melotts.py 中 164 行的 `g-{language.lower()}.bin` 路径
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/MeloTTS/python$ python3 melotts.py -s 瑞莎计算机是一家专注于开发和制造单板计算机的中国科技公司，总部位于深圳。 -e ../encoder-onnx/encoder-zh.onnx -d ../decoder-ax650/decoder-zh.axmodel
[INFO] Available providers:  ['AXCLRTExecutionProvider']
sentence: 瑞莎计算机是一家专注于开发和制造单板计算机的中国科技公司，总部位于深圳。
sample_rate: 44100
encoder: ../encoder-onnx/encoder-zh.onnx
decoder: ../decoder-ax650/decoder-zh.axmodel
language: ZH_MIX_EN
 > Text split to sentences.
瑞莎计算机是一家专注于开发和制造单板计算机的中国科技公司,
总部位于深圳.
 > ===========================
split_sentences_into_pieces take 0.5743503570556641ms
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.3 3251425d
load models take 2446.855306625366ms

Sentence[0]: 瑞莎计算机是一家专注于开发和制造单板计算机的中国科技公司,
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
Load language module take 7701.969146728516ms
Building prefix dict from the default dictionary ...
Loading model from cache /tmp/jieba.cache
Loading model cost 0.809 seconds.
Prefix dict has been built successfully.
encoder run take 113.38ms
Decode slice[0]: decoder run take 94.97ms
Decode slice[1]: decoder run take 92.53ms
Decode slice[2]: decoder run take 92.46ms
Decode slice[3]: decoder run take 92.45ms
Decode slice[4]: decoder run take 92.44ms
Decode slice[5]: decoder run take 92.38ms

Sentence[1]: 总部位于深圳.
Load language module take 0.013828277587890625ms
encoder run take 52.27ms
Decode slice[0]: decoder run take 93.02ms
Decode slice[1]: decoder run take 92.62ms
Save to output.wav
```
