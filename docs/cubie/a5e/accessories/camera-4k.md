---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/accessories/_camera-4k.mdx
---

import Camera4K from '../../../common/accessories/\_camera-4k.mdx';

# 瑞莎 4K 摄像头

<Camera4K product='瑞莎 Cubie A5E' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin' pitch='0.3mm 间距' orientation='异面' board='cubie-a5e' enable_camera='Enable Radxa Camera 4K'/>

## 预览摄像头

使用 GStreamer 预览摄像头画面。

<NewCodeBlock tip='radxa@cubie-a5e$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=I420,width=3840,height=2160,framerate=30/1  ! xvimagesink
```

</NewCodeBlock>

### 4208x3120

<NewCodeBlock tip='radxa@cubie-a5e$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=I420,width=4208,height=3120,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>
