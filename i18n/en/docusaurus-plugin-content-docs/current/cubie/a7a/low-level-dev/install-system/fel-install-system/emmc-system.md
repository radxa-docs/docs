---
sidebar_position: 3
---

# Install System to eMMC Module

This section mainly describes how to install the system to the eMMC module.

:::warning
Installing the system will format the eMMC module. Please back up any important data in advance!
:::

## Hardware Preparation

You need to prepare the following hardware in advance:

- Board: Radxa Cubie A7A
- System boot medium: [eMMC Module](https://radxa.com/products/accessories/emmc-module)
- Power/Data cable: USB Type A to Type C data cable
- Power adapter: 5V Type-C power adapter

:::tip
Recommended accessories:

- [Radxa eMMC Module](https://radxa.com/products/accessories/emmc-module)
- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Hardware Description

The Cubie A7A board supports standard PD protocol 5V power input. A current of 3A or above is recommended to ensure stable operation of all peripherals.

- Power/Data cable

Mainly used to power the Cubie A7A and transfer data. You can use a USB Type A to Type C data cable to flash the system image to the eMMC module.

- Power adapter

After the system image is flashed to the eMMC module, you can use a Type-C power adapter to power the Cubie A7A, avoiding insufficient power issues during later development.

## Hardware Connection

Install the eMMC module into the Cubie A7A's eMMC and UFS combo interface.

- Installation steps:

1. Ensure the notch on the eMMC module aligns with the direction of the Cubie A7A's eMMC and UFS combo interface.
2. Ensure the bottom slot of the eMMC module aligns with the Cubie A7A's eMMC and UFS combo interface.
3. Gently press one end of the eMMC module connector until you hear a click, indicating successful installation. Repeat for the other end to ensure the eMMC module is securely installed.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-emmc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Software Preparation

To flash the Phoenix system image to the eMMC module, you need to use the tool provided by Allwinner. You can download the software from the [Resources Download](../../../download) page.

**PhoenixSuit**: A Windows-based tool that can be used to flash the system image to the eMMC module.

**LiveSuit**: A Linux-based tool that can be used to flash the system image to the eMMC module.

<Tabs queryString="platform">

<TabItem value="Windows">

Using the PhoenixSuit tool on Windows.

:::tip
If you are using Windows 11, go to `Windows Security Center` → `Device Security` → `Core Isolation` and turn off all options inside, otherwise you may encounter driver issues or installation failures.
:::

- Install Driver

Extract the downloaded `PhoenixSuit` archive, go to the `PhoenixSuit` --> `Drivers` --> `AW_Driver` directory;

Run `InstallUSBDriver.exe` as administrator to install the driver.

Once the driver is successfully installed, you should see the `USB Device(VID_1f3a_PID_efe8)` device recognized in the device manager.

- Using PhoenixSuit Tool

Go to the `PhoenixSuit` directory and run the `PhoenixSuit.exe` program.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-phoenixsuit-windows-1.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux">

Using the LiveSuit tool on Ubuntu.

- Install Dependencies

```bash
sudo apt update
sudo apt install dkms
```

- Add File Execute Permission
  Extract the downloaded archive, go to the LiveSuit directory, and run the following command to add execute permission to the file.

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
sudo chmod +x LiveSuit.run
```
</NewCodeBlock>

- Run LiveSuit.run File

Run the `LiveSuit.run` file to install the program.

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
./LiveSuit.run
```
</NewCodeBlock>

After the program is successfully installed, you will see information similar to the following output: where `user_name` is the current logged-in username.

```text
========***********LiveSuit installed completely***********===========
LiveSuit  has been installed in /home/user_name/Bin/livesuit
========***********LiveSuit installed completely***********===========
```

- Run LiveSuit Tool

Go to the program directory and run the LiveSuit tool with the following command.
<NewCodeBlock tip="Host-Linux$" type="host">

```bash
sudo ./LiveSuit
```

</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-livesuit-linux-1.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::tip
If you encounter an error about missing `libpng12.so.0`, you can run the following commands to resolve it.

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
mkdir libpng
cd libpng/
wget https://ppa.launchpadcontent.net/linuxuprising/libpng12/ubuntu/pool/main/libp/libpng/libpng_1.2.54.orig.tar.xz
tar -xvf libpng_1.2.54.orig.tar.xz
cd libpng-1.2.54
./configure
make
sudo make install
sudo ln -s /usr/local/lib/libpng12.so.0.54.0 /usr/lib/libpng12.so
sudo ln -s /usr/local/lib/libpng12.so.0.54.0 /usr/lib/libpng12.so.0
```
</NewCodeBlock>
:::

</TabItem>

</Tabs>

## Install System

### Enter FEL Mode

The board needs to enter FEL mode to flash the system image to the eMMC module.

① : Press and hold the `UBOOT` button on the Cubie A7A

② : Use the USB Type A to Type C data cable to connect the USB Type C port of the Cubie A7A to the USB Type A port of the PC

③ : Release the `UBOOT` button on the Cubie A7A

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-write-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Flash System Image

Open the system image flashing tool provided by Allwinner according to your system platform.

<Tabs queryString="platform">

<TabItem value="Windows">

Open the PhoenixSuit tool on the Linux platform to flash the system image.

- Image Flashing

Download the system image file from the [Resources Download](../../../download) page in advance. The system image file needs to be extracted before it can be flashed to the eMMC module.

① : Select the `Browse` option and locate the corresponding file of the system image (select the actual extracted system file)

② : Select the `Full Flash` option

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-phoenixsuit-windows-2.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

If the software does not automatically flash the system to the board, you can make the board re-enter FEL mode and then observe the flashing progress in the software.

- Flashing Complete

When the software displays `Firmware flashing successful`, it means the system image has been successfully flashed. You can close the PhoenixSuit tool at this point.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-phoenixsuit-windows-3.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="Linux">

Open the LiveSuit tool on the Linux platform to flash the system image.

- Image Flashing

Download the system image file from the [Resources Download](../../download) page in advance. The system image file needs to be extracted before it can be flashed to the eMMC module.

① : Select the `Image` option and locate the corresponding file of the system image (select the actual extracted system file)

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-livesuit-linux-2.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

If the software does not automatically flash the system to the board, you can make the board re-enter FEL mode and then observe the information in the terminal output and the progress bar in the software.

- Flashing Complete

When the progress bar shows `100%`, it means the system image has been successfully flashed. You can close the LiveSuit tool at this point.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-livesuit-linux-3.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## System Information

When you use the system image we provide for the first time, you need to log in to the system using the username and password we set.

- radxa

User account: radxa

User password: radxa
