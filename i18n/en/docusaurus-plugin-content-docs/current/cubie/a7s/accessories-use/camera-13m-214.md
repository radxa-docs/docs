---
sidebar_position: 1
---

import Camera13M214 from '../../../common/accessories/\_camera-13m-214.mdx';

# Radxa Camera 13M 214

:::tip Usage notes

This tutorial applies to the Radxa OS system image.

:::

<Camera13M214 product='Radxa Cubie A7S' interface='31-pin 0.3 mm pitch SMD horizontal FPC connector' connect='Flip type, bottom contact' pins='31-pin connector' board='cubie-a7s'/>

## Preview the camera

Use GStreamer to preview the camera stream.

:::tip Camera device node

- Use `ls /dev/video*` to find the camera device node, and update the `device=` argument accordingly.

:::

### Preview

Run the following command on the board to preview the camera stream.

<NewCodeBlock tip="radxa@cubie-a7s$" type="device">

```
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=4208,height=3120,framerate=24/1 ! xvimagesink
```

</NewCodeBlock>
