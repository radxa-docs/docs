---
sidebar_position: 4
---

# Video Codec 使用指南

## 编解码设备介绍

由于我们使用的是 mainline Linux 的内核, 所以我们对应的编解码设备是 /dev/video0 /dev/video1

## 单流视频播放（H.264）

<NewCodeBlock tip="Linux$" type="device">

```bash

gst-launch-1.0 -e filesrc location="/path/to/h264/video.mp4" ! qtdemux ! queue ! h264parse ! v4l2h264dec ! autovideosink

```

</NewCodeBlock>

## 单流视频播放（H.265）

<NewCodeBlock tip="Linux$" type="device">

```bash

gst-launch-1.0 filesrc location="/path/to/h264/video.mp4" ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! fpsdisplaysink text-overlay=false video-sink="fakesink" sync=false

```

</NewCodeBlock>
