---
sidebar_position: 7
---

# YOLOv8-Seg

This document explains how to run the [YOLOv8-seg](https://github.com/AXERA-TECH/axcl-samples) example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/YOLOv8-Seg --local-dir ./YOLOv8-Seg
cd YOLOv8-Seg
```

</NewCodeBlock>

## Example Usage

### Model Inference

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x axcl_yolov8_seg
./axcl_yolov8_seg -m ax650/yolov8s_seg.axmodel -i football.jpg
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/YOLOv8-Seg$ ./axcl_yolov8_seg -m ax650/yolov8s_seg.axmodel -i football.jpg
--------------------------------------
model file : ax650/yolov8s_seg.axmodel
image file : football.jpg
img_h, img_w : 640 640
--------------------------------------
axclrtEngineCreateContextt is done.
axclrtEngineGetIOInfo is done.

grpid: 0

input size: 1
    name:   images
        1 x 640 x 640 x 3


output size: 7
    name: /model.22/Concat_1_output_0
        1 x 80 x 80 x 144

    name: /model.22/Concat_2_output_0
        1 x 40 x 40 x 144

    name: /model.22/Concat_3_output_0
        1 x 20 x 20 x 144

    name: /model.22/cv4.0/cv4.0.2/Conv_output_0
        1 x 80 x 80 x 32

    name: /model.22/cv4.1/cv4.1.2/Conv_output_0
        1 x 40 x 40 x 32

    name: /model.22/cv4.2/cv4.2.2/Conv_output_0
        1 x 20 x 20 x 32

    name:  output1
        1 x 32 x 160 x 160

==================================================

Engine push input is done.
--------------------------------------
post process cost time:2.87 ms
--------------------------------------
Repeat 1 times, avg time 4.91 ms, max_time 4.91 ms, min_time 4.91 ms
--------------------------------------
detection num: 8
 0:  92%, [1354,  340, 1629, 1035], person
 0:  91%, [   5,  359,  314, 1108], person
 0:  91%, [ 759,  220, 1121, 1153], person
 0:  88%, [ 490,  476,  661,  999], person
32:  73%, [1233,  877, 1286,  923], sports ball
32:  63%, [ 772,  888,  828,  937], sports ball
32:  63%, [ 450,  882,  475,  902], sports ball
 0:  55%, [1838,  690, 1907,  811], person
--------------------------------------

```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-ax-m1/yolov8_seg_out.webp"/>
   yolov8-seg demo output
</div>
