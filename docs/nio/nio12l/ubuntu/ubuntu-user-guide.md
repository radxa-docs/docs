---
sidebar_position: 5
---

# Ubuntu 用户指南

## 默认用户名和密码

```
username : ubuntu
password : ubuntu
```

## 访问设备

### 选项一：使用 HDMI 显示器，USB 键盘和鼠标

可以在 HDMI 显示器看到桌面系统。

### 选项二：SSH

SSH 服务默认是使能的。
可以在路由器管理界面查看设备的 IP；或者是通过电脑主机的 [angryip](https://angryip.org/) 来找到设备的 IP。

```
$ ping ip-of-device
$ ssh ubuntu@ip-of-device
```

第一次登陆，会强制让用户修改密码。请按照提示操作。

### 选项三：串口

可以参照 [NIO 12L 串口使用](../low-level-dev/serial)。

## 添加源并安装视频硬件包

```
$ sudo apt-add-repository ppa:mediatek-genio/genio-public
$ sudo apt update
$ sudo apt install mediatek-vpud-genio1200
$ sudo apt install gstreamer1.0-plugins-base
$ sudo apt install gstreamer1.0-plugins-good
$ sudo apt install gstreamer1.0-plugins-bad
$ sudo rm ~/.cache/gstreamer-1.0/registry.aarch64.bin
```

## 更新内核

下载最新的 kernel 包，并安装

```
$ wget https://dl.radxa.com/nio12l/images/ubuntu/radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ tar zxvf radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ sudo dpkg -i radxa-nio-12l-kernel-5.15.0-1029.33-packages/*.deb
```

安装完内核后，需要重启才生效。

## 使用触摸屏 Radxa Display 8HD

### 步骤一：更新内核到最新

最新的内核版本是 5.15.0-1029.33。

### 步骤二：添加 radxa-nio-12l-radxa-display-8hd dt overlay

进入主机中存放 ubuntu 镜像文件的顶层目录。
修改文件 `u-boot-initial-env`。
找到 `list_dtbo=` 行，追加写入 `radxa-nio-12l-radxa-display-8hd.dtbo` 字符串。如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo radxa-nio-12l-radxa-display-8hd.dtbo
```

### 步骤三：执行命令 `genio-flash board-assets`

```
$ genio-flash board-assets
```

### 步骤四：板子进入下载模式

参照[NIO 12L 进入烧录模式](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

这样主机将会把新的 `u-boot-initial-env` 更新到设备中。

断电重启设备后，将会看到 8HD 触摸屏显示桌面。

## 常用硬件接口 I2C, UART, SPI, etc

NIO 12L 有一个 40-PIN 的扩展座子。UART1 和 PWM 没法同时用。

### I2C

#### I2C-2

| PIN# | Function |
| :--: | :------: |
|  3   |   SDA2   |
|  5   |   SCL2   |

系统默认开启了 I2C-2。
可以在系统中看到

```
ubuntu@mtk-genio:~$ ls /dev/i2c-2
/dev/i2c-2
```

#### I2C-3

| PIN# | Function |
| :--: | :------: |
|  27  |   SCL3   |
|  28  |   SDA3   |

开启 I2C-3 的步骤：

1，添加 i2c3 dt overlay

进入主机中存放 ubuntu 镜像文件的顶层目录。
修改文件 `u-boot-initial-env`。
找到 `list_dtbo=` 行，追加写入 `i2c3.dtbo` 字符串。如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo i2c3.dtbo
```

2，执行命令 `genio-flash board-assets`

```
$ genio-flash board-assets
```

3，板子进入下载模式

参照[NIO 12L 进入烧录模式](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

这样主机将会把新的 `u-boot-initial-env` 更新到设备中。

断电重启设备后，将会看到有设备。

```
ubuntu@mtk-genio:~$ ls /dev/i2c-3
/dev/i2c-3
```

#### I2C-4

| PIN# | Function |
| :--: | :------: |
|  22  |   SCL4   |
|  32  |   SDA4   |

开启 I2C-4 的步骤：

1，添加 i2c4 dt overlay

进入主机中存放 ubuntu 镜像文件的顶层目录。
修改文件 `u-boot-initial-env`。
找到 `list_dtbo=` 行，追加写入 `i2c4.dtbo` 字符串。如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo i2c4.dtbo
```

2，执行命令 `genio-flash board-assets`

```
$ genio-flash board-assets
```

3，板子进入下载模式

参照[NIO 12L 进入烧录模式](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

这样主机将会把新的 `u-boot-initial-env` 更新到设备中。

断电重启设备后，将会看到有设备。

```
ubuntu@mtk-genio:~$ ls /dev/i2c-4
/dev/i2c-4
```

### UART

#### UART1

| PIN# | Function  |
| :--: | :-------: |
|  12  | UART1_TXD |
|  26  | UART1_RXD |

使用 UART1 时，需要修改板子的硬件。如：
移除电阻 R95338 和 R95322。添加 0 OHm 电阻R95339 和 R95319。

开启 UART1 的步骤：

1，添加 uart1 dt overlay

进入主机中存放 ubuntu 镜像文件的顶层目录。
修改文件 `u-boot-initial-env`。
找到 `list_dtbo=` 行，追加写入 `uart1.dtbo` 字符串。如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo uart1.dtbo
```

2，执行命令 `genio-flash board-assets`

```
$ genio-flash board-assets
```

3，板子进入下载模式

参照[NIO 12L 进入烧录模式](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

这样主机将会把新的 `u-boot-initial-env` 更新到设备中。

断电重启设备后，将会看到有如下内核日志信息。

```
ubuntu@mtk-genio:~$ sudo dmesg | grep ttyS1
[    0.476376] 11001200.serial: ttyS1 at MMIO 0x11001200 (irq = 289, base_baud = 1625000) is a ST16650V2
```

### SPI

#### SPI1

| PIN# | Function  |
| :--: | :-------: |
|  7   | SPIM1_CSB |
|  11  | SPIM1_CLK |
|  13  | SPIM1_MO  |
|  15  | SPIM1_MI  |

开启 SPI1 的步骤：

1，添加 spi1-spidev dt overlay

进入主机中存放 ubuntu 镜像文件的顶层目录。
修改文件 `u-boot-initial-env`。
找到 `list_dtbo=` 行，追加写入 `spi1-spidev.dtbo` 字符串。如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo spi1-spidev.dtbo
```

2，执行命令 `genio-flash board-assets`

```
$ genio-flash board-assets
```

3，板子进入下载模式

参照[NIO 12L 进入烧录模式](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

这样主机将会把新的 `u-boot-initial-env` 更新到设备中。

断电重启设备后，将会看到有设备。

```
ubuntu@mtk-genio:~$ ls /dev/spidev1.0
/dev/spidev1.0
```

#### SPI2

| PIN# | Function  |
| :--: | :-------: |
|  19  | SPIM2_MO  |
|  21  | SPIM2_MI  |
|  23  | SPIM2_CLK |
|  24  | SPIM2_CSB |

开启 SPI2 的步骤：

1，添加 spi2-spidev dt overlay

进入主机中存放 ubuntu 镜像文件的顶层目录。
修改文件 `u-boot-initial-env`。
找到 `list_dtbo=` 行，追加写入 `spi2-spidev.dtbo` 字符串。如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo spi2-spidev.dtbo
```

2，执行命令 `genio-flash board-assets`

```
$ genio-flash board-assets
```

3，板子进入下载模式

参照[NIO 12L 进入烧录模式](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

这样主机将会把新的 `u-boot-initial-env` 更新到设备中。

断电重启设备后，将会看到有设备。

```
ubuntu@mtk-genio:~$ ls /dev/spidev2.0
/dev/spidev2.0
```

### PWM

| PIN# | Function |
| :--: | :------: |
|  12  |   PWM    |

开启 PWM 的步骤：

1，添加 gpio104-pwm dt overlay

进入主机中存放 ubuntu 镜像文件的顶层目录。
修改文件 `u-boot-initial-env`。
找到 `list_dtbo=` 行，追加写入 `gpio104-pwm.dtbo` 字符串。如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo gpio104-pwm.dtbo
```

2，执行命令 `genio-flash board-assets`

```
$ genio-flash board-assets
```

3，板子进入下载模式

参照[NIO 12L 进入烧录模式](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

这样主机将会把新的 `u-boot-initial-env` 更新到设备中。

断电重启设备后，将会看到有设备文件。

```
ubuntu@mtk-genio:~$ ls /sys/class/pwm/pwmchip0/
device  export  npwm  power  subsystem  uevent  unexport
```

## 安装 QT

安装 qtcreator。

```
$ sudo apt update && sudo apt install -y qtcreator
```

说明：
用户可以同时打开多个 dt overlay，如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo i2c3.dtbo i2c4.dtbo gpio104-pwm.dtbo spi1-spidev.dtbo spi2-spidev.dtbo
```
