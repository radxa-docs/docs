---
sidebar_position: 6
---

# DX-APP examples

**DX-APP** is a demo application template based on the AIcore DX-M1 / DX-M1M NPU. You can use this demo as a reference to design your own AI applications.

:::tip
DX-APP depends on OpenCV and [DX-RT](./dx-rt).
:::

## Installation

### Clone the DX-ALL-SUITE repository

:::tip
Follow [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) to clone the specified version of the DX-ALL-SUITE repository.
:::

### Install dependencies

Enter the `dx-all-suite/dx-runtime/dx_app` directory.

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_app
```

</NewCodeBlock>

#### Install required dependencies

<NewCodeBlock tip="Host" type="device">

```bash
./install.sh --all
```

</NewCodeBlock>

### Build DX-APP

:::tip
DX-APP must be built inside a Python virtual environment. Use the virtual environment created when you [**build DX-RT**](./dx-rt#build-dx-rt).
:::

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh
```

</NewCodeBlock>

## Examples

### Download test models/images/videos

<NewCodeBlock tip="Host" type="device">

```bash
./setup.sh
```

</NewCodeBlock>

### ImageNet classification

<NewCodeBlock tip="Host" type="device">

```bash
./scripts/run_classifier.sh
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:/mnt/ssd/deepx/v2.1.0/dx_app$ ./scripts/run_classifier.sh
/mnt/ssd/deepx/v2.1.0/dx_app /mnt/ssd/deepx/v2.1.0/dx_app
[INFO] DX_APP_PATH: /mnt/ssd/deepx/v2.1.0/dx_app
./scripts/run_classifier.sh: line 28: [: check_valid_dir_or_symlink: unary operator expected
[INFO] Assets not found. Downloading now via setup.sh...
/mnt/ssd/deepx/v2.1.0/dx_app /mnt/ssd/deepx/v2.1.0/dx_app
[INFO] === DOCKER_VOLUME_PATH() is set ===
[INFO] (host mode detected)
[INFO]  MODEL_PATH: ./assets/models
[INFO]  models directory found. (/mnt/ssd/deepx/workspace/res/models/models-2_1_0)
[INFO] VIDEO_PATH: ./assets/videos
[INFO]  Video directory found. (/mnt/ssd/deepx/workspace/res/videos/sample_videos)
[INFO] [OK] Sample models and videos setup complete
/mnt/ssd/deepx/v2.1.0/dx_app
config json is valid
config json is valid
[sample/ILSVRC2012/0.jpeg] Top1 Result : class 905 (window shade)
[sample/ILSVRC2012/1.jpeg] Top1 Result : class 321 (admiral)
[sample/ILSVRC2012/2.jpeg] Top1 Result : class 846 (table lamp)
[sample/ILSVRC2012/3.jpeg] Top1 Result : class 794 (shower curtain)
/mnt/ssd/deepx/v2.1.0/dx_app
```

### YOLOv5s object detection

<NewCodeBlock tip="Host" type="device">

