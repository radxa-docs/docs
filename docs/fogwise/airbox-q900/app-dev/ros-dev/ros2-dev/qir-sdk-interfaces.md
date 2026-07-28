---
sidebar_position: 6
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# ROS 2 接口通信验证

验证 QRB ROS 生态中自定义消息、服务和动作类型的通信接口是否正常工作。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)

## 预装版本

QIR SDK 安装后自带的接口可直接查看：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 interface package qrb_ros_tensor_list_msgs
```

</NewCodeBlock>

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 interface show qrb_ros_tensor_list_msgs/msg/Tensor
```

</NewCodeBlock>

预期输出 Tensor 消息定义（`name`、`data_type`、`shape`、`data` 字段）。

## 源码构建

源码仓库包含更新的接口定义，相比预装版本新增了 `uint16`/`float16`/`uint32`/`uint64`/`int32` 等数据类型和 DMA-BUF 零拷贝字段。

### 步骤 1：安装构建依赖

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-dev-tools colcon
```

</NewCodeBlock>

### 步骤 2：克隆源码

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/qrb_ros_ws/src && cd ~/qrb_ros_ws/src
source /opt/ros/jazzy/setup.bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_interfaces.git
```

</NewCodeBlock>

### 步骤 3：初始化 rosdep

首次使用需初始化 rosdep（之后无需重复）：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo rosdep init
sudo rosdep update
```

</NewCodeBlock>

### 步骤 4：安装依赖并构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws
source /opt/ros/jazzy/setup.bash
sudo rosdep install -i --from-path src --rosdistro jazzy -y
colcon build
```

</NewCodeBlock>

### 步骤 5：验证

开新终端，加载构建产物：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws
source install/setup.bash
ros2 interface package qrb_ros_tensor_list_msgs
ros2 interface show qrb_ros_tensor_list_msgs/msg/Tensor
```

</NewCodeBlock>

源码构建版本输出更完整的 Tensor 消息定义，包含 9 种 `data_type`（0-8）和 DMA-BUF 相关字段（`dmabuf_fd`、`dmabuf_size`、`dmabuf_offset`、`dmabuf_ptr`）。
