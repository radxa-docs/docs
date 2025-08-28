---
sidebar_position: 1
---

# InternVL3-2B

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 [InternVL3-2B](https://huggingface.co/OpenGVLab/InternVL3-2B) 示例应用，关于模型转换请参考 [这里](https://github.com/AXERA-TECH/InternVL3-2B.axera/tree/main/model_convert)

预编译模型量化方式：**w8a16**

## 下载示例应用仓库

使用 `huggingfcae-cli` 下载示例应用仓库。

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/InternVL3-2B --local-dir ./InternVL3-2B
cd InternVL3-2B
```

</NewCodeBlock>

## 示例使用

### 安装 python 依赖

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install transformers==4.53.3 jinja2==3.1.6
```

</NewCodeBlock>

### 启动 Tokenizer 服务

<NewCodeBlock tip="Host" type="Device">

```bash
python3 internvl3_tokenizer.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/InternVL3-2B$ python3 internvl3_tokenizer.py --port 12345
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
None None 151645 <|im_end|> 151665 151667
context_len is  256
prompt is <|im_start|>system
```

:::tip
如需结束后台的 Tokenizer 服务，请使用 `jobs` 查看后台编号，然后使用 `kill %N` 结束后台进程, 这里的 `%N` 是 `jobs` 下的后台编号
:::

### 模型推理

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x main_axcl_aarch64
./main_axcl_aarch64 --template_filename_axmodel "./internvl3_2b_axmodel/qwen2_p128_l%d_together.axmodel" --axmodel_num 28 --filename_image_encoder_axmodedl "./vit_axmodel/internvl3_2b_vit_slim.axmodel" --use_mmap_load_embed 1 --filename_tokenizer_model "http://0.0.0.0:12345" --filename_post_axmodel "./internvl3_2b_axmodel/qwen2_post.axmodel" --filename_tokens_embed "./internvl3_2b_axmodel/model.embed_tokens.weight.bfloat16.bin" --tokens_embed_num 151674 --tokens_embed_size 1536 --devices 0 --live_print
```

</NewCodeBlock>

:::tip
请检查 run_xxx.sh 运行脚本中 --url_tokenizer_model 的端口是否与 [Tokenizer 服务端口](#启动-tokenizer-服务)一致
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/InternVL3-2B$ ./main_axcl_aarch64 \
--template_filename_axmodel "./internvl3_2b_axmodel/qwen2_p128_l%d_together.axmodel" \
--axmodel_num 28 \
--filename_image_encoder_axmodedl "./vit_axmodel/internvl3_2b_vit_slim.axmodel" \
--use_mmap_load_embed 1 \
--filename_tokenizer_model "http://0.0.0.0:12345" \
--filename_post_axmodel "./internvl3_2b_axmodel/qwen2_post.axmodel" \
--filename_tokens_embed "./internvl3_2b_axmodel/model.embed_tokens.weight.bfloat16.bin" \
--tokens_embed_num 151674 \
--tokens_embed_size 1536 \
--devices 0 \
--live_print 1
[I][                            Init][ 160]: LLM init start
[I][                            Init][  34]: connect http://0.0.0.0:12345 ok
bos_id: -1, eos_id: 151645
img_start_token: 151665
img_context_token: 151667
  3% | ██                                |   1 /  31 [0.00s<0.09s, 333.33 count/s] tokenizer init ok[I][                            Init][  45]: LLaMaEmbedSelector use mmap
  6% | ███                               |   2 /  31 [0.00s<0.05s, 666.67 count/s] embed_selector init ok
[I][                             run][  30]: AXCLWorker start with devid 0
100% | ████████████████████████████████ |  31 /  31 [45.01s<45.01s, 0.69 count/s] init post axmodel ok,remain_cmm(3371 MB)3614 MB)
input size: 1
    name:    image [unknown] [unknown]
        1 x 3 x 448 x 448 size:2408448


output size: 1
    name:   output
        1 x 256 x 1536 size:1572864

[I][                            Init][ 265]: IMAGE_CONTEXT_TOKEN: 151667, IMAGE_START_TOKEN: 151665
[I][                            Init][ 290]: image encoder input nchw@float32
[I][                            Init][ 320]: image encoder output float32

[I][                            Init][ 330]: image_encoder_height : 448, image_encoder_width: 448
[I][                            Init][ 332]: max_token_len : 2559
[I][                            Init][ 335]: kv_cache_size : 256, kv_cache_num: 2559
[I][                            Init][ 343]: prefill_token_num : 128
[I][                            Init][ 347]: grp: 1, prefill_max_token_num : 1
[I][                            Init][ 347]: grp: 2, prefill_max_token_num : 128
[I][                            Init][ 347]: grp: 3, prefill_max_token_num : 256
[I][                            Init][ 347]: grp: 4, prefill_max_token_num : 384
[I][                            Init][ 347]: grp: 5, prefill_max_token_num : 512
[I][                            Init][ 347]: grp: 6, prefill_max_token_num : 640
[I][                            Init][ 347]: grp: 7, prefill_max_token_num : 768
[I][                            Init][ 347]: grp: 8, prefill_max_token_num : 896
[I][                            Init][ 347]: grp: 9, prefill_max_token_num : 1024
[I][                            Init][ 347]: grp: 10, prefill_max_token_num : 1152
[I][                            Init][ 347]: grp: 11, prefill_max_token_num : 1280
[I][                            Init][ 347]: grp: 12, prefill_max_token_num : 1408
[I][                            Init][ 347]: grp: 13, prefill_max_token_num : 1536
[I][                            Init][ 347]: grp: 14, prefill_max_token_num : 1664
[I][                            Init][ 347]: grp: 15, prefill_max_token_num : 1792
[I][                            Init][ 347]: grp: 16, prefill_max_token_num : 1920
[I][                            Init][ 347]: grp: 17, prefill_max_token_num : 2048
[I][                            Init][ 351]: prefill_max_token_num : 2048
________________________
|    ID| remain cmm(MB)|
========================
|     0|           2996|
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

[I][                            Init][ 448]: LLM init ok
Type "q" to exit, Ctrl+c to stop current running
prompt >>
```

### 性能参考

| 模型         | 量化方式 | host 设备 | token/s |
| ------------ | -------- | --------- | ------- |
| InternVL3-2B | w8a16    | ROCK 5B+  | 8.28    |
