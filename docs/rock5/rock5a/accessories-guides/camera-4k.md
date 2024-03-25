---
sidebar_position: 20
---

# 如何在 ROCK 5A 上安装Radxa Camera 4K

## 安装在5A教程

如图所示，FPC 的黑色一面是绝缘的，另一面是用来连接电路的引脚。

![ROCK5A Install Radxa Camera 4K](/img/accessories/fpc.webp)

用手指轻轻向上推黑色盖板，然后将FPC插入相机的连接器中。有关如何安装，请参阅图片。然后按下黑色的盖板来固定相机模块上的FPC。

![ROCK5A Install Radxa Camera 4K](/img/accessories/camera_4k_pfc.webp)

在 ROCK 5A 上以同样的方式连接FPC，如图所示。

![ROCK5A Install Radxa Camera 4K](/img/accessories/rock5a_camera4k_fpc.webp)

## 配置 Radxa Camera 4K

按下"Ctrl + Alt + T" 组合键打开终端,，运行 `rsetup` 命令：

```bash
radxa@rock-5a:~$ rsetup
```

在rsetup工具界面，输入密码并选择 `Overlays` .

```bash
Configure Device Tree Overlay
        Manage overlays
        View overlay info
        Install overlay from source
        Reset overlays
        <Ok>             <Cancel>
```

然后, 选择`Manage overlays`:

```bash
Configure Device Tree Overlay
        Manage overlays
        View overlay info
        Install overlay from source
        Reset overlays


      <Ok>            <Cancel>
```

接下来，将显示已安装的设备树，它可能在不同的产品上有所不同。在`Radxa Camera 4K`按下空格键

```bash
Please select overlays:
        [ ] Enable 1-Wire on GPIO4_B1
        [ ] Enable FIQ Debugger on UART4-M2
        [ ] Enable FIQ Debugger on UART6-M1
        [ ] Enable FIQ Debugger on UART7-M2
        [ ] Enable FIQ Debugger on UART8-M0
        [ ] Enable I2C1-M0
        [ ] Enable I2C2-M4
        [ ] Enable I2C4-M3
        [ ] Enable I2C6-M0
        [ ] Enable I2C6-M3
        [ ] Enable I2C7-M3
        [ ] Enable PWM0-M2
        [ ] Enable PWM1-M2
        [ ] Enable PWM11-M1
        [ ] Enable PWM14-M1
        [ ] Enable PWM14-M2
        [ ] Enable PWM15-M1
        [ ] Enable PWM15-M3
        [ ] Enable PWM6-M0
        [ ] Enable PWM7-M0
        [ ] Enable Radxa Camera 4K
        [ ] Enable Radxa Display 10HD
        [ ] Enable Radxa Display 8HD
        [ ] Enable Raspberry Pi Camera V2
        [ ] Enable UART2-M0
        [ ] Enable UART2-M2
        [ ] Enable UART3-M1
        [ ] Enable UART4-M2
        [ ] Enable UART6-M1
        [ ] Enable UART7-M1
        [ ] Enable UART7-M1 with Hardware Flow Control
        [ ] Enable UART7-M2
        [ ] Enable UART8-M0
        [ ] Enable spidev on SPI0-M1 over CS0
        [ ] Enable spidev on SPI0-M2 over CS0
        [ ] Enable spidev on SPI4-M2 over CS0
        [ ] Set OTG port to Host modeq
        [ ] Set OTG port to Peripheral mode
        <Ok>                   <Cancel>
```

使用空格键选择你想加载的设备，

```bash
[*] Enable Radxa Camera 4K
```

Overlay开头显示`*`表示它是启用的。它将在重新启动后工作。

```bash
radxa@rock-5a:~$ sudo reboot
```

## 使用 Radxa Camera 4K

你可以下载 **cheese** 然后使用以下命令使用摄像机:

```bash
radxa@rock-5a: sudo apt update
radxa@rock-5a: sudo apt install cheese
radxa@rock-5a: ./cheese
```

同时，你也可以使用终端命令打开相机预览:

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
