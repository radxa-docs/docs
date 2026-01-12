---
sidebar_position: 4
---

# Video Codec User Guide

## Introduction to Codec Devices

Since we are using the mainline Linux kernel, our corresponding encoding/decoding devices are /dev/video0 and /dev/video1

## Single Stream Video Playback (H.264)

<NewCodeBlock tip="Linux$" type="device">

```bash

gst-launch-1.0 -e filesrc location="/path/to/h264/video.mp4" ! qtdemux ! queue ! h264parse ! v4l2h264dec ! autovideosink

```

</NewCodeBlock>

## Single-stream video playback (H.265)

<NewCodeBlock tip="Linux$" type="device">

```bash

gst-launch-1.0 filesrc location="/path/to/h264/video.mp4" ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec capture-io-mode=4 output-io-mode=4 ! video/x-raw,format=NV12 ! fpsdisplaysink text-overlay=false video-sink="fakesink" sync=false

```

</NewCodeBlock>
