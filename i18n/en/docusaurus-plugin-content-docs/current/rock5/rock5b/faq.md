---
sidebar_position: 10
---

# FAQ

## General

### Question 1: Get connection with Community

Please refer to https://docs.radxa.com/welcome

### Question 2: ROCK 5B will have WiFi 6E support. Does the new ROCK 5b board come with a (6E) wifi chip. Or will this be purchased separately?

WiFi Card is not included by default since different users require different WiFi speed. The Radxa team recommends a wifi card with RTL8852BE chip for a balance between price and performance.

### Question 3: Without eMMC and TF card, can ROCK 5B boot from PCIe M.2 NVME SSD?

Yes. ROCK 5B can boot from PCIe M.2 NVME SSD.
ROCK 5B is equipped with one 16MB SPI Nor Flash and PCIe M.2 M-Key connector.
SPI Nor Flash stores bootloader. And NVME SSD stores whole system image (at least kernel and rootfs).
For image writing, please refer to this guide. [SPI Nor Flash](./low-level-dev/bootloader_spi_flash) and [PCIe NVME SSD boot](./low-level-dev/install-os-on-nvme).

### Question 4: Also, are heatsinks and fans included in the price?

No, the heatsink and fan are not included by default.

## Power Supply

### Question 1: My new ROCK 5B can not boot / stuck in infinite boot loop

ROCK 5B supports USB PD power negotiation to higher voltage such as 9V, 12V, 15V, 20V to meet the total system power load requirements(around 30W with WiFi, SSD, USB peripherals etc). Currently the PD negotiation is implemented in the kernel driver, we need to boot to the kernel to start negotiation, however some Power Supply can not wait the ROCK 5B to negotiate and cut the power off when timeout, which cause the infinite boot loop. We provide the following suggestions:

- Use official Power Supply - Radxa Power PD 30W. (Strongly recommended) The Radxa Power PD 30W is - tested with all conditions on ROCK 5B.
- Use faster SD card or eMMC module and disable the bootloader/kernel serial console
- Use a dummy 12V USB C power supply
- Check the other Power Supply status reported by the community.
- Wait for Radxa's porting of the PD negotiation to the bootloader(u-boot)
- Double check your power supply can deliver the power needed especially on 5v. Many power supply will max out their 5v at 3amp (15W) while other voltages can go way higher.

## Boot

### Question 1: My ROCK 5B doesn't boot, how to check if it's dead

To troubleshoot if ROCK 5B is defective in the following steps:

- Power off the ROCK 5B, remove eMMC module, SD card, NVMe SSD
- Press and hold the maskrom button[（label 32）](./hardware-design/hardware-interface)
- Plug the ROCK 5B USB C to PC with USB A to C cable, the Green LED should be solid on
  Check if there is new USB device in the PC Device Manager, if yes, the ROCK 5B is live. If not, try other USB ports, we recommend to connect ROCK 5B to the back panel of the PC.

### Question 2: My ROCK 5B HDMI doesn't display anything

- you can manually add the HDMI resolution and framerate in the /boot/extlinux/extlinux.conf
- just add video=1920x1080@60 to the append line (just change the resolution and framerate to a resolution your monitor supports)

## OS

### Question 1: Radxa APT public key is not available

When I try to run apt update, i get following error:

```
root@rock-5b:~# apt update
Hit:1 http://security.debian.org/debian-security bullseye-security InRelease
Hit:2 http://httpredir.debian.org/debian bullseye InRelease
Get:3 http://apt.radxa.com/bullseye-stable bullseye InRelease [2362 B]
Hit:4 http://httpredir.debian.org/debian bullseye-updates InRelease
Hit:5 http://httpredir.debian.org/debian bullseye-backports InRelease
Err:3 http://apt.radxa.com/bullseye-stable bullseye InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 9B98116C9AA302C7
Reading package lists... Done
W: GPG error: http://apt.radxa.com/bullseye-stable bullseye InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 9B98116C9AA302C7
E: The repository 'http://apt.radxa.com/bullseye-stable bullseye InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

The reason is the public key has expired. You can execute the following command to get the new available.

```
sudo apt-get install -y wget
export DISTRO=bullseye-stable
wget -O - apt.radxa.com/$DISTRO/public.key | sudo apt-key add -
sudo apt-get update
```
