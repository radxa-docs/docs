---
sidebar_position: 16
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-14
---

# Follow Me 人员跟随

基于 FastestDet NCNN 的人员检测与深度跟踪。仿真中的 RGB-D 相机持续检测人体，控制器根据深度和水平角度发布 `/cmd_vel`，驱动机器人跟随移动目标。

![Follow me 人员跟踪](/img/fogwise/airbox-q900/airbox-q900-qir-sdk-follow-me-tracking.webp)

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- 已连接显示器（GUI 模式）

## 源码准备

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 仿真环境
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_simulation.git
cd qrb_ros_simulation
source /opt/ros/jazzy/setup.bash
colcon build

# 相机参数文件（仅需克隆，无需构建）
cd ..
git clone -b jazzy-rel https://github.com/qualcomm-qrb-ros/qrb_ros_samples.git
```

</NewCodeBlock>

## 管线

```text
warehouse_followme_path2 演员
  → Gazebo RGB + 深度相机
  → /camera/color/image_raw + /camera/depth/image_raw
  → follow_me FastestDet NCNN 检测与深度跟踪
  → /cmd_vel
  → Gazebo AMR
```

## 模型安装

`follow_me` 预装二进制硬编码了以下模型路径：

```text
/usr/share/follow-me/model/FastestDet.param
/usr/share/follow-me/model/FastestDet.bin
/usr/share/follow-me/model/labels.txt
```

下载模型和标签文件：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo mkdir -p /usr/share/follow-me/model

sudo wget -O /usr/share/follow-me/model/FastestDet.bin \
  https://raw.githubusercontent.com/dog-qiuqiu/FastestDet/main/example/ncnn/FastestDet.bin

sudo wget -O /usr/share/follow-me/model/FastestDet.param \
  https://raw.githubusercontent.com/dog-qiuqiu/FastestDet/main/example/ncnn/FastestDet.param

sudo wget -O /usr/share/follow-me/model/labels.txt \
  https://raw.githubusercontent.com/amikelive/coco-labels/master/coco-labels-2014_2017.txt
```

</NewCodeBlock>

## 运行

所有终端使用相同环境：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=128
export ROS_LOCALHOST_ONLY=1
source qrb_ros_simulation/install/setup.bash
```

</NewCodeBlock>

### 终端 1：启动 Gazebo 仓库跟随场景

在桌面终端中运行：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch qrb_ros_sim_gazebo gazebo_robot_base_mini.launch.py \
  world_model:=warehouse_followme_path2 \
  rgb_camera_config_file:="$HOME/qrb_ros_samples/robotics/simulation_follow_me/followme_rgb_camera_params.yaml" \
  enable_laser:=false enable_imu:=false enable_depth_camera:=true
```

</NewCodeBlock>

Gazebo 启动后处于暂停状态。点击左下角播放按钮启动仿真。

### 终端 2：启动 Follow Me

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=128
export ROS_LOCALHOST_ONLY=1
follow_me
```

</NewCodeBlock>

## 预期输出

持续打印人员检测信息：

```text
Human detected - Depth: 2.00756, Angle X: -0.00312499
Human detected - Depth: 1.80109, Angle X: -0.00937472
Human detected - Depth: 1.49213, Angle X: -0.256708
Human detected - Depth: 1.78986, Angle X:  0.230219
```

Gazebo 中 AMR 应可见跟随移动演员移动。控制器发布非零 `/cmd_vel`（最高约 `linear.x = 0.396 m/s`，`angular.z = -0.310 rad/s`）。

## 限制

- `simulation_follow_me` 仅提供 Gazebo 世界和相机参数，无独立 ROS 包构建。运行时依赖 APT 预装的 `follow_me` 二进制（NCNN FastestDet 管线）。
- 最新 `sample_followme` 文档描述的是 YOLO + Re-ID 架构，与当前 Q900 APT 的 FastestDet 管线不兼容。
- 验证使用 Gazebo 仿真 RGB-D 相机和 AMR，未包含真实 Orbbec 相机或实体底盘。
