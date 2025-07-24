---
sidebar_position: 4
---

# YOLOv11-Seg

此文档讲解如何在安装了瑞莎 AICore AX-M1 的 host 设备上运行 YOLOv11-seg 示例应用, 代码和编译方法请参考 [ax_yolo11_seg_steps.cc](https://github.com/AXERA-TECH/axcl-samples/blob/main/examples/axcl/ax_yolo11_seg_steps.cc) 和 [ax-sample](https://github.com/AXERA-TECH/axcl-samples)

预编译模型量化方式：**w8a16**

## 下载示例应用仓库

使用 `huggingfcae-cli` 下载示例应用仓库。

<NewCodeBlock tip="Host" type="Device">

```bash
pip3 install -U "huggingface_hub[cli]"
huggingface-cli download AXERA-TECH/YOLO11-Seg --local-dir ./YOLO11-Seg
cd YOLO11-Seg
```

</NewCodeBlock>

## 示例使用

### 模型推理

<NewCodeBlock tip="Host" type="Device">

```bash
chmod +x axcl_yolo11_seg
./axcl_yolo11_seg -m ./ax650/yolo11s-seg.axmodel -i football.jpg
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/axera/YOLO11-Seg$ ./axcl_yolo11_seg -m ./ax650/yolo11s-seg.axmodel -i football.jpg
--------------------------------------
model file : ./ax650/yolo11s-seg.axmodel
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
    name: /model.23/Concat_1_output_0
        1 x 80 x 80 x 144

    name: /model.23/Concat_2_output_0
        1 x 40 x 40 x 144

    name: /model.23/Concat_3_output_0
        1 x 20 x 20 x 144

    name: /model.23/cv4.0/cv4.0.2/Conv_output_0
        1 x 80 x 80 x 32

    name: /model.23/cv4.1/cv4.1.2/Conv_output_0
        1 x 40 x 40 x 32

    name: /model.23/cv4.2/cv4.2.2/Conv_output_0
        1 x 20 x 20 x 32

    name:  output1
        1 x 32 x 160 x 160

==================================================

Engine push input is done.
--------------------------------------
post process cost time:2.86 ms
--------------------------------------
Repeat 1 times, avg time 4.56 ms, max_time 4.56 ms, min_time 4.56 ms
--------------------------------------
detection num: 6
 0:  92%, [   0,  359,  318, 1111], person
 0:  92%, [1350,  344, 1628, 1036], person
 0:  92%, [ 759,  216, 1126, 1155], person
 0:  89%, [ 490,  477,  658, 1003], person
32:  82%, [1231,  876, 1281,  922], sports ball
32:  79%, [ 775,  889,  826,  937], sports ball
--------------------------------------
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-ax-m1/yolo11_seg_out.webp"/>
   yolov11-seg demo output
</div>
