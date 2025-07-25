---
sidebar_position: 4
---

# Qwen2.5-VL-3B-Instruct

This document explains how to run the [Qwen2.5-VL-3B-Instruct](https://huggingface.co/Qwen/Qwen2.5-VL-3B-Instruct) example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/Qwen2.5-VL-3B-Instruct --local-dir ./Qwen2.5-VL-3B-Instruct
cd Qwen2.5-VL-3B-Instruct
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

<Tabs queryString groupId="source_type">

    <TabItem value="image">

    <NewCodeBlock tip="Host" type="Device">

    ```bash
    python3 qwen2_tokenizer_image_448.py --port 12345 > /dev/null 2>&1 &
    ```

    </NewCodeBlock>

    ```bash
    (.venv) rock@rock-5b-plus:~/ssd/axera/Qwen2.5-VL-3B-Instruct$ python3 qwen2_tokenizer_image_448.py --port 12345
    None None 151645 <|im_end|>
    [151644, 8948, 198, 2610, 525, 264, 10950, 17847, 13, 151645, 198, 151644, 872, 198, 151652, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151655, 151653, 74785, 419, 2168, 13, 151645, 198, 151644, 77091, 198]
    281
    [151644, 8948, 198, 2610, 525, 264, 10950, 17847, 13, 151645, 198, 151644, 872, 198, 14990, 1879, 151645, 198, 151644, 77091, 198]
    21
    http://localhost:12345
    ```

    </TabItem>
    <TabItem value="video">

    <NewCodeBlock tip="Host" type="Device">

    ```bash
    python3 qwen2_tokenizer_video_308.py --port 12345 > /dev/null 2>&1 &
    ```

    </NewCodeBlock>

    ```bash
    (.venv) rock@rock-5b-plus:~/ssd/axera/Qwen2.5-VL-3B-Instruct$ python3 qwen2_tokenizer_video_308.py --port 12345
    None None 151645 <|im_end|>
    [151644, 8948, 198, 2610, 525, 264, 10950, 17847, 13, 151645, 198, 151644, 872, 198, 151652, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151656, 151653, 53481, 100158, 99487, 87140, 104597, 151645, 198, 151644, 77091, 198]
    510
    [151644, 8948, 198, 2610, 525, 264, 10950, 17847, 13, 151645, 198, 151644, 872, 198, 14990, 1879, 151645, 198, 151644, 77091, 198]
    21
    http://localhost:12345
    ```

    </TabItem>

</Tabs>

:::tip
If you need to end the background Tokenizer service, please use `jobs` to view the background number, then use `kill %N` to end the background process, where `%N` is the background number in `jobs`.
:::

### Model Inference

<Tabs queryString groupId="source_type">

    <TabItem value="image">

    <NewCodeBlock tip="Host" type="Device">

    ```bash
    chmod +x main_axcl_aarch64
    bash run_qwen2_5_vl_image_axcl_aarch64.sh
    ```

    </NewCodeBlock>

    ```bash
    (.venv) rock@rock-5b-plus:~/ssd/axera/Qwen2.5-VL-3B-Instruct$ bash run_qwen2_5_vl_image_axcl_aarch64.sh
    [I][                            Init][ 162]: LLM init start
    [I][                            Init][  34]: connect http://127.0.0.1:12345 ok
    bos_id: -1, eos_id: 151645
    img_start_token: 151652
    img_context_token: 151655
      2% | █                                 |   1 /  39 [0.00s<0.16s, 250.00 count/s] tokenizer init ok[I][                            Init][  45]: LLaMaEmbedSelector use mmap
      5% | ██                                |   2 /  39 [0.00s<0.08s, 500.00 count/s] embed_selector init ok
    [I][                             run][  30]: AXCLWorker start with devid 0
     12% |  █████                                   |   4 /  39 [11.15s<86.99s, 0.45 count/s] init 24 axmodel ok,devid(0) remain_cmm(-1 MB)     100% | ████████████████████████████████ |  39 /  39 [54.60s<57.55s, 0.68 count/s] init post axmodel ok,remain_cmm(3220 MB)545 MB))
    input size: 1
        name: hidden_states [unknown] [unknown]
            1 x 1024 x 392 x 3 size:1204224


    output size: 1
        name: hidden_states_out
            256 x 2048 size:2097152

    [I][                            Init][ 267]: IMAGE_CONTEXT_TOKEN: 151655, IMAGE_START_TOKEN: 151652
    [I][                            Init][ 328]: image encoder output float32

    [I][                            Init][ 340]: max_token_len : 1023
    [I][                            Init][ 343]: kv_cache_size : 256, kv_cache_num: 1023
    [I][                            Init][ 351]: prefill_token_num : 128
    [I][                            Init][ 355]: grp: 1, prefill_max_token_num : 1
    [I][                            Init][ 355]: grp: 2, prefill_max_token_num : 128
    [I][                            Init][ 355]: grp: 3, prefill_max_token_num : 256
    [I][                            Init][ 355]: grp: 4, prefill_max_token_num : 384
    [I][                            Init][ 355]: grp: 5, prefill_max_token_num : 512
    [I][                            Init][ 359]: prefill_max_token_num : 512
    ________________________
    |    ID| remain cmm(MB)|
    ========================
    |     0|           2286|
    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
    [E][                     load_config][ 278]: config file(post_config.json) open failed
    [W][                            Init][ 452]: load postprocess config(post_config.json) failed
    [I][                            Init][ 456]: LLM init ok
    Type "q" to exit, Ctrl+c to stop current running
    prompt >> describe the image
    image >> image/ssd_car.jpg
    [I][                          Encode][ 539]: image encode time : 787.804993 ms, size : 524288
    [I][                             Run][ 625]: input token num : 280, prefill_split_num : 3
    [I][                             Run][ 659]: input_num_token:128
    [I][                             Run][ 659]: input_num_token:128
    [I][                             Run][ 659]: input_num_token:24
    [I][                             Run][ 796]: ttft: 1964.38 ms
    This image shows a busy city street. In the foreground, a woman stands on the sidewalk, wearing a black coat and smiling. She is next to a red double-decker bus, which has an advertisement on it reading "THINGS GET MORE EXITING WHEN YOU SAY ‘YES’". The bus has the license plate number "L15". A black small truck is parked next to the bus. Some shops and pedestrians can be seen in the background, and the buildings on both sides of the street are modern glass curtain buildings. The overall atmosphere is busy and vibrant.

    [N][                             Run][ 949]: hit eos,avg 4.95 token/s
    ```

    </TabItem>
    <TabItem value="video">

<NewCodeBlock tip="Host" type="Device">

    ```bash
    chmod +x main_axcl_aarch64
    bash run_qwen2_5_vl_video_axcl_aarch64.sh
    ```

    </NewCodeBlock>

    ```bash
    (.venv) rock@rock-5b-plus:~/ssd/axera/Qwen2.5-VL-3B-Instruct$ bash run_qwen2_5_vl_video_axcl_aarch64.sh
    [I][                            Init][ 162]: LLM init start
    [I][                            Init][  34]: connect http://127.0.0.1:12345 ok
    bos_id: -1, eos_id: 151645
    img_start_token: 151652
    img_context_token: 151656
      2% | █                                 |   1 /  39 [0.00s<0.12s, 333.33 count/s] tokenizer init ok[I][                            Init][  45]: LLaMaEmbedSelector use mmap
      5% | ██                                |   2 /  39 [0.00s<0.06s, 666.67 count/s] embed_selector init ok
    [I][                             run][  30]: AXCLWorker start with devid 0
     92% | ████████████████████████████████████████████████ █ ████   |  35 /  39 [49.00s<54.60s, 0.71 count/s] init 4 axmodel ok,devid(0) remain100% | ████████████████████████████████ |  39 /  39 [54.74s<56.18s, 0.69 count/s] init post axmodel ok,remain_cmm(3220 MB)3545 MB)
    input size: 1
        name: hidden_states [unknown] [unknown]
            1 x 484 x 392 x 3 size:569184


    output size: 1
        name: hidden_states_out
            121 x 2048 size:991232

    [I][                            Init][ 267]: IMAGE_CONTEXT_TOKEN: 151656, IMAGE_START_TOKEN: 151652
    [I][                            Init][ 328]: image encoder output float32

    [I][                            Init][ 340]: max_token_len : 1023
    [I][                            Init][ 343]: kv_cache_size : 256, kv_cache_num: 1023
    [I][                            Init][ 351]: prefill_token_num : 128
    [I][                            Init][ 355]: grp: 1, prefill_max_token_num : 1
    [I][                            Init][ 355]: grp: 2, prefill_max_token_num : 128
    [I][                            Init][ 355]: grp: 3, prefill_max_token_num : 256
    [I][                            Init][ 355]: grp: 4, prefill_max_token_num : 384
    [I][                            Init][ 355]: grp: 5, prefill_max_token_num : 512
    [I][                            Init][ 359]: prefill_max_token_num : 512
    ________________________
    |    ID| remain cmm(MB)|
    ========================
    |     0|           2464|
    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
    [E][                     load_config][ 278]: config file(post_config.json) open failed
    [W][                            Init][ 452]: load postprocess config(post_config.json) failed
    [I][                            Init][ 456]: LLM init ok
    Type "q" to exit, Ctrl+c to stop current running
    prompt >> describe the video
    image >> video
    video/frame_0000.jpg
    video/frame_0008.jpg
    video/frame_0016.jpg
    video/frame_0024.jpg
    video/frame_0032.jpg
    video/frame_0040.jpg
    video/frame_0048.jpg
    video/frame_0056.jpg
    [I][                          Encode][ 539]: image encode time : 1484.723999 ms, size : 991232
    [I][                             Run][ 625]: input token num : 509, prefill_split_num : 4
    [I][                             Run][ 659]: input_num_token:128
    [I][                             Run][ 659]: input_num_token:128
    [I][                             Run][ 659]: input_num_token:128
    [I][                             Run][ 659]: input_num_token:125
    [I][                             Run][ 796]: ttft: 2931.55 ms
    The video shows a scene with two squirrels outdoors. The background is blurry mountains and blue sky, and there are squirrels interacting in the foreground. The squirrels have brown and gray mixed fur, and their claws are orange. The squirrels seem to be playing with each other or competing, with their claws and mouths reaching out to each other. The entire scene appears natural and lively.

    [N][                             Run][ 949]: hit eos,avg 4.89 token/s
    ```

    </TabItem>

</Tabs>

:::tip
Please check the port of the tokenizer_model in the run_xxx.sh running script is consistent with the [Tokenizer Service Port](#start-tokenizer-service).
:::

### Performance Reference

| Model                  | Quantization Method | Host Device | Token/s |
| ---------------------- | ------------------- | ----------- | ------- |
| Qwen2.5-VL-3B-Instruct | w8a16               | ROCK 5B+    | 4.95    |
