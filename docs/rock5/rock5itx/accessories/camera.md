---
sidebar_position: 4
---

# Camera

<img src="/img/rock5itx/rock5itx-cam1.webp" alt="rock5itx cam1 connection" width="300" />

- 准备好 Radxa Camera 4K，通过 FPC 线接上 ROCK 5 ITX。

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令：

```bash
radxa@rock-5itx:~$ rsetup
```

- 通过[设备树配置](../os-config/rsetup#overlays)来启用瑞莎 4K 摄像头的 Overlay。

:::caution
1. 请启用 `[] Enable Radxa Camera 4K on CAM1` 项 Overlay。
2. 在启用成功显示 `[*] Enable Radxa Camera 4K on CAM1` 后退出重启才能使配置生效。
:::

## 测试 Radxa Camera 4K

你也可以使用终端命令打开相机预览:

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
```

使用以下命令拍照:

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
```

使用以下命令拍摄视频:

```bash
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```
