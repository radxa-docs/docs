---
sidebar_position: 1
---

# Getting Started

Radxa NIO 12L is a small-sized, high-performance single-board computer, equipped with the MediaTek MT8395(Genio 1200) eight-core processor as the development platform, equipped with Mali-G57 MC5 GPU and AI processing module, providing users with a smooth desktop experience and powerful AI Computing power and rich peripheral interfaces provide more possibilities for complex multiple scenarios.

## Annotation diagram

![NIO 12L Overview](/img/nio/nio12l/n12l_overview.webp)

## Feature

<table>
    <tr>
        <td align="center" >Module</td>
        <td align="center">NIO 12L</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">MediaTek MT8395(Genio 1200)</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">Quad-core Cortex-A78 2.2Ghz + Quad-core Cortex-A55 2.0Ghz </td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm Mali™-G57 MC5 3D Graphics Accelerator (GPU) with Vulkan® 1.1, OpenGL ES 3.2 and OpenCL™ 2.2</td>
    </tr>
    <tr>
        <td align="center">Memory</td>
        <td colspan="2" align="center">4/8/16 GB LPDDR4X</td>
    </tr>
    <tr>
        <td align="center">Storage</td>
        <td align="center">UFS: 64G/128G/256G/512G <br/>microSD Card</td>
    </tr>
    <tr>
        <td align="center">Display</td>
        <td colspan="2" align="center">HDMI：4KP60<br/>TYPE-C DP: 4KP60<br/>MIPI LCD: 1X 4-lane</td>
    </tr>
    <tr>
        <td align="center">Ethernet</td>
        <td align="center">1GbE LAN</td>
    </tr>
    <tr>
        <td align="center">Wireless</td>
        <td align="center">Wi-Fi 6 (802.11 b/g/n) BT 5.2 with BLE</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">USB 3.0 Type-C HOST/OTG X1 <br/> USB 3.0 Type-A HOST X4</td>
    </tr>
    <tr>
        <td align="center">Camera</td>
        <td colspan="2" align="center">2X 4-lane MIPI CSI</td>
    </tr>
    <tr>
        <td align="center">Others</td>
        <td colspan="2" align="center">40-pin GPIO expansion interfaces<br/>3.5mm Headphone jack</td>
    </tr>
    <tr>
        <td align="center">Power</td>
        <td colspan="2" align="center">5V Power Adapter</td>
    </tr>
</table>

## Preparation

### Required items

- NIO 12L SBC

- Power supply

  NIO 12L is powered by Type-C port and supports 5V input only. It is recommended to use a 5V/3A power adapter as a minimum.

  :::tip
  Radxa recommends using the [Radxa Power PD30W](/accessories/pd_30w)。
  :::

- USB Mouse and Keyboard

- Monitor and HDMI/Type-C cable

- USB Type-C to Type-A cable

  used for wring and erasing the image on board.

### Optional

- USB to TTL serial cable

  Used for [Serial Debugging](./low-level-dev/serial). The serial port baud rate is 921600.

- Camera

  NIO 12L supports MIPI CSI camera.

- Display

  NIO 12L supports MIPI display such as Radxa Display 8HD, etc.

## Power on NIO 12L

NIO 12L is preintalled with Yocto or Ubuntu or Android.

For NIO 12L with Yocto or Ubuntu, plug in Type-C power adapter and short press the power button, system will boot.

For NIO 12L with Android, plug in Type-C power adapter and keep pressing the power button for about 2 seconds, system will boot.

## System Installation

[Yocto System installation](/nio/nio12l/install-yocto-system)

[Ubuntu System installation](/nio/nio12l/install-ubuntu-system)

[Android System installation](/nio/nio12l/android/install-android-system)
