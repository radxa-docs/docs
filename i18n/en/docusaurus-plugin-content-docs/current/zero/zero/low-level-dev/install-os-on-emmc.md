---
sidebar_position: 5
---

## Install the system to eMMC

## Preparation

- 1x USB cable (USB C on one end, USB A on the other)
- 1x 5V power adapter, recommended to use a power adapter with a rated maximum current greater than 2A (recommended [Radxa Power PD30W](../../../accessories/power/pd_30w))

## Image download

Please go to [Resource Download](../download) to download the corresponding image file.

### Put it in Maskrom mode

Please follow the steps below to enter Maskrom mode:

1. Press and hold the USB BOOT button
2. Connect the USB-A port of the USB-A to USB-C cable to the PC, and the USB-C port to the OTG port of the ZERO.
3. Release the USB BOOT button

![ZERO Maskrom](/img/zero/zero/Zero_ports.webp)

## Installing the system to eMMC

### Environment preparation

<Tabs queryString="host_os">
<TabItem value="Windows">

1. Connect the Radxa ZERO to your computer in [Maskrom Mode](#Put-it-in-Maskrom-mode).

2. Download and install the [Zagdig](https://zadig.akeo.ie/) USB driver.

   Make sure the information shown is `GX-CHIP`, the USB ID is `1B8E:C003`, select `libusb-win32`, and click `Install Driver` to install the driver.

   ![Zagdig libusb](/img/zero/zero2pro/Zagdig-libusb.webp)

   Alternatively, you can install fastboot using nexus-tools by running the following command in PowerShell:

   :::tip
   fastboot is used to install Android or manually clear the eMMC bootloader. If you don't need these, you can skip this step.
   :::

   ```bash
   iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/corbindavenport/nexus-tools/master/install.ps1'))
   ```

   You will also need the [Android driver](https://dl.google.com/android/repository/usb_driver_r13-windows.zip) provided by Google.

   Unzip and right click on the .inf file to install the driver.

   ![Android driver](/img/zero/zero2pro/Install-win-android-driver.webp)

   [RZ USB Boot Helper](https://dl.radxa.com/zero/tools/windows/RZ_USB_Boot_Helper_V1.0.0.zip) is a Windows utility made by Radxa for Maskrom communication.

   The tool will list the current mode on its interface. Right now we are using the Maskrom mode:

   ![Rz maskrom](/img/zero/zero2pro/Rz-usb-helper-maskrom.webp)

</TabItem>
<TabItem value="Linux/MacOS">

On such platforms, we can use the Amlogic boot tool to load binaries. First make sure that the [python](https://www.python.org/) environment is installed, then run the following command in a new terminal:

<Tabs queryString="nix">
<TabItem value="MacOS">

```bash
brew install python lsusb libusb
pip3 install pyamlboot
```

Similar to the Windows platform, you can also install fastboot using nexus-tools by running the following commands in the terminal, or skip this step if you don't need these:

```bash
bash <(curl -s https://raw.githubusercontent.com/corbindavenport/nexus-tools/master/install.sh)
```

</TabItem>
<TabItem value="Linux">

```bash
sudo apt update
sudo apt install python3-pip
sudo pip3 install pyamlboot
```

Similar to the Windows platform, you can also install fastboot using nexus-tools by running the following commands in the terminal, or skip this step if you don't need these:

```bash
bash <(curl -s https://raw.githubusercontent.com/corbindavenport/nexus-tools/master/install.sh)
```

</TabItem>
</Tabs>
</TabItem>
</Tabs>

### Flash the firmware

<Tabs queryString="host_os">
<TabItem value="Windows">

Once the tool detects the Maskrom mode, you can click the `Select` button to select the [radxa-zero-erase-emmc.bin](https://dl.radxa.com/zero/images/loader/radxa-zero-erase-emmc.bin) file and then click the `Run` button to load it:

![Rz fastboot](/img/zero/zero2pro/Rz-usb-helper-fastboot.webp)

The results of the run are shown above.

After this, your computer will recognize the Radxa ZERO as a USB storage device, and you can simply flash the system image to it as described in the [Operating System Installation Guide](../getting-started/install-os) and boot up normally.

</TabItem>
<TabItem value="Linux/MacOS">

Under this platform, you can use the boot-g12.py utility.

Run the following command for loading the firmware:

```bash
boot-g12.py radxa-zero-erase-emmc.bin
```

On Linux platforms, you will also need to add `sudo` to obtain permissions:

```bash
sudo boot-g12.py radxa-zero-erase-emmc.bin
```

After this, your computer will recognize the Radxa ZERO as a USB storage device, and you can simply flash the system image to it as described in the [Operating System Installation Guide](../getting-started/install-os) and boot up normally.

</TabItem>
</Tabs>
