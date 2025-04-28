---
sidebar_position: 3
---

# 接口使用说明

## 接口预览

<img src="/img/e/e54c/e54c-board-label.webp" width="800" alt="e54c-board-label" />

## 接口使用说明

### 电源状态 LED

电源状态指示灯，当设备接通电源后亮起，绿灯。

### 网络状态 LED

四个网口状态指示灯，其亮灭跟随各网口的信号变化。

### 用户按钮 (User Button)

用户可编程按键，可通过软件自定义功能。

### 电源按钮 (Power Button)

用于开启和关闭设备电源。

### 12V DC 电源接口

电源输入，Radxa E54C 使用 12V 电压输入，接口为标准 5525 DC 接口，可参考[电源选择](./power-supply)。

### 千兆以太网端口

Radxa E54C 提供四个千兆以太网端口。在 OpenWrt 系统下，这些接口可以灵活配置为 WAN（广域网接口）或 LAN（局域网接口）端口，为用户提供高度定制的网络解决方案。多个端口还提供了冗余和负载均衡能力，从而增强网络可靠性和性能。

#### 唯一 MAC 地址

Radxa E54C 的 MAC 地址是唯一且固定的，在每次断电重启或者软件重启，MAC 都保持不变，且重新刷机后也是保持不变的。

#### 网口测速

- 安装 iperf3 工具

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```
sudo apt-get install iperf3
```

</NewCodeBlock>

- 在服务器端运行命令：

<NewCodeBlock type="host">

```
iperf -s
```

</NewCodeBlock>

- 测速

1. 测试上传速度

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```
iperf3 -c server-ip -t 60
```

</NewCodeBlock>

2. 测试下载速度

<NewCodeBlock type="host">

```
iperf3 -c server-ip -t 60 -R
```

</NewCodeBlock>

### USB Type-C 口

作为调试口用以查看日志和访问设备，波特率默认1500000。

作为数据传输接口，支持 USB3.0 OTG、烧录固件和 DP 显示输出。

#### USB3.0 OTG

支持 adb。

支持 usbnet。

支持 mass storage。

下面以 USB 大容量存储示例，执行命令前通过 M-Key 插好 SSD。

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```
modprobe libcomposite
modprobe usb_f_mass_storage
systemctl daemon-reload
umount /sys/kernel/config
mount -t configfs none /sys/kernel/config
cd /sys/kernel/config/usb_gadget
mkdir -p my_udisk
cd my_udisk
echo 0x1d6b > idVendor
echo 0x0104 > idProduct
echo 0x0100 > bcdDevice
echo 0x0300 > bcdUSB
mkdir -p strings/0x409
echo "123456789" > strings/0x409/serialnumber
echo "My Manufacturer" > strings/0x409/manufacturer
echo "My USB Disk" > strings/0x409/product
mkdir -p configs/c.1
mkdir -p configs/c.1/strings/0x409
echo "Mass Storage Config" > configs/c.1/strings/0x409/configuration
mkdir -p functions/mass_storage.usb0
mkfs.ext4 /dev/nvme0n1p1
echo /dev/nvme0n1p1 > functions/mass_storage.usb0/lun.0/file
ln -s functions/mass_storage.usb0 configs/c.1
echo fc000000.usb > UDC
```

</NewCodeBlock>

:::tip
上述命令是完成 USB 3.0 的 mass storage 配置，如果需要 USB 2.0 的 mass storage 配置，仅需要将 echo 0x0300 > bcdUSB 修改成 echo 0x0200 > bcdUSB。
:::

使用 USB Type-A to Type-C 线接好 PC 和 E54C，在 PC 端将出现:

<NewCodeBlock type="host">

```
$ lsblk 
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
...
sdb           8:16   1 953.9G  0 disk /media/devmon/sdb-usb-Linux_File-Stor_
...
```

</NewCodeBlock>

你可拷贝文件到这个 mass storage 设备上:

<NewCodeBlock type="host">

