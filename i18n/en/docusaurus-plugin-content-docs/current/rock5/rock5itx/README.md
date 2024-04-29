---
sidebar_position: 5
---

# ROCK 5 ITX

## Product Description

The Radxa ROCK 5 ITX is a fully Mini-ITX form factor compatible single board computer/motherboard utilizing the Rockchip RK3588 SoC.
With open source software and hardware documentation, it is an ideal platform for makers, IoT enthusiasts, hobbyists, gamers and PC users.

### Physical Photos

  <img src="/img/rock5itx/rock5itx-real.webp" width="500" />

### Interface Description

<table>
  <tr>
    <th>Num</th>
    <th> Interface Name</th>
    <th>Num</th>
    <th> Interface Name</th>
    <th>Num</th>
    <th> Interface Name</th>
    <th>Num</th>
    <th> Interface Name</th>
  </tr>
  <tr>
    <th>1</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#tp-Interface">TP  Interface</a></th>
    <th>9</th>
    <th>AUDIO</th>
    <th>17</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#poe">POE  Interface</a></th>
    <th>25</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#pcie-m-key">PCIE M KEY</a></th>
  </tr>
  <tr>
    <th>2</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#lcd0">LCD Interface</a></th>
    <th>10</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#usb-30--hdmi-10">USB 3.0 + HDMI</a></th>
    <th>18</th>
    <th>ATX Power Interface</th>
    <th>26</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#pcie-e-key">PCIE E KEY</a></th>
  </tr>
  <tr>
    <th>3</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#camera Interface">Camera Interface</a></th>
    <th>11</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#usb-30--hdmi-11">USB 3.0 + HDMI</a></th>
    <th>19</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#sata">SATA</a></th>
    <th>27</th>
    <th>RK3588 SOC</th>
  </tr>
  <tr>
    <th>4</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#miscro-sd">Miscro SD</a></th>
    <th>12</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#以太网--usb-20-12">Ethernet + USB 2.0</a></th>
    <th>20</th>
    <th>5V/GND/GND/12V</th>
    <th>28</th>
    <th>LPDDR5</th>
  </tr>
  <tr>
    <th>5</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#debug-uart">DEBUG UART</a></th>
    <th>13</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#以太网--usb-20-13">Ethernet + USB 2.0</a></th>
    <th>21</th>
    <th>EDP</th>
    <th>29</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#fan">FAN</a></th>
  </tr>
  <tr>
    <th>6</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#f_usb">F_USB</a></th>
    <th>14</th>
    <th>HDMI RX</th>
    <th>22</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#rtc">RTC Power</a></th>
    <th></th>
    <th></th>
  </tr>
  <tr>
    <th>7</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#f_audio">F_AUDIO</a></th>
    <th>15</th>
    <th>Full-Featured Type C</th>
    <th>23</th>
    <th>MASK ROM Keypad</th>
    <th></th>
    <th></th>
  </tr>
  <tr>
    <th>8</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#spdif-audio Interface">SPDIF Audio Interface</a></th>
    <th>16</th>
    <th>DC Power Interface</th>
    <th>24</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#recovery"></a></th>
    <th></th>
    <th></th>
  </tr>
</table>

### 芯片框图

<img src="/img/rock5b/rk3588-block-diagram.webp" alt="rk3588 system diagram" width="700" />

### 特性

