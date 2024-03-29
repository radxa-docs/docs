---
sidebar_position: 5
---

# Radxa Camera 8M

Radxa CM5 IO Camera0 接口，使用反向15pin排线，兼容的摄像头有：  
Radxa Camera 8M、OKDO 5MP、RPI Camera V13、RPI Camera V2。

## 以连接Radxa Camera 8M为例：

![Camera-8M 安装](/img/cm5/cm5io-8m-camera-connected.webp)

- 准备好 Radxa Camera 8M，通过 FPC 线接上 Radxa CM5 IO板的Camera 0接口。

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令：

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- 通过[设备树配置](../radxa-os/sys-config/rsetup#overlays)来启用瑞莎 8M 摄像头的 Overlay。

:::caution [注意]

1. 请启用 `[] Enable Radxa Camera 8M 219 on CSI0` 项 Overlay。
2. 在启用成功显示 `[*] Enable Radxa Camera 8M 219 on CSI0` 后退出reboot重启才能使配置生效。

:::

## 测试 Radxa Camera 8M

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
