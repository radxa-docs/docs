---
sidebar_position: 1
---

# Camera Usage

This guide uses the Raspberry Pi Camera V2 as an example to explain how to use a camera with the C200.

## Hardware Connection

Connect the Raspberry Pi Camera V2 module to the CSI connector on the Radxa C200 development kit.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/accessories/rpi-camera-v2-c200.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Software Preparation

If you are using the system image for the [Radxa C200 Development Kit (Jetson Orin Nano Image)](../download.md), you need to manually copy the device tree file to enable camera support.

### Copy the Device Tree File

Open a terminal on the board and run the following command:

<NewCodeBlock tip="radxa@radxa-c200$" type="device">

```bash
sudo cp /boot/tegra234-p3768-0000+p3767-0001-nv.dtb /boot/dtb/kernel_tegra234-p3768-0000+p3767-0001-nv.dtb
```

</NewCodeBlock>

### Enable the Camera

Open a terminal on the board and run the following command:

<NewCodeBlock tip="radxa@radxa-c200$" type="device">

```bash
sudo /opt/nvidia/jetson-io/jetson-io.py
```

</NewCodeBlock>

Select the options in the following order: `Configure Jetson 24pin CSI Connector` -> `Configure for compatible hardware` -> `Camera IMX219 Dual` -> `Save pin changes` -> `Save and reboot to configure pins`. After the system reboots, the camera will be ready to use.

### Install Dependencies

Open a terminal on the board and run the following command:

<NewCodeBlock tip="radxa@radxa-c200$" type="device">

```bash
sudo apt-get install nvidia-l4t-gstreamer -y
```

</NewCodeBlock>

### Preview the Camera

Open a terminal on the board and run the following command to view the camera feed.

<NewCodeBlock tip="radxa@radxa-c200$" type="device">

```bash
nvgstcapture-1.0
```

</NewCodeBlock>
