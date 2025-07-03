---
sidebar_position: 3
---

# ROS2 快速体验（Turtlesim）

使用小海龟 (Turtlesim) 案例快速体验 ROS2 常见基础概念和功能。

:::tip
该教程基于 ROS2 Humble 的 Docker 镜像操作，但不局限于 Docker 环境，任何 ROS2 环境都可以操作。

若您是基于 Docker 环境操作，建议你先看以下教程：

- [Docker 安装](../../virtual-env/docker_install)
- [Docker 使用](../../virtual-env/docker_use)
  :::

## 启动 Docker 脚本

使用以下命令启动 Docker 脚本：`ros_humble.sh` 是在 [ROS2 环境搭建](./install_env) 中创建的脚本。

<NewCodeBlock tip="radxa@docker$" type="device">
```
bash ros_humble.sh
```
</NewCodeBlock>

建议使用多个终端进入同一个 Docker 容器中，方便后续操作。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 启动 Turtlesim

使用以下命令启动 Turtlesim：

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 run turtlesim turtlesim_node
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

该命令会创建 `/turtlesim` 节点和显示一个包含小海龟的窗口。

## 控制 Turtlesim

使用以下命令控制小海龟移动：

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 run turtlesim turtle_teleop_key
```
</NewCodeBlock>

该命令会创建 `/teleop_turtle` 节点。

:::tip
鼠标点击并停留在这个键盘控制的终端窗口，我们可以通过键盘上的方向键控制小海龟移动。
:::

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## ROS2 基础概念

通过 Turtlesim 案例，我们可以进一步了解和使用 ROS2 的基础概念和命令。

:::tip
关闭正在运行的 ROS2 命令，可以使用 `Ctrl + C` 组合键。
:::

### ROS2 节点

节点是 ROS2 中的基本通信单元，通过发布者（Publisher）和订阅者（Subscriber）与其他节点交互。

:::tip
**关键组成**：

- **发布者**：向话题（Topic）发布消息的接口
- **订阅者**：从话题接收消息的接口
  :::

#### 查看节点

使用 `ros2 node list` 命令查看节点：目前只运行启动 Turtlesim 的命令。

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 node list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### ROS2 话题

话题是 ROS2 中的发布/订阅通信机制，实现节点间的异步数据传输。

:::tip
**通信角色**：

- **发布者**：将消息发送到指定话题
- **订阅者**：订阅话题并接收消息
  :::

#### 查看话题

使用 `ros2 topic list` 命令查看话题：

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 topic list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 发布话题

使用 `ros2 topic pub` 命令发布速度控制消息，让小乌龟移动：

```
ros2 topic pub /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.5, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.5}}"
```

该命令会让小海龟以线速度 0.5 和角速度 0.5 移动。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 订阅话题

使用 `ros2 topic echo` 命令订阅话题，查看话题消息：

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 topic echo /turtle1/pose --once
```
</NewCodeBlock>
该命令会在终端打印一次小海龟位置，去掉 `--once` 会一直打印小海龟位置。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### ROS2 服务

服务是 ROS2 中的请求/响应通信机制，用于节点间的同步调用（如远程函数）。

:::tip
**交互流程**：

- **客户端**：发送请求（Request）
- **服务端**：处理请求并返回响应（Response）
  :::

#### 查看服务

使用 `ros2 service list` 命令查看服务：

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 service list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 调用服务

使用 `ros2 service call` 命令调用服务，让小乌龟清屏：

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 service call /clear std_srvs/srv/Empty
```
</NewCodeBlock>

该命令会清除Turtlesim窗口中的背景。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### ROS2 动作

动作是 ROS2 中处理长时间任务的通信机制（如导航、机械臂控制），支持实时反馈。

:::tip
**三阶段交互**：

- **目标**（Goal）：客户端发起任务请求
- **反馈**（Feedback）：服务端持续推送进度
- **结果**（Result）：任务完成后返回最终结果
  :::

#### 查看动作

使用 `ros2 action list` 命令查看动作：

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 action list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-10.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 发布动作

使用 `ros2 action send_goal` 命令发布动作，让小乌龟移动到指定位置：

<NewCodeBlock tip="radxa@docker$" type="device">
```
ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute "{theta: 1.57}"
```
</NewCodeBlock>

该命令会让小海龟旋转 1.57 弧度（约 90 度）。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/turtlesim-11.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
