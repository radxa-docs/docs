---
sidebar_position: 7
---

# WebGL User Guide

This guide shows how to verify that WebGL (GPU-accelerated rendering) is working in the browser on the Dragon Q6A.

:::tip
If you are working over SSH, make sure the board is connected to a display and you are in a desktop session. Otherwise, the browser may not enable GPU acceleration correctly.
:::

## Install chromium-browser

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo apt update
sudo apt install chromium-browser
```

</NewCodeBlock>

## Run chromium-browser

Start chromium-browser:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
chromium-browser
```

</NewCodeBlock>

Open either of the following pages to check WebGL support:

- https://webglreport.com/
- https://get.webgl.org/

If WebGL is reported as unavailable, open `chrome://gpu` and check the Graphics Feature Status to confirm whether hardware acceleration is enabled.
