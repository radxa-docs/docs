---
sidebar_position: 4
---

# DeepSeek-R1-Qwen-7B

This document explains how to run the [DeepSeek-R1-Distill-Qwen-7B-GPTQ-Int4](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-7B) sample application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization format: **w4a16**.

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
hf download AXERA-TECH/DeepSeek-R1-Distill-Qwen-7B-GPTQ-Int4 --local-dir ./DeepSeek-R1-Distill-Qwen-7B-GPTQ-Int4
cd DeepSeek-R1-Distill-Qwen-7B-GPTQ-Int4
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
python3 deepseek-r1_tokenizer.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

:::warning
To stop the background tokenizer service, run `jobs` to find the job ID, then use `kill %N`, where `%N` is the corresponding job number.
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/DeepSeek-R1-Distill-Qwen-7B-GPTQ-Int4$ python3 deepseek-r1_tokenizer.py
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
151646 <｜begin▁of▁sentence｜> 151643 <｜end▁of▁sentence｜>
<｜begin▁of▁sentence｜>You are DeepSeek-R1, You are a helpful assistant.<｜User｜>hello world<｜Assistant｜><think>

[151646, 151646, 2610, 525, 18183, 39350, 10911, 16, 11, 1446, 525, 264, 10950, 17847, 13, 151644, 14990, 1879, 151645, 151648, 198]
http://localhost:12345
```

### Model inference

<NewCodeBlock tip="Host" type="device">

```bash
chmod +x main_axcl_aarch64
mkdir kvcache
bash run_deepseek-r1_7b_gptq_int4_axcl_aarch64.sh
```

</NewCodeBlock>

:::warning
Please check the port of the tokenizer_model in the run_xxx.sh script is consistent with the [Tokenizer service port](#launch-the-tokenizer-service).
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/DeepSeek-R1-Distill-Qwen-7B-GPTQ-Int4$ bash run_deepseek-r1_7b_gptq_int4_axcl_aarch64.sh
build time: Feb 13 2025 15:44:57
[I][                            Init][ 111]: LLM init start
bos_id: 151646, eos_id: 151643
100% | ████████████████████████████████ |  31 /  31 [66.09s<66.09s, 0.47 count/s] init post axmodel okremain_cmm(-1 MB)
[I][                            Init][ 226]: max_token_len : 1024
[I][                            Init][ 231]: kv_cache_size : 512, kv_cache_num: 1024
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

| Model                                 | Quantization | host device | token/s |
| ------------------------------------- | ------------ | ----------- | ------- |
| DeepSeek-R1-Distill-Qwen-7B-GPTQ-Int4 | w4a16        | ROCK 5B+    | 4.20    |
