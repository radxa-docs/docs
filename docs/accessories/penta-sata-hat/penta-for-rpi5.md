---
sidebar_position: 2
---

# 树莓派 5 使用 Penta 扩展板

Raspberry Pi 5 有一个 PCIe 接口，它可以很好地和 Radxa Penta SATA HAT 一起工作。

## 电源选择

Penta SATA HAT 配备了一个 DC 接口（座子规格为外径 5.5mm，内径 2.5mm，中心为正极）和一个 D 形 4PIN 接口，搭配 Raspberry Pi 5 使用时，它支持三种电源供电模式，以适应不同的使用场景：

- 使用 Type-C 适配器从 Raspberry Pi 5 供电
- 使用 DC 12V 适配器从 Penta SATA HAT 供电
- 使用 ATX 或 SFX 电源的 D 形 4PIN 从 Penta SATA HAT 供电

选择哪种供电方式，取决于我们安装的硬盘数量和其他需要使用的外部设备，如 U 盘和风扇等。Raspberry Pi 5 高负载使用时功耗约为 8 瓦。典型的硬盘功耗如下表：

| 硬盘类型       | 功耗    |
| -------------- | ------- |
| 2.5 寸固态硬盘 | 小于 3W |
| 2.5 寸机械硬盘 | 3-5W    |
| 3.5 寸机械硬盘 | 5-10W   |

我们可以根据安装的硬盘类型和数量，选择合适的供电方式，下面是两个举例：

- 如果我们安装 2 块 2.5 寸固态硬盘，并且 Raspberry Pi 5 上没有其他外部设备，那么我们可以使用 Type-C 适配器供电，比如使用 Raspberry Pi 官方的 27W PD 适配器，应该可以满足供电需求。
- 如果我们安装 4 块 3.5 寸机械硬盘，考虑到 Raspberry Pi 5 本身的功耗，整个套件总功耗可能会超过 50W，这时我们可以使用 DC 12V 适配器供电，如 12V/5A 的适配器。或者使用 D 形 4PIN 从 ATX/SFX 电源供电，D 形 4PIN 接口一般能提供较大的功率。

:::info
1. 请不要同时使用两种或两种以上的供电方式。<br/>
2. 如果你需要使用 eSATA 接口，需要使用 DC 12V 适配器或 ATX/SFX 电源供电。
:::

## 组装

请按照下面图片所示的顺序进行组装。

1. 安装铜柱
   ![step1](/img/accessories/penta/rpi-assemble-1.webp)
   ![step2](/img/accessories/penta/rpi-assemble-2.webp)

2. 安装 FPC
   ![step3](/img/accessories/penta/rpi-assemble-3.webp)
   请注意，FPC 黑色的面朝向我们。
   ![step4](/img/accessories/penta/rpi-assemble-4.webp)

3. 拼在一起
   ![step5](/img/accessories/penta/rpi-assemble-5.webp)

4. 安装硬盘
   ![step6](/img/accessories/penta/rpi-assemble-6.webp)
   ![step7](/img/accessories/penta/rpi-assemble-7.webp)
   ![step8](/img/accessories/penta/rpi-assemble-8.webp)

## 安装系统

请浏览 https://www.raspberrypi.com/software/ 下载 Raspberry Pi Imager 并安装。把 microSD 卡插入电脑的 USB 接口。

1. 打开 Raspberry Pi Imager
   ![step1](/img/accessories/penta/rpi-install-os-1.webp)

2. 选择设备，并选择 Raspberry Pi5
   ![step2](/img/accessories/penta/rpi-install-os-2.webp)

3. 选择系统，建议选择 Raspberry Pi OS (64-bit)
   ![step3](/img/accessories/penta/rpi-install-os-3.webp)

4. 选择插入的 microSD 卡设备
   ![step4](/img/accessories/penta/rpi-install-os-4.webp)

5. 编辑设置
   ![step5](/img/accessories/penta/rpi-install-os-5.webp)

6. 新建用户
   ![step6](/img/accessories/penta/rpi-install-os-6.webp)

7. 启用 SSH
   ![step7](/img/accessories/penta/rpi-install-os-7.webp)

8. 开始写入
   ![step8](/img/accessories/penta/rpi-install-os-8.webp)

9. 完成安装
   ![step9](/img/accessories/penta/rpi-install-os-9.webp)

## 开始使用

把安装好系统的 microSD 卡插入树莓派中，并使用 12V/5A 的电源，从 Radxa Penta SATA HAT 的 DC 座子供电。让我们通过 ssh 登录到树莓派。

```bash
ssh pi@raspberrypi.local
```

### 启用 PCIe

编辑 `/boot/firmware/config.txt`，把 `dtparam=pciex1` 添加到文件末尾，保存后重启。

![step1](/img/accessories/penta/rpi-using-1.webp)

### 查看硬盘

使用 `lsblk` 命令可以查看硬盘设备。

```bash
lsblk
```

![step2](/img/accessories/penta/rpi-using-2.webp)

### 速度测试

下面是简单的速度测试，由于使用的是机械硬盘，速度相对较低。

```bash
sudo dd if=/dev/zero of=/dev/sda bs=32M status=progress count=100 oflag=direct
```

![step3](/img/accessories/penta/rpi-using-3.webp)

### 强制 Gen 3

把 `dtparam=pciex1_gen=3` 添加到 `/boot/firmware/config.txt` 可以让树莓派 5 强制使用 PCIe Gen 3。

![step4](/img/accessories/penta/rpi-using-4.webp)

添加后重启，可以使用下面命令查看 Radxa Penta HAT 的连接状态。

```bash
sudo lspci
sudo lspci -vvv -s 0000:01:00.1 | grep LnkSta
```

![step5](/img/accessories/penta/rpi-using-5.webp)

看到使用 Gen3 后，我们可以再测一次写入速度。

![step6](/img/accessories/penta/rpi-using-6.webp)

## 3D 打印外壳

目前我们尚未生产用于销售的相应外壳。但我们以及社区的用户提供了一些非常好看的 3D 打印外壳，你可以尝试打印这些外壳：

| 外壳名称          | 预览                                                                                        | 下载地址                                                                                               | 作者                                                         | 备注                                                                                                                                                                                  |
| ----------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Radxa Penta NAS   | <img src="/img/accessories/penta/case/case-1.webp" width="480" height="360" alt="case-1" /> | [GrabCAD](https://grabcad.com/library/radxa-penta-sata-hat-nas-case-1)                                 | [Radxa Computer](https://radxa.com/)                         | 支持安装 [Top board](sata-hat-top-board)<br/>问题讨论：[Raspberry Pi 3D print penta hat case quirks ](https://forum.radxa.com/t/raspberry-pi-3d-print-penta-hat-case-quirks/21063/15) |
| Pi 5 Four Bay NAS | <img src="/img/accessories/penta/case/case-2.webp" width="480" height="360" alt="case-2" /> | [MakerWorld](https://makerworld.com/en/models/464746#profileId-373433)                                 | [Michael Klements](https://www.youtube.com/@MichaelKlements) | 视频： [I Built A 4-Bay NAS Using A Raspberry Pi 5](https://www.youtube.com/watch?v=vIEjdjS7uVg)                                                                                      |
| Pi 5 NAS TOWER    | <img src="/img/accessories/penta/case/case-3.webp" width="480" height="360" alt="case-3" /> | [Cults 3D](https://cults3d.com/en/3d-model/gadget/pi-5-nas-tower-for-radxa-hat-with-option-noctua-fan) | [CeIIy](https://cults3d.com/en/users/CeIIy)                  | 8CM 猫扇，散热优秀                                                                                                                                                                    |
