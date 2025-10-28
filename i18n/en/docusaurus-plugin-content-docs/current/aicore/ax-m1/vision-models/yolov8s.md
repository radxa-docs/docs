---
sidebar_position: 6
---

# YOLOv8

This document explains how to run the [YOLOv8](https://github.com/AXERA-TECH/axcl-samples) example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/YOLOv8 --local-dir ./YOLOv8
cd YOLOv8
```

</NewCodeBlock>

## Example Usage

### Model Inference

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x ./axcl_aarch64/axcl_yolov8
./axcl_aarch64/axcl_yolov8 -m ax650/yolov8s.axmodel -i football.jpg
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/axera/YOLOv8$ ./axcl_aarch64/axcl_yolov8 -m ax650/yolov8s.axmodel -i football.jpg
--------------------------------------
model file : ax650/yolov8s.axmodel
image file : football.jpg
img_h, img_w : 640 640
--------------------------------------
axclrtEngineCreateContextt is done.
axclrtEngineGetIOInfo is done.

grpid: 0

input size: 1
    name:   images
        1 x 640 x 640 x 3


output size: 3
    name: /model.22/Concat_output_0
        1 x 80 x 80 x 144

    name: /model.22/Concat_1_output_0
        1 x 40 x 40 x 144

    name: /model.22/Concat_2_output_0
        1 x 20 x 20 x 144

==================================================

Engine push input is done.
--------------------------------------
post process cost time:0.91 ms
--------------------------------------
Repeat 1 times, avg time 3.79 ms, max_time 3.79 ms, min_time 3.79 ms
--------------------------------------
detection num: 7
 0:  93%, [ 757,  215, 1131, 1156], person
 0:  93%, [   0,  354,  311, 1104], person
 0:  93%, [1351,  342, 1627, 1032], person
 0:  91%, [ 488,  478,  661,  998], person
32:  87%, [ 773,  889,  829,  939], sports ball
32:  77%, [1231,  876, 1280,  922], sports ball
 0:  60%, [1840,  690, 1906,  809], person
--------------------------------------
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-ax-m1/yolov8_out.webp"/>
   yolov8 demo output
</div>
