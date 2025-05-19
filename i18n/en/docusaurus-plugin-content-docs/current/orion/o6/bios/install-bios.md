---
sidebar_position: 4
description: ""
---

# Install BIOS

:::info
If you are using RadxaOS, the system provides functions related to BIOS updates, and there is no need to refer to the following content for manual updates.
You just need to select the `Install EDK2` boot option when booting up, and confirm the operation according to the instructions.

You can also install RadxaOS into a USB storage device, and use it as a BIOS update media to update multiple devices.

For details, please refer to the [relevant documentation](https://radxa-pkg.github.io/edk2-cix/update.html) of `edk2-cix`.
:::

## Installing BIOS

## Download BIOS distribution package

Please refer to the relevant content on the [download page](../download#bios).

## Make a BIOS flash drive

1, Format a partition on the USB flash drive in FAT32 format.

2, Extract the BIOS zip file and put the following files into the top directory of the FAT32 partition on the USB flash drive.

<NewCodeBlock tip="Host-Computer" type="host">

```
BuildOptions  
BurnImage.efi  
cix_flash_all.bin  
cix_flash_ota.bin  
FlashUpdate.efi  
setup.nsh  
Shell.efi  
VariableInfo.efi
```

</NewCodeBlock>

## Updating BIOS

### Method 1: Online BIOS update with screen mode

#### Step 1: Hardware Preparation

- Orion O6 and PD 65W adapter
- HDMI cable and monitor
- USB keyboard and mouse

#### Step 2: Enter the BIOS interface

- Connect the HDMI monitor and keyboard to the O6.
- Power on the O6 and observe the monitor. When the Radxa logo and progress bar appear, press the keyboard's “Esc” button briefly and the BIOS menu will appear on the HDMI monitor.

#### Step 3: Enter UEFI Shell Interface

Keyboard select `Boot Manager --> UEFI Shell`.

<NewCodeBlock tip="O6-UEFI-Shell>" type="device">
```
UEFI Interactive Shell v2.2
EDK II
UEFI v2.70 (EDK II, 0x00010000)
Mapping table
      FS0: Alias(s):HD0b:;BLK1:
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(1,GPT,80810833-48A5-4976-A296-0209E1012834,0x800,0x100000)
      FS1: Alias(s):HD1b0c:;BLK6:
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)/HD(2,GPT,3A7E1703-AD97-4EE2-A0E0-BDC978C453D0,0x8800,0x3A8F000)
     BLK0: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)
     BLK2: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(2,GPT,02EC7511-B73F-4F06-ABBF-ACEF796021D2,0x100800,0xEB93000)
     BLK3: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(3,GPT,19A46BB8-BDB9-4A8B-A2A8-03CE65C39A29,0xEC93800,0x1E8800)
     BLK4: Alias(s):
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)
     BLK5: Alias(s):
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)/HD(1,GPT,EE706585-639D-48CE-B236-4C372373E325,0x800,0x8000)
Press ESC in 1 seconds to skip startup.nsh or any other key to continue.
Shell>
```
</NewCodeBlock>

#### Step 4: Go to the folder where the BIOS files and tools are located on the USB flash drive.

The folder selected here is `FS1:`. Under Shell, type `FS1:` and press Enter. Then use `ls` to view the files.

<NewCodeBlock tip="O6-UEFI-Shell>" type="device">

```
Shell> FS1:
FS1:\> ls
Directory of: FS1:\
01/01/1980  08:00                 619  BuildOptions
01/01/1980  08:00              57,344  BurnImage.efi
01/01/1980  08:00           6,288,062  cix_flash_all.bin
01/01/1980  08:00           2,101,982  cix_flash_ota.bin
01/01/1980  08:00             434,176  FlashUpdate.efi
01/01/1980  08:00               1,160  setup.nsh
01/01/1980  08:00             970,752  Shell.efi
01/01/1980  08:00              16,384  VariableInfo.efi
          8 File(s)   9,870,479 bytes
          0 Dir(s)
FS1:\>
```

</NewCodeBlock>

#### Step 5: Burn BIOS

Under Shell, output the command `setup.nsh` and press Enter to execute it.

<NewCodeBlock tip="O6-UEFI-Shell>" type="device">
```
FS1:\> setup.nsh
************************************************************************
                       Radxa BIOS Update Utility
************************************************************************

You are about to update the BIOS.
Please make sure the power stays on during the operation.

Enter 'q' to quit, any other key to continue:

************************************************************************
                            Updating BIOS...
************************************************************************

========================================================================
 Copyright 2024 Cix Technology Group Co., Ltd. All Rights Reserved.
                   FlashUpdate Utility v1.04.
                   Build Date:Jan 16 2025
========================================================================
Old Version:0.2.2-1
New Version:0.2.2-1
[00.15] Processing...
Flash update success.

************************************************************************
                         BIOS Update completed!
************************************************************************
System will now power off.
You MUST fully remove all connected power source before connecting them.
Failure to do so may prevent some components to use the updated code.

Enter 'q' to quit, any other key to continue:

Reset with BIOS Update (24 bytes)

```
</NewCodeBlock>

After the burning is completed, unplug the power of the O6 and then power it on again.

### Method 2: Online BIOS Update in Screenless Mode

#### Step 1: Hardware Preparation

- Orion O6 and PD 65W adapter
- x86 Windows/Linux/Mac host machine (with keyboard and mouse, serial port tool)
- Debug serial cable

#### Step 2: Setting Up the Debug Serial Port Environment on the Host Machine

- Connect the debug serial cable to the 3-pin UART2 pin on the O6. Refer: [Debug Connector ㉔](../hardware-design/hardware-interface#circle-24)
- Use the serial port tool and set the baud rate to 115200.

#### Step 3: Booting the O6 into the BIOS Interface

- Power on the O6 and observe the startup log on the debug serial port tool interface.
- During the startup process, you will see a prompt to enter the BIOS interface. At this time, briefly press the "Esc" key on the keyboard of the host machine.

<NewCodeBlock tip="O6-Serial-Console" type="host">
```
Tianocore/EDK2 firmware version 0.2.2-1
Press ESCAPE for boot options
.....
```
</NewCodeBlock>

- In the Debug Serial Port Tool interface, the BIOS menu will appear.

<NewCodeBlock tip="O6-Serial-Console" type="host">
```

 Radxa Orion O6
 CIX P1 CD8180                                       1.80 GHz
 0.2.2-1                                             65536 MB RAM



   Select Language            <English>                  This is the option
                                                         one adjusts to change
 > Device Manager                                        the language for the
 > Boot Manager                                          current system
 > Boot Maintenance Manager

   Continue
   Reset







  ^v=Move Highlight       <Enter>=Select Entry

```

</NewCodeBlock>

##### Step 4: Enter the UEFI Shell Interface

Select `Boot Manager --> UEFI Shell` from the keyboard.

The `Boot Manager` screen is shown below:

<NewCodeBlock tip="O6-Serial-Console" type="host">

```
/------------------------------------------------------------------------------\
|                                Boot Manager                                  |
\------------------------------------------------------------------------------/

                                                         Device Path :
   Boot Manager Menu                                     Fv(9A15AA37-D555-4A4E-
                                                         B541-86391FF68164)/FvF
   debian                                                ile(7C04A583-9E3E-4F1C
   UEFI aigo U330 90003C33924E4D12                       -AD65-E05268D0B4D1)
   UEFI KINGBANK KP230 K19010J001612
   UEFI Shell

   Use the <^> and <v> keys to choose a boot option,
   the <Enter> key to select a boot option, and the
   <Esc> key to exit the Boot Manager Menu.





/------------------------------------------------------------------------------\
|                                                                              |
| ^v=Move Highlight       <Enter>=Select Entry      Esc=Exit                   |
\------------------------------------------------------------------------------/

```

</NewCodeBlock>

Select `UEFI Shell` to enter the shell environment.

<NewCodeBlock tip="O6-Serial-Console" type="host">

```
UEFI Interactive Shell v2.2
EDK II
UEFI v2.70 (EDK II, 0x00010000)
Mapping table
      FS0: Alias(s):HD0b:;BLK1:
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(1,GPT,80810833-48A5-4976-A296-0209E1012834,0x800,0x100000)
      FS1: Alias(s):HD1b0c:;BLK6:
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)/HD(2,GPT,3A7E1703-AD97-4EE2-A0E0-BDC978C453D0,0x8800,0x3A8F000)
     BLK0: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)
     BLK2: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(2,GPT,02EC7511-B73F-4F06-ABBF-ACEF796021D2,0x100800,0xEB93000)
     BLK3: Alias(s):
          PciRoot(0x1)/Pci(0x0,0x0)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-0
1)/HD(3,GPT,19A46BB8-BDB9-4A8B-A2A8-03CE65C39A29,0xEC93800,0x1E8800)
     BLK4: Alias(s):
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)
     BLK5: Alias(s):
          VenHw(0D51905B-B77E-452A-A2C0-ECA0CC8D514A,00801D090000000000)/USB(0x1
,0x0)/HD(1,GPT,EE706585-639D-48CE-B236-4C372373E325,0x800,0x8000)
Press ESC in 1 seconds to skip startup.nsh or any other key to continue.
Shell>
```
</NewCodeBlock>

##### Step 5: Burn BIOS

Under Shell, output the command `setup.nsh` and press Enter to execute it.

<NewCodeBlock tip="O6-Serial-Console" type="host">

```
FS1:\> setup.nsh
************************************************************************
                       Radxa BIOS Update Utility
************************************************************************

You are about to update the BIOS.
Please make sure the power stays on during the operation.

Enter 'q' to quit, any other key to continue:

************************************************************************
                            Updating BIOS...
************************************************************************

========================================================================
 Copyright 2024 Cix Technology Group Co., Ltd. All Rights Reserved.
                   FlashUpdate Utility v1.04.
                   Build Date:Jan 16 2025
========================================================================
Old Version:0.2.2-1
New Version:0.2.2-1
[00.15] Processing...
Flash update success.

************************************************************************
                         BIOS Update completed!
************************************************************************
System will now power off.
You MUST fully remove all connected power source before connecting them.
Failure to do so may prevent some components to use the updated code.

Enter 'q' to quit, any other key to continue:

Reset with BIOS Update (24 bytes)

```
</NewCodeBlock>

Once the burn is complete, unplug the O6 and power it back up.

You can refer to the demo: https://radxa-pkg.github.io/edk2-cix/install.html

### Method 3: Offline BIOS update

For advanced users who need to recover from a corrupted BIOS or prefer direct hardware access, a Serial Flash programmer (such as CH341A) can be used to flash the BIOS firmware (cix_flash_all.bin) directly to the SPI NOR Flash chip. This method bypasses the operating system entirely and works even when the device cannot boot. For detailed step-by-step instructions and hardware requirements, please refer to the comprehensive [Forum Guide](https://forum.radxa.com/t/guide-flash-bios-with-ch341a-macos-linux/26742) contributed by community member Meco, which covers the process on macOS and Linux platforms.
