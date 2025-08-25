---
sidebar_position: 1
---

# Whisper

This document explains how to run the [Whisper](https://github.com/openai/whisper) example application on a host device equipped with the Radxa AICore AX-M1.

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/Whisper --local-dir ./Whisper
cd Whisper
```

</NewCodeBlock>

## Example Usage

### Install Python Dependencies

<NewCodeBlock tip="Host" type="Device">

```bash
cd python
pip3 install -r requirements.txt
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc1/axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

### Model Inference

<NewCodeBlock tip="Host" type="Device">

```bash
python3 whisper.py --wav ../demo.wav --model_type small --model_path ../models-ax650/small/ -l zh
```

</NewCodeBlock>

:::tip
Please modify the melotts.py file's 164th line of `g-{language.lower()}.bin` path
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/Whisper/python$ python3 whisper.py --wav ../demo.wav --model_type small --model_path ../models-ax650/small/ -l zh
[INFO] Available providers:  ['AXCLRTExecutionProvider']
wav: ../demo.wav
model_type: small
model_path: ../models-ax650/small/
language: en
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
Result: hello
```
