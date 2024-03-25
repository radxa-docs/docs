---
sidebar_position: 3
---

# Install Android System

### Requirements

- Radxa NIO 12L
- A computer or laptop (Windows or Linux)
- A USB data cable
- NIO 12L Android image

### Tools

Linux:

[Flash Tool for Linux](https://dl.radxa.com/nio12l/tools/SP_Flash_Tool_Selector_exe_Linux_v1.2152.00.100.zip)

Windows:

[Flash Tool for Windows](https://dl.radxa.com/nio12l/tools/SP_Flash_Tool_Selector_exe_Windows_v1.2152.00.000.zip)

[Driver For Windows](https://dl.radxa.com/nio12l/tools/Driver_Auto_Installer_EXE_v5.2307.00.zip)

### Installation steps

#### Install System under Linux (Ubuntu) (PC)

1. Download and Unzip the Flash Tool(See Tools part), find and run the FlashToolSelector file

```bash
$ mkdir mtk-tool
$ unzip SP_Flash_Tool_Selector_exe_Linux_v1.2152.00.100.zip -d mtk-tool
$ cd mtk-tool/SP_Flash_Tool_Selector_exe_Linux_v1.2152.00.100
$ ./FlashToolSelector
```

You can also find and double-click the FlashToolSelector file in the file viewer

<img src="/img/nio/nio12l/mtk-linux-tool-1.webp" width = "700" alt="mtk linux tool 1"/>

2. Unzip the Android image, use the Flash Tool to find the MT8195_Android_scatter.xml file in the Android image and open it

<img src="/img/nio/nio12l/mtk-linux-tool-2.webp" width = "700" alt="mtk linux tool 2"/>

3. Click the Download button.

<img src="/img/nio/nio12l/mtk-linux-tool-3.webp" width = "700" alt="mtk linux tool 3"/>

4. Connect the PC's USB Port to the NIO 12L's '''Type C Port'''. Then the downloading will begin

<img src="/img/nio/nio12l/device-connect.webp" width = "700" alt="device-connect"/>

<img src="/img/nio/nio12l/mtk-linux-tool-4.webp" width = "700" alt="mtk linux tool 4"/>

5. After Downloading is completed, remove the USB Type-C cable, power on the board to start system
   Note: Please Keep Pressing the POWER Button until the system boot up, just like turning on a phone

<img src="/img/nio/nio12l/mtk-power-on.webp" width = "700" alt="mtk power on"/>

#### Install System under Windows (PC)

1. Unzip and install the MediaTek Windows driver (See Tools Part)

2. Unzip the Flash Tool (See Tools Part), find and execute the FlashToolSelector file

<img src="/img/nio/nio12l/mtk-windows-tool-1.webp" width = "700" alt="mtk windows tool 1"/>

3. Unzip the Android image, use the Flash Tool to find the MT8195_Android_scatter.xml file in the Android image and open it

<img src="/img/nio/nio12l/mtk-windows-tool-2.webp" width = "700" alt="mtk windows tool 2"/>

4. Click the Download button.

<img src="/img/nio/nio12l/mtk-windows-tool-3.webp" width = "700" alt="mtk windows tool 3"/>

5. Connect the PC's USB Port to the NIO 12L's '''Type C Port'''. Then the downloading will begin

<img src="/img/nio/nio12l/device-connect.webp" width = "700" alt="device-connect" />

<img src="/img/nio/nio12l/mtk-windows-tool-4.webp" width = "700" alt="mtk windows tool 4"/>

6. After Downloading is completed, remove the USB Type-C cable, power on the board to start system
   Note:Please Keep Pressing the POWER Button until the system boot up, just like turning on a phone

  <img src="/img/nio/nio12l/mtk-power-on.webp" width = "700" alt="mtk power on"/>

### Note

- Choose “Format All + Download”, if Ethernet MAC address were set previously, after this action Ethernet MAC address will be format

<img src="/img/nio/nio12l/mtk-windows-tool-5.webp" width = "700" alt="mtk windows tool 5"/>

- If the download process doesn't start, then press the physical '''Download Key''' on your NIO 12L and then Plug in the DC power supply in the '''Type C DC''' port
  Once the progress bar appears in the Flash Tool and it starts running, release the '''Download Key'''

<img src="/img/nio/nio12l/mtk-windows-tool-recovery.webp" width = "700" alt="mtk windows tool recovery"/>
