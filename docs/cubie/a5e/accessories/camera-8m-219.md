---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/accessories/_camera-8m-219.mdx
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# 瑞莎 8M 219 摄像头

<Camera8M219 product='瑞莎 Cubie A5E' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin' pitch='0.3mm 间距' orientation='同面' board='cubie-a5e' />

## 预览摄像头

使用 GStreamer 预览摄像头画面。

<NewCodeBlock tip='radxa@cubie-a5e$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=I420,width=1920,height=1080,framerate=30/1 ! xvimagesink
```

</NewCodeBlock><NewCodeBlock tip='radxa@cubie-a5e$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=1 ! video/x-raw,format=I420,width=3280,height=2464,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>