---
sidebar_position: 3
---

import Serial from "../../../../common/general/\_serial.mdx"

# 外设使用

本章节旨在向用户说明 ROCK 5C 如何使用板载外设。

## 串口终端

:::danger
使用 USB 串口数据线和 ROCK 5C 进行串口登录时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

将 USB 串口数据线连接到 ROCK 5C 的 UART0 接口，另一端连接到 PC 的 USB 端口。

| ROCK 5C 引脚功能       | 连接方式                          |
| ---------------------- | --------------------------------- |
| ROCK 5C : GND（Pin6）  | USB 串口数据线的 GND 引脚(黑色线) |
| ROCK 5C : TXD（Pin8）  | USB 串口数据线的 RXD 引脚(白色线) |
| ROCK 5C : RXD（Pin10） | USB 串口数据线的 TXD 引脚(绿色线) |

<img src="/img/accessories/rock5a-1000px-Serial-connection.webp" alt="kai rock5c debug uart" />

:::info 串口通讯参数

- 波特率：1500000
- 数据位：8
- 停止位：1
- 校验位：无
- 流控：无

:::

## USB

当前主板的 OTG 口默认设置为 device 模式，方便用户在 Kaihong 系统上进行 hdc 调试。

用户如果需要将 OTG 口设置成 host 模式，请在串口终端中输入如下指令：

```bash
echo host > /sys/devices/platform/fd5d0000.syscon/fd5d0000.syscon\:usb2-phy@0/otg_mode
```

## hdc 工具使用

可以根据[ohos-sdk](https://ci.openharmony.cn/workbench/cicd/dailybuild/dailylist) 每日构建的sdk中获取到 hdc 工具，同时将 hdc 工具的路径加入到高级环境变量中即可在 windows cmd中使用 hdc 命令。这边给出一些简单的 hdc 示例，如下。

上传文件到系统内：

```bash

hdc file send D:\temp\cyx.mp3 /data/local/tmp

```

下载文件至本地：

```bash

hdc file recv /data/local/tmp D:\temp

```

## 风扇

按照以下方式安装风扇：

<img src="/img/rock5c/rock5c-fan-connect.webp" alt="kaihong fan" />

## HDMI

目前由于系统层 UI 问题，仅推荐使用 1080P 分辨率的屏幕。接线方式如下：

<img src="/img/rock5c/rock5c-hdmi-connect.webp" alt="kaihong hdmi connect" />

显示效果如下：

<img src="/img/rock5c/kaihong_hdmi_disp.webp" alt="kaihong hdmi disp" />

## MIPI DSI

目前 Kaihong OS 仅适配了[瑞莎 8 寸显示屏](https://radxa.com/products/accessories/display-8hd)，接线方式如下：

<img src="/img/rock5c/rock5c-8inch-display.webp" alt="mipi dsi connect" />

显示效果如下：

<img src="/img/rock5c/kaihong_mipi_dsi.webp" alt="kaihong mipi dsi" />

## 耳机

耳机录音使用如下方式进行：

```bash
amixer set 'Differential Mux' 'lin2-rin2'
amixer set 'Main Mic' off
amixer set 'Headset Mic' on
arecord -D hw:0,0 -f cd -c 2 tmp.wav
```

## WiFi

在系统的设置中可以进行 WiFi 连接，如下：

<img src="/img/rock5c/kaihong_wifi.webp" alt="kaihong wifi" />

## 以太网

有线连接方式如下：

<img src="/img/rock5c/rock5c-ethernet-connect.webp" alt="kaihong eth" />

在串口终端输入"ifconfig" 可以看到 eth0 的状态，如下：

```bash
# ifconfig
lo        Link encap:Local Loopback
         inet addr:127.0.0.1  Mask:255.0.0.0
         inet6 addr: ::1/128 Scope: Host
         UP LOOPBACK RUNNING  MTU:65536  Metric:1
         RX packets:2 errors:0 dropped:0 overruns:0 frame:0
         TX packets:2 errors:0 dropped:0 overruns:0 carrier:0
         collisions:0 txqueuelen:1000
         RX bytes:176 TX bytes:176

eth0     Link encap:Ethernet  HWaddr xxxxxxxx  Driver rk_gmac-dwmac
         inet addr:192.168.xxx.xxx  Bcast:192.168.xxx.255  Mask:255.255.255.0
         UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
         RX packets:2381 errors:0 dropped:0 overruns:0 frame:0
         TX packets:186 errors:0 dropped:0 overruns:0 carrier:0
         collisions:0 txqueuelen:1000
         RX bytes:198095 TX bytes:32657
         Interrupt:85
```

## PCIe

可以借助 PCIe 转接板去使用 SSD，PCIe 转接板和主板安装方式如下：

<img src="/img/rock5c/kaihong_nvme.webp" alt="kaihong nvme" />

接上转接板和 SSD 后，在系统中可以使用如下查看 SSD 的状态：

```bash
# ls /dev/block/nvme**
/dev/block/nvme0n1    /dev/block/nvme0n1p2  /dev/block/nvme0n1p4
/dev/block/nvme0n1p1  /dev/block/nvme0n1p3

# df -h
Filesystem                              Size  Used Avail Use% Mounted on
tmpfs                                   3.7G  380K  3.7G   1% /dev
tmpfs                                   3.7G     0  3.7G   0% /mnt
tmpfs                                   3.7G     0  3.7G   0% /mnt/data
tmpfs                                   3.7G     0  3.7G   0% /storage
/dev/block/mmcblk0p6                    1.9G  1.1G  829M  58% /
/dev/block/mmcblk0p7                    240M   74M  166M  31% /vendor
/dev/block/mmcblk0p8                    300M   57M  243M  20% /sys_prod
/dev/block/mmcblk0p9                    240M   23M  217M  10% /chip_prod
/dev/block/mmcblk0p12                    10G  217M   10G   3% /data
tmpfs                                   3.7G     0  3.7G   0% /module_update
/dev/block/vol-259-1                    196M   98M   98M  51% /mnt/data/external/CE13-3A68
/dev/block/vol-259-3                    118G   29G   89G  25% /mnt/data/external/30FC1457FC1419A4
/dev/block/vol-259-4                    764M  645M  119M  85% /mnt/data/external/E048FBAF48FB8318
/data/service/el2/100/hmdfs/account      10G  217M   10G   3% /mnt/hmdfs/100/account
/data/service/el2/100/hmdfs/non_account  10G  217M   10G   3% /mnt/hmdfs/100/non_account

# blkid /dev/block/vol-259-3
/dev/block/vol-259-3: UUID="30FC1457FC1419A4" TYPE="ntfs"
# blkid /dev/block/nvme0n1p3
/dev/block/nvme0n1p3: UUID="30FC1457FC1419A4" TYPE="ntfs"

```

通过 uuid 得知其中 /dev/block/vol-259-x 就是我们的 SSD 设备，已经正常挂载到系统中了。

## MIPI CSI

当前系统仅适配了 IMX415，MIPI CSI 接线方式如下：

<img src="/img/rock5c/rock5c-camera-4k.webp" alt="kaihong mipi csi" />

连接摄像头后，可以打开系统相机应用，预览摄像头效果。
