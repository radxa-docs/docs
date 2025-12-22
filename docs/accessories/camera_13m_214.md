---
sidebar_position: 4
---

# 瑞莎 13M 214 摄像头

## 产品概述

瑞莎 13M 214 摄像头是一款专为瑞莎产品设计的高性能摄像头模组，搭载 1300 万像素索尼 IMX214 图像传感器，支持自动对焦、HDR 成像及 4K 超高清视频输出。

该摄像头适用于以下应用场景：

- 高画质图像采集

- 嵌入式视觉系统

- AI边缘计算（图像识别、视频分析等）

- 机器人视觉感知

## 产品规格

### IMX214 传感器

- 传感器尺寸：对角线 5.867mm（1 / 3.06 英寸）
- 总像素：4224（H）x 3200（V）
- 有效像素：4208（H）x 3120（V）
- 成像性能：
  - 全分辨率@30帧/秒 (普通/HDR模式)
  - 4K2K@30帧/秒 (普通/HDR模式)
  - 1080P@60帧/秒 (普通/HDR模式)
- 支持单帧高动态范围(HDR)技术，等效全像素输出

### 镜头规格

- 视场角(FOV):
  - 垂直: 51.6°
  - 水平: 66.2°
  - 对角线: 78.4°
- 有效焦距(EFL): 3.57 mm
- 光圈值(FNO): 2.0 ± 5% (无穷远对焦时)
- TV畸变(传统算法×2): < 1.5%

### 兼容主板

FPC 排线：标准 31p 0.3mm 间距排线，长度 150mm

- 瑞莎 NIO 12L
- 瑞莎 ROCK 4D
- 瑞莎 CM4 IO 板

## 机械尺寸

<div style={{textAlign: 'center'}}>
    <img src="/img/accessories/camera_13m_214_dimension.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

### 使用前提

- 标准 31p 0.3mm 间距 FPC 排线
- 瑞莎 13M 214 摄像头
- 兼容主板

### 硬件连接

使用 FPC 排线连接摄像头和主板：以 ROCK 4D 作为演示

① : 连接主板的 MIPI CSI 接口，金手指（金属接触点）朝向主板方向

② : 连接摄像头的 MIPI CSI 接口，金手指（金属接触点）朝向摄像头方向

<div style={{textAlign: 'center'}}>
    <img src="/img/accessories/rock4d-camera-13m-214.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 软件使能

在终端命令行输入 `rsetup` 命令，使用 Rsetup 工具设置显示器选项。

<NewCodeBlock tip="radxa@device$" type="device">

```
rsetup
```

</NewCodeBlock>

1. 通过方向键选择 Overlays 选项，然后按回车键确认选择。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/rsetup-overlays.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

2. 通过方向键选择 Manage overlays 选项，然后按回车键确认选择。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/rsetup-overlays-manage.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

3. 通过方向键选择对应的 Camera 选项，按空格键并出现 `*` 代表启用该功能，然后回车键确认选择。

- Camera 13M 214 → 选择 `Enable Radxa Camera 13M 214` 选项

4. 重启系统，配置生效。

## 测试摄像头

可以使用以下命令测试相机是否正常。

- 相机预览命令

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
```

- 拍摄照片命令

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
```

- 拍摄视频命令

```bash
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```

## 引脚定义

| Pin | Signal | Pin | Signal | Pin | Signal    | Pin | Signal     |
| --- | ------ | --- | ------ | --- | --------- | --- | ---------- |
| 1   | DGND   | 9   | NC     | 17  | MCN       | 25  | SDA        |
| 2   | MDN3   | 10  | DGND   | 18  | MCP       | 26  | NC         |
| 3   | MDP3   | 11  | MDN1   | 19  | DGND      | 27  | RESET      |
| 4   | DGND   | 12  | MDP1   | 20  | MCLK      | 28  | VCC3.3V    |
| 5   | MDN2   | 13  | DGND   | 21  | DGND      | 29  | VCC3.3V    |
| 6   | MDP2   | 14  | MDN0   | 22  | NC        | 30  | VCC5V / NC |
| 7   | DGND   | 15  | MDP0   | 23  | PWDN / NC | 31  | VCC5V / NC |
| 8   | NC     | 16  | DGND   | 24  | SCL       | 32  | ~          |

:::tip 注意事项

在瑞莎 13M 214 摄像头模组中，Pin 23 / 30 / 31 为悬空未连接脚位。

:::