<table>
  <tr>
    <td>Model</td>
    <td>ROCK 5ITX</td>
  </tr>
  <tr>
    <td>SoC</td>
    <td>Rockchip RK3588 SoC</td>
  </tr>
  <tr>
    <td>CPU</td>
    <td>Quad-core Cortex®-A76 @ 2.2/2.4GHz and Quad-core Cortex®-A55 @ 1.8GHz based on Arm® DynamIQ™ configuration</td>
  </tr>
  <tr>
    <td>GPU</td>
    <td>Arm® Mali™ G610MC4 GPU supporting:<br/>OpenGL® ES1.1, ES2.0, and ES3.2<br/>OpenCL® 1.1, 1.2 and 2.2<br/>Vulkan® 1.1 and 1.2<br/>Embedded high-performance 2D graphics acceleration module</td>
  </tr>
  <tr>
    <td>NPU</td>
    <td>Supports INT4 / INT8 / INT16 / FP16 / BF16 and TF32 acceleration, up to 6TOPs of computing power</td>
  </tr>
  <tr>
    <td>Memory</td>
    <td>64-bit LPDDR5 memory at 5500MT/S<br/>Options: 8/16/24/32GB</td>
  </tr>
  <tr>
    <td>Storage</td>
    <td>Onboard 32GB eMMC</td>
  </tr>
  <tr>
    <td>Hardware Codec</td>
    <td>Supports 4 display outputs via two HDMI, one DP (Type-C), and one MIPI DSI<br/>H.265/H.264/VP9/AV1/AVS2 video decoders, up to 8K@60fps<br/>H.264/H.265 video decoders, up to 8K@30fps</td>
  </tr>
  <tr>
    <td>Ethernet</td>
    <td>2 x 2.5 Gigabit Ethernet ports, one of which supports PoE (requires an additional PoE module)</td>
  </tr>
  <tr>
    <td>USB</td>
    <td>USB Type-C: Equipped with a USB 3.0 OTG Type-C port supporting DP interface, maximum resolution up to 4Kp60. Does not support power input via USB C.<br/>Rear IO USB: 2 USB 2.0 HOST ports shared with RJ45 connectors, total output power of these four ports is 1A; 2 dual USB 3.0 HOST ports shared with HDMI connectors, total output power per dual USB 3.0 port is 1.75A.<br/>Front Panel USB: F_USB connector provides 2 USB 2.0 HOST ports, total output power of these two ports is 1A.
    </td>
  </tr>
  <tr>
    <td>Display</td>
    <td>1 eDP port for eDP LCD panels<br/>2x MIPI LCD ports (quad-channel MIPI DSI)</td>
  </tr>
  <tr>
    <td>Camera</td>
    <td>2 camera ports (2 quad-channel MIPI CSI or 2 dual-channel MIPI CSI)</td>
  </tr>
  <tr>
    <td>SATA</td>
    <td>4x SATA interfaces, with power connectors</td>
  </tr>
  <tr>
    <td>Power Supply</td>
    <td>1x 12V DC power input<br/>1x 24P ATX power connector</td>
  </tr>
  <tr>
    <td>Dimensions</td>
    <td>170mm x 170mm</td>
  </tr>
</table>

### 系统框图

<img src="/img/rock5itx/rock5itx-system-block-diagram.webp" alt="rk3588 system diagram" width="700" />

## Documentation guidelines

:::tip
With the exception of the **Other Systems** directory below, the content is centered around Radxa OS (Radxa's customized system based on Debian).
:::

### [Getting Started](./getting-started/README)

This section describes how to burn in the system, log in, and accessorize the system so that you can get started quickly.

### [radxa-os](./radxa-os/README)

Radxa OS is a customized operating system based on Debian OS. Here we introduce the system login, network connection, etc. to help users get familiar with the system and use it.
This is a brief introduction to the system login, network connection, etc., to help users quickly familiarize themselves with the system and use it.

### [System Configuration](./os-config/README)

This section describes how to configure devices and features with tools (e.g., rsetup) and commands.

### [Apps Deployment](./apps-deployment/README)

This section describes the configuration and use of common applications such as Samba, Docker, PVE, OMV, LAMP, Cheese, and Remote Control.

### [apps-development](./app-development/README)

Introduces upper-level application development, such as QT, WiringX, Mraa and so on.

### [Hardware Development](./hardware-design/README)

Introduces hardware information, such as hardware interface, supported accessories, etc.

### [Low-level development](./low-level-dev/README)

Introduces uboot, kernel, debian os compilation and packaging.

### [Other systems](./other-os/README)

Introduces other systems than Radxa OS, such as Android.

### [Accessory list](./accessories/README)

This section describes the supported accessory models and describes how to use them.
