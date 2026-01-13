---
sidebar_position: 1
---

# Camera

## CSI Interface definition

Radxa ROCK 3C has a 15 PIN CSI interface. The interface definition is as follows:

<img src="../../../img/rock3/3c/rock3c-camera-pin.webp" width = "800" alt="rock 3c csi 2lanes"/>

Currently supported cameras are:

- Raspberry Pi Camera V1.3 (OV5647)
- Okdo 5mp Camera (OV5647)
- Raspberry Pi Camera V2 (IMX219)
- Radxa Camera 8M (IMX219)

## How to use

### 1. Connect camera

:::tip
Please pay attention to the direction of the camera cable interface!
:::

<img src="../../../img/rock3/3c/rock3c-camera-connect.webp" width = "400" alt="rock 3c camera connect"/>

### 2. [rsetup enable camera overlay](../system-config/rsetup)

### 3. Preview

It is recommended to use cheese for real-time preview of the camera. Run the following command to install cheese:

```bash
sudo apt update
sudo apt install cheese
```

After entering the desktop, open the terminal and execute the following command to start implementing the preview camera:

```bash
sudo cheese
```

<img src="../../../img/rock3/3a/rock3a-cheese.webp" width = "700" alt="rock 3a cheese" />
