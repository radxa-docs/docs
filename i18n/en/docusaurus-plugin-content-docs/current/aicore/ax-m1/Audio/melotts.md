---
sidebar_position: 0
---

# MeloTTS

This document explains how to run the [**MeloTTS**](https://github.com/myshell-ai/MeloTTS) sample application on a host device equipped with the Radxa AICore AX-M1.

## Create a virtual environment

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv && source .venv/bin/activate
```

</NewCodeBlock>

## Download the demo repository

<NewCodeBlock tip="Host" type="device">

```bash
pip3 install -U "huggingface_hub"
hf download AXERA-TECH/MeloTTS --local-dir ./MeloTTS
cd MeloTTS
```

</NewCodeBlock>

## Example usage

### Install system dependencies

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt-get install libsndfile1-dev libmecab-dev
```

</NewCodeBlock>

### Install Python dependencies

<NewCodeBlock tip="Host" type="device">

```bash
cd python
pip3 install -r requirements.txt
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc1/axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

### Copy the `nltk_data` folder

<NewCodeBlock tip="Host" type="device">

```bash
cp -r ../nltk_data ~/
```

</NewCodeBlock>

### Run inference

<NewCodeBlock tip="Host" type="device">

```bash
python3 melotts.py -s "Radxa Computer is a Chinese technology company focused on developing and manufacturing single-board computers, headquartered in Shenzhen." -e ../encoder-onnx/encoder-zh.onnx -d ../decoder-ax650/decoder-zh.axmodel
```

</NewCodeBlock>

:::tip
Update the `g-{language.lower()}.bin` path in line 164 of `melotts.py` to match your environment.
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/MeloTTS/python$ python3 melotts.py -s "Radxa Computer is a Chinese technology company focused on developing and manufacturing single-board computers, headquartered in Shenzhen." -e ../encoder-onnx/encoder-zh.onnx -d ../decoder-ax650/decoder-zh.axmodel
[INFO] Available providers:  ['AXCLRTExecutionProvider']
sentence: Radxa Computer is a Chinese technology company focused on developing and manufacturing single-board computers, headquartered in Shenzhen.
sample_rate: 44100
encoder: ../encoder-onnx/encoder-zh.onnx
decoder: ../decoder-ax650/decoder-zh.axmodel
language: ZH_MIX_EN
 > Text split to sentences.
Radxa Computer is a Chinese technology company focused on developing and manufacturing single-board computers,
Headquartered in Shenzhen.
 > ===========================
split_sentences_into_pieces take 0.5743503570556641ms
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.3 3251425d
load models take 2446.855306625366ms

Sentence[0]: Radxa Computer is a Chinese technology company focused on developing and manufacturing single-board computers,
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

Sentence[1]: Headquartered in Shenzhen.
Load language module take 0.013828277587890625ms
encoder run take 52.27ms
Decode slice[0]: decoder run take 93.02ms
Decode slice[1]: decoder run take 92.62ms
Save to output.wav
```
