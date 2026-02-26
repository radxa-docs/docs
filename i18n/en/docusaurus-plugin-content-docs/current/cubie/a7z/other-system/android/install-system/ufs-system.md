---
sidebar_position: 4
---

# Install System to the Onboard UFS

This section explains how to flash the Android system directly to the Cubie A7Z onboard UFS storage.

:::warning
Flashing the system erases the UFS drive. Back up any important data in advance!
:::

## Hardware Checklist

Have the following items ready:

- Board: Radxa Cubie A7Z
- Power/data cable: USB Type‑A to Type‑C cable

:::tip Recommended accessory

- [Radxa 30 W PD Power Adapter (recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Software Preparation

Allwinner’s flashing utilities are required to write the Phoenix-format Android image to the onboard UFS. Download them from the [Resources download page](../../../download).

**PhoenixSuit**: Windows utility for burning images to UFS.

**LiveSuit**: Linux utility for burning images to UFS.

<Tabs queryString="platform">

<TabItem value="Windows">

Use PhoenixSuit on Windows.

:::tip
On Windows 11, go to **Windows Security → Device security → Core isolation** and disable every switch; otherwise the driver might fail to install.
:::

- **Install the driver**

Unzip `PhoenixSuit`, then open `PhoenixSuit/Drivers/AW_Driver`.

Run `InstallUSBDriver.exe` as Administrator to install the driver.

After a successful installation, Device Manager should list `USB Device (VID_1f3a_PID_efe8)`.

- **Launch PhoenixSuit**

Open the `PhoenixSuit` folder and run `PhoenixSuit.exe`.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-phoenixsuit-windows-1.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux">

Use LiveSuit on Ubuntu (or other Linux distributions).

- **Install dependencies**

```bash
sudo apt update
sudo apt install dkms
```

- **Mark installer as executable**

Unzip the package, enter the LiveSuit directory, and run:

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
sudo chmod +x LiveSuit.run
```
</NewCodeBlock>

- **Run the LiveSuit installer**

Execute `LiveSuit.run` to install the program.

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
./LiveSuit.run
```
</NewCodeBlock>

After a successful installation you will see output similar to:

```text
========***********LiveSuit installed completely***********===========
LiveSuit  has been installed in /home/user_name/Bin/livesuit
========***********LiveSuit installed completely***********===========
```

- **Launch LiveSuit**

Switch to the installation directory and run:

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
sudo ./LiveSuit
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-livesuit-linux-1.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::tip
If the program reports that `libpng12.so.0` is missing, build and install it with the following commands:

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

## Install the System

### Enter FEL Mode

Before powering the board, hold the Cubie A7Z **UBOOT** button. While holding it, connect the board to your PC via the USB Type‑A to Type‑C cable. Release the button after power-on to enter FEL mode.

1. Hold the UBOOT button.
2. Connect the Cubie A7Z Type‑C port to the PC’s Type‑A port with the USB cable.
3. Release the UBOOT button once powered.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7z/a7z-fel-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Burn the Image

Launch the appropriate Allwinner flashing utility for your platform.

<Tabs queryString="platform">

<TabItem value="Windows">

Use PhoenixSuit to flash the image.

- **Prepare the image**

Download the firmware from the [Resources download page](../../../download) and unzip it before flashing.

1. Click **Browse** and select the extracted image file.
2. Choose **Full erase upgrade**.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-phoenixsuit-windows-2.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

If PhoenixSuit does not start flashing automatically, re-enter FEL mode and watch the progress bar.

- **Finishing up**

When PhoenixSuit displays **Firmware download successful**, the process is complete—close the application.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-phoenixsuit-windows-3.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="Linux">

Use LiveSuit to flash the image.

- **Prepare the image**

Download and unzip the firmware from the [Resources download page](../../../download).

1. Click **Image** and select the extracted file.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-livesuit-linux-2.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

If flashing does not start automatically, re-enter FEL mode and monitor both the terminal output and the GUI progress bar.

- **Finishing up**

When the progress reaches **100%**, the flash is complete—close LiveSuit.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-livesuit-linux-3.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>
