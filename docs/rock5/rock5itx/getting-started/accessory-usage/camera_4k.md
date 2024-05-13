---
sidebar_position: 4
---

# 瑞莎 4K 摄像头

![Radxa Camera 4K](/img/accessories/camera-4k.webp)

## 概述

Radxa Camera 4K 是一款适用于 Radxa 产品的高分辨率相机模块，采用索尼 IMX415 图像传感器，具有 829 万像素和高达 4K 的分辨率。 Radxa Camera 4K Module 可用于以下应用：

- 监控摄像头
- FA相机
- 工业相机

## 规格

- 传感器：
  - SONY IMX415
  - 对角线 6.43 mm ( 1/2.8 型 )
  - 8.29万像素
  - Unit cell size: 1.45 µm (H) × 1.45 µm (V)
- Output:
  - MIPI CSI‑2 4‑通道串行数据输出
  - RAW10 / RAW12 输出
- 镜头规格:
  - 接口类型： M12XP0.5
  - 焦距（EFL）：2.95±5%mm
  - 后焦距: 4.64mm
  - 镜间距: 4.00mm
  - 工作温度：‑40°C ~ +85°C
  - FOV

| 视野（对角线/水平/垂直）  | CRA |
| ------------------------- | --- |
| D=88.2±5° H=75±3° V=59±2° | 15° |

- 默认带状电缆长度: 150 mm

## 数据手册

- [Radxa Camera 4K](https://dl.radxa.com/accessories/camera-4k/radxa_camera_4k_product_brief_Revision_1.0.pdf)
- [SONY IMX415](https://dl.radxa.com/accessories/camera-4k/IMX415-AAQR-C_Datasheet_E19504.pdf)

## 物理规格

![Radxa Display 8 HD](/img/accessories/camera-4k-spec-1.webp)
![Radxa Display 8 HD](/img/accessories/camera-4k-spec-2.webp)

## 使用教程

### 连接

通过 FPC 线接上 ROCK 5 ITX，如图所示：

<img src="/img/rock5itx/rock5itx-cam1.webp" alt="rock5itx cam1 connection" width="300" />

### 开启 Overlay

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令：

```bash
radxa@rock-5itx:~$ rsetup
```

- 通过[设备树配置](../os-config/rsetup#overlays)来启用瑞莎 4K 摄像头的 Overlay。

:::tip

1. 请启用 `[] Enable Radxa Camera 4K on CAM1` 项 Overlay。
2. 在启用成功显示 `[*] Enable Radxa Camera 4K on CAM1` 后退出重启才能使配置生效。

:::

### 测试

打开终端，输入以下命令打开相机预览:

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
