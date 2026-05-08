---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/accessories/_camera-13m-214.mdx
---

import Camera13M214 from '../../../common/accessories/\_camera-13m-214.mdx';

# 瑞莎 13M 214 摄像头

<Camera13M214 product='瑞莎 Cubie A7Z' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin' pitch='0.3mm 间距' orientation='异面' board='cubie-a7z'/>

## 预览摄像头

使用 GStreamer 预览摄像头画面。

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=4208,height=3120,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>

### 1920x1080 (1080p)

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>

### 3840x2160 (4K)

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=3840,height=2160,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>

## 排障

- 如果系统中没有出现 `/dev/video*` 节点，请先确认使用的是最新可用官方镜像，再重新插拔并检查 FPC 排线是否压紧、方向是否正确
- 如果需要先确认摄像头是否已经被内核识别，可运行 `v4l2-ctl --list-devices`
