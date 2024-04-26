---
sidebar_position: 2
---

# U-boot development

[bsp](https://github.com/radxa-repo/bsp) is a set of tools provided by Radxa to quickly build U-Boot Kernel, using bsp it is very easy to build your own U-Boot and Kernel.  
The following shows you how to build a U-Boot for Radxa ROCK 5 ITX using bsp.

## [bsp environment configuration](https://radxa-repo.github.io/bsp/)

## Compiling U-Boot

After configuring the bsp environment, you need to compile the U-Boot before pulling the code from the repository, you can execute `. /bsp u-boot rknext rock-5-itx` to build U-Boot, the path to the U-Boot source code is located in `.src/u-boot` in the bsp directory.

`.src/u-boot`
cd bsp
mkdir output
cd output
../bsp --no-prepare-source u-boot rknext rock-5-itx

Parameter description:
--no-prepare-source # Compile with local changes, without this parameter the latest code will be synchronized from the Radxa U-Boot repository and overwrite the local changes.
```

For more information on how to use bsp, you can run `. /bsp`.

After compilation, a number of `deb` packages will be generated in the bsp/output directory, just install the following `deb` packages

``
u-boot-rknext_2017.09-1_arm64.deb
```

Copy the above two `deb` packages to the board and install them with the `dpkg` command to complete the U-Boot installation.

```
sudo dpkg -i u-boot-rknext_2017.09-1_arm64.deb
```

After the installation is complete, you need to flash U-Boot to the boot media.

```
cd /usr/lib/u-boot/rock-5-itx/
sudo . /setup.sh update_bootloader /dev/mmcblk1 #/dev/mmcblk1 is the boot media you are currently using, which needs to be selected based on the actual device being used
sudo reboot
```

After rebooting, you can watch the U-Boot boot log to see if U-Boot was updated successfully.
