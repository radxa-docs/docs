---
sidebar_position: 1
---

# Qwen3-1.7B

This document explains how to run the [Qwen3-1.7B](https://huggingface.co/Qwen/Qwen3-1.7B) sample application on a host device equipped with the Radxa AICore AX-M1.

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
hf download AXERA-TECH/Qwen3-1.7B --local-dir ./Qwen3-1.7B
cd Qwen3-1.7B
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
python3 qwen3_tokenizer_uid.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

:::warning
To stop the background tokenizer service, run `jobs` to find the job ID, then use `kill %N`, where `%N` is the corresponding job number.
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/Qwen3-1.7B$ python3 qwen3_tokenizer_uid.py --port 12345
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
Server running at http://0.0.0.0:12345
```

### Run inference

<NewCodeBlock tip="Host" type="device">

```bash
chmod +x main_axcl_aarch64
mkdir kvcache
bash run_qwen3_1.7b_int8_ctx_axcl_aarch64.sh
```

</NewCodeBlock>

:::warning
Ensure the `tokenizer_model` port configured in `run_xxx.sh` matches the port used in [Launch the tokenizer service](#launch-the-tokenizer-service).
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/Qwen3-1.7B$ bash run_qwen3_1.7b_int8_ctx_axcl_aarch64.sh
[I][                            Init][ 136]: LLM init start
[I][                            Init][  34]: connect http://127.0.0.1:12345 ok
[I][                            Init][  57]: uid: 922e4b39-685a-453d-80c9-2229d1e65db0
bos_id: -1, eos_id: 151645
  3% | ██                                |   1 /  31 [1.15s<35.62s, 0.87 count/s] tokenizer init ok[I][                            Init][  45]: LLaMaEmbedSelector use mmap
  6% | ███                               |   2 /  31 [1.15s<17.81s, 1.74 count/s] embed_selector init ok
[I][                             run][  30]: AXCLWorker start with devid 0
100% | ████████████████████████████████ |  31 /  31 [52.76s<52.76s, 0.59 count/s] init post axmodel ok,remain_cmm(-1 MB)m(4112 MB)
[I][                            Init][ 237]: max_token_len : 2559
[I][                            Init][ 240]: kv_cache_size : 1024, kv_cache_num: 2559
[I][                            Init][ 248]: prefill_token_num : 128
[I][                            Init][ 252]: grp: 1, prefill_max_token_num : 1
[I][                            Init][ 252]: grp: 2, prefill_max_token_num : 512
[I][                            Init][ 252]: grp: 3, prefill_max_token_num : 1024
[I][                            Init][ 252]: grp: 4, prefill_max_token_num : 1536
[I][                            Init][ 252]: grp: 5, prefill_max_token_num : 2048
[I][                            Init][ 256]: prefill_max_token_num : 2048
________________________
|    ID| remain cmm(MB)|
========================
|     0|             -1|
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
[I][                     load_config][ 282]: load config:
{
    "enable_repetition_penalty": false,
    "enable_temperature": false,
    "enable_top_k_sampling": true,
    "enable_top_p_sampling": false,
    "penalty_window": 20,
    "repetition_penalty": 1.2,
    "temperature": 0.9,
    "top_k": 1,
    "top_p": 0.8
}

[I][                            Init][ 279]: LLM init ok
Type "q" to exit, Ctrl+c to stop current running
[I][          GenerateKVCachePrefill][ 335]: input token num : 21, prefill_split_num : 1 prefill_grpid : 2
[I][          GenerateKVCachePrefill][ 372]: input_num_token:21
[I][                            main][ 236]: precompute_len: 21
[I][                            main][ 237]: system_prompt: You are Qwen, created by Alibaba Cloud. You are a helpful assistant.
prompt >>
```

### Performance reference

| Model      | Quantization | Host device | Tokens/s |
| ---------- | ------------ | ----------- | -------- |
| Qwen3-1.7B | w8a16        | ROCK 5B+    | 7.30     |