```bash
export DXRT_DYNAMIC_CPU_THREAD=ON
./scripts/run_detector.sh
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:/mnt/ssd/deepx/v2.1.0/dx_app$ ./scripts/run_detector.sh
/mnt/ssd/deepx/v2.1.0/dx_app /mnt/ssd/deepx/v2.1.0/dx_app
[INFO] DX_APP_PATH: /mnt/ssd/deepx/v2.1.0/dx_app
./scripts/run_detector.sh: line 28: [: check_valid_dir_or_symlink: unary operator expected
[INFO] Assets not found. Downloading now via setup.sh...
/mnt/ssd/deepx/v2.1.0/dx_app /mnt/ssd/deepx/v2.1.0/dx_app
[INFO] === DOCKER_VOLUME_PATH() is set ===
[INFO] (host mode detected)
[INFO]  MODEL_PATH: ./assets/models
[INFO]  models directory found. (/mnt/ssd/deepx/workspace/res/models/models-2_1_0)
[INFO] VIDEO_PATH: ./assets/videos
[INFO]  Video directory found. (/mnt/ssd/deepx/workspace/res/videos/sample_videos)
[INFO] [OK] Sample models and videos setup complete
/mnt/ssd/deepx/v2.1.0/dx_app
config json is valid
config json is valid
[app1] : entered post process thread function.
[app2] : entered post process thread function.
[app3] : entered post process thread function.
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
[DXRT] CPU TASK [cpu_0] Inference Worker - Average Input Queue Load : 32.1429%  (DXRT_DYNAMIC_CPU_THREAD: ON)
/mnt/ssd/deepx/v2.1.0/dx_app
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/run_detector.webp"/>
   run_detector demo result
</div>

## C++ demo applications

### Classification

Source file: `./demos/classification/classification_sync.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/classification -m assets/models/EfficientNetB0_4.dxnn -i sample/ILSVRC2012/1.jpeg
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/v2.1.0/dx_app$ ./bin/classification -m assets/models/EfficientNetB0_4.dxnn -i sample/ILSVRC2012/1.jpeg
modelPath: assets/models/EfficientNetB0_4.dxnn
imgFile: sample/ILSVRC2012/1.jpeg
loopTest: 1
Top1 Result : class 321
[DXAPP] [INFO] total time : 14157 us
[DXAPP] [INFO] per frame time : 14157 us
[DXAPP] [INFO] fps : 71.4286
```

### ImageNet classification

Source file: `./demos/classification/imagenet_classification.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/imagenet_classification -m assets/models/EfficientNetB0_4.dxnn -i example/imagenet_classification/imagenet_val_map.txt -p sample/ILSVRC2012/
```

</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/imagenet_result.webp"/>
   imagenet_classification demo result
</div>

### YOLOv5 object detection

Source file: `./demos/object_detection/yolo_1channel.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/yolo -m assets/models/YOLOV5S_3.dxnn -i sample/1.jpg -p 1
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/v2.1.0/dx_app$ ./bin/yolo -m assets/models/YOLOV5S_3.dxnn -i sample/1.jpg -p 1

modelpath: assets/models/YOLOV5S_3.dxnn
videoFile:
imgFile: sample/1.jpg
cameraInput: 0
rtspURL:
cfg.numBoxes: 16128
  YoloParam:
    - conf_threshold: 0.25, score_threshold: 0.3, iou_threshold: 0.4, num_classes: 80, num_layers: 3
    - LayerParam: [ name : 378, 64 x 64 x 3boxes], anchorWidth [10, 16, 33, ], anchorHeight [13, 30, 23, ], tensor index [0, ]
    - LayerParam: [ name : 439, 32 x 32 x 3boxes], anchorWidth [30, 62, 59, ], anchorHeight [61, 45, 119, ], tensor index [1, ]
    - LayerParam: [ name : 500, 16 x 16 x 3boxes], anchorWidth [116, 156, 373, ], anchorHeight [90, 198, 326, ], tensor index [2, ]
    - classes: [person, bicycle, car, motorcycle, airplane, bus, train, truck, boat, trafficlight, firehydrant, stopsign, parkingmeter, bench, bird, cat, dog, horse, sheep, cow, elephant, bear, zebra, giraffe, backpack, umbrella, handbag, tie, suitcase, frisbee, skis, snowboard, sportsball, kite, baseballbat, baseballglove, skateboard, surfboard, tennisracket, bottle, wineglass, cup, fork, knife, spoon, bowl, banana, apple, sandwich, orange, broccoli, carrot, hotdog, pizza, donut, cake, chair, couch, pottedplant, bed, diningtable, toilet, tv, laptop, mouse, remote, keyboard, cellphone, microwave, oven, toaster, sink, refrigerator, book, clock, vase, scissors, teddybear, hairdrier, toothbrush, ]
