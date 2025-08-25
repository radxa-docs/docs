---
sidebar_position: 0
---

# Qwen2.5-1.5B-Instruct

This document explains how to run the [Qwen2.5-1.5B](https://huggingface.co/Qwen/Qwen2.5-1.5B-Instruct-GPTQ-Int8) example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a16** and **w4a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/Qwen2.5-1.5B-Instruct --local-dir ./Qwen2.5-1.5B-Instruct
cd Qwen2.5-1.5B-Instruct
```

</NewCodeBlock>

## Example Usage

### Install Python Dependencies

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install transformers==4.53.3 jinja==3.1.6
```

</NewCodeBlock>

### Start Tokenizer Service

<NewCodeBlock tip="Host" type="Device">

```bash
python3 qwen2.5_tokenizer_uid.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/Qwen2.5-1.5B-Instruct$ python3 qwen2.5_tokenizer_uid.py
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
Server running at http://0.0.0.0:12345
```

:::tip
If you need to end the background Tokenizer service, please use `jobs` to view the background number, then use `kill %N` to end the background process, where `%N` is the background number in `jobs`.
:::

### Model Inference

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x main_axcl_aarch64
mkdir kvcache
bash run_qwen2.5_1.5b_ctx_axcl_aarch64.sh
```

</NewCodeBlock>

:::tip
Please check the port of the tokenizer_model in the run_xxx.sh running script is consistent with the [Tokenizer Service Port](#start-tokenizer-service).
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/Qwen2.5-1.5B-Instruct$ bash run_qwen2.5_1.5b_ctx_axcl_aarch64.sh
[I][                            Init][ 136]: LLM init start
[I][                            Init][  34]: connect http://127.0.0.1:12345 ok
[I][                            Init][  57]: uid: 736c3297-4e22-4e36-8022-4fcddfbafe89
bos_id: -1, eos_id: 151645
  3% | ██                                |   1 /  31 [0.61s<18.88s, 1.64 count/s] tokenizer init ok[I][                            Init][  45]: LLaMaEmbedSelector use mmap
  6% | ███                               |   2 /  31 [0.61s<9.46s, 3.28 count/s] embed_selector init ok
[I][                             run][  30]: AXCLWorker start with devid 0
100% | ████████████████████████████████ |  31 /  31 [49.97s<49.97s, 0.62 count/s] init post axmodel ok,remain_cmm(4610 MB)4853 MB)
[I][                            Init][ 237]: max_token_len : 2047
[I][                            Init][ 240]: kv_cache_size : 256, kv_cache_num: 2047
[I][                            Init][ 248]: prefill_token_num : 128
[I][                            Init][ 252]: grp: 1, prefill_max_token_num : 1
[I][                            Init][ 252]: grp: 2, prefill_max_token_num : 128
[I][                            Init][ 252]: grp: 3, prefill_max_token_num : 256
[I][                            Init][ 252]: grp: 4, prefill_max_token_num : 384
[I][                            Init][ 252]: grp: 5, prefill_max_token_num : 512
[I][                            Init][ 252]: grp: 6, prefill_max_token_num : 640
[I][                            Init][ 252]: grp: 7, prefill_max_token_num : 768
[I][                            Init][ 252]: grp: 8, prefill_max_token_num : 896
[I][                            Init][ 252]: grp: 9, prefill_max_token_num : 1024
[I][                            Init][ 256]: prefill_max_token_num : 1024
________________________
|    ID| remain cmm(MB)|
========================
|     0|           4610|
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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

[I][                            Init][ 279]: LLM init ok
Type "q" to exit, Ctrl+c to stop current running
[E][                    load_kvcache][ 100]: k_cache ./kvcache/k_cache_0.bin or v_cache ./kvcache/v_cache_0.bin not exist
[W][                            main][ 223]: load kvcache from path: ./kvcache failed,generate kvcache
[I][          GenerateKVCachePrefill][ 336]: input token num : 53, prefill_split_num : 1 prefill_grpid : 2
[I][          GenerateKVCachePrefill][ 373]: input_num_token:53
[E][                    save_kvcache][  49]: save kvcache failed
[E][                            main][ 227]: save kvcache failed
[I][                            main][ 229]: generate kvcache to path: ./kvcache
[I][                            main][ 236]: precompute_len: 53
[I][                            main][ 237]: system_prompt: Your name is Allen, you are a harmless AI assistant. It is April 1st today in Shenzhen, cloudy, mild wind, temperature between 14°C and 19°C.
```

### Performance Reference

| Model        | Quantization | Host Device | token/s |
| ------------ | ------------ | ----------- | ------- |
| Qwen2.5-1.5B | w8a16        | ROCK 5B+    | 8.89    |
| Qwen2.5-1.5B | w4a16        | ROCK 5B+    | 11.27   |
