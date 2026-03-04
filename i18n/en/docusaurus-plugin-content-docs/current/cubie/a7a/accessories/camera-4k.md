---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/accessories/_camera-4k.mdx
---

import Camera4K from '../../../common/accessories/\_camera-4k.mdx';

# Radxa Camera 4K

<Camera4K product='Radxa Cubie A7A' interface='31-Pin 0.3 mm pitch SMD horizontal FPC connector' connect='Flip type, bottom contact' pins='31-Pin connector' board='cubie-a7a' enable_camera='Enable Radxa Camera 4K' />

## Preview the camera

Use GStreamer to preview the camera image.

<NewCodeBlock tip='radxa@cubie-a7a$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=3840,height=2160,framerate=24/1  ! xvimagesink
```

</NewCodeBlock>