YOLO created : 16128 boxes, 80 classes,
  Detected 9 boxes.
    BBOX:person(0) 0.873049, (307.488, 138.329, 401.201, 364.832)
    BBOX:bowl(45) 0.734457, (46.3406, 315.319, 106.942, 346.32)
    BBOX:bowl(45) 0.716818, (25.4639, 359.278, 79.1976, 392.92)
    BBOX:oven(69) 0.684362, (0.127205, 227.296, 154.541, 325.347)
    BBOX:person(0) 0.617352, (-0.210583, 294.967, 48.6577, 331.301)
    BBOX:bowl(45) 0.560206, (-0.456394, 328.875, 69.3085, 379.828)
    BBOX:oven(69) 0.531655, (389.404, 246.171, 495.742, 358.992)
    BBOX:bottle(39) 0.443776, (172.721, 269.242, 200.909, 322.747)
    BBOX:pottedplant(58) 0.393512, (-0.180674, 85.4695, 51.1122, 207.897)
Result saved to result.jpg
[DXAPP] [INFO] total time : 151422 us
[DXAPP] [INFO] per frame time : 151422 us
[DXAPP] [INFO] fps : 6.62252
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-app-yolov5s.webp"/>
   yolov5s demo result
</div>

### Multi-channel object detection

Source file: `./demos/object_detection/yolo_demo_multi.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/yolo_multi -c ./example/yolo_multi/ppu_yolo_multi_demo.json
```

</NewCodeBlock>

Use the following JSON as a reference to create the configuration file.

```json
{
  "usage": "multi",
  "model_path": "./assets/models/YOLOV5S_PPU.dxnn",
  "model_name": "yolov5s_512_ppu",

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
   <img src="/en/img/aicore-dx-m1/yolo_multi.webp"/>
   yolov5s multi result
</div>

### Pose estimation

Source file: `./demos/pose_estimation/yolo_pose.cpp`

<NewCodeBlock tip="Host" type="device">

```bash
./bin/pose -m assets/models/YOLOV5Pose640_1.dxnn -i sample/7.jpg -p 0
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/v2.1.0/dx_app$ ./bin/pose -m assets/models/YOLOV5Pose640_1.dxnn -i sample/7.jpg -p 0
modelpath: assets/models/YOLOV5Pose640_1.dxnn
videoFile:
imgFile: sample/7.jpg
cameraInput: 0
[DXAPP] [WARN] The numBoxes is not set. Please check the numBoxes.
cfg.numBoxes: 25500
  YoloParam:
    - conf_threshold: 0.3, score_threshold: 0.3, iou_threshold: 0.4, num_classes: 1, num_layers: 0
    - classes: [person, ]
YOLO created : 25500 boxes, 1 classes,
  Detected 2 boxes.
    BBOX:person(0) 0.908174, (52.9721, 212.993, 228.171, 448.604)
    BBOX:person(0) 0.892166, (316.646, 232.729, 448.644, 428.188)
Result saved to result.jpg
[DXAPP] [INFO] total time : 157653 us
[DXAPP] [INFO] per frame time : 157653 us
[DXAPP] [INFO] fps : 6.36943
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/post_estimation_result.webp"/>
   YOLOV5Pose result
</div>

### Image segmentation

Source file: `./demos/segmentation/segmentation.cpp`

#### Image segmentation

<NewCodeBlock tip="Host" type="device">

```bash
./bin/segmentation -m assets/models/DeepLabV3PlusMobileNetV2_2.dxnn -i sample/8.jpg
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/v2.1.0/dx_app$ ./bin/segmentation -m assets/models/DeepLabV3PlusMobileNetV2_2.dxnn -i sample/8.jpg
modelpath: assets/models/DeepLabV3PlusMobileNetV2_2.dxnn
parameter: 0
imgFile: sample/8.jpg
videoFile:
cameraInput: 0
Result saved to result.jpg
[DXAPP] [INFO] total time : 316640 us
[DXAPP] [INFO] per frame time : 316640 us
[DXAPP] [INFO] fps : 3.16456

```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/segmentation_result.webp"/>
   segmentation result
