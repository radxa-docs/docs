---
sidebar_position: 2
---

# Kernel Develop

BSP is a set of tools provided by Radxa to quickly build U-Boot Kernel. It is very convenient to use bsp to build your own U-Boot and Kernel.  
The following will show you how to use bsp to build the kernel of Radxa ROCK S0.

## [bsp Environment configuration](https://radxa-repo.github.io/bsp/)

## Build Kernel

After completing the bsp environment configuration, you need to compile the kernel first before pulling the kernel code from the warehouse.  
You can execute `./bsp linux stable` to build the kernel. The path to the kernel source code is located in the bsp directory. `.src/linux`

```text
cd bsp
mkdir output
cd output
../bsp --no-prepare-source linux stable -r 20

Parameter Description:
--no-prepare-source

# Compile using local modifications. If this parameter is not added, the latest code will be synchronized from the Radxa kernel warehouse and the local modifications will be overwritten.

-r 20

# Specify that the kernel version is 20, and the kernel will be loaded sequentially at boot.
```

For more bsp parameter usage instructions, you can execute `./bsp` to view.

After compilation is completed, many `deb` packages will be generated in the bsp/output directory. You only need to install the following two `deb` packages.

```text
linux-headers-6.1.68-20-stable_6.1.68-20_arm64.deb
linux-image-6.1.68-20-stable_6.1.68-20_arm64.deb
```

Copy the above two `deb` packages to the board and use the `dpkg` command to install them to complete the kernel installation.

```bash
sudo dpkg -i linux-headers-6.1.68-20-stable_6.1.68-20_arm64.deb
sudo dpkg -i linux-image-6.1.68-20-stable_6.1.68-20_arm64.deb
sudo reboot
```

After the restart is complete, you can use `uname -a` to check the currently started kernel version number to see whether the installation was successful.
