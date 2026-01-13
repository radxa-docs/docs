---
sidebar_position: 1
---

# 摄像头

## CSI 接口定义

Radxa ROCK 3C 拥有一个 15 PIN 的 CSI 接口,接口定义如下:

<img src="../../../img/rock3/3c/rock3c-camera-pin.webp" width = "800" alt="rock 3c csi 2lanes"/>

目前支持的摄像头有:

- Raspberry Pi Camera V1.3 (OV5647)
- Okdo 5mp Camera (OV5647)
- Raspberry Pi Camera V2 (IMX219)
- Radxa Camera 8M (IMX219)

## 使用方法

### 1. 连接摄像头

:::tip
请注意 camera 排线的接口朝向！
:::

<img src="../../../img/rock3/3c/rock3c-camera-connect.webp" width = "400" alt="rock 3c camera connect"/>

### 2. [rsetup 开启摄像头 overlay](../system-config/rsetup)

### 3. 图像预览

摄像头的实时预览推荐使用 cheese，运行以下命令安装 cheese：

```bash
sudo apt update
sudo apt install cheese
```

进入桌面后打开终端执行以下命令即可开始实施预览摄像头：

```bash
sudo cheese
```

<img src="../../../img/rock3/3a/rock3a-cheese.webp" width = "700" alt="rock 3a cheese" />
