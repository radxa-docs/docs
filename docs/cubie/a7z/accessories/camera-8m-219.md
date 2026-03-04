---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/accessories/_camera-8m-219.mdx
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# 瑞莎 8M 219 摄像头

<Camera8M219 product='瑞莎 Cubie A7Z' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin 接口' board='cubie-a7z' />

## 预览摄像头

使用 GStreamer 预览摄像头画面。

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=NV12,width=3280,height=2464,framerate=24/1  ! xvimagesink
```

</NewCodeBlock>
