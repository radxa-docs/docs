---
sidebar_position: 1
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# 瑞莎 8M 219 摄像头

:::tip 使用提示

该教程适用于 Radxa OS 系统镜像。

:::

<Camera8M219 product='瑞莎 Cubie A7S' interface='31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口' connect='翻盖式，下接触' pins='31-Pin 接口' board='cubie-a7s'/>

## 预览摄像头

使用 GStreamer 工具预览摄像头画面。

:::tip 摄像头设备路径

- 请使用 `ls /dev/video*` 命令查看摄像头设备路径和更换命令中的设备路径。

:::

### 预览画面

在主板系统终端运行以下命令预览摄像头画面。

<NewCodeBlock tip="radxa@cubie-a7s$" type="device">

```
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=NV12,width=3280,height=2464,framerate=24/1  ! xvimagesink
```

</NewCodeBlock>
