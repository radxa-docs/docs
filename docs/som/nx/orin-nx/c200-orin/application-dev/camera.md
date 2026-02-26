---
sidebar_position: 1
---

# 摄像头使用

以树莓派摄像头 V2 作为示例，介绍如何使用摄像头。

## 硬件连接

将树莓派 V2 摄像头的接口连接到瑞莎 C200 开发套件的 CSI 接口。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/accessories/rpi-camera-v2-c200.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 软件准备

若使用的是适用于[瑞莎 C200 开发套件（Jetson Orin Nano 镜像）](../download.md)的系统镜像，需要手动复制设备树文件，用于支持摄像头调用。

### 复制设备树文件

打开主板系统终端运行以下命令：

<NewCodeBlock tip="radxa@radxa-c200$" type="device">

```bash
sudo cp /boot/tegra234-p3768-0000+p3767-0001-nv.dtb /boot/dtb/kernel_tegra234-p3768-0000+p3767-0001-nv.dtb
```

</NewCodeBlock>

### 使能摄像头

打开主板系统终端运行以下命令：

<NewCodeBlock tip="radxa@radxa-c200$" type="device">

```bash
sudo /opt/nvidia/jetson-io/jetson-io.py
```

</NewCodeBlock>

依次选择 `Configure Jetson 24pin CSI Connector` -> `Configure for compatible hardware` -> `Camera IMX219 Dual` -> `Save pin changes` -> `Save and reboot to configure pins` 选项，系统重启后，摄像头即可使用。

### 安装依赖工具

打开主板系统终端运行以下命令：

<NewCodeBlock tip="radxa@radxa-c200$" type="device">

```bash
sudo apt-get install nvidia-l4t-gstreamer -y
```

</NewCodeBlock>

### 预览摄像头

打开主板系统终端运行以下命令查看摄像头画面。

<NewCodeBlock tip="radxa@radxa-c200$" type="device">

```bash
nvgstcapture-1.0
```

</NewCodeBlock>
