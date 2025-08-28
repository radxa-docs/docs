---
sidebar_position: 0
---

# InternVL2_5-1B

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 [InternVL2_5-1B](https://huggingface.co/OpenGVLab/InternVL2_5-1B) 示例应用。

预编译模型量化方式：**w8a16**

## 下载示例应用仓库

使用 `huggingfcae-cli` 下载示例应用仓库。

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/InternVL2_5-1B --local-dir ./InternVL2_5-1B
cd InternVL2_5-1B
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
python3 internvl2_5_tokenizer_448.py --port 12345 > /dev/null 2>&1 &
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/InternVL2_5-1B$ python3 internvl2_5_tokenizer_448.py --port 12345
None None 151645 <|im_end|>
[151644, 8948, 198, 56568, 104625, 100633, 104455, 104800, 101101, 32022, 102022, 99602, 100013, 9370, 90286, 21287, 42140, 53772, 35243, 26288, 104949, 3837, 105205, 109641, 67916, 30698, 11, 54851, 46944, 115404, 42192, 99441, 100623, 48692, 100168, 110498, 1773, 151645, 151644, 872, 198, 151665, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151667, 151666, 198, 5501, 7512, 279, 2168, 19620, 13, 151645, 151644, 77091, 198]
310
[151644, 8948, 198, 56568, 104625, 100633, 104455, 104800, 101101, 32022, 102022, 99602, 100013, 9370, 90286, 21287, 42140, 53772, 35243, 26288, 104949, 3837, 105205, 109641, 67916, 30698, 11, 54851, 46944, 115404, 42192, 99441, 100623, 48692, 100168, 110498, 1773, 151645, 151644, 872, 198, 14990, 1879, 151645, 151644, 77091, 198]
47
http://0.0.0.0:12345
```

:::tip
如需结束后台的 Tokenizer 服务，请使用 `jobs` 查看后台编号，然后使用 `kill %N` 结束后台进程, 这里的 `%N` 是 `jobs` 下的后台编号
:::

### 模型推理

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x main_axcl_aarch64
bash run_internvl2_5_448_axcl_aarch64.sh
```

</NewCodeBlock>

:::tip
请检查 run_xxx.sh 运行脚本中 tokenizer_model 的端口是否与 [Tokenizer 服务端口](#启动-tokenizer-服务)一致
:::

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/InternVL2_5-1B$ cat run_internvl2_5_448_axcl_aarch64.sh
./main_aarch64_axcl \
--template_filename_axmodel "internvl2_5_1b_448_ax650/qwen2_p320_l%d_together.axmodel" \
--axmodel_num 24 \
--filename_image_encoder_axmodedl "internvl2_5_1b_448_ax650/vit_intern_2_5_sim_space2depth_nhwc.axmodel" \
--tokenizer_type 2 \
--bos 0 --eos 0 \
--use_mmap_load_embed 0 \
--filename_tokenizer_model "http://127.0.0.1:12345" \
--filename_post_axmodel "internvl2_5_1b_448_ax650/qwen2_post.axmodel" \
--filename_tokens_embed "internvl2_5_1b_448_ax650/model.embed_tokens.weight.bfloat16.bin" \
--tokens_embed_num 151674 \
--tokens_embed_size 896 \
--live_print 1 \
--devices "0" \
--continue 1 \
--prompt "" --image ""(.venv) rock@rock-5b-plus:~/ssd/axera/InternVL2_5-1B$ bash run_internvl2_5_448_axcl_aarch64.sh
[I][                            Init][ 128]: LLM init start
[I][                            Init][ 321]: connect http://127.0.0.1:12345 ok
bos_id: -1, eos_id: 151645
  7% | ███                               |   2 /  27 [0.33s<4.40s, 6.13 count/s] embed_selector init ok
[I][                             run][  30]: AXCLWorker start with devid 0
100% | ████████████████████████████████ |  27 /  27 [17.43s<17.43s, 1.55 count/s] init post axmodel ok,remain_cmm(6433 MB)6574 MB)
[I][                            Init][ 225]: image_encoder_height : 448, image_encoder_width: 448
[I][                            Init][ 227]: max_token_len : 1023
[I][                            Init][ 230]: kv_cache_size : 128, kv_cache_num: 1023
[I][                            Init][ 238]: prefill_token_num : 320
[I][                            Init][ 240]: prefill_max_token_num : 320
________________________
|    ID| remain cmm(MB)|
========================
|     0|           6066|
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
[E][                     load_config][ 278]: config file(post_config.json) open failed
[W][                            Init][ 333]: load postprocess config(post_config.json) failed
[I][                            Init][ 337]: LLM init ok
Type "q" to exit, Ctrl+c to stop current running
prompt >
```

### 性能参考

| 模型           | 量化方式 | host 设备 | token/s |
| -------------- | -------- | --------- | ------- |
| InternVL2_5-1B | w8a16    | ROCK 5B+  | 17.52   |
