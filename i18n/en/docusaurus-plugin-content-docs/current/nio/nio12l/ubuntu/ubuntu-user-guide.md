---
sidebar_position: 5
---

# Ubuntu User guide

## Default user name and password

<pre>
username : ubuntu
password : ubuntu
</pre>

## Access the device

### Option one: Use HDMI monitor, USB keyboard and mouse

You can view the Desktop on the monitor.

### Option two: SSH

ssh service is enabled by default.
You can find the IP from the router management windows or [angryip](https://angryip.org/).

<pre>
$ ping ip-of-device
$ ssh ubuntu@ip-of-device
</pre>

The first login will force the user to change their password. Please follow the prompts.

### Option three: Serial port

Please refer to [NIO 12L serial port usage](/nio/nio12l/low-level-dev/serial).

## Add APT source and install video hardware packages

<pre>
$ sudo apt-add-repository ppa:mediatek-genio/genio-public
$ sudo apt update
$ sudo apt install mediatek-vpud-genio1200
$ sudo apt install gstreamer1.0-plugins-base
$ sudo apt install gstreamer1.0-plugins-good
$ sudo apt install gstreamer1.0-plugins-bad
$ sudo rm ~/.cache/gstreamer-1.0/registry.aarch64.bin
</pre>

## Update kernel

Download the latest kernel packages and install them.

<pre>
$ wget https://dl.radxa.com/nio12l/images/ubuntu/radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ tar zxvf radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ sudo dpkg -i radxa-nio-12l-kernel-5.15.0-1029.33-packages/*.deb
</pre>

After installing the kernel, a restart is required for it to take effect.

## Use Radxa Display 8HD Touchscreen

### Step one: Update the kernel to the latest version

The latest kernel version is 5.15.0-1029.33.

### Step two: Add radxa-nio-12l-radxa-display-8hd dt overlay

Navigate to the top level of directory including ubuntu system files.
Modify file `u-boot-initial-env`.
Find the line `list_dtbo=` and write `radxa-nio-12l-radxa-display-8hd.dtbo` at the end of the line. Like this:

<pre>
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo radxa-nio-12l-radxa-display-8hd.dtbo
</pre>

### Step three: Execute the command `genio-flash board-assets`

<pre>
$ genio-flash board-assets
</pre>

### Step four: Boot the device to download mode

Please refer to [NIO 12L Download mode](/en/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

The Host PC will update the `u-boot-initial-env` to the device OS.

Power cycle the device and you will see the Desktop on the 8HD touchscreen.
