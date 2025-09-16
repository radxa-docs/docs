---
sidebar_position: 6
---

# DX-APP 应用示例

**DX-APP** 是基于智核 DX-M1 NPU 的应用 demo 模板。用户可以参考此 demo 模板设计自己的 AI 应用。

:::tip
DX-APP 依赖 opencv 与 [DX-RT](./dx-rt)
:::

## 安装方法

请在 DX-M1 SDK [资源下载](../download.md)页面下载 DX-APP 安装包并解压

<NewCodeBlock tip="Host" type="device">

```bash
tar -xvf dx_app_v1.2.1_hotfix.tar.gz && cd dx_app
```

</NewCodeBlock>

### 安装依赖

#### 安装系统依赖

<NewCodeBlock tip="Host" type="device">

```bash
./install.sh --dep
```

</NewCodeBlock>

#### 安装 opencv

- 使用 apt 安装 (推荐)

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install libopencv-dev
```

</NewCodeBlock>

- 使用脚本安装 (可选)

<NewCodeBlock tip="Host" type="device">

```bash
./install.sh --opencv
```

</NewCodeBlock>

:::warning
如果您使用 radxa os 6.1内核系统且使用脚本安装方法，请修改 install.sh 中 **127 和 130 行** 安装 opencv 版本为 4.7.0 (默认为 4.5.5) 否则会出现编译报错
:::

### 编译 DX-APP

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --arch aarch64
```

</NewCodeBlock>

## 运行例子

### ImageNet 目标分类

<NewCodeBlock tip="Host" type="device">

```bash
./scripts/run_classifier.sh
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/dx_app$ ./scripts/run_classifier.sh
~/ssd/deepx/dx_app ~/ssd/deepx/dx_app
/home/rock/ssd/deepx/dx_app
config json is valid
config json is valid
DXNN Model Ver. : 6
{"version": 6, "signature": "DXNN", "size": 8192, "encode_type": "utf-8", "bytes_order": "little", "hw_config": null, "data": {"merged_model": {"type": "bytes", "offset": 0, "size": 0}, "npu_models": {"npu_0": {"type": "bytes", "offset": 19751, "size": 5602912}}, "cpu_models": {"cpu_0": {"type": "bytes", "offset": 5623487, "size": 7632}}, "graph_info": {"type": "str", "offset": 5631119, "size": 1036}, "compile_config": {"type": "str", "offset": 5622663, "size": 824}, "compiled_data": {"M1A_4K": {"npu_0": {"rmap": {"type": "bytes", "offset": 5632155, "size": 360960}, "weight": {"type": "bytes", "offset": 5993115, "size": 5683904}, "rmap_info": {"type": "str", "offset": 11677019, "size": 1512}, "bitmatch": {"type": "bytes", "offset": 11678531, "size": 0}, "sim_info": {"type": "bytes", "offset": 11678531, "size": 23}}}}, "vis_npu_models": {"npu_0": {"type": "bytes", "offset": 0, "size": 19751}}, "vis_cpu_models": {}}, "cipher_manager": {"_serializer": {"use_pickle": false}, "_cipher": "DXCipherV2"}}
DXRT v2.6.3
argmax_output
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_app/example/EfficientNetB0_4/EfficientNetB0_4.dxnn
  Task[0] npu_0, NPU, 8209728bytes (input 157696, output 2)
    inputs
      data, UINT8, [1, 224, 224, 3 ], 0
    outputs
      argmax_output, UINT16, [1 ], 0


[example/ILSVRC2012/0.jpeg] Top1 Result : class 831 (studio couch, day bed)
[example/ILSVRC2012/1.jpeg] Top1 Result : class 321 (admiral)
[example/ILSVRC2012/2.jpeg] Top1 Result : class 846 (table lamp)
[example/ILSVRC2012/3.jpeg] Top1 Result : class 794 (shower curtain)
Profiler data has been written to profiler.json
~/ssd/deepx/dx_app
```

### Yolov5s 目标识别

<NewCodeBlock tip="Host" type="device">

