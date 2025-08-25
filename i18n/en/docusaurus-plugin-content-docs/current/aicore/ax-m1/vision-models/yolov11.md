---
sidebar_position: 3
---

# YOLOv11

This document explains how to run the YOLOv11 example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/YOLO11 --local-dir ./YOLO11
cd YOLO11
```

</NewCodeBlock>

## Example Usage

### Model Inference

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x axcl_yolo11
./axcl_yolo11 -m ax650/yolo11s.axmodel -i football.jpg
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/YOLO11$ ./axcl_yolo11 -m ax650/yolo11s.axmodel -i football.jpg
--------------------------------------
model file : ax650/yolo11s.axmodel
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
    name: /model.23/Concat_output_0
        1 x 80 x 80 x 144

    name: /model.23/Concat_1_output_0
        1 x 40 x 40 x 144

    name: /model.23/Concat_2_output_0
        1 x 20 x 20 x 144

==================================================

Engine push input is done.
--------------------------------------
post process cost time:0.89 ms
--------------------------------------
Repeat 1 times, avg time 3.41 ms, max_time 3.41 ms, min_time 3.41 ms
--------------------------------------
detection num: 7
 0:  95%, [ 759,  213, 1126, 1152], person
 0:  94%, [   0,  359,  315, 1107], person
 0:  94%, [1350,  344, 1629, 1036], person
 0:  89%, [ 490,  480,  658,  996], person
32:  73%, [ 771,  888,  830,  939], sports ball
32:  67%, [1231,  876, 1280,  924], sports ball
 0:  62%, [   0,  565,   86,  995], person
--------------------------------------

```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-ax-m1/yolo11_out.webp"/>
   yolov11 demo output
</div>
