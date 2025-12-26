---
sidebar_position: 5
---

# Yocto 用户指南

## 默认用户名和密码

Yocto 默认的用户名是 `root`。不需要输入用户密码。

## 访问设备

### 选项一：使用 HDMI 显示器，USB 键盘和鼠标

可以在 HDMI 显示器看到桌面系统。

### 选项二：SSH

SSH 服务默认是使能的。
可以在路由器管理界面查看设备的 IP；或者是通过电脑主机的 [angryip](https://angryip.org/) 来找到设备的 IP。

```
$ ping ip-of-device
$ ssh root@ip-of-device
```

### 选项三：USB 访问（adb）

Yocto 系统默认开启了 adbd 服务。
硬件连接方面，使用一根 USB-A 转 USB-C 电缆，接到设备的 “TYPE C” 口和主机。
电脑主机上，需要安装 adb 工具。

在主机上查看 adb 设备

```
adb devices
```

在主机上访问设备

```
adb shell
```

### 选项四：串口

可以参照 [NIO 12L 串口使用](../low-level-dev/serial)。

## 存储

### UFS

使用 `lsblk` 查看 UFS 设备。`/dev/sda`，`/dev/sdb` 和 `/dev/sdc` 都属于 UFS 设备文件。

```
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda       8:0    0     4M  0 disk
sdb       8:16   0     4M  0 disk
sdc       8:32   0 119.2G  0 disk
|-sdc1    8:33   0     4M  0 part
|-sdc2    8:34   0     4M  0 part
|-sdc3    8:35   0    32M  0 part
|-sdc4    8:36   0    32M  0 part
|-sdc5    8:37   0   512K  0 part
|-sdc6    8:38   0     1M  0 part
|-sdc7    8:39   0    32M  0 part
|-sdc8    8:40   0   100M  0 part
|-sdc9    8:41   0    32M  0 part
`-sdc10   8:42   0 118.9G  0 part /
```

### MicroSD 卡

使用 `lsblk | grep mmc` 查看 MicroSD 卡。如这里的 `/dev/mmcblk1`。

```
mmcblk1     179:0    0  58.9G  0 disk
|-mmcblk1p1 179:1    0     1G  0 part
`-mmcblk1p2 179:2    0  57.9G  0 part
```

## 内存

使用 `free -h` 查看内存容量。

```
               total        used        free      shared  buff/cache   available
Mem:           7.6Gi       508Mi       6.8Gi        51Mi       386Mi       6.8Gi
Swap:             0B          0B          0B

```

## 显示

### HDMI

Yocto 系统默认开启了 HDMI。接上 HDMI 显示器就能显示桌面。最大支持的分辨率是 4K@P60。

### Type-C 显示

Yocto 系统默认开启了 Type-C 显示器，接上 Type-C 显示器，或者是通过一个 Type-C 转 HDMI hub，再接到 HDMI 显示器就能显示桌面。
最大支持的分辨率是 4K@P60。

## USB

NIO 12L 有 4个 Type-A USB 3.0 口。只做 host 模式，用于接 USB 鼠标，键盘，U盘等设备。

Type-C 口是有 USB host/device 和显示功能。系统根据插入的设备，自行切换模式。
例如，当接入 Type-C U盘，系统将 Type-C 口设置为 host 模式，U盘将被系统识别到。
当接入 Type-C 显示器时，系统将会输出显示到显示器。
当接入 Type-C hub（包含 HDMI，USB3.0，RJ45），系统将会提供 USB host 功能，网络，显示功能。
当使用 Type-C to Type-A 线，将 NIO 12L 和主机连接，系统将会提供 usb adb 和 usb net 功能。

## 网络连接

有两种网络连接方式，以太网和 Wi-Fi。

### 以太网

你可以使用网线（一端连接外部网口或者路由器）将 NIO 12L 接入网络。NIO 12L 会自动配置网络，方便你上网。

测试以太网的步骤：

- 使用命令 `ifconfig` 查看以太网是否正常。可以看到网卡名，IP 等信息。使用 `ping` 去连接一个正常的域名。

```
ifconfig
ping www.baidu.com
```

- 可以使用 `iperf3` 测试性能。

### Wi-Fi

没有网线时，还可以通过 Wi-Fi 为 NIO 12L 联网。NIO 12L 支持 2.4G/5G/6G 无线网线。

测试 Wi-Fi 的步骤：

- 打开 Wi-Fi

```
nmcli radio wifi on
```

- 扫描热点

```
nmcli dev wifi
```

- 连接热点

```
nmcli dev wifi connect "wifi_name" password "wifi_password"
```

- 可以使用 `iperf3` 测试性能。

## 蓝牙

- 查看蓝牙状态

```
hciconfig -a
```

- 开启蓝牙

```
hciconfig hci0 up
```

- 设置蓝牙为可发现

```
hciconfig hci0 piscan
```

- 扫描周边蓝牙设备

```
hcitool lescan
```

## 音频

### HDMI 音频

使用指令：

```
aplay -D hdmi_dp_out ./test.wav
```

### 耳机

录音

```
amixer -c mt8395evk cset name='PGA1 Volume' 3
arecord -D jack_mic -r 48000 -f S32_LE sample.wav
```

录音

```
aplay -D jack_speaker ./sample.wav
```

## 摄像头

### 在 CAM1 上使用 Radxa Camera 13M 214 摄像头

加载 radxa-nio-12l-camera1-imx214 dtbo

```
genio-flash --load-dtbo radxa-nio-12l-camera1-imx214.dtbo
```

预览摄像头

```
declare -a video=(`v4l2-ctl --list-devices | grep mtk-v4l2-camera -A 3 | grep video | tr -d "\n"`)
printf "Preview Node\t= ${video[0]}\nVideo Node\t= ${video[1]}\nCapture Node\t= ${video[2]}\n"
gst-launch-1.0 v4l2src device=${video[0]} ! video/x-raw,width=1920,height=1080,format=YUY2 ! waylandsink sync=false
```

### 在 CAM2 上使用 Radxa Camera 13M 214 摄像头

加载 radxa-nio-12l-camera2-imx214 dtbo

```
genio-flash --load-dtbo radxa-nio-12l-camera2-imx214.dtbo
```

预览摄像头

```
declare -a video=(`v4l2-ctl --list-devices | grep mtk-v4l2-camera -A 3 | grep video | tr -d "\n"`)
printf "Preview Node\t= ${video[0]}\nVideo Node\t= ${video[1]}\nCapture Node\t= ${video[2]}\n"
gst-launch-1.0 v4l2src device=${video[0]} ! video/x-raw,width=1920,height=1080,format=YUY2 ! waylandsink sync=false
```

### 使用 USB 摄像头

通过 `ls -l /sys/class/video4linux` 查看 v4l2 设备节点。可以看到有设备 `/dev/vidoe6`。

```
ls -l /sys/class/video4linux
total 0
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video0 -> ../../devices/platform/soc/14001000.mdp3-rdma0/video4linux/video0
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video1 -> ../../devices/platform/soc/1a030000.jpgenc/video4linux/video1
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video2 -> ../../devices/platform/soc/1a040000.jpgdec/video4linux/video2
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video3 -> ../../devices/platform/soc/18000000.vdec/video4linux/video3
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video4 -> ../../devices/platform/soc/1a020000.venc/video4linux/video4
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video5 -> ../../devices/platform/soc/14001000.mdp3-rdma0/video4linux/video5
lrwxrwxrwx 1 root root 0 Jan  1 02:50 video6 -> ../../devices/platform/soc/112f0000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb5/5-1/5-1.4/5-1.4:1.0/video4linux/video6
lrwxrwxrwx 1 root root 0 Jan  1 02:50 video7 -> ../../devices/platform/soc/112f0000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb5/5-1/5-1.4/5-1.4:1.0/video4linux/video7
```

捕获预览指令为：

```
gst-launch-1.0 v4l2src device=/dev/video6 io-mode=mmap ! videoconvert ! waylandsink sync=false
```

## HDMI RX

例子一：捕获预览

使用 HDMI 线连接 PC HDMI 输出口和 NIO 12L HDMI RX 口后，将会在 Yocto 系统看到有设备 `/dev/video5`。

在 NIO 12L Yocto 系统上，执行指令：

```
gst-launch-1.0 -v v4l2src device=/dev/video5 ! video/x-raw,width=3840,height=2160,format=YUY2 ! queue ! fpsdisplaysink video-sink=waylandsink text-overlay=false
```
