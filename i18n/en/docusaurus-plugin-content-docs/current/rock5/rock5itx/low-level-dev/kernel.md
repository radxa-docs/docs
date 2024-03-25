---
sidebar_position: 2
---

# Kernel Develop

BSP is a set of tools provided by Radxa to quickly build U-Boot Kernel. It is very convenient to use bsp to build your own U-Boot and Kernel.  
The following will show you how to use bsp to build the kernel of ROCK 5 ITX.

## [bsp Environment configuration](https://radxa-repo.github.io/bsp/)

## Build Kernel

After completing the bsp environment configuration, you need to compile the kernel first before pulling the kernel code from the warehouse.  
You can execute `./bsp linux rockchip` to build the kernel. The path to the kernel source code is located in the bsp directory. `.src/linux`

```
cd bsp
mkdir output
cd output
../bsp --no-prepare-source linux rockchip -r 1

Parameter Description:
--no-prepare-source    # Compile using local modifications. If this parameter is not added, the latest code will be synchronized from the Radxa kernel warehouse and the local modifications will be overwritten.

-r 1     # Specify the kernel version number as 1, which specifies the boot order for different kernel versions.
```

For more bsp parameter usage instructions, you can execute `./bsp` to view.

After compilation is completed, many `deb` packages will be generated in the bsp/output directory. You only need to install the following two `deb` packages.

```
linux-headers-5.10.110-1-rockchip_5.10.110-1_arm64.deb
linux-image-5.10.110-1-rockchip_5.10.110-1_arm64.deb
```

Copy the above two `deb` packages to the board and use the `dpkg` command to install them to complete the kernel installation.

```
sudo dpkg -i linux-headers-5.10.110-1-rockchip_5.10.110-1_arm64.deb
sudo dpkg -i linux-image-5.10.110-1-rockchip_5.10.110-1_arm64.deb
sudo reboot
```

After the restart is complete, you can use `uname -a` to check the currently started kernel version number to see whether the installation was successful.