</div>

#### Object detection + segmentation

<NewCodeBlock tip="Host" type="device">

```bash
./bin/od_segmentation -m0 assets/models/YOLOV5S_3.dxnn -p0 1 -m1 assets/models/DeepLabV3PlusMobileNetV2_2.dxnn -i sample/8.jpg
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~/ssd/deepx/v2.1.0/dx_app$ ./bin/od_segmentation -m0 assets/models/YOLOV5S_3.dxnn -p0 1 -m1 assets/models/DeepLabV3PlusMobileNetV2_2.dxnn -i sample/8.jpg
od_modelpath: assets/models/YOLOV5S_3.dxnn
seg_modelpath: assets/models/DeepLabV3PlusMobileNetV2_2.dxnn
imgFile: sample/8.jpg
videoFile:
cameraInput: 0
cfg.numBoxes: 16128
  YoloParam:
    - conf_threshold: 0.25, score_threshold: 0.3, iou_threshold: 0.4, num_classes: 80, num_layers: 3
    - LayerParam: [ name : 378, 64 x 64 x 3boxes], anchorWidth [10, 16, 33, ], anchorHeight [13, 30, 23, ], tensor index [0, ]
    - LayerParam: [ name : 439, 32 x 32 x 3boxes], anchorWidth [30, 62, 59, ], anchorHeight [61, 45, 119, ], tensor index [1, ]
    - LayerParam: [ name : 500, 16 x 16 x 3boxes], anchorWidth [116, 156, 373, ], anchorHeight [90, 198, 326, ], tensor index [2, ]
    - classes: [person, bicycle, car, motorcycle, airplane, bus, train, truck, boat, trafficlight, firehydrant, stopsign, parkingmeter, bench, bird, cat, dog, horse, sheep, cow, elephant, bear, zebra, giraffe, backpack, umbrella, handbag, tie, suitcase, frisbee, skis, snowboard, sportsball, kite, baseballbat, baseballglove, skateboard, surfboard, tennisracket, bottle, wineglass, cup, fork, knife, spoon, bowl, banana, apple, sandwich, orange, broccoli, carrot, hotdog, pizza, donut, cake, chair, couch, pottedplant, bed, diningtable, toilet, tv, laptop, mouse, remote, keyboard, cellphone, microwave, oven, toaster, sink, refrigerator, book, clock, vase, scissors, teddybear, hairdrier, toothbrush, ]
YOLO created : 16128 boxes, 80 classes,
  Detected 13 boxes.
    BBOX:car(2) 0.89303, (0.480949, 227.935, 93.051, 302.253)
    BBOX:car(2) 0.882933, (426.194, 222.593, 511.927, 321.371)
    BBOX:car(2) 0.862958, (86.1822, 234.01, 142.1, 281.351)
    BBOX:car(2) 0.848508, (317.336, 228.731, 358.4, 260.354)
    BBOX:car(2) 0.84496, (366.256, 210.955, 482.539, 293.438)
    BBOX:car(2) 0.818492, (297.631, 231.888, 322.464, 252.024)
    BBOX:car(2) 0.777943, (122.689, 229.362, 168.695, 268.896)
    BBOX:car(2) 0.711904, (158.728, 229.85, 187.161, 261.946)
    BBOX:car(2) 0.666848, (262.793, 232.572, 276.692, 243.45)
    BBOX:car(2) 0.52669, (169.424, 215.719, 215.506, 257.233)
    BBOX:car(2) 0.514303, (277.343, 232.588, 296.351, 241.116)
    BBOX:car(2) 0.506402, (228.703, 232.507, 246.448, 241.995)
    BBOX:truck(7) 0.343093, (173.549, 215.718, 214.675, 256.886)
Result saved to result.jpg
[DXAPP] [INFO] total time : 300656 us
[DXAPP] [INFO] per frame time : 300656 us
[DXAPP] [INFO] fps : 3.33333
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/segmentation_detection_result.webp"/>
   segmentation and objection detection result
</div>

## Python demo applications

:::tip
Before running inference in Python, make sure you have activated the virtual environment where the [**dx-engine Python library**](dx-rt#install-dx-rt-python-library) is installed.
:::

Install Python dependencies.

<NewCodeBlock tip="Host" type="device">

```bash
pip install -r ./templates/python/requirements.txt
```

</NewCodeBlock>

### ImageNet Python example

Source file: `./templates/python/imageNet_example.py`

<NewCodeBlock tip="Host" type="device">

```bash
python3 ./templates/python/imageNet_example.py --config example/run_classifier/imagenet_example.json
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/v2.1.0/dx_app$ python3 ./templates/python/imageNet_example.py --config example/run_classifier/imagenet_example.json
[DX-APP Notify] single run inference using run

