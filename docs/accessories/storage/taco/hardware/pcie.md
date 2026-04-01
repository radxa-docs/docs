---
sidebar_position: 1
---

# 使能 PCIe Gen3

## 启用 PCIe

编辑 `/boot/firmware/config.txt` 文件。

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo nano /boot/firmware/config.txt
```

</NewCodeBlock>

把 `dtparam=pciex1` 添加到文件末尾，然后保存文件后重启系统。

```text
dtparam=pciex1
```

## 查看硬盘

使用 `lsblk` 命令可以查看硬盘设备。

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

![step2](/img/accessories/storage/penta/rpi-using-2.webp)

## 速度测试

下面是简单的速度测试，由于使用的是机械硬盘，速度相对较低。

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo dd if=/dev/zero of=/dev/sda bs=32M status=progress count=100 oflag=direct
```

</NewCodeBlock>

![step3](/img/accessories/storage/penta/rpi-using-3.webp)

## 强制 Gen 3

把 `dtparam=pciex1_gen=3` 添加到 `/boot/firmware/config.txt` 可以让树莓派 CM5 强制使用 PCIe Gen 3。

![step4](/img/accessories/storage/penta/rpi-using-4.webp)

添加后重启，可以使用下面命令查看 Radxa Taco 的连接状态。

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo lspci
sudo lspci -vvv -s 0000:01:00.1 | grep LnkSta
```

</NewCodeBlock>

![step5](/img/accessories/storage/penta/rpi-using-5.webp)

看到使用 Gen3 后，我们可以再测一次写入速度。

![step6](/img/accessories/storage/penta/rpi-using-6.webp)
