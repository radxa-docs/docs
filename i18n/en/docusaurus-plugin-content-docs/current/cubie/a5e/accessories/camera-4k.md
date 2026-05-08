---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/accessories/_camera-4k.mdx
---

import Camera4K from '../../../common/accessories/\_camera-4k.mdx';

# Radxa Camera 4K

<Camera4K product='Radxa Cubie A5E' interface='31-Pin 0.3 mm pitch SMD horizontal FPC connector' connect='Flip type, bottom contact' pins='31-Pin' pitch='0.3mm pitch' orientation='opposite side' board='cubie-a5e' enable_camera='Enable Radxa Camera 4K' />

## Preview the camera

Use GStreamer to preview the camera image.

<NewCodeBlock tip='radxa@cubie-a5e$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=I420,width=3840,height=2160,framerate=30/1  ! xvimagesink
```

</NewCodeBlock>

### 4208x3120

<NewCodeBlock tip='radxa@cubie-a5e$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=I420,width=4208,height=3120,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>
