---
sidebar_position: 1
---

# Whisper

This document explains how to run the [**Whisper**](https://github.com/openai/whisper) sample application on a host device equipped with the Radxa AICore AX-M1.

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
hf download AXERA-TECH/Whisper --local-dir ./Whisper
cd Whisper
```

</NewCodeBlock>

## Example usage

### Install Python dependencies

<NewCodeBlock tip="Host" type="device">

```bash
cd python
pip3 install -r requirements.txt
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc1/axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

### Run inference

<NewCodeBlock tip="Host" type="device">

```bash
python3 whisper.py --wav ../demo.wav --model_type small --model_path ../models-ax650/small/ -l zh
```

</NewCodeBlock>

:::tip
Update the `g-{language.lower()}.bin` path in line 164 of `melotts.py` to match your environment.
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/Whisper/python$ python3 whisper.py --wav ../demo.wav --model_type small --model_path ../models-ax650/small/ -l zh
[INFO] Available providers:  ['AXCLRTExecutionProvider']
wav: ../demo.wav
model_type: small
model_path: ../models-ax650/small/
language: zh
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.2-patch1 117f5fd4
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.2-patch1 117f5fd4
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 3.2-patch1 117f5fd4
Load models take 10340.124607086182ms
Preprocess wav take 52.04367637634277ms
Run encoder take 382.8761577606201ms
Run decoder_main take 260.6687545776367ms
First token: 17556
Run decoder_loop take 320.3253746032715ms
Iter 0 	 Token: 20844
Run decoder_loop take 378.09014320373535ms
Iter 1 	 Token: 7781
Run decoder_loop take 320.0690746307373ms
Iter 2 	 Token: 20204
Run decoder_loop take 307.8148365020752ms
Iter 3 	 Token: 28455
Run decoder_loop take 319.16141510009766ms
Iter 4 	 Token: 31962
Run decoder_loop take 307.8572750091553ms
Iter 5 	 Token: 6336
Run decoder_loop take 318.7582492828369ms
Iter 6 	 Token: 254
Run decoder_loop take 307.97505378723145ms
Iter 7 	 Token: 2930
Run decoder_loop take 318.79711151123047ms
Iter 8 	 Token: 236
Run decoder_loop take 307.94668197631836ms
Iter 9 	 Token: 36135
Run decoder_loop take 317.66581535339355ms
Iter 10 	 Token: 15868
Run decoder_loop take 308.0439567565918ms
Iter 11 	 Token: 252
Run decoder_loop take 317.3696994781494ms
Iter 12 	 Token: 1546
Run decoder_loop take 308.08019638061523ms
Iter 13 	 Token: 46514
Run decoder_loop take 317.45195388793945ms
Iter 14 	 Token: 50257
Result: There have even been situations where trading has almost come to a standstill
```
