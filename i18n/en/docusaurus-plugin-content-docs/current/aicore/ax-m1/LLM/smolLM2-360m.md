---
sidebar_position: 5
---

# SmolLM2-360M-Instruct

This document explains how to run the [SmolLM2-360M-Instruct](https://huggingface.co/HuggingFaceTB/SmolLM2-360M-Instruct) example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/SmolLM2-360M-Instruct --local-dir ./SmolLM2-360M-Instructcd DeepSeek-R1-Distill-Qwen-1.5B
cd SmolLM2-360M-Instruct
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
python smollm2_tokenizer.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

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

:::tip
If you need to end the background Tokenizer service, please use `jobs` to view the background number, then use `kill %N` to end the background process, where `%N` is the background number in `jobs`.
:::

### Model Inference

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x main_axcl_aarch64
mkdir kvcache
bash run_smollm2_360m_axcl_aarch64.sh
```

</NewCodeBlock>

:::tip
Please check the port of the tokenizer_model in the run_xxx.sh running script is consistent with the [Tokenizer Service Port](#start-tokenizer-service).
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

### Performance Reference

| Model                 | Quantization | Host Device | token/s |
| --------------------- | ------------ | ----------- | ------- |
| SmolLM2-360M-Instruct | w8a16        | ROCK 5B+    | 18.02   |