```bash
./scripts/run_detector.sh
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/dx_app$ ./scripts/run_detector.sh
~/ssd/deepx/dx_app ~/ssd/deepx/dx_app
/home/rock/ssd/deepx/dx_app
config json is valid
config json is valid
DXNN Model Ver. : 6
{"version": 6, "signature": "DXNN", "size": 8192, "encode_type": "utf-8", "bytes_order": "little", "hw_config": null, "data": {"merged_model": {"type": "bytes", "offset": 0, "size": 0}, "npu_models": {"npu_0": {"type": "bytes", "offset": 16424, "size": 7564736}}, "cpu_models": {"cpu_0": {"type": "bytes", "offset": 7583644, "size": 280}}, "graph_info": {"type": "str", "offset": 7583924, "size": 1551}, "compile_config": {"type": "str", "offset": 7581160, "size": 2484}, "compiled_data": {"M1A_4K": {"npu_0": {"rmap": {"type": "bytes", "offset": 7585475, "size": 274560}, "weight": {"type": "bytes", "offset": 7860035, "size": 7463168}, "rmap_info": {"type": "str", "offset": 15323203, "size": 4298}, "bitmatch": {"type": "bytes", "offset": 15327501, "size": 0}, "sim_info": {"type": "bytes", "offset": 15327501, "size": 288}}}}, "vis_npu_models": {"npu_0": {"type": "bytes", "offset": 0, "size": 16424}}, "vis_cpu_models": {}}, "cipher_manager": {"_serializer": {"use_pickle": false}, "_cipher": "DXCipherV2"}}
DXRT v2.6.3
DX_tensor_3904
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_app/example/YOLOV5S_3/YOLOV5S_3.dxnn
  Task[0] npu_0, NPU, 13767040bytes (input 786432, output 131072)
    inputs
      images, UINT8, [1, 512, 512, 3 ], 0
    outputs
      DX_tensor_3904, BBOX, [UNKNOWN ], 0


[result save mode] ./xxx.jpg
Create Thread to save jpg [
app1] : entered thread function.
[app1] : notify to this thread function.
save file : result-app1.jpg
 detector application End.
Profiler data has been written to profiler.json
~/ssd/deepx/dx_app
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-app-yolov5s.webp"/>
   yolov5s demo result
</div>

## C++ 应用 demo

### 目标分类

源码位置 `./demos/classification/classification.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/classification -m example/EfficientNetB0_4/EfficientNetB0_4.dxnn -i example/ILSVRC2012/0.jpeg
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/dx_app$ ./bin/classification -m example/EfficientNetB0_4/EfficientNetB0_4.dxnn -i example/ILSVRC2012/0.jpeg
modelPath: example/EfficientNetB0_4/EfficientNetB0_4.dxnn
imgFile: example/ILSVRC2012/0.jpeg
DXNN Model Ver. : 6
{"version": 6, "signature": "DXNN", "size": 8192, "encode_type": "utf-8", "bytes_order": "little", "hw_config": null, "data": {"merged_model": {"type": "bytes", "offset": 0, "size": 0}, "npu_models": {"npu_0": {"type": "bytes", "offset": 19751, "size": 5602912}}, "cpu_models": {"cpu_0": {"type": "bytes", "offset": 5623487, "size": 7632}}, "graph_info": {"type": "str", "offset": 5631119, "size": 1036}, "compile_config": {"type": "str", "offset": 5622663, "size": 824}, "compiled_data": {"M1A_4K": {"npu_0": {"rmap": {"type": "bytes", "offset": 5632155, "size": 360960}, "weight": {"type": "bytes", "offset": 5993115, "size": 5683904}, "rmap_info": {"type": "str", "offset": 11677019, "size": 1512}, "bitmatch": {"type": "bytes", "offset": 11678531, "size": 0}, "sim_info": {"type": "bytes", "offset": 11678531, "size": 23}}}}, "vis_npu_models": {"npu_0": {"type": "bytes", "offset": 0, "size": 19751}}, "vis_cpu_models": {}}, "cipher_manager": {"_serializer": {"use_pickle": false}, "_cipher": "DXCipherV2"}}
DXRT v2.6.3
argmax_output
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_app/example/EfficientNetB0_4/EfficientNetB0_4.dxnn
  Task[0] npu_0, NPU, 8209728bytes (input 157696, output 2)
    inputs
      data, UINT8, [1, 224, 224, 3 ], 0
    outputs
      argmax_output, UINT16, [1 ], 0


