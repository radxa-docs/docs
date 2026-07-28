---
sidebar_position: 15
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-14
---

# 2D LiDAR SLAM

使用 QCOM Cartographer 在 Gazebo 仿真环境中实现 2D LiDAR SLAM。通过 Cartographer 服务接口控制建图、冻结、保存、载图和重定位。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- 已连接显示器（GUI 模式）

## 源码构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_simulation.git
cd qrb_ros_simulation
source /opt/ros/jazzy/setup.bash
colcon build
```

</NewCodeBlock>

## 管线

```text
office mini Gazebo AMR
  → /scan + /odom + /tf
  → cartographer_node + cartographer_occupancy_grid_node
  → /qrb_slam_command (建图 / 冻图 / 保存 / 载图 / 重定位)
  → /map + /tracked_pose + /scan_matched_points2 + /submap_list
```

## 运行

所有终端使用相同环境：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=124
export ROS_LOCALHOST_ONLY=1
source qrb_ros_simulation/install/setup.bash
```

</NewCodeBlock>

### 终端 1：启动 Gazebo Office 场景

在桌面终端中运行：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch qrb_ros_sim_gazebo gazebo_robot_base_mini.launch.py \
  world_model:=office \
  initial_x:=1.0 \
  initial_y:=6.0 \
  enable_depth_camera:=false
```

</NewCodeBlock>

Gazebo 启动后处于暂停状态。**点击左下角播放按钮**启动仿真时钟。

### 终端 2：启动 Cartographer

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch cartographer_ros qrb_2d_lidar_slam.launch.py use_sim_time:=true
```

</NewCodeBlock>

### 终端 3：交互式服务客户端

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sh /opt/ros/jazzy/share/cartographer_ros/scripts/qrb_slam_service_request.sh
```

</NewCodeBlock>

按序号选择服务命令：

| 命令 | 含义       | 说明                                   |
| ---- | ---------- | -------------------------------------- |
| `0`  | 开始建图   | 消耗 `/scan` 和 `/odom` 构建地图       |
| `1`  | 冻结轨迹   | 冻结当前 mapping 轨迹                  |
| `2`  | 保存地图   | 保存 pbstream 并导出 ROS occupancy map |
| `3`  | 载入地图   | 加载已保存的地图                       |
| `4`  | 开始重定位 | 对已加载的地图启动定位轨迹             |
| `5`  | 验证重定位 | 检查定位轨迹是否就绪                   |

## 完整流程

1. 终端 3 输入 `0` 开始建图
2. 驱动机器人在环境中移动，覆盖足够的静态几何特征
3. 输入 `1` 冻结轨迹，再输入 `2` 保存地图
4. 地图保存至 `/var/tmp/cartographer_ros/map/map_0.pbstream`
5. 重启 Cartographer（终端 2 按 `Ctrl+C` 后重新运行 launch）
6. 终端 3 依次输入 `3` → `4` 载图并开始重定位
7. 让机器人移动以收集足够的扫描数据
8. 输入 `5`，预期返回 `Relocalization Successful, Localization ID: 1`

## 驱动机器人

Cartographer 服务只控制建图和定位状态，不会驱动机器人。建图和重定位阶段需要独立源发布 `/cmd_vel`。在另一个终端发布速度命令后，务必发送零 Twist 停止：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 前进
ros2 topic pub --rate 10 --times 50 /cmd_vel geometry_msgs/msg/Twist \
  '{linear: {x: 0.4}, angular: {z: 0.0}}'
# 停止（Gazebo 会保持最后的速度命令）
ros2 topic pub --times 1 /cmd_vel geometry_msgs/msg/Twist '{}'
```

</NewCodeBlock>

## 预期输出

命令 `0` 到 `5` 的正常响应：

```text
0: Success. Mapping is Started. Trajectory ID: 0
1: TrajectoryID:0 has finished.
2: Write state to pbstream successfully.
3: Load Map Successfully.
4: Success. Localization is Started. Trajectory ID: 1
5: Relocalization Successful, Localization ID: 1
```

> 如果建图路径覆盖面积不足，命令 `5` 可能返回 `Relocalization Not Ready.`——需要更多扫描数据连接定位轨迹与保存的地图。

## 限制

- 验证使用 Gazebo 仿真 LiDAR 和 odometry，未包含真实 RPLIDAR 和底盘。
- 未验证 RViz 可视化或 GPU 相关的 Cartographer 功能。
- 迁移到真实硬件时需确保 `/odom` 和 `/scan` 话题兼容。
