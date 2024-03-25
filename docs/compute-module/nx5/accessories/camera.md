---
sidebar_position: 4
---

# 摄像头

目前支持以下3款摄像头产品：

1. OKDO 5MP Camera (ov5647)
2. Raspberry Camera v1.3 (ov5647)
3. Raspberry Camera v2 (imx219)

以下采用 'Raspberry Camera v2' 演示操作的流程,其他摄像头类似。

## 配置

- 准备好 raspberry camera v2，通过 FPC 线接上 NX5 IO 的 CSI 接口。

- 打开终端运行 `sudo rsetup` 命令：

```bash
radxa@radxa-nx5-io:~$ sudo rsetup
```

- 通过[设备树配置](../radxa-os/sys-config/rsetup#overlays)来启用摄像头的 overlay。

:::caution [注意]

1. 请启用 `[] Enable Raspberry Pi Camera v2 on CAM0` 项 overlay。
2. 在启用成功显示 `[*] Enable Raspberry Pi Camera v2 on CAM0` 回车键确认后退出重启才能使配置生效。
3. 其他产品请根据描述开启相应的overlay。

:::

## 图像预览

摄像头的实时预览推荐使用 cheese，运行以下命令安装 cheese：

```bash
sudo apt update
sudo apt install cheese
```

进入桌面后打开终端执行以下命令即可开始实施预览摄像头：

```bash
sudo cheese
```

你也可以使用终端命令打开相机预览:

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink
```

使用以下命令拍照:

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg
```

使用以下命令拍摄视频:

```bash
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```
