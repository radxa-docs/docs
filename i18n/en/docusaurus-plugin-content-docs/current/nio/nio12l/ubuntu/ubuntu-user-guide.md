---
sidebar_position: 5
---

# Ubuntu User Guide

## Default username and password

```text
username : ubuntu
password : ubuntu
```

## Accessing the device

### Option 1: HDMI display, USB keyboard and mouse

You can see the desktop environment on the HDMI display.

### Option 2: SSH

The SSH service is enabled by default.
You can check the device IP address on your router's management page, or use [angryip](https://angryip.org/) on your PC to scan and find the device IP.

```bash
$ ping ip-of-device
$ ssh ubuntu@ip-of-device
```

On the first login, you will be forced to change the password. Please follow the on‑screen prompts.

### Option 3: Serial port

Refer to [NIO 12L Serial Usage](../low-level-dev/serial).

## Add repository and install video hardware packages

```bash
$ sudo apt-add-repository ppa:mediatek-genio/genio-public
$ sudo apt update
$ sudo apt install mediatek-vpud-genio1200
$ sudo apt install gstreamer1.0-plugins-base
$ sudo apt install gstreamer1.0-plugins-good
$ sudo apt install gstreamer1.0-plugins-bad
$ sudo rm ~/.cache/gstreamer-1.0/registry.aarch64.bin
```

## Update kernel

Download and install the latest kernel packages:

```bash
$ wget https://dl.radxa.com/nio12l/images/ubuntu/radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ tar zxvf radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ sudo dpkg -i radxa-nio-12l-kernel-5.15.0-1029.33-packages/*.deb
```

After installing the kernel, you must reboot for it to take effect.

## Using the Radxa Display 8HD touchscreen

### Step 1: Update the kernel to the latest version

The latest kernel version is 5.15.0-1029.33.

### Step 2: Add the `radxa-nio-12l-radxa-display-8hd` DT overlay

Go to the top‑level directory where the Ubuntu image files are stored on your host PC.
Edit the `u-boot-initial-env` file.
Find the line starting with `list_dtbo=` and append the string `radxa-nio-12l-radxa-display-8hd.dtbo`. For example:

```text
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo radxa-nio-12l-radxa-display-8hd.dtbo
```

### Step 3: Run the `genio-flash board-assets` command

```bash
$ genio-flash board-assets
```

### Step 4: Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the new `u-boot-initial-env` to the device from the host.

After powering off and rebooting the device, you should see the desktop displayed on the 8HD touchscreen.

## Common hardware interfaces: I2C, UART, SPI, etc.

NIO 12L has a 40‑pin expansion header. UART1 and PWM cannot be used at the same time.

### I2C

#### I2C-2

| PIN# | Function |
| :--: | :------: |
|  3   |   SDA2   |
|  5   |   SCL2   |

I2C‑2 is enabled by default in the system.
You can see the device node with:

```bash
ubuntu@mtk-genio:~$ ls /dev/i2c-2
/dev/i2c-2
```

#### I2C-3

| PIN# | Function |
| :--: | :------: |
|  27  |   SCL3   |
|  28  |   SDA3   |

Steps to enable I2C‑3:

1. Add the `i2c3` DT overlay.

Go to the top‑level directory where the Ubuntu image files are stored on your host PC.
Edit the `u-boot-initial-env` file.
Find the line starting with `list_dtbo=` and append the string `i2c3.dtbo`. For example:

```text
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo i2c3.dtbo
```

2. Run the `genio-flash board-assets` command

```bash
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the new `u-boot-initial-env` to the device from the host.

After powering off and rebooting the device, you should see the device node:

```bash
ubuntu@mtk-genio:~$ ls /dev/i2c-3
/dev/i2c-3
```

#### I2C-4

| PIN# | Function |
| :--: | :------: |
|  22  |   SCL4   |
|  32  |   SDA4   |

Steps to enable I2C‑4:

1. Add the `i2c4` DT overlay.

Go to the top‑level directory where the Ubuntu image files are stored on your host PC.
Edit the `u-boot-initial-env` file.
Find the line starting with `list_dtbo=` and append the string `i2c4.dtbo`. For example:

```text
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo i2c4.dtbo
```

2. Run the `genio-flash board-assets` command

```bash
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the new `u-boot-initial-env` to the device from the host.

After powering off and rebooting the device, you should see the device node:

```bash
ubuntu@mtk-genio:~$ ls /dev/i2c-4
/dev/i2c-4
```

### UART

#### UART1

| PIN# | Function  |
| :--: | :-------: |
|  12  | UART1_TXD |
|  26  | UART1_RXD |

To use UART1, you need to modify the board hardware. For example:
Remove resistors R95338 and R95322. Add 0‑ohm resistors R95339 and R95319.

Steps to enable UART1:

1. Add the `uart1` DT overlay.

Go to the top‑level directory where the Ubuntu image files are stored on your host PC.
Edit the `u-boot-initial-env` file.
Find the line starting with `list_dtbo=` and append the string `uart1.dtbo`. For example:

```text
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo uart1.dtbo
```

2. Run the `genio-flash board-assets` command

```bash
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the new `u-boot-initial-env` to the device from the host.

After powering off and rebooting the device, you should see the following kernel log:

```bash
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

1. Add the `spi1-spidev` DT overlay.

Go to the top‑level directory where the Ubuntu image files are stored on your host PC.
Edit the `u-boot-initial-env` file.
Find the line starting with `list_dtbo=` and append the string `spi1-spidev.dtbo`. For example:

```text
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo spi1-spidev.dtbo
```

2. Run the `genio-flash board-assets` command

```bash
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the new `u-boot-initial-env` to the device from the host.

After powering off and rebooting the device, you should see the device node:

```bash
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

1. Add the `spi2-spidev` DT overlay.

Go to the top‑level directory where the Ubuntu image files are stored on your host PC.
Edit the `u-boot-initial-env` file.
Find the line starting with `list_dtbo=` and append the string `spi2-spidev.dtbo`. For example:

```text
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo spi2-spidev.dtbo
```

2. Run the `genio-flash board-assets` command

```bash
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the new `u-boot-initial-env` to the device from the host.

After powering off and rebooting the device, you should see the device node:

```bash
ubuntu@mtk-genio:~$ ls /dev/spidev2.0
/dev/spidev2.0
```

### PWM

| PIN# | Function |
| :--: | :------: |
|  12  |   PWM    |

Steps to enable PWM:

1. Add the `gpio104-pwm` DT overlay.

Go to the top‑level directory where the Ubuntu image files are stored on your host PC.
Edit the `u-boot-initial-env` file.
Find the line starting with `list_dtbo=` and append the string `gpio104-pwm.dtbo`. For example:

```text
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo gpio104-pwm.dtbo
```

2. Run the `genio-flash board-assets` command

```bash
$ genio-flash board-assets
```

3. Put the board into download mode

Refer to [NIO 12L Enter Download Mode](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

This will update the new `u-boot-initial-env` to the device from the host.

After powering off and rebooting the device, you should see the device files:

```bash
ubuntu@mtk-genio:~$ ls /sys/class/pwm/pwmchip0/
device  export  npwm  power  subsystem  uevent  unexport
```

## Install Qt

Install `qtcreator`:

```bash
$ sudo apt update && sudo apt install -y qtcreator
```

Note:
You can enable multiple DT overlays at the same time, for example:

```text
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo i2c3.dtbo i2c4.dtbo gpio104-pwm.dtbo spi1-spidev.dtbo spi2-spidev.dtbo
```
