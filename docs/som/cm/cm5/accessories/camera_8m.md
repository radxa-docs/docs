---
sidebar_position: 5
---

# 瑞莎 8M 摄像头

瑞莎 CM5 载板 Camera0 接口，使用反向15pin排线，兼容的摄像头有：  
瑞莎 8M 摄像头、OKDO 5MP 摄像头、树莓派 V1.3 摄像头和树莓派 V2 摄像头。

## 连接瑞莎 8M 摄像头

![Camera-8M 安装](/img/cm5/cm5io-8m-camera-connected.webp)

- 准备好瑞莎 8M 摄像头，通过 FPC 排线连接到瑞莎 CM5 载板的 Camera 0 接口。

- 单击左下角的 Application Launcher（应用程序启动器），打开 Konsole 终端并运行 `rsetup` 命令：

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- 通过[设备树配置](../radxa-os/sys-config/rsetup#overlays)来启用瑞莎 8M 摄像头的 Overlay。

:::caution [注意]

1. 请启用 `[] Enable Radxa Camera 8M 219 on CSI0` 项 Overlay。
2. 显示 `[*] Enable Radxa Camera 8M 219 on CSI0` 表示启用成功。退出配置界面并重启系统，使配置生效。

:::

## 测试瑞莎 8M 摄像头

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
