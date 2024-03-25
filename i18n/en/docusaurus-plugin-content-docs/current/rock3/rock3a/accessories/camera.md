---
sidebar_position: 20
---

# Camera

## CSI interface definition

The Radxa ROCK 3A has a 15 PIN CSI interface defined as follows.

<img src="../../../img/rock3/3a/rock3a-actual-sci.webp" width = "500" alt="rock 3a sci actual"/>
<img src="../../../img/rock3/3a/rock3a-mipi-2lanes.webp" width = "500" alt="rock 3a mipi 2lanes"/>

Currently supported cameras are.

- Raspberry Pi Camera V1.3 (OV5647)
- Raspberry Pi Camera V2 (IMX219)
- Radxa Camera 8m
- Okdo 5mp Camera

## How to use

### System configuration

```bash
sudo rsetup
```

<img src="../../../img/rock3/3a/rock3a-rsetup-camera-v2.webp" width = "700" height="300" alt="rock 3a rsetup camera v2"/>

Confirm and reboot to take effect

### Hardware connections

The hardware connections are as follows.

:::tip
Please note the orientation of the camera cable!
:::

<img src="../../../img/rock3/3a/rock3a-rpi-imx219.webp" width = "500" alt="rock 3a rpi imx219"/>

### Image preview

The live preview of the camera is recommended to use cheese, run the following command to install cheese:

`bash
sudo apt update
sudo apt install cheese
`

After entering the desktop, open a terminal and execute the following commands to start the implementation of the preview camera:

```bash
sudo cheese
```

<img src="../../../img/rock3/3a/rock3a-cheese.webp" width = "700" alt="rock 3a cheese" />
