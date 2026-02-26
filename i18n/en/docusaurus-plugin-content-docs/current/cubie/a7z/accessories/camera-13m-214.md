---
sidebar_position: 1
---

import Camera13M214 from '../../../common/accessories/\_camera-13m-214.mdx';

# Radxa Camera 13M 214

<Camera13M214 product='Radxa Cubie A7Z' interface='31-Pin 0.3 mm pitch SMD horizontal FPC connector' connect='Flip type, bottom contact' pins='31-Pin connector' board='cubie-a7z' />

## Preview the camera

Use GStreamer to preview the camera image.

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=4208,height=3120,framerate=24/1  ! xvimagesink
```

</NewCodeBlock>
