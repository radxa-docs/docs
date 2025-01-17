---
sidebar_position: 5
---

# MIPI CSI 接口

## 支持列表

<table>
  <tr>
    <th>Camera Name</th>
    <th>Sensor 型号</th>
    <th>分辨率</th>
  </tr>
  <tr>
    <td>Radxa Camera 8M 219</td>
    <td>IMX219</td>
    <td>800 万 像素</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera V2</td>
    <td>IMX219</td>
    <td>800 万 像素</td>
  </tr>
  <tr>
    <td>Raspberry Pi Camera v1.3</td>
    <td>OV5647</td>
    <td>500 万 像素</td>
  </tr>
</table>

## 使用介绍

树莓派 Compute Module 4 IO Board 有两个 CSI 接口：CAM0 和 CAM1

:::tip
使用 CAM0 或者 DISP0 时需要短接底板如下图所示的位置
:::

![JUMP](/img/cm3j/jump.webp)

### Radxa Camera 8M 219

- 连接

  - 通过 FPC 线接上树莓派 Compute Module 4 IO Board ，如图所示：
    ![8M 219](/img/cm3j/8m-219.webp)

- 通过 rsetup 打开对应的 overlay

  - 使用 Ctrl + T 组合键打开终端, 运行 rsetup 命令：

    ```
    radxa@radxa-cm3j-rpi-cm4-io:~$ rsetup
    ```

  - 通过 [overlays](../../../os-config/rsetup#overlays) 设备树配置来启用 Radxa Camera 8M 219 的 Overlay。

    :::tip
    请启用 [] Enable Radxa Camera 8M on CAM0/CAM1 项 Overlay。<br/>
    在启用成功显示 [*] Enable Radxa Camera 8M on CAM0/CAM1 后退出重启才能使配置生效。
    :::

### Raspberry Pi Camera V2

- 连接

  - 通过 FPC 线接上树莓派 Compute Module 4 IO Board ，如图所示：
    ![V2](/img/cm3j/v2.webp)

- 通过 rsetup 打开对应的 overlay

  - 使用 Ctrl + T 组合键打开终端, 运行 rsetup 命令：

    ```
    radxa@radxa-cm3j-rpi-cm4-io:~$ rsetup
    ```

  - 通过 [overlays](../../../os-config/rsetup#overlays) 设备树配置来启用 Raspberry Pi Camera V2 的 Overlay。

    :::tip
    请启用 [] Enable Raspberry Pi Camera V2 on CAM0/CAM1 项 Overlay。<br/>
    在启用成功显示 [*] Enable Raspberry Pi Camera V2 on CAM0/CAM1 后退出重启才能使配置生效。
    :::

### Raspberry Pi Camera v1.3

- 连接

  - 通过 FPC 线接上树莓派 Compute Module 4 IO Board ，如图所示：
    ![V1.3](/img/cm3j/V1-3.webp)

- 通过 rsetup 打开对应的 overlay

  - 使用 Ctrl + T 组合键打开终端, 运行 rsetup 命令：

    ```
    radxa@radxa-cm3j-rpi-cm4-io:~$ rsetup
    ```

  - 通过 [overlays](../../../os-config/rsetup#overlays) 设备树配置来启用 Raspberry Pi Camera v1.3 的 Overlay。

    :::tip
    请启用 [] Enable Raspberry Pi Camera v1.3 on CAM0/CAM1 项 Overlay。<br/>
    在启用成功显示 [*] Enable Raspberry Pi Camera v1.3 on CAM0/CAM1 后退出重启才能使配置生效。
    :::

### 可以通过以下方式测试

- 预览

  - 打开终端，输入以下命令打开相机预览:

    <pre style={{ whiteSpace: "nowrap" }}>
      <!-- prettier-ignore -->
      gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
    </pre>

- 拍照

  - 打开终端，输入以下命令打开相机进行拍照:

    <pre style={{ whiteSpace: "nowrap" }}>
      <!-- prettier-ignore -->
      gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
    </pre>

- 拍摄视频

  - 打开终端，输入以下命令打开相机进行拍摄视频:

    <pre style={{ whiteSpace: "nowrap" }}>
      <!-- prettier-ignore -->
      gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
    </pre>
