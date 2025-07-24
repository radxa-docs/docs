---
sidebar_position: 3
---

# DeepSeek-R1-Qwen-1.5B

此文档讲解如何在安装了瑞莎 AICore AX-M1 的 host 设备上运行 [DeepSeek-R1-Qwen-1.5B](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B) 示例应用。

预编译模型量化方式：**w4a16** 和 **w8a16**

## 下载示例应用仓库

使用 `huggingfcae-cli` 下载示例应用仓库。

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
如需结束后台的 Tokenizer 服务，请使用 `jobs` 查看后台编号，然后使用 `kill %N` 结束后台进程, 这里的 `%N` 是 `jobs` 下的后台编号
:::

### 模型推理

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
请检查 run_xxx.sh 运行脚本中 tokenizer_model 的端口是否与 [Tokenizer 服务端口](#启动-tokenizer-服务)一致
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

### 性能参考

| 模型                                    | 量化方式 | host 设备 | token/s |
| --------------------------------------- | -------- | --------- | ------- |
| DeepSeek-R1-Distill-Qwen-1.5B           | w8a16    | ROCK 5B+  | 8.95    |
| DeepSeek-R1-Distill-Qwen-1.5B-GPTQ-Int4 | w4a16    | ROCK 5B+  | 12.65   |
