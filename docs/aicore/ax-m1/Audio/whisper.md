---
sidebar_position: 1
doc_kind: page
last_verified: 2026-08-19
---

# Whisper

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 [**Whisper**](https://github.com/openai/whisper) 示例应用。

Python 推理依赖 [PyAXEngine](https://github.com/AXERA-TECH/pyaxengine)。

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
hf download AXERA-TECH/Whisper --local-dir ./Whisper
cd Whisper
```

</NewCodeBlock>

## 示例使用

### 安装 Python 依赖

<NewCodeBlock tip="Host" type="device">

```bash
cd python
pip3 install -r requirements.txt
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc3/axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

### 指定 AXCL 提供方

仓库脚本默认使用开发板的 `AxEngineExecutionProvider`。瑞莎智核 AX-M1 是 M.2 算力卡，需要改成 `AXCLRTExecutionProvider`。

<NewCodeBlock tip="Host" type="device">

```bash
sed -i 's/AxEngineExecutionProvider/AXCLRTExecutionProvider/g' whisper_ax.py
```

</NewCodeBlock>

### 模型推理

`whisper_cli.py` 会把 `--model_type` 拼到 `--model_path` 后面，因此 `--model_path` 应指向 `models-ax650`，而不是 `models-ax650/small`。

<NewCodeBlock tip="Host" type="device">

```bash
python3 whisper_cli.py --wav ../demo.wav --model_type small --model_path ../models-ax650 -l zh
```

</NewCodeBlock>

```text
[INFO] Available providers:  ['AXCLRTExecutionProvider']
{'wav': '../demo.wav', 'model_type': 'small', 'model_path': '../models-ax650', 'language': 'zh', 'task': 'transcribe'}
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 5.0 76f70fdc
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 5.0 76f70fdc
ASR result:
甚至出现交易几乎停滞的情况
RTF: 1.6212542777329928
```
