---
sidebar_position: 1
doc_kind: page
---

# Install Armbian 26

Armbian Imager is the official image download and flashing utility from Armbian. It can download official images online or write a local image file. The utility automatically downloads, decompresses, writes, and verifies the image.

:::caution
Flashing erases all data on the target storage device. Back up important files and carefully confirm the target device before continuing.
:::

## Connect the Target Device

Connect the storage device that you want to flash to your computer.

:::tip
Armbian Imager can flash a system directly to a UFS module. Install the UFS module on the board, put the board into [EDL mode](../low-level-dev/edl-mode), connect the board to your computer with a USB cable, and then select the corresponding UFS system image.
:::

## Download Armbian Imager

Visit the [Armbian Imager](https://imager.armbian.com/) website, download the version that matches your operating system and processor architecture, and install it.

## Use Armbian Imager
Open Armbian Imager and click `Start now` to open the board and image selection screen.

<img src="/img/dragon/q8b/armbian/01-start-now.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Select the Manufacturer

Select `Radxa` from the manufacturer list.

<img src="/img/dragon/q8b/armbian/02-vendor-radxa.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Select the Board

Select the product on which you want to install the system. This guide uses `Dragon Q8B` as an example.

:::note
Select the model that matches your actual hardware to ensure that the image and boot configuration are correct.
:::

<img src="/img/dragon/q8b/armbian/03-board.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Select the Image

Select the Armbian system image that you want to install. This guide uses Armbian Ubuntu 26.04 as an example. Available versions may change; refer to the versions shown in Armbian Imager.

If the target is a UFS module, select an image designed for UFS. These image options usually include a `UFS` label.

<img src="/img/dragon/q8b/armbian/04-image.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Select a Local Image (Optional)

If you have already downloaded a system image, select `Custom Image` and import the local image file.

After selecting a local image, you do not need to select a manufacturer, board, or online image. You can proceed directly to selecting the target storage device.

<img src="/img/dragon/q8b/armbian/05-custom-image.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Select the Target Storage Device

Select the storage device to which the system will be written, and carefully verify its name and capacity.

:::caution
All existing data on the selected device will be erased. Do not select your computer's system drive or another important storage device.
:::

<img src="/img/dragon/q8b/armbian/06-target-device.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Start Flashing

After confirming the image and target device, click `Erase & Flash`. Armbian Imager downloads the image (skipped for a local image), decompresses it, erases the target device, writes the system image, and verifies the written data.

<img src="/img/dragon/q8b/armbian/07-erase-flash.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Complete Flashing

When `Flash Complete!` appears, the system image has been written and verified successfully.

<img src="/img/dragon/q8b/armbian/08-flash-complete.webp" style={{width: '100%', maxWidth: '1200px'}} />

## Use the System

If you flashed the system image to a UFS module through EDL mode, power on the board after flashing and the system will start automatically.

If the system is installed on a microSD card or NVMe SSD, install the storage device in the corresponding slot on the board, and then connect the power adapter. The device will start automatically.

### Set the Root Password

At first boot, follow the prompts to set a password for the root user.

<img src="/img/dragon/q8b/armbian/09-root-password.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Select the System Shell

Select the default command-line shell.

<img src="/img/dragon/q8b/armbian/10-shell.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Set the Username and Password

Follow the prompts to create a regular user and set its password.

<img src="/img/dragon/q8b/armbian/11-user-password.webp" style={{width: '100%', maxWidth: '1200px'}} />

### Set the Locale and Time Zone

Select the locale, country, and time zone for your region, and then confirm the settings.

<img src="/img/dragon/q8b/armbian/12-locale-select.webp" style={{width: '100%', maxWidth: '1200px'}} />

<img src="/img/dragon/q8b/armbian/13-locale-confirm.webp" style={{width: '100%', maxWidth: '1200px'}} />

### System Desktop

After completing the initial setup, the Armbian desktop appears.

<img src="/img/dragon/q8b/armbian/14-desktop.webp" style={{width: '100%', maxWidth: '1200px'}} />
