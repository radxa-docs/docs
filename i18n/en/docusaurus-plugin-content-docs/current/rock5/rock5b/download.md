---
sidebar_position: 2
---

# Summary of resource downloads

## System Image

### Official Image

SPI Image:

[spi_image.img](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rock-5b-spi-image-gd1cf491-20240523.img)

Linux：

<pre>
    Loader： [RK3588_SPL_Loader_v1.15.113.bin](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rk3588_spl_loader_v1.15.113.bin)

    ROCK 5B Debian (kernel 5.10): [rock-5b_debian_bullseye_kde_b39](https://github.com/radxa-build/rock-5b/releases/download/b39/rock-5b_debian_bullseye_kde_b39.img.xz)

    ROCK 5B Debian (kernel 6.1): [rock-5b_bookworm_kde_b5](https://github.com/radxa-build/rock-5b/releases/download/rsdk-b5/rock-5b_bookworm_kde_b5.output.img.xz)

    ROCK 5B+ Debian(kernel 6.1): [rock-5b-plus_bookworm_kde_b2](https://github.com/radxa-build/rock-5b-plus/releases/download/rsdk-b2/rock-5b-plus_bookworm_kde_b2.output.img.xz)
</pre>

Android：

<pre>
    Loader: [MiniLoader.bin](https://dl.radxa.com/rock5/5itx/images/MiniLoaderAll.bin)

    [ROCK 5B Android 12](https://github.com/radxa/manifests/releases/download/Android12_rkr14_20240419/Rock5B_Android12_rkr14_20240419-gpt.zip)(used for booting from sdcard/emmc/nvme)

    [ROCK_5B+_Android12_gpt](https://github.com/radxa/manifests/releases/download/android12-radxa-20240708/Rock5BPlus-Android12-rkr14-SD-or-eMMC-20240705-1-gpt.zip)(used for booting from sdcard/emmc)

    [ROCK_5B+_Android12_update](https://github.com/radxa/manifests/releases/download/android12-radxa-20240708/Rock5BPlus-Android12-rkr14-SPI_NVME-20240705-update.zip)(used for booting from SPI-NVME)
</pre>

### Third-party Image

- Full Image

<table>
    <tr>
        <td align="center">OS</td>
        <td align="center">Descriptions</td>
        <td align="center">Additions</td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Rebornos-arm.webp" alt="RebornOS" style={{ width: "70%" }} /></td>
        <td align="center">RebornOS is a desktop-oriented Linux distribution based on Arch Linux. Although the RebornOS live image provides only one desktop, the installation process can be customized to install more than 10 DEs by choosing to install many popular desktop environments and window managers.</td>
        <td align="center"><a href= "https://github.com/RebornOS-Team/lxqt-rock5b-image/releases">RebornOS ARM ROCK 5B Beta</a><br /><br /><a href="https://wiki.rebornos.org/arm/install">Installation WiKi</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Archlinux.webp" /></td>
        <td align="center">Arch Linux is an independently developed general-purpose GNU/Linux distribution that strives to provide the most up-to-date stable versions of most software through a rolling release model. The default installation is a minimalist base system, to which the user only needs to add the necessary configuration.</td>
        <td align="center"><a href="https://github.com/kwankiu/archlinux-installer-rock5">Archlinux Installer By Kwankiu</a><br /><br /><a href="https://forum.radxa.com/t/archlinux-on-rock5b/13851">Radxa Forum Discussion</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/dietpi-logo.webp" alt="Dietpi" style={{ width: "70%" }} /></td>
        <td align="center">At its core, DietPi is extremely lightweight, featuring a low process/memory footprint and a default installation of DietPi-RAMlog to maximize device performance.</td>
        <td align="center"><a href="https://dietpi.com/#download"> Dietpi Download</a><br /><br /><a href="https://dietpi.com/docs/install/"> Installation guide</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Armbian.webp" alt="Armbian" style={{ width: "70%" }} /></td>
        <td align="center">Armbian is a computing build framework that allows users to create ready-to-use images of working kernels with variable user-space configurations for a variety of single-board computers. It provides a variety of pre-built images for some of the supported boards. These images are usually Debian or Ubuntu style.</td>
        <td align="center"><a href="https://forum.radxa.com/t/armbian-images-are-now-available-for-rock-5b/11896/1">Armbian images are now available for ROCK 5B!</a><br /><br /> <a href="https://forum.radxa.com/t/armbian-rock-5b-the-best-option/14979"> Armbian ROCK 5B the best option </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/openfyde.webp" alt="openfyde" style={{ width: "70%" }} /></td>
        <td align="center">openFyde is an open source initiative launched by Fyde Innovations, the creators of FydeOS, to provide an alternative approach to Chromium OS. openFyde is an open source project that provides a more open and flexible Chromium OS than FydeOS. With openFyde, you can have a more open and flexible Chromium OS, compared to FydeOS, which offers a more stable experience, better performance, and unique features.</td>
        <td align="center"><a href="https://github.com/openFyde/overlay-rock5b-openfyde/"> overlay-rock5b-openfyde </a><br /><br /><a href="https://fydeos.io/download/device/rock5b-fydeos"> FydeOS & openFyde for ROCK 5 </a><br /><br /><a href="https://forum.radxa.com/t/introducing-fydeos-for-you-unleash-the-power-of-radxa-rock-5b/16416" >Introducing FydeOS for You: Unleash the Power of Radxa ROCK 5B</a> <br /><br /><a href="https://forum.radxa.com/t/openfyde-chromium-os-fork-for-rock-5b/10963/47" >openFyde (Chromium OS fork) for ROCK 5B</a><br /><br /><a href="https://forum.radxa.com/t/guide-fydeos-openfyde-for-you-rock-5b-the-best-option/15338/1">[Guide] openFydeOS - ROCK 5B- the best option </a><a href="https://discord.gg/vX4UhRPT9A/"> Discord</a></td>
    </tr>
    <tr>
    <td align="center"><img src="/img/rock5b/downloads/windows.webp" alt="windows on r" style={{ width: "70%" }}   /></td>
        <td align="center"></td>
        <td align="center"><a href="https://worproject.com/guides/how-to-install/on-rockchip" >how to install on rockchip</a><br /><br /><a href="https://forum.radxa.com/t/how-to-use-windows-11-on-rock-5b/15524"> Windows for ROCK 5B</a><br /><br /><a href="https://worproject.com/guides/how-to-install/on-rockchip">Windows on R Project</a><br /><br /><br /><br /><a href="https://forum.radxa.com/t/windows-uefi-on-rock-5-mega-thread/12924/1"> UEFI Discussion </a><br /><br /><a href="https://discord.gg/eX94cCRnsN" > Discord </a><br /><br /><a href="https://github.com/edk2-porting/edk2-rk35xx" > EDK2 Porting RK35XX</a></td>
    </tr>
    <tr>
        <td align="center"> <img src="/img/rock5b/downloads/batocera.webp" alt="batocera" style={{ width: "70%" }} /></td>
        <td align="center">Want to play a good emulator?Batocera gives you the best emulator in one system. Batocera.linux is an open source, completely free retro gaming distribution that can be copied to a USB flash drive or SD card, with the aim of turning any computer/nanocomputer into a gaming machine during gameplay, or permanently.Batocera.linux does not require any modifications to the computer.</td>
        <td align="center"><a href="https://youtu.be/OE65lPvpu0I" >batocera youtube</a><br /><br /><a href="https://mirrors.o2switch.fr/batocera/rock-5b/stable/last/batocera-rk3588-rock-5b-41-20241231.img.gz">Batocera For ROCK 5B</a><br /><br /><a href="https://batocera.org/"> Batocera Official</a><br /><br /><a href="https://wiki.batocera.org/" > Batocera WiKi</a><br /><br /><a href="https://discord.com/invite/ndyUKA5"> Discord </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/openhd.webp" alt="openhd" style={{ width: "70%" }} /></td>
        <td align="center">OpenHD is a suite of open source software for long range video transmission, telemetry and remote control. Although originally designed for hobbyist drones, it can be adapted to a wide range of other applications. openHD is an all-in-one solution for digital video transmission, as well as other telemetry and control data via MAVLINK. Its main purpose is to utilize off-the-shelf WiFi hardware (e.g. rtl8812au) to achieve low latency and long range video/data transmission.</td>
        <td align="center"><a href="https://openhdfpv.org/">Openhdfpv Official Page</a><br /><br /><a href="https://openhd.gitbook.io/" >Openhd WiKi</a><br /><br /><a href="https://t.me/OpenHD_User">Telegram</a><br /><br /><a href="https://discord.gg/NRRn5ugrxH">Discord</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/emteria.webp" alt="emteria" style={{ width: "70%" }} /></td>
        <td align="center">Emteria's ROCK 5B Android operating system is designed for product manufacturers. It combines the benefits of Android with extended enterprise features such as self-service terminal mode, integrated device management, OTA update management, application storage, remote screen mirroring, and real-time monitoring of all devices in the field.</td>
        <td align="center"><a href="https://emteria.com/" >Emteria Official Page</a><br /><br /><a href="https://emteria.com/kb/install-emteria-rock5b" >How to install Android OS by emteria on ROCK 5B</a><br /><br /><a href="https://forum.emteria.com/search?Search=rock" >Emteria Forum</a><br /><br /><a href="https://emteria.com/register" >Register for free license</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Jelos.webp" /></td>
        <td align="center">Just Enough Linux Operating System (JELOS) is a community Linux distribution developed for handheld gaming devices. Our goal is to develop an operating system with the features and functionality we need, and to have fun while doing it.</td>
        <td align="center"><a href="https://github.com/JustEnoughLinuxOS" >JustEnoughLinuxOS</a><br /><br /><a href="https://github.com/JustEnoughLinuxOS/distribution/releases" >JustEnoughLinuxOS Release </a><br /><br /><a href="https://github.com/JustEnoughLinuxOS/distribution/wiki/">JustEnoughLinuxOS WiKi</a><br /><br /><a href="https://discord.gg/wHCFtm2TJ8" >Discord</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/openwrt.webp" alt="OpenWRT" style={{ width: "70%" }} /></td>
        <td align="center">OpenWRT is a Linux operating system for embedded devices. It provides a fully writable filesystem with package management, allowing you to freely choose and customize applications and features on your device.</td>
        <td align="center"><a href="https://openwrt.org/toh/hwdata/radxa/radxa_rock_5b" >OpenWRT Technical Data Page: Radxa Rock 5B</a><br /><br /><a href="https://openwrt.org/" >OpenWRT Official Website</a><br /><br /><a href="https://forum.openwrt.org/" >OpenWRT Forum</a></td>
    </tr>

</table>

- Community Building Reference

<table>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/UFEI.webp" alt="UEFI For Rock 5"  style={{ width: "70%" }} /></td>
        <td align="center">The Unified Extensible Firmware Interface (UEFI) is a specification for a software program that connects a computer's firmware to its operating system (OS).UEFI is expected to eventually replace the Basic Input/Output System (BIOS), but is compatible with it.</td>
        <td align="center"><a href="https://forum.radxa.com/t/uefi-edk2-on-the-rock-5b/12642"> UEFI/EDK2 on the ROCK 5B</a><br /><br /><a href="https://forum.radxa.com/t/windows-uefi-on-rock-5-mega-thread/12924/1"></a><br /><br /><a href="https://discord.gg/Gh7STP7Qh3" >Discord</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Talos.webp" alt="talos" style={{ width: "70%" }}  /></td>
        <td align="center">Talos Linux is a modern Linux distribution built specifically for Kubernetes.</td>
        <td align="center"><a href="https://forum.radxa.com/t/fork-of-talos-linux-for-rock-5/14360">Fork of Talos Linux for ROCK 5</a><br /><br /><a href="https://github.com/milas/rock5-talos" >ROCK 5 Talos </a><br /><br /><a href="https://github.com/milas/rock5-talos/releases" >Talos Release</a><br /><br /><a href="https://talos.dev" > Talos Dev</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Afterburner.webp" alt="Afterburner" style={{ width: "70%" }} /></td>
        <td align="center">MonkaBlyat Afterburner is a ready-to-use modification of Armbian jammy!</td>
        <td align="center"><a href="https://forum.radxa.com/t/rock-5b-my-experience-armbian-afterburner-image/14552" >MonkaBlyat's Afterburner for ROCK 5</a><br /><br /><a href="https://forum.radxa.com/t/guide-best-option-for-armbian-afterburner-image-by-monkablyat/14552" >MonkaBlyat AfterBurner with Steam Wine Box64/86 ready, user/passwd: rock</a><br /><br /><a href="https://monka.systemonachip.net/rock5b/Armbian_23.05.0-trunk_Rock-5b_jammy_legacy_5.10.110.AFM.img.xz">Armbian Download</a><br /><br /><a href="https://drive.google.com/file/d/1pbd0flWhtfIZE4tLla2DPuGfcrWYNsL9/">Google Driver</a><br /><br /><a href="https://discord.gg/828EKhgZTa">Discord</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Android.webp" alt="thc013" style={{ width: "70%" }} /></td>
        <td align="center">Thc013 Android ROM is a modified version of Google Android and Google TV to play around with!</td>
        <td align="center"><a href="https://forum.radxa.com/t/rom-rock-5b-android-12-1-rkr10-googletv/13208">Thc013 Android ROM for ROCK 5 </a><br /><br /><a href="https://forum.radxa.com/t/rom-rock-5b-android-12-1-rkr10-googletv/13208" >THC013 ROCK 5B Android 12.1 rkr10 GoogleTV</a><br /><br /><a href="https://drive.google.com/drive/folders/1TRt-Oh3Pk-oJKatcHe3fenVSnoRSK8BI?usp=share_link/">Google Drive Download</a><br /><br /><a href="https://discord.gg/Ey2hR3ummR" >Discord</a><br /><br /><a href="https://forum.radxa.com/t/android-12-1-tablet-custom/15359">Tablet Version</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/AndroidTV.webp" alt="AndroidTV" style={{ width: "70%" }} /></td>
        <td align="center">Mo123 Android TV is an Android-based system developed by Google for televisions, digital media players, set-top boxes and sound systems.</td>
        <td align="center"><a href="https://forum.radxa.com/t/rock5b-androidtv-by-mo123/15527" > [ROM] ROCK5A/B AndroidTV 12 by mo123 </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/AmiRock.webp" alt="Amiga" style={{ width: "70%" }} /></td>
        <td align="center">The Amiga is a line of personal computers introduced by Commodore in 1985.</td>
        <td align="center"><a href="https://forum.radxa.com/t/amiga-like-customized-image/15234" > Amiga like customized image </a><br /><br /><a href="https://forum.radxa.com/t/rock-5-case-cooling/11795/109" > Amiga Case DIY </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/OpenMandriva.webp" alt="OpenMandriva" style={{ width: "70%" }} /></td>
        <td align="center">OpenMandriva Lx is a Linux distribution branched from Mandriva Linux. It is maintained by the OpenMandriva Association.</td>
        <td align="center"><a href="https://forum.radxa.com/t/openmandriva-for-rock-5b-test-build-released/15210"> OpenMandriva for ROCK 5B test build released </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/YoloV8.webp" alt="YoloV8" style={{ width: "70%" }} /></td>
        <td align="center">Ultralytics YOLOv8 is the latest version of the acclaimed real-time object detection and image segmentation model, based on cutting-edge technologies in deep learning and computer vision, offering unmatched performance in terms of speed and accuracy for a wide range of applications such as the detection of traffic signals, people, parking meters and animals.</td>
        <td align="center"><a href="https://forum.radxa.com/t/use-yolov8-in-rk3588-npu/15838">Use YoloV8 in RK3588 NPU</a></td>
    </tr>
</table>

## Hardware Design

<Tabs queryString="HardwareDesign">

<TabItem value="ROCK 5B">
### V1.3(Developer Edition)

[v1.3 Schematic pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v13_sch.pdf)
[v1.3 2D Top&Bottom dxf](https://dl.radxa.com/rock5/5b/docs/hw/ROCK5B_V13_2D_20220519.zip)
[v1.3 SMD pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v13_smd.pdf)

### V1.41 (pre-production version)

- [V1.41 2D Top&Bottom dxf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v141_dimension_20220728_dxf.zip)
- [V1.41 2D Top&Bottom pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v141_dimension_20220728_pdf.zip)
- [V1.41 2D Drawings](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v141_dimension_20220728_dxf.zip)

### V1.42

- [v1.42 3D Figure stp](https://dl.radxa.com/rock5/5b/docs/hw/ROCK5B_v1.42_3D.step.zip)
- [v1.42 Schematic pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1423_sch.pdf)
- [v1.42 SMD pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1423_smd.pdf)

### V1.423

- [ROCK 5B V1.423 SCH](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1423_sch.pdf)
- [ROCK 5B V1.423 SMD](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1423_smd.pdf)

### V1.44

When EKEY is connected, I2C4 will be shorted to ground and the following material will be deleted:
R90580 R90581  
L2203 L2205 L2300 L2301 L2303 Converted to 3225 RHP322512T-R24M

### V1.45

- [ROCK 5B V1.45 SCH](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic.pdf)
- [ROCK 5B V1.45 SMD](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_smd.pdf)

### V1.46

Changed the package of 31P holder:
Pins 1-31 widened to 0.3mm, two locator pins widened to 0.7mm
</TabItem>

<TabItem value="ROCK 5B+">

- [v1.2 Schematic pdf](https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf)
- [v1.2 Components Placement Map pdf](https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_components_placement_map.pdf)
- [v1.2 2D DXF](https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v12_2d.zip)
- [v1.2 3D STP](https://dl.radxa.com/rock5/5b+/docs/hw/rock5bp_pcba_3d_V1_2_20250314.stp)

</TabItem>
</Tabs>

## Quality certification

### CE EMC

- **Report number: BCTC2208667594C**
- Compliance Link:
  [Test Verification of Conformity](https://dl.radxa.com/rock5/compliance/5b/ce-emc/BCTC2208667594C-ROCK-5B-CE-EMC-comfromity.pdf)

- **Test Standards: EN 55032:2015+A11:2020+A1:2020, EN 55035:2017+A11:2020**:
  [Test Report](https://dl.radxa.com/rock5/compliance/5b/ce-emc/BCTC2208667594E-ROCK-5B-CE-EMC-report.pdf)

### FCC SDOC

- **Report number: BCTC2208647334C**
- Compliance Link:
  [FCC Supplier's Declaration of Conformity](https://dl.radxa.com/rock5/compliance/5b/fcc-sdoc/BCTC2208647334C-ROCK-5B-FCC-sDoC-comformity.pdf)

- **Test Standards: FCC Part 15B**:
  [Test Report](https://dl.radxa.com/rock5/compliance/5b/fcc-sdoc/BCTC2208647334E-ROCK-5B-FCC-sDoC-report.pdf)
