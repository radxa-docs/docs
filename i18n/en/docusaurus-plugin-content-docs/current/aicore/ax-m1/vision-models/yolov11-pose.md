---
sidebar_position: 5
---

# YOLOv11-Pose

This document explains how to run the YOLOv11-Pose example application on a host device equipped with the Radxa AICore AX-M1.

Precompiled model quantization methods: **w8a16**

## Download Example Application Repository

Use `huggingfcae-cli` to download the example application repository.

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/YOLO11-Pose --local-dir ./YOLO11-Pose
cd YOLO11-Pose
```

</NewCodeBlock>

## Example Usage

### Model Inference

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x axcl_yolo11_pose
./axcl_yolo11_pose -m ax650/yolo11x-pose.axmodel -i football.jpg
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/YOLO11-Pose$ ./axcl_yolo11_pose -m ax650/yolo11x-pose.axmodel -i football.jpg
--------------------------------------
model file : ax650/yolo11x-pose.axmodel
image file : football.jpg
img_h, img_w : 640 640
--------------------------------------
axclrtEngineCreateContextt is done.
axclrtEngineGetIOInfo is done.

grpid: 0

input size: 1
    name:   images
        1 x 640 x 640 x 3


output size: 6
    name: /model.23/Concat_1_output_0
        1 x 80 x 80 x 65

    name: /model.23/Concat_2_output_0
        1 x 40 x 40 x 65

    name: /model.23/Concat_3_output_0
        1 x 20 x 20 x 65

    name: /model.23/cv4.0/cv4.0.2/Conv_output_0
        1 x 80 x 80 x 51

    name: /model.23/cv4.1/cv4.1.2/Conv_output_0
        1 x 40 x 40 x 51

    name: /model.23/cv4.2/cv4.2.2/Conv_output_0
        1 x 20 x 20 x 51

==================================================

Engine push input is done.
--------------------------------------
post process cost time:0.40 ms
--------------------------------------
Repeat 1 times, avg time 25.16 ms, max_time 25.16 ms, min_time 25.16 ms
--------------------------------------
detection num: 6
 0:  94%, [1350,  337, 1632, 1036], person
 0:  93%, [ 492,  477,  658, 1000], person
 0:  92%, [ 756,  219, 1126, 1154], person
 0:  91%, [   0,  354,  314, 1108], person
 0:  73%, [   0,  530,   81, 1017], person
 0:  54%, [ 142,  589,  239, 1013], person
--------------------------------------
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-ax-m1/yolo11_pose_out.webp"/>
   yolov11-pose demo output
</div>
