---
sidebar_position: 2
---

# 资源下载汇总

## 操作系统镜像

### 官方镜像及Loader

SPI Image:

[spi_image.img](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rock-5b-spi-image-gd1cf491-20240523.img)

Linux：

<pre>
    Loader： [RK3588_SPL_Loader_v1.15.113.bin](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rk3588_spl_loader_v1.15.113.bin)

    ROCK 5B 系统镜像 (5.10 内核): [rock-5b_debian_bullseye_kde_b39](https://github.com/radxa-build/rock-5b/releases/download/b39/rock-5b_debian_bullseye_kde_b39.img.xz)

    ROCK 5B 系统镜像 (6.1 内核): [rock-5b_bookworm_kde_b5](https://github.com/radxa-build/rock-5b/releases/download/rsdk-b5/rock-5b_bookworm_kde_b5.output.img.xz)

    ROCK 5B+ 系统镜像: [rock-5b-plus_bookworm_kde_b2](https://github.com/radxa-build/rock-5b-plus/releases/download/rsdk-b2/rock-5b-plus_bookworm_kde_b2.output.img.xz)
</pre>

Android：

<pre>
    Loader: [MiniLoader.bin](https://dl.radxa.com/rock5/5itx/images/MiniLoaderAll.bin)

    [ROCK 5B Android 12](https://github.com/radxa/manifests/releases/download/Android12_rkr14_20240419/Rock5B_Android12_rkr14_20240419-gpt.zip)(用于 sdcard/emmc/nvme 启动)

    [ROCK_5B+_Android12_gpt](https://github.com/radxa/manifests/releases/download/android12-radxa-20240708/Rock5BPlus-Android12-rkr14-SD-or-eMMC-20240705-1-gpt.zip)(用于 sdcard/emmc 启动)

    [ROCK_5B+_Android12_update](https://github.com/radxa/manifests/releases/download/android12-radxa-20240708/Rock5BPlus-Android12-rkr14-SPI_NVME-20240705-update.zip)(用于 SPI-NVME 启动)
</pre>

### 第三方镜像

- 完整镜像

<table>
    <tr>
        <td align="center">操作系统</td>
        <td align="center">描述</td>
        <td align="center">补充</td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Rebornos-arm.webp" alt="RebornOS" style={{ width: "70%" }} /></td>
        <td align="center">RebornOS 是基于 Arch Linux 的面向桌面的 Linux 发行版。虽然 RebornOS 实时镜像只提供一个桌面，但安装过程中可以选择安装许多流行的桌面环境和窗口管理器，可根据喜好定制安装 10 多个 DE。</td>
        <td align="center"><a href= "https://github.com/RebornOS-Team/lxqt-rock5b-image/releases">RebornOS ARM ROCK 5B Beta</a><br /><br /><a href="https://wiki.rebornos.org/arm/install">Installation WiKi</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Archlinux.webp" /></td>
        <td align="center">Arch Linux 是一个独立开发的通用 GNU/Linux 发行版，它通过滚动发行模式，努力为大多数软件提供最新的稳定版本。默认安装是一个最小化的基本系统，用户只需添加必要的配置即可。</td>
        <td align="center"><a href="https://github.com/kwankiu/archlinux-installer-rock5">Archlinux Installer By Kwankiu</a><br /><br /><a href="https://forum.radxa.com/t/archlinux-on-rock5b/13851">Radxa Forum Discussion</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/dietpi-logo.webp" alt="Dietpi" style={{ width: "70%" }} /></td>
        <td align="center">DietPi 的核心是极度轻量级，具有低进程/内存占用和默认安装 DietPi-RAMlog 的特点，可以最大限度地发挥设备的性能。</td>
        <td align="center"><a href="https://dietpi.com/#download"> Dietpi 下载</a><br /><br /><a href="https://dietpi.com/docs/install/"> 安装指导</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Armbian.webp" alt="Armbian" style={{ width: "70%" }} /></td>
        <td align="center">Armbian 是一个计算构建框架，允许用户为各种单板计算机创建带有可变用户空间配置的工作内核的即用映像。它为某些支持的板卡提供了各种预构建镜像。这些镜像通常是 Debian 或 Ubuntu 风格的</td>
        <td align="center"><a href="https://forum.radxa.com/t/armbian-images-are-now-available-for-rock-5b/11896/1">Armbian images are now available for Rock 5b!</a><br /><br /> <a href="https://forum.radxa.com/t/armbian-rock-5b-the-best-option/14979"> Armbian ROCK 5B the best option </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/openfyde.webp" alt="openfyde" style={{ width: "70%" }} /></td>
        <td align="center">openFyde 是由 FydeOS 的创建者 Fyde Innovations 发起的一项开源计划，旨在为 Chromium OS 提供另一种方法。有了 openFyde，你可以拥有一个更开放、更灵活的 Chromium OS。相比之下，FydeOS 提供了更稳定的体验、更好的性能和独特的功能。</td>
        <td align="center"><a href="https://github.com/openFyde/overlay-rock5b-openfyde/"> overlay-rock5b-openfyde </a><br /><br /><a href="https://fydeos.io/download/device/rock5b-fydeos"> FydeOS & openFyde for ROCK 5 </a><br /><br /><a href="https://forum.radxa.com/t/introducing-fydeos-for-you-unleash-the-power-of-radxa-rock-5b/16416" >Introducing FydeOS for You: Unleash the Power of Radxa Rock 5B</a> <br /><br /><a href="https://forum.radxa.com/t/openfyde-chromium-os-fork-for-rock-5b/10963/47" >openFyde (Chromium OS fork) for ROCK 5B</a><br /><br /><a href="https://forum.radxa.com/t/guide-fydeos-openfyde-for-you-rock-5b-the-best-option/15338/1">[Guide] openFydeOS - ROCK 5B- the best option </a><a href="https://discord.gg/vX4UhRPT9A/"> Discord</a></td>
    </tr>
    <tr>
    <td align="center"><img src="/img/rock5b/downloads/windows.webp" alt="windows on r" style={{ width: "70%" }}   /></td>
        <td align="center"></td>
        <td align="center"><a href="https://worproject.com/guides/how-to-install/on-rockchip" >how to install on rockchip</a><br /><br /><a href="https://forum.radxa.com/t/how-to-use-windows-11-on-rock-5b/15524"> Windows for ROCK 5B</a><br /><br /><a href="https://worproject.com/guides/how-to-install/on-rockchip">Windows on R Project</a><br /><br /><br /><br /><a href="https://forum.radxa.com/t/windows-uefi-on-rock-5-mega-thread/12924/1"> UEFI Discussion </a><br /><br /><a href="https://discord.gg/eX94cCRnsN" > Discord </a><br /><br /><a href="https://github.com/edk2-porting/edk2-rk35xx" > EDK2 Porting RK35XX</a></td>
    </tr>
    <tr>
        <td align="center"> <img src="/img/rock5b/downloads/batocera.webp" alt="batocera" style={{ width: "70%" }} /></td>
        <td align="center">想玩一款好的模拟器吗？Batocera 让你在一个系统中获得最好的模拟器。 Batocera.linux是一款开源、完全免费的复古游戏发行版，可以复制到U盘或SD卡上，目的是在游戏过程中将任何电脑/纳米电脑变成游戏机，或者永久性地变成游戏机。Batocera.linux 无需对电脑进行任何修改。</td>
        <td align="center"><a href="https://youtu.be/OE65lPvpu0I" >batocera youtube</a><br /><br /><a href="https://mirrors.o2switch.fr/batocera/rock-5b/stable/last/batocera-rk3588-rock-5b-36-20230310.img.gz">Batocera For ROCK 5B</a><br /><br /><a href="https://batocera.org/"> Batocera Official</a><br /><br /><a href="https://wiki.batocera.org/" > Batocera WiKi</a><br /><br /><a href="https://discord.com/invite/ndyUKA5"> Discord </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/openhd.webp" alt="openhd" style={{ width: "70%" }} /></td>
        <td align="center">OpenHD 是一套开源软件，用于远距离视频传输、遥测和遥控。虽然最初是为业余爱好者的无人机设计的，但它也可适用于其他广泛的应用。OpenHD 是数字视频传输的一体化解决方案，还能通过 MAVLINK 传输其他遥测和控制数据。其主要目的是利用现成的 WiFi 硬件（如 rtl8812au）实现低延迟和远距离视频/数据传输。</td>
        <td align="center"><a href="https://openhdfpv.org/">Openhdfpv Official Page</a><br /><br /><a href="https://openhd.gitbook.io/" >Openhd WiKi</a><br /><br /><a href="https://t.me/OpenHD_User">Telegram</a><br /><br /><a href="https://discord.gg/NRRn5ugrxH">Discord</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/emteria.webp" alt="emteria" style={{ width: "70%" }} /></td>
        <td align="center">Emteria 的 ROCK 5BAndroid 操作系统专为产品制造商设计。它结合了安卓系统的优势，并扩展了企业功能，如自助服务终端模式、集成设备管理、OTA 更新管理、应用程序存储、远程屏幕镜像以及实时监控现场的所有设备。</td>
        <td align="center"><a href="https://emteria.com/" >Emteria Official Page</a><br /><br /><a href="https://emteria.com/kb/install-emteria-rock5b" >How to install Android OS by emteria on ROCK 5B</a><br /><br /><a href="https://forum.emteria.com/search?Search=rock" >Emteria Forum</a><br /><br /><a href="https://emteria.com/register" >Register for free license</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Jelos.webp" /></td>
        <td align="center">Just Enough Linux Operating System (JELOS) 是一个为手持游戏设备开发的社区 Linux 发行版。我们的目标是开发出一个具有我们所需的特性和功能的操作系统，并在开发过程中享受乐趣。</td>
        <td align="center"><a href="https://github.com/JustEnoughLinuxOS" >JustEnoughLinuxOS</a><br /><br /><a href="https://github.com/JustEnoughLinuxOS/distribution/releases" >JustEnoughLinuxOS Release </a><br /><br /><a href="https://github.com/JustEnoughLinuxOS/distribution/wiki/">JustEnoughLinuxOS WiKi</a><br /><br /><a href="https://discord.gg/wHCFtm2TJ8" >Discord</a></td>
    </tr>

</table>

- 社区构建参考

<table>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/UFEI.webp" alt="UEFI For Rock 5"  style={{ width: "70%" }} /></td>
        <td align="center">统一可扩展固件接口（UEFI）是连接计算机固件和操作系统（OS）的软件程序规范。UEFI 预计将最终取代基本输入/输出系统（BIOS），但与之兼容。</td>
        <td align="center"><a href="https://forum.radxa.com/t/uefi-edk2-on-the-rock-5b/12642"> UEFI/EDK2 on the ROCK 5B</a><br /><br /><a href="https://forum.radxa.com/t/windows-uefi-on-rock-5-mega-thread/12924/1"></a><br /><br /><a href="https://discord.gg/Gh7STP7Qh3" >Discord</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Talos.webp" alt="talos" style={{ width: "70%" }}  /></td>
        <td align="center">Talos Linux 是专为 Kubernetes 打造的现代 Linux 发行版。</td>
        <td align="center"><a href="https://forum.radxa.com/t/fork-of-talos-linux-for-rock-5/14360">Fork of Talos Linux for ROCK 5</a><br /><br /><a href="https://github.com/milas/rock5-talos" >ROCK 5 Talos </a><br /><br /><a href="https://github.com/milas/rock5-talos/releases" >Talos Release</a><br /><br /><a href="https://talos.dev" > Talos Dev</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Afterburner.webp" alt="Afterburner" style={{ width: "70%" }} /></td>
        <td align="center">MonkaBlyat Afterburner 是一款可随时使用的 Armbian jammy 修改版！</td>
        <td align="center"><a href="https://forum.radxa.com/t/rock-5b-my-experience-armbian-afterburner-image/14552" >MonkaBlyat's Afterburner for ROCK 5</a><br /><br /><a href="https://forum.radxa.com/t/guide-best-option-for-armbian-afterburner-image-by-monkablyat/14552" >MonkaBlyat AfterBurner with Steam Wine Box64/86 ready, user/passwd: rock</a><br /><br /><a href="https://monka.systemonachip.net/rock5b/Armbian_23.05.0-trunk_Rock-5b_jammy_legacy_5.10.110.AFM.img.xz">Armbian Download</a><br /><br /><a href="https://drive.google.com/file/d/1pbd0flWhtfIZE4tLla2DPuGfcrWYNsL9/">Google Driver</a><br /><br /><a href="https://discord.gg/828EKhgZTa">Discord</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/Android.webp" alt="thc013" style={{ width: "70%" }} /></td>
        <td align="center">Thc013 Android ROM 是谷歌安卓和谷歌电视的修改版，可以尽情玩耍！</td>
        <td align="center"><a href="https://forum.radxa.com/t/rom-rock-5b-android-12-1-rkr10-googletv/13208">Thc013 Android ROM for ROCK 5 </a><br /><br /><a href="https://forum.radxa.com/t/rom-rock-5b-android-12-1-rkr10-googletv/13208" >THC013 ROCK 5B Android 12.1 rkr10 GoogleTV</a><br /><br /><a href="https://drive.google.com/drive/folders/1TRt-Oh3Pk-oJKatcHe3fenVSnoRSK8BI?usp=share_link/">Google Drive Download</a><br /><br /><a href="https://discord.gg/Ey2hR3ummR" >Discord</a><br /><br /><a href="https://forum.radxa.com/t/android-12-1-tablet-custom/15359">Tablet Version</a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/AndroidTV.webp" alt="AndroidTV" style={{ width: "70%" }} /></td>
        <td align="center">Mo123 Android TV  是基于 Android 的系统，由 Google 开发，适用于电视机、数字媒体播放器、机顶盒和音响系统。</td>
        <td align="center"><a href="https://forum.radxa.com/t/rock5b-androidtv-by-mo123/15527" > [ROM] ROCK5A/B AndroidTV 12 by mo123 </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/AmiRock.webp" alt="Amiga" style={{ width: "70%" }} /></td>
        <td align="center">Amiga 是 Commodore 于 1985 年推出的个人电脑系列。</td>
        <td align="center"><a href="https://forum.radxa.com/t/amiga-like-customized-image/15234" > Amiga like customized image </a><br /><br /><a href="https://forum.radxa.com/t/rock-5-case-cooling/11795/109" > Amiga Case DIY </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/OpenMandriva.webp" alt="OpenMandriva" style={{ width: "70%" }} /></td>
        <td align="center">OpenMandriva Lx 是一个从 Mandriva Linux 分支出来的 Linux 发行版。它由 OpenMandriva 协会维护。</td>
        <td align="center"><a href="https://forum.radxa.com/t/openmandriva-for-rock-5b-test-build-released/15210"> OpenMandriva for ROCK 5B test build released </a></td>
    </tr>
    <tr>
        <td align="center"><img src="/img/rock5b/downloads/YoloV8.webp" alt="YoloV8" style={{ width: "70%" }} /></td>
        <td align="center">Ultralytics YOLOv8 是广受赞誉的实时物体检测和图像分割模型的最新版本，基于深度学习和计算机视觉领域的尖端技术，在速度和准确性方面具有无与伦比的性能，广泛应用于交通信号、人员、停车计时器和动物的检测。</td>
        <td align="center"><a href="https://forum.radxa.com/t/use-yolov8-in-rk3588-npu/15838">Use YoloV8 in RK3588 NPU</a></td>
    </tr>
</table>

## 硬件设计

<Tabs queryString="HardwareDesign">
    <TabItem value="ROCK 5B">
### V1.3(开发者版)

- [v1.3 原理图 pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v13_sch.pdf)
- [v1.3 2D Top&Bottom dxf](https://dl.radxa.com/rock5/5b/docs/hw/ROCK5B_V13_2D_20220519.zip)
- [v1.3 SMD pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v13_smd.pdf)

### V1.41(预生产版)

- [V1.41 2D Top&Bottom dxf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v141_dimension_20220728_dxf.zip)
- [V1.41 2D Top&Bottom pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v141_dimension_20220728_pdf.zip)
- [V1.41 2D Drawings](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v141_dimension_20220728_dxf.zip)

### V1.42

- [v1.42 3D 图 stp](https://dl.radxa.com/rock5/5b/docs/hw/ROCK5B_v1.42_3D.step.zip)
- [v1.42 原理图 pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1423_sch.pdf)
- [v1.42 SMD pdf](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1423_smd.pdf)

### V1.423

- [ROCK 5B V1.423 SCH](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1423_sch.pdf)
- [ROCK 5B V1.423 SMD](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1423_smd.pdf)

### V1.44

EKEY 接上后，I2C4 会对地短路，删除以下物料：
R90580 R90581  
L2203 L2205 L2300 L2301 L2303 改成 3225 封装的 RHP322512T-R24M

### V1.45

- [ROCK 5B V1.45 SCH](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic.pdf)
- [ROCK 5B V1.45 SMD](https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_smd.pdf)

### V1.46

更改了 31P 座子的封装：
1-31脚加宽到0.3mm，两个定位脚加宽到0.7mm
</TabItem>

<TabItem value="ROCK 5B+">

### V1.2

- [v1.2 原理图 pdf](https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf)
- [v1.2 位号图 pdf](https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_components_placement_map.pdf)
- [v1.2 3D STP](https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_3d_stp.zip)

</TabItem>
</Tabs>

## 质量认证

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
