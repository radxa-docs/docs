---
sidebar_position: 2
---

# YOLO-World-V2

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 [YOLO-World-V2](https://github.com/AILab-CVC/YOLO-World) 示例应用。

## 下载示例应用仓库

使用 `huggingfcae-cli` 下载示例应用仓库。

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/YOLO-World-V2 --local-dir ./YOLO-World-V2
cd YOLO-World-V2
```

</NewCodeBlock>

## 示例使用

### 安装 python 依赖

<NewCodeBlock tip="Host" type="Device">

```bash
pip install -r pyyoloworld/requirements.txt
```

</NewCodeBlock>

### 模型推理

<NewCodeBlock tip="Host" type="Device">

```bash
cp install/lib/axcl_aarch64/libyoloworld.so ./pyyoloworld/
cd pyyoloworld/
python gradio_example.py --yoloworld ../models/yolo_u16_ax650.axmodel --tenc ../models/clip_b1_u16_ax650.axmodel --vocab ../vocab.txt
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/YOLO-World-V2/pyyoloworld$ python gradio_example.py --yoloworld ../models/yolo_u16_ax650.axmodel --tenc ../models/clip_b1_u16_ax6/vocab.txt
Trying to load: /home/radxa/AXERA-TECH/YOLO-World-V2/pyyoloworld/aarch64/libyoloworld.so

❌ Failed to load: /home/radxa/AXERA-TECH/YOLO-World-V2/pyyoloworld/aarch64/libyoloworld.so
   /home/radxa/AXERA-TECH/YOLO-World-V2/pyyoloworld/aarch64/libyoloworld.so: cannot open shared object file: No such file or directory
🔍 File not found. Please verify that libclip.so exists and the path is correct.

Trying to load: /home/radxa/AXERA-TECH/YOLO-World-V2/pyyoloworld/libyoloworld.so
open libax_sys.so failed
open libax_engine.so failed
✅ Successfully loaded: /home/radxa/AXERA-TECH/YOLO-World-V2/pyyoloworld/libyoloworld.so
可用设备: {'host': {'available': False, 'version': '', 'mem_info': {'remain': 0, 'total': 0}}, 'devices': {'host_version': 'V3.6.4_20250819020149', 'dev_version': 'V3.6.4_nt': 1, 'devices_info': [{'temp': 45, 'cpu_usage': 2, 'npu_usage': 0, 'mem_info': {'remain': 7022, 'total': 7040}}]}}
axcl device available, use device-0
[I][                             run][  31]: AXCLWorker start with devid 0

input size: 2
    name:   images [unknown] [unknown]
        1 x 640 x 640 x 3   size: 1228800

    name: txt_feats [unknown] [unknown]
        1 x 4 x 512   size: 8192


output size: 3
    name:  stride8
        1 x 80 x 80 x 68   size: 1740800

    name: stride16
        1 x 40 x 40 x 68   size: 435200

    name: stride32
        1 x 20 x 20 x 68   size: 108800

[I][                       yw_create][ 408]: num_classes: 4, num_features: 512, input w: 640, h: 640
is_output_nhwc: 1

input size: 1
    name: text_token [unknown] [unknown]
        1 x 77   size: 308


output size: 1
    name:     2202
        1 x 1 x 512   size: 2048

[I][               load_text_encoder][  44]: text feature len 512
[I][                  load_tokenizer][  60]: text token len 77
* Running on local URL:  http://192.168.1.100:7860
* Running on local URL:  http://0.0.0.0:7860
* To create a public link, set `share=True` in `launch()`.
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-ax-m1/yolo_world_out.webp"/>
   yolo_world_v2 demo output
</div>

如果您的开发板 IP Address 是 192.168.1.100, 那么使用浏览器访问以下链接 http://192.168.1.100:7860.

<img width="1871" height="980" alt="image" src="https://github.com/user-attachments/assets/a41c0f65-ba5f-4af6-9ad7-80ec5c7d14e1" />