Top1 Result : class 831
Profiler data has been written to profiler.json
```

### ImageNet 目标分类

源码位置 `./demos/classification/imagenet_classification.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/imagenet_classification -m example/EfficientNetB0_4/EfficientNetB0_4.dxnn -i example/imagenet_val_map.txt -p example/ILSVRC2012/
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/dx_app$ ./bin/imagenet_classification -m example/EfficientNetB0_4/EfficientNetB0_4.dxnn -i example/imagenet_val_map.txt -p example/ILSVRC2012/
DXNN Model Ver. : 6
{"version": 6, "signature": "DXNN", "size": 8192, "encode_type": "utf-8", "bytes_order": "little", "hw_config": null, "data": {"merged_model": {"type": "bytes", "offset": 0, "size": 0}, "npu_models": {"npu_0": {"type": "bytes", "offset": 19751, "size": 5602912}}, "cpu_models": {"cpu_0": {"type": "bytes", "offset": 5623487, "size": 7632}}, "graph_info": {"type": "str", "offset": 5631119, "size": 1036}, "compile_config": {"type": "str", "offset": 5622663, "size": 824}, "compiled_data": {"M1A_4K": {"npu_0": {"rmap": {"type": "bytes", "offset": 5632155, "size": 360960}, "weight": {"type": "bytes", "offset": 5993115, "size": 5683904}, "rmap_info": {"type": "str", "offset": 11677019, "size": 1512}, "bitmatch": {"type": "bytes", "offset": 11678531, "size": 0}, "sim_info": {"type": "bytes", "offset": 11678531, "size": 23}}}}, "vis_npu_models": {"npu_0": {"type": "bytes", "offset": 0, "size": 19751}}, "vis_cpu_models": {}}, "cipher_manager": {"_serializer": {"use_pickle": false}, "_cipher": "DXCipherV2"}}
DXRT v2.6.3
argmax_output
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_app/example/EfficientNetB0_4/EfficientNetB0_4.dxnn
  Task[0] npu_0, NPU, 8209728bytes (input 157696, output 2)
    inputs
      data, UINT8, [1, 224, 224, 3 ], 0
    outputs
      argmax_output, UINT16, [1 ], 0


Profiler data has been written to profiler.json
```

### YOLOv5 目标识别

源码位置 `./demos/object_detection/yolo_demo.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/yolo -m example/YOLOV5S_3/YOLOV5S_3.dxnn -i sample/1.jpg -p 1
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/dx_app$ ./bin/yolo -m example/YOLOV5S_3/YOLOV5S_3.dxnn -i sample/1.jpg -p 1
modelPath: example/YOLOV5S_3/YOLOV5S_3.dxnn
videoFile:
rtspPath:
imgFile: sample/1.jpg
binFile:
simFile:
cameraInput: 0
ispInput: 0
asyncInference: 0
DXNN Model Ver. : 6
{"version": 6, "signature": "DXNN", "size": 8192, "encode_type": "utf-8", "bytes_order": "little", "hw_config": null, "data": {"merged_model": {"type": "bytes", "offset": 0, "size": 0}, "npu_models": {"npu_0": {"type": "bytes", "offset": 16424, "size": 7564736}}, "cpu_models": {"cpu_0": {"type": "bytes", "offset": 7583644, "size": 280}}, "graph_info": {"type": "str", "offset": 7583924, "size": 1551}, "compile_config": {"type": "str", "offset": 7581160, "size": 2484}, "compiled_data": {"M1A_4K": {"npu_0": {"rmap": {"type": "bytes", "offset": 7585475, "size": 274560}, "weight": {"type": "bytes", "offset": 7860035, "size": 7463168}, "rmap_info": {"type": "str", "offset": 15323203, "size": 4298}, "bitmatch": {"type": "bytes", "offset": 15327501, "size": 0}, "sim_info": {"type": "bytes", "offset": 15327501, "size": 288}}}}, "vis_npu_models": {"npu_0": {"type": "bytes", "offset": 0, "size": 16424}}, "vis_cpu_models": {}}, "cipher_manager": {"_serializer": {"use_pickle": false}, "_cipher": "DXCipherV2"}}
DXRT v2.6.3
DX_tensor_3904
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_app/example/YOLOV5S_3/YOLOV5S_3.dxnn
  Task[0] npu_0, NPU, 13767040bytes (input 786432, output 131072)
    inputs
      images, UINT8, [1, 512, 512, 3 ], 0
    outputs
      DX_tensor_3904, BBOX, [UNKNOWN ], 0


