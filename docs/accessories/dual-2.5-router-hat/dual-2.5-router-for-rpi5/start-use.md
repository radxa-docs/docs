---
sidebar_position: 6
---

# 开始使用

## 启动系统

把安装好系统的 microSD 卡插入树莓派中，并使用[合适的电源](./power-supply)。让我们通过 ssh 登录到树莓派。

```bash
ssh pi@raspberrypi.local
```

## 启用 Raspberry Pi 5 的 PCIe

Raspberry Pi 5 FPC PCIe 通道默认没有开启，需要我们按照下面的方法开启。

使用下面命令来编辑 `/boot/firmware/config.txt`，把 `dtparam=pciex1` 添加到文件末尾，保存后重启。

![step1](/img/accessories/dual-2.5-route-hat/rpi-using-1.webp)

可参考[树莓派官网文档 PCIe 连接器介绍](https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#raspberry-pi-connector-for-pcie)

## 查看设备

输入 `lspci` 命令来查看是否识别到相关 PCIe 设备。

![step2](/img/accessories/dual-2.5-route-hat/rpi-using-2.webp)

### 查看硬盘

使用 `lsblk` 命令可以查看 nvme 设备。

```bash
lsblk
```

![step3](/img/accessories/dual-2.5-route-hat/rpi-using-3.webp)

#### 速度测试

下面是简单的速度测试。

```bash
sudo dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=1000 status=progress oflag=direct
```

![step4](/img/accessories/dual-2.5-route-hat/rpi-using-4.webp)

#### 强制 Gen 3

把 `dtparam=pciex1_gen=3` 添加到 `/boot/firmware/config.txt` 可以让树莓派 5 强制使用 PCIe Gen 3。

![step5](/img/accessories/dual-2.5-route-hat/rpi-using-5.webp)

添加后重启，可以使用下面命令查看 Radxa Dual 2.5G Router HAT 的连接状态。

```bash
sudo lspci
sudo lspci -vvv -s 0000:03:00.0 | grep LnkSta
```

![step6](/img/accessories/dual-2.5-route-hat/rpi-using-6.webp)

看到使用 Gen3 后，我们可以再测一次写入速度。

![step7](/img/accessories/dual-2.5-route-hat/rpi-using-7.webp)

### 查看以太网设备

使用 `ip a` 来查看是否是识别到 2.5G 双网口

![step8](/img/accessories/dual-2.5-route-hat/rpi-using-8.webp)

#### 测试以太网速度

使用 `iperf3` 来测试 2.5G 以太网速度

执行下面命令来安装 `iperf3` 工具

```bash
sudo apt-get update
sudo apt-get install iperf3
```

首先需要一个支持 2.5G 的服务端，在服务端执行下面的命令：

```bash
iperf3 -s
```

然后在 Raspberry Pi 5 上执行下面的命令

```bash
iperf3 -c xxx.xxx.x.xxx (服务端的 IP)
```

![step9](/img/accessories/dual-2.5-route-hat/rpi-using-9.webp)
