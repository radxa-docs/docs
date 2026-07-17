---
sidebar_position: 13
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-13
---

# 机械臂抓取与放置

在 Gazebo 中仿真 RML-63 机械臂的 pick-and-place 操作。使用 MoveIt2 进行运动规划，OMPL 生成关节轨迹，`gz_ros2_control` 驱动仿真中的机械臂和夹爪。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- 已安装 MoveIt2：
  ```bash
  sudo apt install -y ros-jazzy-moveit
  ```
- 已连接显示器（GUI 模式）

## 源码构建

### 步骤 1：克隆仓库

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 仿真环境（如已构建可跳过）
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_simulation.git

# Pick-and-place 示例
git clone -b jazzy-rel https://github.com/qualcomm-qrb-ros/qrb_ros_samples.git
```

</NewCodeBlock>

### 步骤 2：构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 构建仿真环境
cd qrb_ros_simulation
source /opt/ros/jazzy/setup.bash
colcon build

# 构建 pick-and-place 示例
cd ../qrb_ros_samples/robotics/simulation_sample_pick_and_place
source install/setup.bash
colcon build
```

</NewCodeBlock>

## 运行

所有终端使用相同的 ROS 环境：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=55
export ROS_LOCALHOST_ONLY=1
source qrb_ros_simulation/install/setup.bash
source qrb_ros_samples/robotics/simulation_sample_pick_and_place/install/setup.bash
```

</NewCodeBlock>

按顺序在四个独立终端中执行。

**终端 1** — 在桌面终端中启动 Gazebo：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch qrb_ros_sim_gazebo gazebo_rml_63_gripper.launch.py \
  robot_entity_name:=rml_63 \
  world_model:=warehouse \
  initial_x:=2.2 initial_y:=-2 initial_z:=1.025 \
  initial_yaw:=3.14159 initial_pitch:=0.0 initial_roll:=0.0
```

</NewCodeBlock>

![RML-63 pick-and-place simulation](/img/fogwise/airbox-q900/airbox-q900-qir-sdk-pick-place-gazebo.webp)

Gazebo 窗口打开后，点击左下角播放按钮启动仿真。

> `robot_entity_name:=rml_63` 必须显式指定。官方默认值 `rml_63_arm_robot` 与示例的 MoveIt URDF/SRDF 名称不匹配。

**终端 2** — 等待控制器管理器就绪后加载控制器：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 等待控制器管理器
until ros2 service list | grep -qx '/controller_manager/list_controllers'; do
  sleep 1
done

# 加载控制器
ros2 launch qrb_ros_sim_gazebo gazebo_rml_63_gripper_load_controller.launch.py
```

</NewCodeBlock>

**终端 3** — 启动 MoveIt2：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch simulation_sample_pick_and_place simulation_sample_pick_and_place.launch.py
```

</NewCodeBlock>

**终端 4** — 等待 MoveIt 就绪后执行抓取序列：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 等待 move_action 出现
until ros2 action list -t | grep -q '^/move_action '; do
  sleep 1
done

ros2 run simulation_sample_pick_and_place qrb_ros_arm_pick_place
```

</NewCodeBlock>

> 官方 launch 仅启动 `move_group`，不会自动执行 pick-and-place。需手动运行 `ros2 run` 命令。

## 执行流程

示例按以下顺序执行 9 个规划与执行步骤：

1. 归位（ready pose）
2. 打开夹爪
3. 移动至抓取位置
4. 闭合夹爪
5. 抬起物体
6. 移动至放置位置
7. 释放物体（打开夹爪）
8. 再次抬起
9. 回到 ready 位姿

终端 4 输出 `Pick and place task completed!`，退出码 0 即为成功。

## 可用接口

| 话题 / 动作 / 服务                             | 类型                    |
| ---------------------------------------------- | ----------------------- |
| `/joint_states`                                | `JointState`            |
| `/rm_group_controller/follow_joint_trajectory` | `FollowJointTrajectory` |
| `/hand_controller/follow_joint_trajectory`     | `FollowJointTrajectory` |
| `/move_action`                                 | `MoveGroup` action      |

## 限制

- 示例使用固定关节角度目标，不包含物体生成、附着或抓取验证。
- 未配置 Octomap 三维传感器插件，不支持动态避障。
- MoveIt 日志中的 `No kinematics plugins defined` 警告不影响关节目标规划，但 Cartesian IK 扩展需额外配置。
