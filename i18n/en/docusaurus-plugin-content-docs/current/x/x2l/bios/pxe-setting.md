---
sidebar_position: 50
---

# PXE Usage Guide

- PXE stands for Preboot Execute Environment, referring to the capability to boot the system via network.

:::tip
A PXE server is required within the local network to provide services. Radxa X2L can then install and boot various systems through the PXE server (setting up a PXE server is not covered in this document).
:::

## PXE Function Configuration

- Power on the system and press the DEL key to access the BIOS settings.
- Navigate to Advanced --> Network Stack Configuration.
- Enable the relevant PXE options (taking IPV4 network PXE server as an example) as shown in the figure below. After configuration, press F4 to save and exit.

![PXE_Setting_01](/img/x/x2l/pxe_setting_01.webp)

## PXE Function Usage

- Connect Radxa X2L to a network containing a PXE server using an Ethernet cable.
- Power on the system, and press and hold the F7 key to enter the Boot Menu. Choose PXE IP4 based on the network conditions.
- After pressing Enter, the system will automatically scan for the PXE server. Once connected to the PXE server, an operating system selection interface will appear (depending on server configuration), as shown in the figure.

![PXE_Setting_02](/img/x/x2l/pxe_setting_02.webp)

![PXE_Setting_03](/img/x/x2l/pxe_setting_03.webp)

![PXE_Setting_04](/img/x/x2l/pxe_setting_04.webp)

- According to your requirements, select and install the operating system (using the installation of the Windows 10 system as an example).
- Choose option 1 to load the necessary files for installing the Windows system. Once the loading is complete, enter the Windows installation interface. The subsequent steps will be consistent with the standard Windows system installation process.

![PXE_Setting_05](/img/x/x2l/pxe_setting_05.webp)

![PXE_Setting_06](/img/x/x2l/pxe_setting_06.webp)
