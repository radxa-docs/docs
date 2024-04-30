---
sidebar_position: 2
---

# 摄像头

## CSI 接口定义

Radxa ZERO 3 拥有一个22 PIN 的CSI 接口,接口定义如下:

![zero3w csi1](/img/zero/zero3/zero3w-csi1.webp)

![zero3w csi](/img/zero/zero3/zero3w-csi.webp)

目前支持的摄像头有:

- Raspberry Pi Camera V1.3 (OV5647)
- Raspberry Pi Camera V2 (IMX219)
- Radxa Camera 8M (IMX219)

## 使用方法

### 系统配置

- 开启摄像头 overlay, 选择启用对应的 overlay
- 本教程使用的是 Raspberry Pi Camera V1.3，使用其他的摄像头请摄像头型号请选择启用对应的 overlay

```bash
sudo rsetup
```

![zero3w camera1](/img/zero/zero3/zero3w-camera1.webp)

确认之后重启生效

### 硬件连接

硬件连接如下

:::tip
请注意 camera 排线的接口朝向！
:::

![zero3w camera2](/img/zero/zero3/zero3w-camera2.webp)

### 图像预览

摄像头的实时预览推荐使用 cheese，运行以下命令安装 cheese：

```bash
sudo apt update
sudo apt install cheese
```

进入桌面后打开终端执行以下命令即可开始实施预览摄像头：

```bash
sudo cheese
```

![zero3w camera3](/img/zero/zero3/zero3w-camera3.webp)

也可以使用指令拍照：

```bash
gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=/home/radxa/test.jpg
```

![zero3w camera4](/img/zero/zero3/zero3w-camera4.webp)

执行指令，开始读秒后按下 `Ctrl + C`即可拍照, 照片路径为 `/home/radxa/test.jpg`

### 常见问题排查

- 抓图提示无法打开 /dev/video0 设备

```bash
radxa@radxa-zero3:~$ gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=/home/radxa/test.jpg
Setting pipeline to PAUSED ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Cannot identify device '/dev/video0'.
Additional debug info:
../sys/v4l2/v4l2_calls.c(608): gst_v4l2_open (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
system error: No such file or directory
ERROR: pipeline doesn't want to preroll.
Failed to set pipeline to PAUSED.
Setting pipeline to NULL ...
Freeing pipeline ...
```

这个问题可能是 overlay 未成功使能导致，重新执行 rsetup 操作，查看 /boot/extlinux/extlinux.conf
文件，确认 overlay 是否添加，如果添加成功 extlinux.conf 文件中会有如下条目：

```bash
...
fdtoverlays  /boot/dtbo/radxa-zero3-rpi-camera-v1.3.dtbo
...
```
