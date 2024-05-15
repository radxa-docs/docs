---
sidebar_position: 2
---

# 树莓派 5 使用 Penta SATA 扩展板

Raspberry Pi 5 有一个 PCIe 接口，它可以很好地和 Radxa Penta SATA HAT 一起工作。

:::info
请不要同时使用 DC 电源和 Type-C 给 Penta SATA HAT 和 Raspberry Pi 5 供电。

一般来讲，2.5 英寸硬盘的功耗 5W 左右，如果你使用 2 块或 2 块以上的硬盘，请考虑使用 DC 电源从 Penta 供电。

如果选择 DC 电源供电，请使用电压为 12V，电流 4A 或 4A 以上的电源。DC 座子的规格为 5525。
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
