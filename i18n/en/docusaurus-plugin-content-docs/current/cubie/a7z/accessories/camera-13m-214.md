---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/accessories/_camera-13m-214.mdx
---

import Camera13M214 from '../../../common/accessories/\_camera-13m-214.mdx';

# Radxa Camera 13M 214

<Camera13M214 product='Radxa Cubie A7Z' interface='31-Pin 0.3 mm pitch SMD horizontal FPC connector' connect='Flip type, bottom contact' pins='31-Pin' pitch='0.3mm pitch' orientation='opposite side' board='cubie-a7z' />

## Preview the camera

Use GStreamer to preview the camera image.

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video1 en-awisp=1 en-largemode=1 ! video/x-raw,format=NV12,width=4208,height=3120,framerate=24/1 ! xvimagesink
```

</NewCodeBlock>

## Verified setup and common pipelines

The notes below summarize the Cubie A7Z results confirmed in issue #1360 and are intended as a quick validation baseline.

- Verified image: `radxa-a733_bullseye_kde_r2.output_512.img.xz`
- Full-resolution preview: use `/dev/video1` at `4208x3120` with `en-largemode=1`
- 1080p preview: use `/dev/video0` at `1920x1080` with `en-largemode=0`
- Lower resolutions were not fully validated in that software flow; switching directly to smaller resolutions may still produce abnormal output

### 1080p preview

<NewCodeBlock tip='radxa@cubie-a7z$' type="device">

```bash
DISPLAY=:0 gst-launch-1.0 v4l2src device=/dev/video0 en-awisp=1 en-largemode=0 ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! xvimagesink
```

</NewCodeBlock>

## Troubleshooting

- If no `/dev/video*` nodes appear, first confirm that you are using a recent official image, then reseat the FPC cable and verify its orientation and latch state
- To quickly confirm whether the camera has been detected by the kernel, run `v4l2-ctl --list-devices`
- To reproduce the validated behavior documented here, start with the two verified pipelines above before trying unvalidated lower-resolution settings
