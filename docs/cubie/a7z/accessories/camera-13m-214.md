---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/accessories/_camera-13m-214.mdx
---

import Camera13M214 from '../../../common/accessories/\_camera-13m-214.mdx';

# 瑞莎 13M 214 摄像头

<Camera13M214 product='瑞莎 Cubie A7Z' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin 接口' board='cubie-a7z'/>

## 预览摄像头

使用 GStreamer 预览摄像头画面。

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=4208,height=3120,framerate=24/1  ! xvimagesink
```

</NewCodeBlock>
