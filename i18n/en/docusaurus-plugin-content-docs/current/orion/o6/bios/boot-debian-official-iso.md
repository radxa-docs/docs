---
sidebar_position: 6
description: ""
---

# Boot Debian Official ISO

The O6 BIOS supports booting the official Debian ARM64 ISO, here are the instructions on how to boot the official Debian ISO image on the O6.

## Getting the official Debian ARM64 ISO

Refer to the official Debian documentation: [Debian ARM64 ISO](https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/)

## Make a USB boot disk

Use [balenaEtcher](https://etcher.balena.io/) to write the downloaded ISO file, e.g. debian-12.9.0-arm64-netinst.iso, to a USB flash drive.
This will make the USB boot disk ready.

## Hardware Connection

Follow the instructions below to make the hardware connections.

- Assemble the PCIe NVME SSD to the O6 M.2 M-Key.
- Insert the USB flash drive into the O6 Type-A 3.2 port.
- Connect the O6 to a USB keyboard and mouse, and a HDMI monitor.
- Connect the O6 Type-A port to a Type-A **USB to Ethernet adapter** (Internet access is required for ISO installation).
- Power up the O6, and during the boot process, when you see the Radxa logo and the progress bar, briefly press the “Esc” key on the keyboard to enter the BIOS interface.

## Configure the O6 BIOS for ACPI booting

O6 BIOS defaults to Device Tree boot mode. You need to switch to ACPI boot.

In the BIOS interface, select it via keyboard:

```
Device Manager
    --> O/S Hardware Description Selection
        --> O/S Hardware Description   <ACPI>
```

Enter BIOS interface

```

 Radxa Orion O6
 CIX P1 CD8180                                       1.80 GHz
 0.2.2-1                                             65536 MB RAM



   Select Language            <English>                  This selection will
                                                         take you to the Boot
 > Device Manager                                        Manager
 > Boot Manager
 > Boot Maintenance Manager

   Continue
   Reset







  ^v=Move Highlight       <Enter>=Select Entry


```

Enter `Device Manager`

```
/------------------------------------------------------------------------------\
|                               Device Manager                                 |
\------------------------------------------------------------------------------/

   Devices List                                          Press <Enter> to view
 > System Information                                    current system
 > Platform Configuration                                information.
 > O/S Hardware Description Selection
 > Secure Boot Configuration
 > Network Device List


   Press ESC to exit.







/------------------------------------------------------------------------------\
|                                                                              |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/

```

Enter `O/S Hardware Description Selection`

```
/------------------------------------------------------------------------------\
|                     O/S Hardware Description Selection                       |
\------------------------------------------------------------------------------/

   O/S Hardware Description   <Device Tree>              Select the hardware
                                                         description that will
                                                         be exposed to the O/S.













/------------------------------------------------------------------------------\
|                         F9=Reset to Defaults      F10=Save                   |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/
                                                    Configuration changed

```

Change to `ACPI` and save.

```
/------------------------------------------------------------------------------\
|                     O/S Hardware Description Selection                       |
\------------------------------------------------------------------------------/

   O/S Hardware Description   <ACPI>                     Select the hardware
                                                         description that will
                                                         be exposed to the O/S.

                  /------------------------------------------\
                  |                                          |
                  |        Save configuration changes?       |
                  |Press 'Y' to confirm, 'N'/'ESC' to ignore.|
                  |                                          |
                  \------------------------------------------/






/------------------------------------------------------------------------------\
|                         F9=Reset to Defaults      F10=Save                   |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/

```

The O6 needs to be rebooted after the changes are made. which can be done by pressing the reset button briefly.

## Install ISO image

After rebooting the O6, boot the O6 into the BIOS interface and then select the device to boot from the USB disk.

After entering the `Boot Manager` by keyboard selection, select the USB flash drive, `UEFI aigo U330 EABF80131F85D705`.

```
/------------------------------------------------------------------------------\
|                                Boot Manager                                  |
\------------------------------------------------------------------------------/

                                                         Device Path :
   Boot Manager Menu                                     VenHw(0D51905B-B77E-45
                                                         2A-A2C0-ECA0CC8D514A,0
   debian                                                0801D090000000000)/USB
   UEFI Shell                                            (0x1,0x0)
   UEFI aigo U330 EABF80131F85D705
   UEFI KINGBANK KP230 K19010J001612

   Use the <^> and <v> keys to choose a boot option,
   the <Enter> key to select a boot option, and the
   <Esc> key to exit the Boot Manager Menu.





/------------------------------------------------------------------------------\
|                                                                              |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/
```

Select `Graphical install` and follow the prompts to install the system.

```

                       GNU GRUB  version 2.06-13+deb12u1

 /----------------------------------------------------------------------------\
 | Install                                                                    |
 |*Graphical install                                                          |
 | Advanced options ...                                                       |
 | Accessible dark contrast installer menu ...                                |
 | Install with speech synthesis                                              |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 \----------------------------------------------------------------------------/

      Use the ^ and v keys to select which entry is highlighted.
      Press enter to boot the selected OS, `e' to edit the commands
      before booting or `c' for a command-line.

```
