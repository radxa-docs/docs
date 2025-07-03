---
sidebar_position: 3
---

# ROS1 快速体验（Turtlesim）

使用小海龟 (Turtlesim) 案例快速体验 ROS1 常见基础概念和功能。

:::tip
该教程基于 ROS1 Noetic 的 Docker 镜像操作，但不局限于 Docker 环境，任何 ROS1 环境都可以操作。

若您是基于 Docker 环境操作，建议你先看以下教程：

- [Docker 安装](../../virtual-env/docker_install)
- [Docker 使用](../../virtual-env/docker_use)
  :::

## 启动 Docker 脚本

使用以下命令启动 Docker 脚本：`ros_noetic.sh` 是在 [ROS1 环境搭建](./install_env) 中创建的脚本。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
bash ros_noetic.sh
```
</NewCodeBlock>

建议使用多个终端进入同一个 Docker 容器中，方便后续操作。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 启动 Master 节点

ROS1 需要先启动 Master 节点，再启动 Turtlesim 节点。

<NewCodeBlock tip="radxa@docker$" type="device">
```
roscore
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 启动 Turtlesim

使用以下命令启动 Turtlesim：

<NewCodeBlock tip="radxa@docker$" type="device">
```
rosrun turtlesim turtlesim_node
```
</NewCodeBlock>

该命令会创建 `/turtlesim` 节点和显示一个包含小海龟的窗口。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 控制 Turtlesim

使用以下命令控制小海龟移动：

<NewCodeBlock tip="radxa@docker$" type="device">
```
rosrun turtlesim turtle_teleop_key
```
</NewCodeBlock>

该命令会创建 `/teleop_turtle` 节点。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
鼠标点击并停留在这个键盘控制的终端窗口，我们可以通过键盘上的方向键控制小海龟移动。
:::

## ROS1 基础概念

通过 Turtlesim 案例，我们可以进一步了解和使用 ROS1 的基础概念和命令。

:::tip
关闭正在运行的 ROS1 命令，可以使用 `Ctrl + C` 组合键。
:::

### ROS1 节点

节点是 ROS1 中的基本通信单元，通过发布者（Publisher）和订阅者（Subscriber）与其他节点交互。

:::tip
**关键组成**：

- **发布者**：向话题（Topic）发布消息的接口
- **订阅者**：从话题接收消息的接口
  :::

#### 查看节点

使用 `rosnode list` 命令查看节点：目前只运行启动 Turtlesim 的命令。

<NewCodeBlock tip="radxa@docker$" type="device">
```
rosnode list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### ROS1 话题

话题是 ROS1 中的发布/订阅通信机制，实现节点间的异步数据传输。

:::tip
**通信角色**：

- **发布者**：将消息发送到指定话题
- **订阅者**：订阅话题并接收消息
  :::

#### 查看话题

使用 `rostopic list` 命令查看话题：

<NewCodeBlock tip="radxa@docker$" type="device">
```
rostopic list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 发布话题

使用 `rostopic pub` 命令发布速度控制消息，让小乌龟移动：

```
rostopic pub -r 10 /turtle1/cmd_vel geometry_msgs/Twist "{linear: {x: 0.5, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.5}}"
```

该命令会以 10 Hz 的频率让小海龟以线速度 0.5 和角速度 0.5 移动。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 订阅话题

使用 `rostopic echo` 命令订阅话题，查看话题消息：

<NewCodeBlock tip="radxa@docker$" type="device">
```
rostopic echo -n 1 /turtle1/pose
```
</NewCodeBlock>
该命令会在终端打印一次小海龟的位置。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### ROS1 服务

服务是 ROS1 中的请求/响应通信机制，用于节点间的同步调用（如远程函数）。

:::tip
**交互流程**：

- **客户端**：发送请求（Request）
- **服务端**：处理请求并返回响应（Response）
  :::

#### 查看服务

使用 `rosservice list` 命令查看服务：

<NewCodeBlock tip="radxa@docker$" type="device">
```
rosservice list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 调用服务

使用 `rosservice call` 命令调用服务，让小乌龟清屏：

<NewCodeBlock tip="radxa@docker$" type="device">
```
rosservice call /clear
```
</NewCodeBlock>

该命令会清除Turtlesim窗口中的背景。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/ros1-turtlesim-10.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