```
$ lsblk 
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
...
cp /home/lsj/Downloads/test.wav /media/devmon/sdb-usb-Linux_File-Stor_
md5sum /media/devmon/sdb-usb-Linux_File-Stor_/test.wav 
...
```

</NewCodeBlock>

在 E54C 上查看:

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```
systemctl daemon-reload
mount /dev/nvme0n1p1 /mnt/
ls /mnt/
md5sum /mnt/test.wav
```

</NewCodeBlock>

#### DP 显示

支持 4K 分辨率，显示屏需额外供电。

### Maskrom 按钮

Maskrom 按键，用以进入 Maskrom 模式完成刷机。

### USB 3.0 HOST Type-A

提供高速 USB 3.0 接口，用于连接外部设备，如存储设备、网络适配器等。

### USB 2.0 HOST Type-A

提供两个 USB 2.0 接口，用于连接外部设备，如键盘、鼠标、存储设备等。

#### 外设连接测试

反复拔插 USB 外设，确保每次都能正常识别得到，且正常使用

识别存储设备

    <NewCodeBlock tip="root@radxa-e54c#" type="device">

    ```
    $ lsusb
      Bus 001 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
    ```

    </NewCodeBlock>

如上所示，这里已经成功识别到了 Micro-SD Card Reader

#### 传输速率测试

1. 确定 USB 存储设备

通过 lsblk 确认 USB 存储设备

  <NewCodeBlock tip="root@radxa-e54c#" type="device">

```
$ lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda            8:0    1 29.3G  0 disk
├─sda1         8:1    1  256M  0 part
└─sda2         8:2    1   29G  0 part
mmcblk0      179:0    0 14.5G  0 disk
├─mmcblk0p1  179:1    0  256M  0 part /boot
└─mmcblk0p2  179:2    0 14.2G  0 part /
```

  </NewCodeBlock>

2. 测试读写速度

  <NewCodeBlock tip="root@radxa-e54c#" type="device">

```
# 测试写入速度
dd if=/dev/zero of=/mnt/usb/test.img bs=1M count=1024 oflag=direct

# 测试读取速度
dd if=/mnt/usb/test.img of=/dev/null bs=1M count=1024 iflag=direct
```

  </NewCodeBlock>

### HDMI 2.1 接口

支持高达 8K 分辨率的视频输出，可连接显示器或电视。

### M.2 M Key 接口

提供 PCIe 2.1 1-lane 接口，用于连接 M.2 NVMe SSD。支持标准 M.2 2280 规格的 NVMe SSD，注意不支持 M.2 SATA SSD。

#### 安装 NVMe SSD

1. 确保设备已关机并断开电源
2. 将 M.2 NVMe SSD 插入 M.2 M Key 插槽
3. 使用螺丝固定 SSD
4. 连接电源并启动设备

#### 测试 NVMe SSD 性能

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```
# 安装测试工具
sudo apt-get install hdparm

# 测试读取性能
sudo hdparm -t /dev/nvme0n1

# 使用 dd 测试写入性能
sudo dd if=/dev/zero of=/mnt/nvme/test.img bs=1M count=1024 oflag=direct
```

</NewCodeBlock>

### microSD 卡插槽

用于插入 microSD 存储卡，可作为系统启动盘或额外存储空间。

### 风扇接口

2-Pin 1.25mm 风扇接口，用于连接散热风扇。

### RTC 电池接口

2-Pin 1.25mm RTC 电池接口，用于连接实时时钟电池，保持系统时间在断电后仍然准确。

### GPIO 接口

14-Pin 0.1" (2.54mm) 接口，支持多种接口功能：

- 1x SPI
- 1x UART
- 1x I2C
- 2x 5V 电源输出
- 1x 3.3V 电源输出

#### GPIO 使用示例

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```
# 安装 GPIO 控制工具
sudo apt-get install gpiod

# 列出可用的 GPIO 芯片
gpiodetect

# 查看 GPIO 状态
gpioinfo

# 控制 GPIO 输出
gpioset <chip> <line>=<value>

# 读取 GPIO 输入
gpioget <chip> <line>
```

</NewCodeBlock>
