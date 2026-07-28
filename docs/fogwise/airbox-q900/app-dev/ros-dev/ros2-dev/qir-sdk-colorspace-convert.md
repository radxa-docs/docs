---
sidebar_position: 9
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# 颜色空间转换

在 NV12 和 RGB888 格式之间进行颜色空间转换。Qualcomm 智能设备默认使用 NV12 格式，而常见的图像处理格式为 RGB888。该示例支持 DMA-BUF 输入输出和 QRB ROS Transport 零拷贝传输，提供 GPU（OpenGL ES）和 CPU（OpenCV）两种后端。

以下验证使用 CPU/OpenCV 后端，无需显示器或 GPU。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)

## 源码构建

### 步骤 1：克隆仓库

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_color_space_convert.git
```

</NewCodeBlock>

### 步骤 2：构建（CPU/OpenCV 后端）

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd qrb_ros_color_space_convert
source /opt/ros/jazzy/setup.bash
colcon build --packages-up-to qrb_ros_colorspace_convert \
  --cmake-args -DUSE_OPENCV_BACKEND=ON -DBUILD_TESTING=OFF
```

</NewCodeBlock>

> GPU 后端使用 OpenGL ES，需安装 `qcom-adreno-dev` 和 `weston`，CMake 参数为 `-DUSE_OPENCV_BACKEND=OFF`，并需连接显示器。

## 运行

需要一个自定义 ROS 节点发布测试图像到 `/image_raw`。以下以 Python 测试脚本为例。

**终端 1** — 启动转换节点：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd qrb_ros_color_space_convert
source /opt/ros/jazzy/setup.bash
source install/setup.bash
ros2 launch qrb_ros_colorspace_convert colorspace_convert.launch.py \
  conversion_type:=nv12_to_rgb8 latency_fps_test:=False
```

</NewCodeBlock>

**终端 2** — 运行测试脚本：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd qrb_ros_color_space_convert
source /opt/ros/jazzy/setup.bash
source install/setup.bash
python3 test/colorspace_ros_test.py nv12_to_rgb8 \
  --output artifacts/data/nv12_to_rgb8.raw
```

</NewCodeBlock>

测试脚本发布 64×48 已知图案到 `/image_raw`，订阅 `/image` 并与独立 OpenCV 参考结果逐字节比较。

反向转换（RGB8 → NV12）将 `conversion_type` 和脚本参数改为 `rgb8_to_nv12` 即可。

## 预期输出

```text
mode=nv12_to_rgb8
input=nv12
output=rgb8
width=64
height=48
max_error=0
mean_error=0.000000
result=PASS
```

`max_error=0` 表示有效像素区域数据完全一致。