[sample/ILSVRC2012/0.jpeg] Top1 Result : class 905 (window shade)
[sample/ILSVRC2012/1.jpeg] Top1 Result : class 321 (admiral)
[sample/ILSVRC2012/2.jpeg] Top1 Result : class 846 (table lamp)
[sample/ILSVRC2012/3.jpeg] Top1 Result : class 794 (shower curtain)
```

### YOLOv5s Python example

Source file: `templates/python/yolov5s_example.py`

<NewCodeBlock tip="Host" type="device">

```bash
python3 templates/python/yolov5s_example.py
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/v2.1.0/dx_app$ python3 templates/python/yolov5s_example.py
dxrt inference Done!
decoding output Done!
[Result] Detected 11 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.8739, person(0), 383, 66, 501, 348
[1] conf, classID, x1, y1, x2, y2, : 0.7595, bowl(45), 57, 288, 133, 327
[2] conf, classID, x1, y1, x2, y2, : 0.7423, bowl(45), 31, 342, 98, 385
[3] conf, classID, x1, y1, x2, y2, : 0.6719, oven(69), 0, 170, 191, 300
[4] conf, classID, x1, y1, x2, y2, : 0.5923, bowl(45), 0, 303, 86, 368
[5] conf, classID, x1, y1, x2, y2, : 0.5887, oven(69), 487, 201, 621, 342
[6] conf, classID, x1, y1, x2, y2, : 0.5675, person(0), 0, 263, 60, 307
[7] conf, classID, x1, y1, x2, y2, : 0.4376, potted plant(58), 0, 0, 62, 151
[8] conf, classID, x1, y1, x2, y2, : 0.3855, bottle(39), 215, 231, 251, 297
[9] conf, classID, x1, y1, x2, y2, : 0.3226, cup(41), 147, 268, 171, 302
[10] conf, classID, x1, y1, x2, y2, : 0.3183, bowl(45), 155, 167, 181, 185
save file : yolov5s_1.jpg
dxrt inference Done!
decoding output Done!
[Result] Detected 9 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.8261, chair(56), 291, 215, 355, 318
[1] conf, classID, x1, y1, x2, y2, : 0.7895, tv(62), 2, 164, 155, 266
[2] conf, classID, x1, y1, x2, y2, : 0.7772, chair(56), 361, 215, 433, 311
[3] conf, classID, x1, y1, x2, y2, : 0.6629, person(0), 422, 158, 463, 296
[4] conf, classID, x1, y1, x2, y2, : 0.6128, vase(75), 548, 299, 586, 399
[5] conf, classID, x1, y1, x2, y2, : 0.5882, tv(62), 553, 208, 640, 286
[6] conf, classID, x1, y1, x2, y2, : 0.5303, person(0), 385, 171, 403, 211
[7] conf, classID, x1, y1, x2, y2, : 0.4672, dining table(60), 470, 360, 637, 423
[8] conf, classID, x1, y1, x2, y2, : 0.4226, refrigerator(72), 451, 168, 510, 290
save file : yolov5s_2.jpg
dxrt inference Done!
decoding output Done!
[Result] Detected 17 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.8743, person(0), 18, 476, 318, 1068
[1] conf, classID, x1, y1, x2, y2, : 0.8742, person(0), 420, 528, 615, 1080
[2] conf, classID, x1, y1, x2, y2, : 0.7187, person(0), 993, 753, 1308, 1068
[3] conf, classID, x1, y1, x2, y2, : 0.6268, person(0), 622, 832, 795, 1080
[4] conf, classID, x1, y1, x2, y2, : 0.5648, person(0), 300, 870, 487, 1076
[5] conf, classID, x1, y1, x2, y2, : 0.5136, person(0), 1785, 791, 1920, 1076
[6] conf, classID, x1, y1, x2, y2, : 0.5084, backpack(24), 802, 881, 903, 1061
[7] conf, classID, x1, y1, x2, y2, : 0.4755, backpack(24), 1083, 963, 1290, 1080
[8] conf, classID, x1, y1, x2, y2, : 0.4404, person(0), 1732, 723, 1841, 982
[9] conf, classID, x1, y1, x2, y2, : 0.4285, person(0), 1657, 630, 1725, 855
[10] conf, classID, x1, y1, x2, y2, : 0.4195, person(0), 1597, 750, 1710, 967
[11] conf, classID, x1, y1, x2, y2, : 0.4082, person(0), 885, 787, 1012, 1061
[12] conf, classID, x1, y1, x2, y2, : 0.4081, person(0), 236, 693, 393, 1057
[13] conf, classID, x1, y1, x2, y2, : 0.4052, person(0), 1466, 742, 1578, 922
[14] conf, classID, x1, y1, x2, y2, : 0.3827, person(0), 817, 570, 903, 840
[15] conf, classID, x1, y1, x2, y2, : 0.3682, person(0), 1338, 791, 1511, 1076
[16] conf, classID, x1, y1, x2, y2, : 0.3127, person(0), 690, 588, 746, 765
save file : yolov5s_3.jpg
dxrt inference Done!
decoding output Done!
[Result] Detected 1 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.8201, dog(16), 187, 91, 1073, 808
save file : yolov5s_4.jpg
dxrt inference Done!
decoding output Done!
[Result] Detected 4 Boxes.
[0] conf, classID, x1, y1, x2, y2, : 0.8946, horse(17), 1, 190, 315, 409
[1] conf, classID, x1, y1, x2, y2, : 0.7735, cow(19), 436, 212, 597, 346
[2] conf, classID, x1, y1, x2, y2, : 0.7386, horse(17), 0, 184, 150, 280
[3] conf, classID, x1, y1, x2, y2, : 0.7217, horse(17), 244, 197, 428, 366
save file : yolov5s_5.jpg
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/yolov5s_python.webp" style={{ width: '60%' }} />
    yolov5s objection detection result
</div>

## Build DX-APP documentation

:::tip
For more details on how to use DX-APP, build the full documentation and refer to it.
:::

### Install MkDocs

<NewCodeBlock tip="Host" type="device">

```bash
pip install mkdocs mkdocs-material mkdocs-video pymdown-extensions mkdocs-with-pdf markdown-grid-tables
```

</NewCodeBlock>

### Build the docs

<NewCodeBlock tip="Host" type="device">

```bash
cd docs
mkdocs build
```

</NewCodeBlock>

After the build finishes, `DEEPX_DX-APP_UM_v2.1.0.pdf` will be generated in the current directory.

### Serve the docs

You can access the documentation website in a browser.

<NewCodeBlock tip="Host" type="device">

```bash
mkdocs serve
```

</NewCodeBlock>
