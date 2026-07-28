---
sidebar_position: 15
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-14
---

# 2D LiDAR SLAM

Use QCOM Cartographer for 2D LiDAR SLAM in a Gazebo simulation. Control mapping, freeze, save, map loading, and relocalization through Cartographer service commands.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)
- Display connected (GUI mode)

## Build from Source

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_simulation.git
cd qrb_ros_simulation
source /opt/ros/jazzy/setup.bash
colcon build
```

</NewCodeBlock>

## Pipeline

```text
office mini Gazebo AMR
  → /scan + /odom + /tf
  → cartographer_node + cartographer_occupancy_grid_node
  → /qrb_slam_command (mapping / freeze / save / load / relocalize)
  → /map + /tracked_pose + /scan_matched_points2 + /submap_list
```

## Run

Use the same environment in all terminals:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=124
export ROS_LOCALHOST_ONLY=1
source qrb_ros_simulation/install/setup.bash
```

</NewCodeBlock>

### Terminal 1: Start Gazebo Office Scene

Run from the desktop terminal:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch qrb_ros_sim_gazebo gazebo_robot_base_mini.launch.py \
  world_model:=office \
  initial_x:=1.0 \
  initial_y:=6.0 \
  enable_depth_camera:=false
```

</NewCodeBlock>

Gazebo starts paused. **Click the play button at the bottom-left** to start the simulation clock.

### Terminal 2: Start Cartographer

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch cartographer_ros qrb_2d_lidar_slam.launch.py use_sim_time:=true
```

</NewCodeBlock>

### Terminal 3: Interactive Service Client

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sh /opt/ros/jazzy/share/cartographer_ros/scripts/qrb_slam_service_request.sh
```

</NewCodeBlock>

Select service commands by number:

| Command | Meaning                 | Description                                     |
| ------- | ----------------------- | ----------------------------------------------- |
| `0`     | Start mapping           | Consume `/scan` and `/odom` to build a map      |
| `1`     | Finish mapping          | Freeze the active mapping trajectory            |
| `2`     | Save map                | Save pbstream and export ROS occupancy map      |
| `3`     | Load map                | Load the saved map                              |
| `4`     | Start localization      | Start a localization trajectory against the map |
| `5`     | Validate relocalization | Check whether localization is ready             |

## Full Workflow

1. Enter `0` in Terminal 3 to start mapping
2. Drive the robot to cover enough static geometry in the environment
3. Enter `1` to freeze the trajectory, then `2` to save the map
4. The map is saved to `/var/tmp/cartographer_ros/map/map_0.pbstream`
5. Restart Cartographer (press `Ctrl+C` in Terminal 2 and re-run the launch)
6. Enter `3` → `4` in Terminal 3 to load the map and start localization
7. Move the robot to collect enough scans
8. Enter `5` — expected response: `Relocalization Successful, Localization ID: 1`

## Driving the Robot

Cartographer services control mapping and localization state only; they do not drive the robot. An independent source must publish `/cmd_vel` during mapping and localization. Always follow any velocity command with a zero Twist to stop:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# Move forward
ros2 topic pub --rate 10 --times 50 /cmd_vel geometry_msgs/msg/Twist \
  '{linear: {x: 0.4}, angular: {z: 0.0}}'
# Stop (Gazebo retains the last velocity command)
ros2 topic pub --times 1 /cmd_vel geometry_msgs/msg/Twist '{}'
```

</NewCodeBlock>

## Expected Output

Normal responses for commands `0` through `5`:

```text
0: Success. Mapping is Started. Trajectory ID: 0
1: TrajectoryID:0 has finished.
2: Write state to pbstream successfully.
3: Load Map Successfully.
4: Success. Localization is Started. Trajectory ID: 1
5: Relocalization Successful, Localization ID: 1
```

> If the mapping route does not cover enough area, command `5` may return `Relocalization Not Ready.` — more scan data is needed to connect the localization trajectory to the saved map.

## Limitations

- Validation used simulated Gazebo LiDAR and odometry; no physical RPLIDAR or robot base was tested.
- RViz visualization and GPU-specific Cartographer features were not verified.
- Migration to real hardware requires compatible `/odom` and `/scan` topics.
