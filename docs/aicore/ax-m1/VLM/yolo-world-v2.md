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

### 模型推理

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x ./axcl_aarch64/axcl_yolo_world_open_vocabulary
./axcl_aarch64/axcl_yolo_world_open_vocabulary -m ./ax650/yoloworldv2_4cls_50_npu3.axmodel -i ./ssd_horse.jpg -t ./person.bin
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/YOLO-World-V2$ ./axcl_aarch64/axcl_yolo_world_open_vocabulary -m ./ax650/yoloworldv2_4cls_50_npu3.axmodel -i ./ssd_horse.jpg -t ./person.bin
--------------------------------------
model file : ./ax650/yoloworldv2_4cls_50_npu3.axmodel
image file : ./ssd_horse.jpg
text_feature file : ./person.bin
img_h, img_w : 640 640
--------------------------------------
axclrtEngineCreateContextt is done.
axclrtEngineGetIOInfo is done.

grpid: 0

input size: 2
    name:   images
        1 x 640 x 640 x 3

    name: txt_feats
        1 x 4 x 512


output size: 3
    name:  stride8
        1 x 80 x 80 x 68

    name: stride16
        1 x 40 x 40 x 68

    name: stride32
        1 x 20 x 20 x 68

==================================================

Engine push input is done.
--------------------------------------
post process cost time:0.26 ms
--------------------------------------
Repeat 1 times, avg time 4.56 ms, max_time 4.56 ms, min_time 4.56 ms
--------------------------------------
detection num: 3
 0:  83%, [ 272,   14,  349,  234], class1
 0:  67%, [ 431,  124,  452,  178], class1
 0:  38%, [ 402,  130,  410,  147], class1
--------------------------------------
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-ax-m1/yolo_world_out.webp"/>
   yolo_world_v2 demo output
</div>
