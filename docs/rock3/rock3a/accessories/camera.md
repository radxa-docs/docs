---
sidebar_position: 20
---

# 摄像头

## CSI 接口定义

Radxa ROCK 3A 拥有一个 15 PIN 的 CSI 接口,接口定义如下:

<img src="../../../img/rock3/3a/rock3a-actual-sci.webp" width = "500" alt="rock 3a sci actual"/>
<img src="../../../img/rock3/3a/rock3a-mipi-2lanes.webp" width = "500" alt="rock 3a mipi 2lanes"/>

目前支持的摄像头有:

- Raspberry Pi Camera V1.3 (OV5647)
- Raspberry Pi Camera V2 (IMX219)
- Radxa Camera 8m
- Okdo 5mp Camera

## 使用方法

### 系统配置

```bash
sudo rsetup
```

<img src="../../../img/rock3/3a/rock3a-rsetup-camera-v2.webp" width = "700" height="300" alt="rock 3a rsetup camera v2"/>

确认之后重启生效

### 硬件连接

硬件连接如下:

:::tip
请注意 camera 排线的接口朝向！
:::

<img src="../../../img/rock3/3a/rock3a-rpi-imx219.webp" width = "500" alt="rock 3a rpi imx219"/>

### 图像预览

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
