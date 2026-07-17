---
sidebar_position: 13
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-13
---

# Pick and Place

Simulate RML-63 robotic arm pick-and-place operations in Gazebo. Uses MoveIt2 for motion planning, OMPL for joint trajectory generation, and `gz_ros2_control` to drive the simulated arm and gripper.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)
- MoveIt2 installed:
  ```bash
  sudo apt install -y ros-jazzy-moveit
  ```
- Display connected (GUI mode)

## Build from Source

### Step 1: Clone Repositories

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# Simulation environment (skip if already built)
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_simulation.git

# Pick-and-place sample
git clone -b jazzy-rel https://github.com/qualcomm-qrb-ros/qrb_ros_samples.git
```

</NewCodeBlock>

### Step 2: Build

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# Build simulation environment
cd qrb_ros_simulation
source /opt/ros/jazzy/setup.bash
colcon build

# Build pick-and-place sample
cd ../qrb_ros_samples/robotics/simulation_sample_pick_and_place
source install/setup.bash
colcon build
```

</NewCodeBlock>

## Run

Use the same ROS environment in all terminals:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=55
export ROS_LOCALHOST_ONLY=1
source qrb_ros_simulation/install/setup.bash
source qrb_ros_samples/robotics/simulation_sample_pick_and_place/install/setup.bash
```

</NewCodeBlock>

Execute in four separate terminals, in order.

**Terminal 1** — Start Gazebo from the desktop terminal:

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

Once the Gazebo window opens, click the play button at the bottom-left to start the simulation.

> `robot_entity_name:=rml_63` is required. The official default `rml_63_arm_robot` does not match the sample's MoveIt URDF/SRDF name.

**Terminal 2** — Wait for the controller manager, then load controllers:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# Wait for the controller manager
until ros2 service list | grep -qx '/controller_manager/list_controllers'; do
  sleep 1
done

# Load controllers
ros2 launch qrb_ros_sim_gazebo gazebo_rml_63_gripper_load_controller.launch.py
```

</NewCodeBlock>

**Terminal 3** — Start MoveIt2:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch simulation_sample_pick_and_place simulation_sample_pick_and_place.launch.py
```

</NewCodeBlock>

**Terminal 4** — Wait for MoveIt, then run the pick-and-place sequence:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# Wait for the move_action
until ros2 action list -t | grep -q '^/move_action '; do
  sleep 1
done

ros2 run simulation_sample_pick_and_place qrb_ros_arm_pick_place
```

</NewCodeBlock>

> The official launch only starts `move_group`. Run the `ros2 run` command separately to execute the pick-and-place sequence.

## Execution Sequence

The sample executes 9 plan-and-execute steps:

1. Move to ready pose
2. Open gripper
3. Move to pick position
4. Close gripper
5. Lift object
6. Move to place position
7. Release object (open gripper)
8. Lift again
9. Return to ready pose

Terminal 4 outputs `Pick and place task completed!` with exit code 0 on success.

## Available Interfaces

| Topic / Action / Service                       | Type                    |
| ---------------------------------------------- | ----------------------- |
| `/joint_states`                                | `JointState`            |
| `/rm_group_controller/follow_joint_trajectory` | `FollowJointTrajectory` |
| `/hand_controller/follow_joint_trajectory`     | `FollowJointTrajectory` |
| `/move_action`                                 | `MoveGroup` action      |

## Limitations

- The sample uses fixed joint-angle targets and does not spawn, attach, or verify a grasped object.
- No Octomap 3D sensor plugin is configured; dynamic obstacle avoidance is not supported.
- The `No kinematics plugins defined` warning in MoveIt logs does not affect joint-target planning, but Cartesian IK extensions require additional configuration.
