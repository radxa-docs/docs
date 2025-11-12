---
sidebar_position: 6
---

# DX-APP 应用示例

**DX-APP** 是基于智核 DX-M1 NPU 的应用 demo 模板。用户可以参考此 demo 模板设计自己的 AI 应用。

:::tip
DX-APP 依赖 opencv 与 [DX-RT](./dx-rt)
:::

## 安装方法

### 克隆 DX-ALL-SUITE 仓库

:::tip
请按照 [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) 克隆指定版本的 DX-ALL-SUITE 仓库
:::

### 安装依赖

进入 `dx-all-suite/dx-runtime/dx_app` 目录

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_app
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
如果您使用 radxa os 6.1内核系统且使用脚本安装方法，请修改 install.sh 中 **183** 安装 opencv 建议版本为 4.7.0 (默认为 4.5.5) 否则会出现编译报错
:::

### 编译 DX-APP

:::tip
编译 DX-APP 时需要在 python 虚拟环境中，请用户进入[**编译 DX-RT**](./dx-rt#编译-dx-rt) 时创建的 python 虚拟环境
:::

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --arch aarch64
```

</NewCodeBlock>

## 运行例子

### 下载测试模型/图片/视频资源

<NewCodeBlock tip="Host" type="device">

```bash
./setup.sh
```

</NewCodeBlock>

### ImageNet 目标分类

<NewCodeBlock tip="Host" type="device">

```bash
./scripts/run_classifier.sh
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ ./scripts/run_classifier.sh
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app ~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
[INFO] DX_APP_PATH: /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
./scripts/run_classifier.sh: line 28: [: check_valid_dir_or_symlink: unary operator expected
[INFO] Assets not found. Downloading now via setup.sh...
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
[INFO] === DOCKER_VOLUME_PATH() is set ===
[INFO] (host mode detected)
[INFO]  MODEL_PATH: ./assets/models
[INFO]  models directory found. (/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1)
[INFO] VIDEO_PATH: ./assets/videos
[INFO]  Video directory found. (/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/videos/sample_videos)
[INFO] [OK] Sample models and videos setup complete
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
config json is valid
config json is valid
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/EfficientNetB0_4.dxnn
  Task[0] npu_0, NPU, NPU memory usage 21199872 bytes (input 157696 bytes, output 2 bytes)
   inputs
     data, UINT8, [1, 224, 704 ], 0
   outputs
     argmax_output, UINT16, [1 ], 0


sh: 1: ldconfig: not found
[sample/ILSVRC2012/0.jpeg] Top1 Result : class 831 (studio couch, day bed)
[sample/ILSVRC2012/1.jpeg] Top1 Result : class 321 (admiral)
[sample/ILSVRC2012/2.jpeg] Top1 Result : class 846 (table lamp)
[sample/ILSVRC2012/3.jpeg] Top1 Result : class 794 (shower curtain)
~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
```

### Yolov5s 目标识别

<NewCodeBlock tip="Host" type="device">

```bash
./scripts/run_detector.sh
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ ./scripts/run_detector.sh
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app ~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
[INFO] DX_APP_PATH: /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
./scripts/run_detector.sh: line 28: [: check_valid_dir_or_symlink: unary operator expected
[INFO] Assets not found. Downloading now via setup.sh...
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
[INFO] === DOCKER_VOLUME_PATH() is set ===
[INFO] (host mode detected)
[INFO]  MODEL_PATH: ./assets/models
[INFO]  models directory found. (/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1)
[INFO] VIDEO_PATH: ./assets/videos
[INFO]  Video directory found. (/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/videos/sample_videos)
[INFO] [OK] Sample models and videos setup complete
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
config json is valid
config json is valid
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/YOLOV5S_3.dxnn
  Task[0] npu_0, NPU, NPU memory usage 50736064 bytes (input 786432 bytes, output 131072 bytes)
   inputs
     images, UINT8, [1, 512, 1536 ], 0
   outputs
     BBOX, BBOX, [1, unknown ], 0


[app1] : entered post process thread function.
[app3[] : entered post process thread function. app2] : entered post process thread function.

[app4] : entered post process thread function.
[result save mode] ./xxx.jpg
Create Thread to save jpg
[app5] : entered post process thread function.
[app1] : notify to this thread function.
[app2] : notify to this thread function.
[app3] : notify to this thread function.
[app4] : notify to this thread function.
[app5] : notify to this thread function.
save file : result-app1.jpg
save file : result-app2.jpg
save file : result-app3.jpg
save file : result-app4.jpg
save file : result-app5.jpg
 detector application End.
~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/run_detector.webp"/>
   run_detector demo result
</div>

## C++ 应用 demo

### 目标分类

源码位置 `./demos/classification/classification_sync.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/classification -m assets/models/EfficientNetB0_4.dxnn -i sample/ILSVRC2012/1.jpeg
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ ./bin/classification -m assets/models/EfficientNetB0_4.dxnn -i sample/ILSVRC2012/1.jpeg
modelPath: assets/models/EfficientNetB0_4.dxnn
imgFile: sample/ILSVRC2012/1.jpeg
loopTest: 0
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/EfficientNetB0_4.dxnn
  Task[0] npu_0, NPU, NPU memory usage 21199872 bytes (input 157696 bytes, output 2 bytes)
   inputs
     data, UINT8, [1, 224, 704 ], 0
   outputs
     argmax_output, UINT16, [1 ], 0


sh: 1: ldconfig: not found
Top1 Result : class 321
```

### ImageNet 目标分类

源码位置 `./demos/classification/imagenet_classification.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/imagenet_classification -m assets/models/EfficientNetB0_4.dxnn -i example/imagenet_classification/imagenet_val_map.txt -p sample/ILSVRC2012/
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

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/imagenet_result.webp"/>
   imagenet_classification demo result
</div>

### YOLOv5 目标识别

源码位置 `./demos/object_detection/yolo_1channel.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/yolo -m assets/models/YOLOV5S_3.dxnn -i sample/1.jpg -p 1
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ ./bin/yolo -m assets/models/YOLOV5S_3.dxnn -i sample/1.jpg -p 1
modelPath: assets/models/YOLOV5S_3.dxnn
videoFile:
rtspPath:
imgFile: sample/1.jpg
binFile:
simFile:
cameraInput: 0
ispInput: 0
asyncInference: 0
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/YOLOV5S_3.dxnn
  Task[0] npu_0, NPU, NPU memory usage 50736064 bytes (input 786432 bytes, output 131072 bytes)
   inputs
     images, UINT8, [1, 512, 1536 ], 0
   outputs
     BBOX, BBOX, [1, unknown ], 0


YOLO created : 16128 boxes, 80 classes, 3 layers.
  YoloParam:
    - conf_threshold: 0.25, score_threshold: 0.3, iou_threshold: 0.4, num_classes: 80, num_layers: 3
    - LayerParam: [ name : , 64 x 64 x 3boxes], anchorWidth [10, 16, 33, ], anchorHeight [13, 30, 23, ], tensor index [0, ]
    - LayerParam: [ name : , 32 x 32 x 3boxes], anchorWidth [30, 62, 59, ], anchorHeight [61, 45, 119, ], tensor index [1, ]
    - LayerParam: [ name : , 16 x 16 x 3boxes], anchorWidth [116, 156, 373, ], anchorHeight [90, 198, 326, ], tensor index [2, ]
    - classes: [person, bicycle, car, motorcycle, airplane, bus, train, truck, boat, trafficlight, firehydrant, stopsign, parkingmeter, bench, bird, cat, dog, horse, sheep, cow, elephant, bear, zebra, giraffe, backpack, umbrella, handbag, tie, suitcase, frisbee, skis, snowboard, sportsball, kite, baseballbat, baseballglove, skateboard, surfboard, tennisracket, bottle, wineglass, cup, fork, knife, spoon, bowl, banana, apple, sandwich, orange, broccoli, carrot, hotdog, pizza, donut, cake, chair, couch, pottedplant, bed, diningtable, toilet, tv, laptop, mouse, remote, keyboard, cellphone, microwave, oven, toaster, sink, refrigerator, book, clock, vase, scissors, teddybear, hairdrier, toothbrush, ]
  Detected 12 boxes.
    BBOX:person(0) 0.875763, (307.966, 139.33, 400.62, 363.818)
    BBOX:bowl(45) 0.757843, (25.5009, 359.271, 78.9972, 393.135)
    BBOX:bowl(45) 0.746948, (45.7862, 315.049, 107.652, 346.66)
    BBOX:oven(69) 0.704987, (0.613022, 228.342, 154.078, 323.998)
    BBOX:person(0) 0.634506, (0.297041, 294.957, 47.7459, 332.847)
    BBOX:bowl(45) 0.586166, (-0.0214653, 329.143, 69.1521, 379.916)
    BBOX:oven(69) 0.570114, (389.473, 246.375, 496.342, 358.539)
    BBOX:bottle(39) 0.457588, (172.319, 269.279, 200.35, 322.045)
    BBOX:pottedplant(58) 0.442146, (0.486477, 86.0419, 51.4276, 208.321)
    BBOX:bowl(45) 0.408516, (124.304, 219.822, 145.465, 232.589)
    BBOX:oven(69) 0.280937, (184.404, 237.089, 290.812, 398.126)
    BBOX:spoon(44) 0.276009, (227.967, 100.182, 240.816, 148.097)
save file : result.jpg
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/YOLOV5S_3.dxnn : latency 14052us, 3230us
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-app-yolov5s.webp"/>
   yolov5s demo result
</div>

### 多路目标识别

源码位置 `./demos/object_detection/yolo_demo_multi.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/yolo_multi -c ./example/yolo_multi/yolo_multi_demo.json
```

</NewCodeBlock>

请参考以下 json 构造配置文件

```json
{
  "usage": "multi",
  "model_path": "./assets/models/YOLOV5S_3.dxnn",
  "model_name": "yolov5s_512",

  "video_sources": [
    ["./assets/videos/dron-citry-road.mov", "offline", 60],
    ["./assets/videos/dance-group.mov", "offline", 60],
    ["./assets/videos/cctv-city-road2.mov", "offline", 60],
    ["./assets/videos/dance-solo.mov", "offline", 60],
    ["./assets/videos/codec_test_clip_h264_16Mbps.mp4", "offline", 60],
    ["./assets/videos/codec_test_clip_h265_8Mbps.mp4", "offline", 60],
    ["./assets/videos/blackbox-city-road.mp4", "offline", 60],
    ["./assets/videos/cctv-city-road.mov", "offline", 60]
  ],

  "display_config": {
    "display_label": "output",
    "capture_period": 30,
    "output_width": 1920,
    "output_height": 1080,
    "show_fps": true
  }
}
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/yolo_multi.webp"/>
   yolov5s multi result
</div>

### 姿态识别

源码位置 `./demos/pose_estimation/yolo_pose.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/pose -m assets/models/YOLOV5Pose640_1.dxnn -i sample/7.jpg -p 0
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ ./bin/pose -m assets/models/YOLOV5Pose640_1.dxnn -i sample/7.jpg -p 0
modelPath: assets/models/YOLOV5Pose640_1.dxnn
videoFile:
imgFile: sample/7.jpg
binFile:
cameraInput: 0
ispInput: 0
asyncInference: 0
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/YOLOV5Pose640_1.dxnn
  Task[0] npu_0, NPU, NPU memory usage 114738560 bytes (input 1228800 bytes, output 131072 bytes)
   inputs
     images, UINT8, [1, 640, 1920 ], 0
   outputs
     POSE, POSE, [1, unknown ], 0


YOLO created : 25500 boxes, 1 classes, 4 layers.
  YoloParam:
    - conf_threshold: 0.3, score_threshold: 0.3, iou_threshold: 0.4, num_classes: 1, num_layers: 4
    - LayerParam: [ 80 x 80 x 3boxes], anchorWidth [19, 44, 38, ], anchorHeight [27, 40, 94, ], tensor index [0, 1, ]
    - LayerParam: [ 40 x 40 x 3boxes], anchorWidth [96, 86, 180, ], anchorHeight [68, 152, 137, ], tensor index [2, 3, ]
    - LayerParam: [ 20 x 20 x 3boxes], anchorWidth [140, 303, 238, ], anchorHeight [301, 264, 542, ], tensor index [4, 5, ]
    - LayerParam: [ 10 x 10 x 3boxes], anchorWidth [436, 739, 925, ], anchorHeight [615, 380, 792, ], tensor index [6, 7, ]
    - classes: [person, ]
  Detected 2 boxes.
    BBOX:person(0) 0.913559, (54.1375, 212.814, 227.197, 449.009)
    BBOX:person(0) 0.887131, (316.288, 231.539, 448.978, 429.411)
save file : result.jpg
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/post_estimation_result.webp"/>
   YOLOV5Pose result
</div>

### 图像分割

源码位置 `./demos/segmentation/segmentation.cpp`

#### 图像分割

<NewCodeBlock tip="Host" type="device">

```bash
./bin/pidnet -m assets/models/DeepLabV3PlusMobileNetV2_2.dxnn -i sample/8.jpg
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ ./bin/pidnet -m assets/models/DeepLabV3PlusMobileNetV2_2.dxnn -i sample/8.jpg
modelPath: assets/models/DeepLabV3PlusMobileNetV2_2.dxnn
videoFile:
cameraInput: 0
asyncInference: 0
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/DeepLabV3PlusMobileNetV2_2.dxnn
  Task[0] npu_0, NPU, NPU memory usage 393316160 bytes (input 1228800 bytes, output 52428800 bytes)
   inputs
     input.1, UINT8, [1, 640, 640, 3 ], 0
   outputs
     1063, FLOAT, [1, 640, 640, 32 ], 0


sh: 1: ldconfig: not found
640x640 <- 676x338
save file : result.jpg
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/segmentation_result.webp"/>
   segmentation result
</div>

#### 图像检测与分割

<NewCodeBlock tip="Host" type="device">

```bash
./bin/od_pid -m0 assets/models/YOLOV5S_3.dxnn -m1 assets/models/DeepLabV3PlusMobileNetV2_2.dxnn -i sample/8.jpg
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ ./bin/od_pid -m0 assets/models/YOLOV5S_3.dxnn -m1 assets/models/DeepLabV3PlusMobileNetV2_2.dxnn -i sample/8.jpg
od_modelpath: assets/models/YOLOV5S_3.dxnn
seg_modelpath: assets/models/DeepLabV3PlusMobileNetV2_2.dxnn
imgFile: sample/8.jpg
videoFile:
cameraInput: 0
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/YOLOV5S_3.dxnn
  Task[0] npu_0, NPU, NPU memory usage 50736064 bytes (input 786432 bytes, output 131072 bytes)
   inputs
     images, UINT8, [1, 512, 1536 ], 0
   outputs
     BBOX, BBOX, [1, unknown ], 0


[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/DeepLabV3PlusMobileNetV2_2.dxnn
  Task[1] npu_0, NPU, NPU memory usage 393316160 bytes (input 1228800 bytes, output 52428800 bytes)
   inputs
     input.1, UINT8, [1, 640, 640, 3 ], 0
   outputs
     1063, FLOAT, [1, 640, 640, 32 ], 0


sh: 1: ldconfig: not found
YOLO created : 16128 boxes, 80 classes, 3 layers.
  YoloParam:
    - conf_threshold: 0.25, score_threshold: 0.3, iou_threshold: 0.4, num_classes: 80, num_layers: 3
    - LayerParam: [ 64 x 64 x 3boxes], anchorWidth [10, 16, 33, ], anchorHeight [13, 30, 23, ], tensor index [0, ]
    - LayerParam: [ 32 x 32 x 3boxes], anchorWidth [30, 62, 59, ], anchorHeight [61, 45, 119, ], tensor index [1, ]
    - LayerParam: [ 16 x 16 x 3boxes], anchorWidth [116, 156, 373, ], anchorHeight [90, 198, 326, ], tensor index [2, ]
    - classes: [person, bicycle, car, motorcycle, airplane, bus, train, truck, boat, trafficlight, firehydrant, stopsign, parkingmeter, bench, bird, cat, dog, horse, sheep, cow, elephant, bear, zebra, giraffe, backpack, umbrella, handbag, tie, suitcase, frisbee, skis, snowboard, sportsball, kite, baseballbat, baseballglove, skateboard, surfboard, tennisracket, bottle, wineglass, cup, fork, knife, spoon, bowl, banana, apple, sandwich, orange, broccoli, carrot, hotdog, pizza, donut, cake, chair, couch, pottedplant, bed, diningtable, toilet, tv, laptop, mouse, remote, keyboard, cellphone, microwave, oven, toaster, sink, refrigerator, book, clock, vase, scissors, teddybear, hairdrier, toothbrush, ]
640x640 <- 676x338
  Detected 13 boxes.
    BBOX:car(2) 0.909042, (1.04781, 227.536, 92.2432, 303.1)
    BBOX:car(2) 0.888733, (425.907, 222.871, 512.271, 320.548)
    BBOX:car(2) 0.871704, (86.6853, 233.949, 142.035, 281.4)
    BBOX:car(2) 0.857452, (316.556, 228.92, 358.95, 260.397)
    BBOX:car(2) 0.854294, (364.961, 211.574, 482.898, 294.025)
    BBOX:car(2) 0.828323, (298.004, 231.673, 322.384, 252.117)
    BBOX:car(2) 0.809814, (122.821, 228.76, 168.794, 268.967)
    BBOX:car(2) 0.768341, (159.306, 230.32, 187.039, 261.545)
    BBOX:car(2) 0.689728, (262.998, 232.582, 276.37, 243.308)
    BBOX:car(2) 0.557953, (229.21, 232.742, 246.731, 241.766)
    BBOX:car(2) 0.53157, (277.398, 232.602, 296.908, 241.041)
    BBOX:car(2) 0.522827, (170.016, 214.851, 214.887, 258.137)
    BBOX:truck(7) 0.355202, (173.136, 216.022, 215.157, 256.622)
save file : result.jpg
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/segmentation_detection_result.webp"/>
   segmentation and objection detection result
</div>

## Python 应用 demo

:::tip
使用 Python 进行模型推理前，请确保已经进入安装了 [**dx-engine Python 库**](dx-rt#安装-dx-rt-python-库)的虚拟环境
:::

### ImageNet Python 示例

源码位置 `./templates/python/imageNet_example.py`

<NewCodeBlock tip="Host" type="device">

```bash
python3 ./templates/python/imageNet_example.py --config example/run_classifier/imagenet_example.json
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ python3 ./templates/python/imageNet_example.py --config example/run_classifier/imagenet_example.json
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/EfficientNetB0_4.dxnn
  Task[0] npu_0, NPU, NPU memory usage 21199872 bytes (input 157696 bytes, output 2 bytes)
   inputs
     data, UINT8, [1, 224, 704 ], 0
   outputs
     argmax_output, UINT16, [1 ], 0


[DX-APP Notify] single run inference using run

[sample/ILSVRC2012/0.jpeg] Top1 Result : class 831 (studio couch, day bed)
[sample/ILSVRC2012/1.jpeg] Top1 Result : class 321 (admiral)
[sample/ILSVRC2012/2.jpeg] Top1 Result : class 846 (table lamp)
[sample/ILSVRC2012/3.jpeg] Top1 Result : class 794 (shower curtain)
```

### Yolov5s Python 示例

源码位置 `templates/python/yolov5s_example.py`

<NewCodeBlock tip="Host" type="device">

```bash
python3 templates/python/yolov5s_example.py
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app$ python3 templates/python/yolov5s_example.py
DXRT v2.9.5
[  ] -> npu_0 -> [ ]
 InferenceEngine /mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/workspace/res/models/models-1_60_1/YOLOV5S_3.dxnn
  Task[0] npu_0, NPU, NPU memory usage 50736064 bytes (input 786432 bytes, output 131072 bytes)
   inputs
     images, UINT8, [1, 512, 1536 ], 0
   outputs
     BBOX, BBOX, [1, unknown ], 0


dxrt inference Done!
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-runtime/dx_app/templates/python/yolov5s_example.py:110: DeprecationWarning: Conversion of an array with ndim > 0 to a scalar is deprecated, and will error in future. Ensure you extract a single element from your array before performing this operation. (Deprecated NumPy 1.25.)
  tensor[4] = score
decoding output Done!
[Result] Detected 7 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.7701, person(0), 307, 140, 400, 363
[1] conf, classID, x1, y1, x2, y2, : 0.6203, bowl(45), 25, 359, 80, 393
[2] conf, classID, x1, y1, x2, y2, : 0.6127, bowl(45), 46, 316, 107, 347
[3] conf, classID, x1, y1, x2, y2, : 0.4740, oven(69), 0, 227, 154, 324
[4] conf, classID, x1, y1, x2, y2, : 0.4365, bowl(45), 0, 329, 69, 380
[5] conf, classID, x1, y1, x2, y2, : 0.3829, oven(69), 391, 246, 495, 358
[6] conf, classID, x1, y1, x2, y2, : 0.3426, person(0), 0, 296, 47, 333
save file : yolov5s_1.jpg
dxrt inference Done!
decoding output Done!
[Result] Detected 6 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.7209, tv(62), 2, 218, 124, 296
[1] conf, classID, x1, y1, x2, y2, : 0.6937, chair(56), 234, 259, 284, 339
[2] conf, classID, x1, y1, x2, y2, : 0.6208, chair(56), 289, 258, 346, 336
[3] conf, classID, x1, y1, x2, y2, : 0.4169, person(0), 337, 212, 371, 323
[4] conf, classID, x1, y1, x2, y2, : 0.4062, tv(62), 443, 252, 512, 316
[5] conf, classID, x1, y1, x2, y2, : 0.4052, vase(75), 439, 326, 469, 404
save file : yolov5s_2.jpg
dxrt inference Done!
decoding output Done!
[Result] Detected 4 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.7521, person(0), 6, 238, 85, 398
[1] conf, classID, x1, y1, x2, y2, : 0.7475, person(0), 113, 252, 163, 401
[2] conf, classID, x1, y1, x2, y2, : 0.5038, person(0), 266, 315, 348, 396
[3] conf, classID, x1, y1, x2, y2, : 0.3259, person(0), 166, 333, 213, 400
save file : yolov5s_3.jpg
dxrt inference Done!
decoding output Done!
[Result] Detected 1 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.7188, dog(16), 88, 104, 455, 409
save file : yolov5s_4.jpg
dxrt inference Done!
decoding output Done!
[Result] Detected 4 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.8054, horse(17), 3, 212, 209, 359
[1] conf, classID, x1, y1, x2, y2, : 0.6319, cow(19), 289, 226, 395, 316
[2] conf, classID, x1, y1, x2, y2, : 0.5420, horse(17), 0, 208, 101, 273
[3] conf, classID, x1, y1, x2, y2, : 0.5380, horse(17), 162, 217, 283, 329
save file : yolov5s_5.jpg
```

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/yolov5s_python.webp" style={{ width: '60%' }} />
    yolov5s objection detection result
</div>
