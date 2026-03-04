---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/accessories/_camera-8m-219.mdx
---

import Camera8M219 from '../../../common/accessories/\_camera-8m-219.mdx';

# Radxa Camera 8M 219

<Camera8M219 product='Radxa Cubie A7Z' interface='31-Pin 0.3 mm pitch SMD horizontal FPC connector' connect='Flip type, bottom contact' pins='31-Pin connector' board='cubie-a7z' />

## Preview the camera

Use GStreamer to preview the camera image.

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=NV12,width=3280,height=2464,framerate=24/1  ! xvimagesink
```

</NewCodeBlock>
