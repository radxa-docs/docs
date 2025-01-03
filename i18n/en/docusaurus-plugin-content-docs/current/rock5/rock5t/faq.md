---
sidebar_position: 10
---

# FAQ

## Q1: Connecting Communities

Please refer to https://docs.radxa.com/welcome

## Q2： Can the ROCK 5T boot from a PCIe M.2 NVME SSD without an eMMC and TF card?

Yes, the ROCK 5T can boot from a PCIe M.2 NVME solid state drive.
ROCK 5T is equipped with a 16MB SPI Nor Flash and PCIe M.2 M-Key interface.
The SPI Nor Flash stores the boot loader, and the NVME SSD stores the entire system image (including at least the kernel and rootfs).
See this guide for more information on writing images. [SPI Nor Flash](./getting-started/install-os/erase_spi-flash) and [PCIe NVME SSD](./getting-started/install-os/nvme) boot.

## Q3： Also, are heatsinks and fans included in the price?

No, the heatsink and fan are not included by default.

## Q4：My new ROCK 5T won't boot/stuck in infinite boot loop

The ROCK 5T supports negotiating USB PD power supplies to higher voltages such as 9V, 12V, 15V, 20V to meet total system power load requirements (~30W with WiFi, SSD, USB peripherals, etc.). Currently, the PD negotiation is implemented in the kernel driver and we need to boot into the kernel to start the negotiation, but some power supplies cannot wait for the ROCK 5T negotiation and cut off the power when the timeout occurs, resulting in an infinite boot loop. We offer the following suggestions:

- Use the official power supply - Radxa Power PD 30W.(Highly recommended) The Radxa Power PD 30W has been tested for all conditions of ROCK 5T.
- Use a faster SD card or eMMC module and disable the bootloader/kernel serial console.
- Use a fake 12V USB C power supply
- Check other power supply statuses reported by the community.
- Wait for Radxa to port the PD negotiation to the bootloader (u-boot).
- Double-check that your power supply is capable of delivering the required power, especially the 5V voltage. Many power supplies have a maximum 5V voltage of 3 amps (15W), while others may have a higher maximum 5V voltage.

## Q5： My ROCK 5T won't start, how do I check if it's broken?

Follow the steps below to troubleshoot ROCK 5T:

- Power off the ROCK 5T and remove the eMMC module, SD card, and NVMe SSD.
- Press and hold the MASKROOM button [(tag 32)](. /hardware-design/hardware-interface)
- Plug the ROCK 5T USB C connector into the computer using the USB A to C cable, the green LED should light up
- Check if there is a new USB device in the computer's Device Manager, if so, the ROCK 5T is active. If not, try another USB port, we recommend connecting the ROCK 5T to the rear panel of your computer.

## Q6： My ROCK 5B HDMI does not display anything!

- You can manually add the HDMI resolution and frame rate in /boot/extlinux/extlinux.conf
- Just add video=1920x1080@60 in an additional line (just change the resolution and frame rate to the resolution supported by your monitor)

## Q7： I burned eMMC with RKDevTool successfully, but after powering up, the Led doesn't flash and there is no output on the screen.

Confirmation:

Remove the MicroSD, NVME device and short DISABLE SPI pin, then connect the board and PC via USB cableand press Maskrom key，then see if the device enters [Maskrom state](./low-level-dev/maskrom/).
If it's not in MaskRom state, it's most likely due to the following reasons.

In [Burning system to eMMC via USB](./low-level-dev/maskrom/), did not follow the instructions to press the Maskrom button, causing the system to reach the [SPI Flash](./low-level-dev/maskrom/erase), and when the system starts, it reads the SPI information first, and then there is an error and it cannot start normally.

Solution:

[Empty SPI Flash](./low-level-dev/maskrom/erase), then follow the steps again [Burn system to eMMC via USB](./low-level-dev/maskrom/)

## Q8： Radxa APT public key not available

When I try to run apt update, I get the following error:

```
root@rock-5T:~# apt update
Hit:1 http://security.debian.org/debian-security bookworm-security InRelease
Hit:2 http://httpredir.debian.org/debian bookworm InRelease
Get:3 http://apt.radxa.com/bookworm-stable bookworm InRelease [2362 B]
Hit:4 http://httpredir.debian.org/debian bookworm-updates InRelease
Hit:5 http://httpredir.debian.org/debian bookworm-backports InRelease
Err:3 http://apt.radxa.com/bookworm-stable bookworm InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 9B98116C9AA302C7
Reading package lists... Done
W: GPG error: http://apt.radxa.com/bookworm-stable bookworm InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 9B98116C9AA302C7
E: The repository 'http://apt.radxa.com/bookworm-stable bookworm InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

The reason is that the public key has expired. You can execute the following command to get a new available key.

```
sudo apt-get install -y wget
export DISTRO=bookworm-stable
wget -O - apt.radxa.com/$DISTRO/public.key | sudo apt-key add -
sudo apt-get update
```

## Q9： Fan does not rotate/How to install the fan

Please follow the [Fan usage tutorial](./getting-started/interface-usage/fan).