YOLO created : 16128 boxes, 80 classes, 3 layers.
  YoloParam:
    - conf_threshold: 0.25, score_threshold: 0.3, iou_threshold: 0.4, num_classes: 80, num_layers: 3
    - LayerParam: [ name : , 64 x 64 x 3boxes], anchorWidth [10, 16, 33, ], anchorHeight [13, 30, 23, ], tensor index [0, ]
    - LayerParam: [ name : , 32 x 32 x 3boxes], anchorWidth [30, 62, 59, ], anchorHeight [61, 45, 119, ], tensor index [1, ]
    - LayerParam: [ name : , 16 x 16 x 3boxes], anchorWidth [116, 156, 373, ], anchorHeight [90, 198, 326, ], tensor index [2, ]
    - classes: [person, bicycle, car, motorcycle, airplane, bus, train, truck, boat, trafficlight, firehydrant, stopsign, parkingmeter, bench, bird, cat, dog, horse, sheep, cow, elephant, bear, zebra, giraffe, backpack, umbrella, handbag, tie, suitcase, frisbee, skis, snowboard, sportsball, kite, baseballbat, baseballglove, skateboard, surfboard, tennisracket, bottle, wineglass, cup, fork, knife, spoon, bowl, banana, apple, sandwich, orange, broccoli, carrot, hotdog, pizza, donut, cake, chair, couch, pottedplant, bed, diningtable, toilet, tv, laptop, mouse, remote, keyboard, cellphone, microwave, oven, toaster, sink, refrigerator, book, clock, vase, scissors, teddybear, hairdrier, toothbrush, ]
  Detected 10 boxes.
    BBOX:person(0) 0.875031, (307.338, 138.913, 400.92, 363.954)
    BBOX:bowl(45) 0.732544, (45.9369, 315.534, 107.349, 345.854)
    BBOX:bowl(45) 0.722641, (25.4563, 359.523, 79.3362, 392.863)
    BBOX:oven(69) 0.681473, (-0.0987854, 226.037, 154.623, 324.768)
    BBOX:person(0) 0.616135, (0.465769, 294.91, 48.1221, 331.129)
    BBOX:oven(69) 0.558456, (389.31, 246.236, 496.878, 359.313)
    BBOX:bowl(45) 0.536057, (-0.60582, 329.002, 69.4923, 379.934)
    BBOX:pottedplant(58) 0.425957, (-0.255436, 85.7847, 50.8082, 206.899)
    BBOX:bottle(39) 0.420662, (172.748, 270.659, 201.125, 321.889)
    BBOX:bowl(45) 0.267693, (124.005, 219.177, 146.024, 232.778)
save file : result.jpg
/mnt/ssd/deepx/dx_app/example/YOLOV5S_3/YOLOV5S_3.dxnn : latency 4677us, 3040us
Profiler data has been written to profiler.json
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-app-yolov5s.webp"/>
   yolov5s demo result
</div>

Yolo 目标识别需要指定前后处理参数。示例在 `./demos/object_detection/yolo_cfg.cpp` 中。前后处理参数选项在 `yolo_demo.cpp` 中：

```cpp
YoloParam yoloParams[] = {
    [0] = yolov5s_320,
    [1] = yolov5s_512,
    [2] = yolov5s_640,
    [3] = yolox_s_512,
    [4] = yolov7_640,
    [5] = yolov7_512,
    [6] = yolov4_608,
};
```

### 多路目标识别

源码位置 `./demos/object_detection/yolo_demo_multi.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/yolo_multi -c ./example/4ch.json
```

</NewCodeBlock>

请参考以下 json 构造配置文件

```json
{
  "usage": "multi",
  "model_path": "/model_path/yolov5s_512",
  "model_name": "yolov5s_512",

  "video_sources": [
    ["/video_path/video_sample0.mp4", "realtime"],
    ["/dev/video0", "camera"],
    ["/image_path/image.jpg", "image"],
    ["/video_path/video_sample1.mp4", "offline", 400]
  ],

  "display_config": {
    "display_label": "output",
    "capture_period": 33,
    "output_width": 1920,
    "output_height": 1080,
    "show_fps": true
  }
}
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-app-yolo-multi.webp"/>
   yolov5s multi result
</div>
