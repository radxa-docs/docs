---
sidebar_position: 0
---

# Qwen2.5-1.5B-Instruct

此文档讲解如何在安装了瑞莎 AICore AX-M1 的 host 设备上运行 [Qwen2.5-1.5B](https://huggingface.co/Qwen/Qwen2.5-1.5B-Instruct-GPTQ-Int8) 示例应用，关于模型转换请参考 [这里](https://huggingface.co/AXERA-TECH/Qwen2.5-1.5B-Instruct#convert-script)

预编译模型量化方式：**w8a16** 和 **w4a16**

## 下载示例应用仓库

使用 `huggingfcae-cli` 下载示例应用仓库。

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/Qwen2.5-1.5B-Instruct --local-dir ./Qwen2.5-1.5B-Instruct
cd Qwen2.5-1.5B-Instruct
```

</NewCodeBlock>

## 示例使用

### 安装 python 依赖

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install transformers==4.53.3 jinja==3.1.6
```

</NewCodeBlock>

### 启动 Tokenizer 服务

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
如需结束后台的 Tokenizer 服务，请使用 `jobs` 查看后台编号，然后使用 `kill %N` 结束后台进程, 这里的 `%N` 是 `jobs` 下的后台编号
:::

### 模型推理

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x main_axcl_aarch64
mkdir kvcache
bash run_qwen2.5_1.5b_ctx_axcl_aarch64.sh
```

</NewCodeBlock>

:::tip
请检查 run_xxx.sh 运行脚本中 tokenizer_model 的端口是否与 [Tokenizer 服务端口](#启动-tokenizer-服务)一致
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
[I][                            main][ 237]: system_prompt: 你的名字叫小智（allen）,你是一个人畜无害的AI助手。深圳市今天（4月1日）阴天，愚人节，气温在14°C至19°C之间，微风。
```

### 性能参考

| 模型         | 量化方式 | host 设备 | token/s |
| ------------ | -------- | --------- | ------- |
| Qwen2.5-1.5B | w8a16    | ROCK 5B+  | 8.89    |
| Qwen2.5-1.5B | w4a16    | ROCK 5B+  | 11.27   |
