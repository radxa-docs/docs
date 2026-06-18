---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/accessories/_camera-4k.mdx
---

import Camera4K from '../../../common/accessories/\_camera-4k.mdx';

# 瑞莎 4K 摄像头

<Camera4K product='瑞莎 Cubie A7Z' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin' pitch='0.3mm 间距' orientation='异面' board='cubie-a7z' enable_camera='Enable Radxa Camera 4K'/>

## 安装 GStreamer

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
sudo apt-get update
sudo apt-get install -y gstreamer1.0-tools gstreamer1.0-plugins-base-apps
```

</NewCodeBlock>

## 预览摄像头

使用 GStreamer 预览摄像头画面。

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=3840,height=2160,framerate=30/1  ! xvimagesink
```

</NewCodeBlock>
