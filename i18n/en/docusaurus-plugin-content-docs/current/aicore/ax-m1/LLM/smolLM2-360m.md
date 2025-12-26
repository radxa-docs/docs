---
sidebar_position: 5
---

# SmolLM2-360M-Instruct

This document explains how to run the [SmolLM2-360M-Instruct](https://huggingface.co/HuggingFaceTB/SmolLM2-360M-Instruct) sample application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization format: **w8a16**.

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
hf download AXERA-TECH/SmolLM2-360M-Instruct --local-dir ./SmolLM2-360M-Instruct
cd SmolLM2-360M-Instruct
```

</NewCodeBlock>

## Example usage

### Install Python dependencies

<NewCodeBlock tip="Host" type="device">

```bash
pip3 install transformers==4.53.3 jinja2==3.1.6
```

</NewCodeBlock>

### Launch the tokenizer service

<NewCodeBlock tip="Host" type="device">

```bash
python smollm2_tokenizer_uid.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

:::warning
To stop the background tokenizer service, run `jobs` to find the job ID, then use `kill %N`, where `%N` is the corresponding job number.
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/SmolLM2-360M-Instruct$ python3 smollm2_tokenizer.py --port 12345
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
1 <|im_start|> 2 <|im_end|>
<|im_start|>system
You are a helpful AI assistant named SmolLM, trained by Hugging Face<|im_end|>
<|im_start|>user
hello world<|im_end|>
<|im_start|>assistant

[1, 9690, 198, 2683, 359, 253, 5356, 5646, 11173, 3365, 3511, 308, 34519, 28, 7018, 411, 407, 19712, 8182, 2, 198, 1, 4093, 198, 28120, 905, 2, 198, 1, 520, 9531, 198]
http://localhost:12345
```

### Run inference

<NewCodeBlock tip="Host" type="device">

```bash
chmod +x main_axcl_aarch64
mkdir kvcache
bash run_smollm2_360m_axcl_aarch64.sh
```

</NewCodeBlock>

:::warning
Ensure the `tokenizer_model` port configured in `run_xxx.sh` matches the port used in [Launch the tokenizer service](#launch-the-tokenizer-service).
:::

```bash
rock@rock-5b-plus:~/ssd/axera/SmolLM2-360M-Instruct$ bash run_smollm2_360m_axcl_aarch64.sh
build time: Feb 13 2025 15:44:57
[I][                            Init][ 111]: LLM init start
bos_id: 1, eos_id: 2
100% | ████████████████████████████████ |  35 /  35 [7.59s<7.59s, 4.61 count/s] init post axmodel okremain_cmm(-1 MB)
[I][                            Init][ 226]: max_token_len : 1023
[I][                            Init][ 231]: kv_cache_size : 320, kv_cache_num: 1023
[I][                     load_config][ 282]: load config:
{
    "enable_repetition_penalty": false,
    "enable_temperature": true,
    "enable_top_k_sampling": true,
    "enable_top_p_sampling": false,
    "penalty_window": 20,
    "repetition_penalty": 1.2,
    "temperature": 0.9,
    "top_k": 10,
    "top_p": 0.8
}

[I][                            Init][ 288]: LLM init ok
Type "q" to exit, Ctrl+c to stop current running
```

### Performance reference

| Model                 | Quantization | Host device | Tokens/s |
| --------------------- | ------------ | ----------- | -------- |
| SmolLM2-360M-Instruct | w8a16        | ROCK 5B+    | 18.02    |
