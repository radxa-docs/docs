---
sidebar_position: 5
---

# Ubuntu User guide

## Default user name and password

```
username : ubuntu
password : ubuntu
```

## Access the device

### Option one: Use HDMI monitor, USB keyboard and mouse

You can view the Desktop on the monitor.

### Option two: SSH

ssh service is enabled by default.
You can find the IP from the router management windows or [angryip](https://angryip.org/).

```
$ ping ip-of-device
$ ssh ubuntu@ip-of-device
```

The first login will force the user to change their password. Please follow the prompts.

### Option three: Serial port

Please refer to [NIO 12L serial port usage](../low-level-dev/serial).

## Add APT source and install video hardware packages

```
$ sudo apt-add-repository ppa:mediatek-genio/genio-public
$ sudo apt update
$ sudo apt install mediatek-vpud-genio1200
$ sudo apt install gstreamer1.0-plugins-base
$ sudo apt install gstreamer1.0-plugins-good
$ sudo apt install gstreamer1.0-plugins-bad
$ sudo rm ~/.cache/gstreamer-1.0/registry.aarch64.bin
```

## Update kernel

Download the latest kernel packages and install them.

```
$ wget https://dl.radxa.com/nio12l/images/ubuntu/radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ tar zxvf radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ sudo dpkg -i radxa-nio-12l-kernel-5.15.0-1029.33-packages/*.deb
```

After installing the kernel, a restart is required for it to take effect.

## Use Radxa Display 8HD Touchscreen

### Step one: Update the kernel to the latest version

The latest kernel version is 5.15.0-1029.33.

### Step two: Add radxa-nio-12l-radxa-display-8hd dt overlay

Navigate to the top level of directory including ubuntu system files.
Modify file `u-boot-initial-env`.
Find the line `list_dtbo=` and write `radxa-nio-12l-radxa-display-8hd.dtbo` at the end of the line. Like this:

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo radxa-nio-12l-radxa-display-8hd.dtbo
```

### Step three: Execute the command `genio-flash board-assets`

```
$ genio-flash board-assets
```

### Step four: Boot the device to download mode

Please refer to [NIO 12L Download mode](/en/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

The Host PC will update the `u-boot-initial-env` to the device OS.

After power cycling the device, you will see the following kernel log information.

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

Steps to enable SPI1:

1. Add spi1-spidev dt overlay

Navigate to the top level directory containing the Ubuntu image files on the host machine.
Modify the file `u-boot-initial-env`.
Find the line starting with `list_dtbo=` and append `spi1-spidev.dtbo` to the line. For example:

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo spi1-spidev.dtbo
```

2. Execute the command `genio-flash board-assets`

```
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the `u-boot-initial-env` on the device from the host.

After power cycling the device, you should see the device file.

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

Steps to enable SPI2:

1. Add spi2-spidev dt overlay

Navigate to the top level directory containing the Ubuntu image files on the host machine.
Modify the file `u-boot-initial-env`.
Find the line starting with `list_dtbo=` and append `spi2-spidev.dtbo` to the line. For example:

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo spi2-spidev.dtbo
```

2. Execute the command `genio-flash board-assets`

```
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the `u-boot-initial-env` on the device from the host.

After power cycling the device, you should see the device file.

```
ubuntu@mtk-genio:~$ ls /dev/spidev2.0
/dev/spidev2.0
```

### PWM

| PIN# | Function |
| :--: | :------: |
|  12  |   PWM    |

Steps to enable PWM:

1. Add gpio104-pwm dt overlay

Navigate to the top level directory containing the Ubuntu image files on the host machine.
Modify the file `u-boot-initial-env`.
Find the line starting with `list_dtbo=` and append `gpio104-pwm.dtbo` to the line. For example:

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo gpio104-pwm.dtbo
```

2. Execute the command `genio-flash board-assets`

```
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the `u-boot-initial-env` on the device from the host.

After power cycling the device, you should see the device file.

```
ubuntu@mtk-genio:~$ ls /sys/class/pwm/pwmchip0/
device  export  npwm  power  subsystem  uevent  unexport
```

## Install QT

Install qtcreator:

```
$ sudo apt update && sudo apt install -y qtcreator
```

Note:
Users can enable multiple dt overlays simultaneously, for example:

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo i2c3.dtbo i2c4.dtbo gpio104-pwm.dtbo spi1-spidev.dtbo spi2-spidev.dtbo
```
