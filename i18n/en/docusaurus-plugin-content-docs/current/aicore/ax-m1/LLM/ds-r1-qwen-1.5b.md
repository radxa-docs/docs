---
sidebar_position: 3
---

# DeepSeek-R1-Qwen-1.5B

This document explains how to run the [DeepSeek-R1-Qwen-1.5B](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B) example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w4a16** and **w8a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/DeepSeek-R1-Distill-Qwen-1.5B --local-dir ./DeepSeek-R1-Distill-Qwen-1.5B
cd DeepSeek-R1-Distill-Qwen-1.5B
```

</NewCodeBlock>

<Tabs queryString groupId="deepseek-version">

    <TabItem value="w8a16">

    <NewCodeBlock tip="Host" type="Device">

    ```bash
    pip3 install -U "huggingface_hub[cli]"
    huggingface-cli download AXERA-TECH/DeepSeek-R1-Distill-Qwen-1.5B --local-dir ./DeepSeek-R1-Distill-Qwen-1.5B
    cd DeepSeek-R1-Distill-Qwen-1.5B
    ```

    </NewCodeBlock>

    </TabItem>
    <TabItem value="w4a16">

    <NewCodeBlock tip="Host" type="Device">

    ```bash
    pip3 install -U "huggingface_hub[cli]"
    huggingface-cli download AXERA-TECH/DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4 --local-dir ./DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4
    cd DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4
    ```

    </NewCodeBlock>

    </TabItem>

</Tabs>

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
python3 deepseek-r1_tokenizer.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/DeepSeek-R1-Distill-Qwen-1.5B$ python3 deepseek-r1_tokenizer.py
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
151646 <｜begin▁of▁sentence｜> 151643 <｜end▁of▁sentence｜>
<｜begin▁of▁sentence｜>You are Qwen, created by Alibaba Cloud. You are a helpful assistant.<｜User｜>hello world<｜Assistant｜>
[151646, 151646, 2610, 525, 1207, 16948, 11, 3465, 553, 54364, 14817, 13, 1446, 525, 264, 10950, 17847, 13, 151644, 14990, 1879, 151645]
http://localhost:12345
```

:::tip
If you need to end the background Tokenizer service, please use `jobs` to view the background number, then use `kill %N` to end the background process, where `%N` is the background number in `jobs`.
:::

### Model Inference

<Tabs queryString groupId="deepseek-version">

    <TabItem value="w8a16">

    <NewCodeBlock tip="Host" type="Device">

    ```bash
    chmod +x main_axcl_aarch64
    mkdir kvcache
    bash run_deepseek-r1_1.5b_axcl_aarch64.sh
    ```

    </NewCodeBlock>

    </TabItem>
    <TabItem value="w4a16">

    <NewCodeBlock tip="Host" type="Device">

    ```bash
    chmod +x main_axcl_aarch64
    mkdir kvcache
    bash run_deepseek-r1_1.5b_gptq_int4_axcl_aarch64.sh
    ```

    </NewCodeBlock>

    </TabItem>

</Tabs>

:::tip
Please check the port of the tokenizer_model in the run_xxx.sh running script is consistent with the [Tokenizer Service Port](#start-tokenizer-service).
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

### Performance Reference

| Model                                   | Quantization | Host Device | token/s |
| --------------------------------------- | ------------ | ----------- | ------- |
| DeepSeek-R1-Distill-Qwen-1.5B           | w8a16        | ROCK 5B+    | 8.95    |
| DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4 | w4a16        | ROCK 5B+    | 12.65   |
