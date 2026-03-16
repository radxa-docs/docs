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
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=4208,height=3120,framerate=24/1 ! xvimagesink
```

</NewCodeBlock>

## 已验证环境与常用管线

以下说明基于 issue #1360 中确认过的 Cubie A7Z 实测结果整理，适合先做快速自检。

- 已验证镜像：`radxa-a733_bullseye_kde_r2.output_512.img.xz`
- 全分辨率预览：使用 `/dev/video1`，分辨率 `4208x3120`，并保持 `en-largemode=1`
- 1080p 预览：使用 `/dev/video0`，分辨率 `1920x1080`，并使用 `en-largemode=0`
- 当前软件流中，更低分辨率未在该 issue 对应环境下完成验证；如果直接切到更低分辨率，可能出现画面异常

### 1080p 预览

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>

## 排障

- 如果系统中没有出现 `/dev/video*` 节点，请先确认使用的是最新可用官方镜像，再重新插拔并检查 FPC 排线是否压紧、方向是否正确
- 如果需要先确认摄像头是否已经被内核识别，可运行 `v4l2-ctl --list-devices`
- 如需复现本文档中的已验证结果，建议优先使用上方两条已验证管线，不要一开始就切换到未验证的低分辨率参数
