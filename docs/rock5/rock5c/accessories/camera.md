---
sidebar_position: 4
---

# 摄像头

目前支持以下几款摄像头:

<table>
  <tr>
    <th>Camera Name</th>
    <th>Sensor Type</th>
    <th>Resolution</th>
  </tr>
  <tr>
    <td>OKDO 5MP Camera</td>
    <td>OV5647</td>
    <td>5 megapixels</td>
  </tr>
  <tr>
    <td>Radxa Camera 4K</td>
    <td>IMX415</td>
    <td>8.29 megapixels</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera V2</td>
    <td>IMX219</td>
    <td>8 megapixels</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera v1.3</td>
    <td>OV5647</td>
    <td>5 megapixels</td>
  </tr>
</table>

## 配置

以 Radxa Camera 4K 摄像头为例：

<!-- ![Camera-4K 安装-01](/img/rock5c/accessories/camera/rock5c-with-4k-camera-FPC.webp)
![Camera-4K 安装-02](/img/rock5c/accessories/camera/rock5c-4k-camera-connected.webp)
![Camera-4K 安装-03](/img/rock5c/accessories/camera/rock5c-4k-camera.webp) -->

- 准备好 Radxa Camera 4K，通过 FPC 线接上 ROCK 5C。

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令。

```bash
radxa@rock-5c:~$ rsetup
```

通过[设备树配置](../os-config/rsetup#overlays)来启用瑞莎 4K 摄像头的 Overlay。

:::caution [注意]

1. 请启用 `[] Enable Radxa Camera 4K` 项 Overlay。
2. 在启用成功显示 `[*] Enable Radxa Camera 4K` 后退出重启才能使配置生效。

:::

## 图像预览

你也可以使用终端命令打开相机预览:

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
```

使用以下命令拍照:

```bash
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
```

使用以下命令拍摄视频:

```bash
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```

## 购买链接

[Radxa Camera 4K](https://radxa.com/products/accessories/camera4k)
