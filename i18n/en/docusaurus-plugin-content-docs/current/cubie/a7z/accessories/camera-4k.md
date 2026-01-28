---
sidebar_position: 1
---

import Camera4K from '../../../common/accessories/\_camera-4k.mdx';

# Radxa Camera 4K

<Camera4K product='Radxa Cubie A7Z' interface='31-Pin 0.3 mm pitch SMD horizontal FPC connector' connect='Flip type, bottom contact' pins='31-Pin connector' board='cubie-a7z' enable_camera='Enable Radxa Camera 4K' />

## Preview the camera

Use GStreamer to preview the camera image.

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=3840,height=2160,framerate=24/1  ! xvimagesink
```

</NewCodeBlock>
