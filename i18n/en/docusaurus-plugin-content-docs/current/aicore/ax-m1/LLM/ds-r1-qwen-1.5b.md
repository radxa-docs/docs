---
sidebar_position: 3
---

# DeepSeek-R1-Qwen-1.5B

This document explains how to run the [DeepSeek-R1-Qwen-1.5B](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B) sample application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization formats: **w4a16** and **w8a16**.

## Create a virtual environment

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv && source .venv/bin/activate
```

</NewCodeBlock>

## Download the demo repository

<Tabs queryString groupId="deepseek-version">

    <TabItem value="w8a16">

    <NewCodeBlock tip="Host" type="device">

    ```bash
    pip3 install -U "huggingface_hub"
    hf download AXERA-TECH/DeepSeek-R1-Distill-Qwen-1.5B --local-dir ./DeepSeek-R1-Distill-Qwen-1.5B
    cd DeepSeek-R1-Distill-Qwen-1.5B
    ```

    </NewCodeBlock>

    </TabItem>
    <TabItem value="w4a16">

    <NewCodeBlock tip="Host" type="device">

    ```bash
    pip3 install -U "huggingface_hub"
    hf download AXERA-TECH/DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4 --local-dir ./DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4
    cd DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4
    ```

    </NewCodeBlock>

    </TabItem>

</Tabs>

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
python3 deepseek-r1_tokenizer_uid.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

:::warning
To stop the background tokenizer service, run `jobs` to find the job ID, then use `kill %N`, where `%N` is the corresponding job number.
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/DeepSeek-R1-Distill-Qwen-1.5B$ python3 deepseek-r1_tokenizer_uid.py
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
151646 <｜begin▁of▁sentence｜> 151643 <｜end▁of▁sentence｜>
<｜begin▁of▁sentence｜>You are Qwen, created by Alibaba Cloud. You are a helpful assistant.<｜User｜>hello world<｜Assistant｜>
[151646, 151646, 2610, 525, 1207, 16948, 11, 3465, 553, 54364, 14817, 13, 1446, 525, 264, 10950, 17847, 13, 151644, 14990, 1879, 151645]
http://localhost:12345
```

### Run inference

<Tabs queryString groupId="deepseek-version">

    <TabItem value="w8a16">

    <NewCodeBlock tip="Host" type="device">

    ```bash
    chmod +x main_axcl_aarch64
    mkdir kvcache
    bash run_deepseek-r1_1.5b_axcl_aarch64.sh
    ```

    </NewCodeBlock>

    </TabItem>
    <TabItem value="w4a16">

    <NewCodeBlock tip="Host" type="device">

    ```bash
    chmod +x main_axcl_aarch64
    mkdir kvcache
    bash run_deepseek-r1_1.5b_gptq_int4_axcl_aarch64.sh
    ```

    </NewCodeBlock>

    </TabItem>

</Tabs>

:::warning
Ensure the `tokenizer_model` port configured in the `run_xxx.sh` script matches the port used in [Launch the tokenizer service](#launch-the-tokenizer-service).
:::

```bash
rock@rock-5b-plus:~/ssd/axera/DeepSeek-R1-Distill-Qwen-1.5B$ bash run_deepseek-r1_1.5b_axcl_aarch64.sh
build time: Feb 13 2025 15:44:57
[I][                            Init][ 111]: LLM init start
bos_id: 151646, eos_id: 151643
100% | ████████████████████████████████ |  31 /  31 [26.50s<26.50s, 1.17 count/s] init post axmodel okremain_cmm(-1 MB)
[I][                            Init][ 226]: max_token_len : 1023
[I][                            Init][ 231]: kv_cache_size : 256, kv_cache_num: 1023
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

| Model                                   | Quantization | Host device | Tokens/s |
| --------------------------------------- | ------------ | ----------- | -------- |
| DeepSeek-R1-Distill-Qwen-1.5B           | w8a16        | ROCK 5B+    | 8.95     |
| DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4 | w4a16        | ROCK 5B+    | 12.65    |
