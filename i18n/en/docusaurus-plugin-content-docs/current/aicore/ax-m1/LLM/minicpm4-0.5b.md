---
sidebar_position: 2
---

# MiniCPM4-0.5B

This document explains how to run the [MiniCPM4-0.5B](https://huggingface.co/openbmb/MiniCPM4-0.5B) sample application on a host device equipped with the Radxa AICore AX-M1.

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
hf download AXERA-TECH/MiniCPM4-0.5B --local-dir ./MiniCPM4-0.5B
cd MiniCPM4-0.5B
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
python3 minicpm4_tokenizer_uid.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

:::warning
To stop the background tokenizer service, run `jobs` to find the job ID, then use `kill %N`, where `%N` is the corresponding job number.
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/MiniCPM4-0.5B$ python3 minicpm4_tokenizer_uid.py --port 12345
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
Server running at http://0.0.0.0:12345
```

### Run inference

<NewCodeBlock tip="Host" type="device">

```bash
chmod +x main_axcl_aarch64
mkdir kvcache
./main_axcl_aarch64 --system_prompt "You are MiniCPM4, created by ModelBest. You are a helpful assistant." --kvcache_path "./kvcache" --template_filename_axmodel "minicpm4-0.5b-int8-ctx-ax650/MiniCPMForCausalLM_p128_l%d_together.axmodel" --axmodel_num 24 --tokenizer_type 2 --url_tokenizer_model "http://127.0.0.1:12345" --filename_post_axmodel "minicpm4-0.5b-int8-ctx-ax650/MiniCPMForCausalLM_post.axmodel" --filename_tokens_embed "minicpm4-0.5b-int8-ctx-ax650/model.embed_tokens.weight.bfloat16.bin" --tokens_embed_num 73448 --tokens_embed_size 1024 --use_mmap_load_embed 0 --live_print 1 --devices 0
```

</NewCodeBlock>

:::warning
Ensure the `tokenizer_model` port used in your launch command matches the port from [Launch the tokenizer service](#launch-the-tokenizer-service).
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/MiniCPM4-0.5B$ ./main_axcl_aarch64 --system_prompt "You are MiniCPM4, created by ModelBest. You are a helpful assistant." --kvcache_path "./kvcache" --template_filename_axmodel "minicpm4-0.5b-int8-ctx-ax650/MiniCPMForCausalLM_p128_l%d_together.axmodel" --axmodel_num 24 --tokenizer_type 2 --url_tokenizer_model "http://127.0.0.1:12345" --filename_post_axmodel "minicpm4-0.5b-int8-ctx-ax650/MiniCPMForCausalLM_post.axmodel" --filename_tokens_embed "minicpm4-0.5b-int8-ctx-ax650/model.embed_tokens.weight.bfloat16.bin" --tokens_embed_num 73448 --tokens_embed_size 1024 --use_mmap_load_embed 0 --live_print 1 --devices 0
[I][                            Init][ 136]: LLM init start
[I][                            Init][  34]: connect http://127.0.0.1:12345 ok
[I][                            Init][  57]: uid: e7d4d518-d3d6-494f-96ae-46729fa5cb29
bos_id: 1, eos_id: 73440
  7% | ███                               |   2 /  27 [0.64s<8.61s, 3.13 count/s] embed_selector init ok
[I][                             run][  30]: AXCLWorker start with devid 0
100% | ████████████████████████████████ |  27 /  27 [20.41s<20.41s, 1.32 count/s] init post axmodel ok,remain_cmm(6450 MB)6528 MB)
[I][                            Init][ 237]: max_token_len : 1023
[I][                            Init][ 240]: kv_cache_size : 128, kv_cache_num: 1023
[I][                            Init][ 248]: prefill_token_num : 128
[I][                            Init][ 252]: grp: 1, prefill_max_token_num : 1
[I][                            Init][ 252]: grp: 2, prefill_max_token_num : 128
[I][                            Init][ 252]: grp: 3, prefill_max_token_num : 512
[I][                            Init][ 256]: prefill_max_token_num : 512
________________________
|    ID| remain cmm(MB)|
========================
|     0|           6450|
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
[E][                    load_kvcache][ 100]: k_cache ./kvcache/k_cache_0.bin or v_cache ./kvcache/v_cache_0.bin not exist
[W][                            main][ 223]: load kvcache from path: ./kvcache failed,generate kvcache
[I][          GenerateKVCachePrefill][ 336]: input token num : 25, prefill_split_num : 1 prefill_grpid : 2
[I][          GenerateKVCachePrefill][ 373]: input_num_token:25
[I][                            main][ 229]: generate kvcache to path: ./kvcache
[I][                            main][ 236]: precompute_len: 25
[I][                            main][ 237]: system_prompt: You are MiniCPM4, created by ModelBest. You are a helpful assistant.
```

### Performance reference

| Model         | Quantization | Host device | Tokens/s |
| ------------- | ------------ | ----------- | -------- |
| MiniCPM4-0.5B | w8a16        | ROCK 5B+    | 17.86    |
