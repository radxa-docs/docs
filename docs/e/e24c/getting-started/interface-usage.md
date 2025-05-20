---
sidebar_position: 2
---

# 接口使用

## 1. 接口预览

<Tabs queryString="e24cmode2">

<TabItem value="E24C (裸板)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C 裸板接口</div>
  <img src="/img/e/e24c/e24c-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| 序号 | 说明                                          | 数量 |
| :--: | :-------------------------------------------- | :--: |
|  ①   | 电源接口：DC5525                              |  1   |
|  ②   | 板载 eMMC                                     |  1   |
|  ③   | USB 2.0 Type‑C 型接口：从设备加调试二合一接口 |  1   |
|  ④   | 用户按键                                      |  1   |
|  ⑤   | USB 2.0 Type‑A 型接口                         |  3   |
|  ⑥   | RTC 电池接口                                  |  1   |
|  ⑦   | MicroSD 卡槽                                  |  1   |
|  ⑧   | GPIO：14Pin 拓展排针                          |  1   |
|  ⑨   | LED 状态指示灯(1个电源指示灯，4个网口指示灯)  |  5   |
|  ⑩   | 电源按键                                      |  1   |
|  ⑪   | 风扇接口                                      |  1   |
|  ⑫   | Maskrom 按键                                  |  1   |
|  ⑬   | 千兆以太网接口( WAN/LAN 可配置)               |  4   |
|  ⑭   | HDMI2.1 输出接口                              |  1   |
|  ⑮   | M.2 NVME SSD 接口                             |  1   |

</TabItem>

<TabItem value="E24C (外壳版)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C 外壳版接口</div>
  <img src="/img/e/e24c/e24c-shell-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| 序号 | 说明                                          | 数量 |
| :--: | :-------------------------------------------- | :--: |
|  ①   | 电源接口：DC5525                              |  1   |
|  ②   | HDMI2.1 输出接口                              |  1   |
|  ③   | 千兆以太网接口( WAN/LAN 可配置)               |  4   |
|  ④   | 电源按键                                      |  1   |
|  ⑤   | LED 状态指示灯(1个电源指示灯，4个网口指示灯)  |  5   |
|  ⑥   | MicroSD 卡槽                                  |  1   |
|  ⑦   | USB 2.0 Type‑A 型接口                         |  3   |
|  ⑧   | Maskrom 按键                                  |  1   |
|  ⑨   | 用户按键                                      |  1   |
|  ⑩   | USB 2.0 Type‑C 型接口：从设备加调试二合一接口 |  1   |

</TabItem>

</Tabs>

## 2. 接口说明

以 Radxa E24C 裸板作为示例进行接口说明。

### 2.1 电源接口

使用 DC5525 接口的 12V/2A 电源适配器进行供电。

:::tip

参考电源：

- [瑞莎 DC12 36W电源适配器](https://radxa.com/products/accessories/power-dc12-36w)(推荐使用)
- [瑞莎 DC12 60W电源适配器](https://radxa.com/products/accessories/power-dc12-60w)
- 标准 12V/2A DC 电源适配器( DC5525 接口)

:::

### 2.2 板载 eMMC

可选板载 eMMC 存储配置。

### 2.3 USB 2.0 Type‑C 型接口

作为调试口用以查看日志和访问设备，波特率默认1500000。

作为数据传输接口，支持 USB2.0 OTG 数据传输和串口调试。

- USB2.0 OTG

支持 adb 、usbnet 、mass storage。

以 USB 大容量存储示例，执行命令前通过 M-Key 插好 SSD。

<NewCodeBlock tip="radxa@radxa-e24c$" type="host">
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

### 2.4 用户按键

用户可编程按键，可通过软件自定义功能。

### 2.5 USB 2.0 Type‑A型接口

提供3个 USB 2.0 接口，用于连接外部设备，如键盘、鼠标、存储设备等。

### 2.6 RTC 电池接口

2-Pin 1.25mm RTC 电池接口，用于连接实时时钟电池，保持系统时间在断电后仍然准确。

### 2.7 MicroSD 卡槽

用于插入 MicroSD 卡，可作为系统启动盘或拓展存储空间。

### 2.8 GPIO：14Pin 拓展排针

14-Pin 0.1" (2.54mm) 接口，支持多种接口功能：

- 1x SPI
- 1x UART
- 1x I2C
- 2x 5V 电源输出
- 1x 3.3V 电源输出

- 使用示例

<NewCodeBlock tip="radxa@radxa-e24c$" type="host">
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

### 2.9 LED状态指示灯

5个状态指示灯，显示电源和网络状态：可根据 Radxa E24C 裸板上的丝印辨识对应指示灯。

- 电源指示灯：设备接通电源亮绿灯
- 网络状态指示灯：LED 亮灭跟随对应网口信号变化

### 2.10 电源按键

用于开启和关闭设备电源。

### 2.11 风扇接口

2-Pin 1.25mm 风扇接口，用于连接散热风扇。

### 2.12 Maskrom按键

Maskrom 按键，用于进入 Maskrom 模式完成刷机。

### 2.13 千兆以太网接口

提供四个千兆以太网端口。

在 OpenWrt 系统下，这些接口可以灵活配置为 WAN（广域网接口）或 LAN（局域网接口）端口，为用户提供高度定制的网络解决方案。多个端口还提供了冗余和负载均衡能力，从而增强网络可靠性和性能。

- 唯一MAC地址

Radxa E24C 的 MAC 地址是唯一且固定的，在每次断电重启或者软件重启， MAC 都保持不变，且重新刷机后也是保持不变的。

- 网口测速

<NewCodeBlock tip="radxa@radxa-e24c$" type="host">
```
# 安装 iperf3 工具
sudo apt install iperf3

# 在服务器端运行命令
iperf -s

# 测试上传速度
iperf3 -c server-ip -t 60

# 测试下载速度
iperf3 -c server-ip -t 60 -R
```
</NewCodeBlock>

### 2.14 HDMI2.1 输出接口

支持高达 4K 分辨率的视频输出，可连接显示器或电视。

### 2.15 M.2 NVME SSD 接口

提供 PCIe 2.1 1-lane 接口，用于连接 M.2 NVMe SSD。
支持标准 M.2 2280 规格的 NVMe SSD，注意不支持 M.2 SATA SSD。
