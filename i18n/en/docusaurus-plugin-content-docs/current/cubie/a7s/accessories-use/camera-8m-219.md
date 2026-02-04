---
sidebar_position: 1
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# Radxa Camera 8M 219

:::tip Usage notes

This tutorial applies to the Radxa OS system image.

:::

<Camera8M219 product='Radxa Cubie A7S' interface='31-pin 0.3 mm pitch SMD horizontal FPC connector' connect='Flip type, bottom contact' pins='31-pin connector' board='cubie-a7s'/>

## Preview the camera

Use GStreamer to preview the camera stream.

:::tip Camera device node

- Use `ls /dev/video*` to find the camera device node, and update the `device=` argument accordingly.

:::

### Preview

Run the following command on the board to preview the camera stream.

<NewCodeBlock tip="radxa@cubie-a7s$" type="device">

```
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=NV12,width=3280,height=2464,framerate=24/1  ! xvimagesink
```

</NewCodeBlock>
