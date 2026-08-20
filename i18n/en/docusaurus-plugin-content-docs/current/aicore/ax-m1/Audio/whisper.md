---
sidebar_position: 1
doc_kind: page
last_verified: 2026-08-19
---

# Whisper

This document explains how to run the [**Whisper**](https://github.com/openai/whisper) sample application on a host device equipped with the Radxa AICore AX-M1.

Python inference depends on [PyAXEngine](https://github.com/AXERA-TECH/pyaxengine).

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
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc3/axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

### Select the AXCL provider

The upstream script defaults to the board-side `AxEngineExecutionProvider`. The Radxa AICore AX-M1 is an M.2 accelerator card, so change it to `AXCLRTExecutionProvider`.

<NewCodeBlock tip="Host" type="device">

```bash
sed -i 's/AxEngineExecutionProvider/AXCLRTExecutionProvider/g' whisper_ax.py
```

</NewCodeBlock>

### Run inference

`whisper_cli.py` appends `--model_type` to `--model_path`, so `--model_path` must be `models-ax650`, not `models-ax650/small`.

<NewCodeBlock tip="Host" type="device">

```bash
python3 whisper_cli.py --wav ../demo.wav --model_type small --model_path ../models-ax650 -l en
```

</NewCodeBlock>

```text
[INFO] Available providers:  ['AXCLRTExecutionProvider']
{'wav': '../demo.wav', 'model_type': 'small', 'model_path': '../models-ax650', 'language': 'en', 'task': 'transcribe'}
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 5.0 76f70fdc
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 5.0 76f70fdc
ASR result:
Even the transaction was almost stopped.
RTF: 1.0198882348406686
```
