---
sidebar_position: 21
---

# 清空 SPI Flash

## 方法一： 在板子上执行清空指令

从 SD 卡或者 eMMC 启动 Linux 系统，登录系统后，确认 SPI flash 是否能读到

```bash
ls /dev/mtdblock*
```

正常情况下会返回 /dev/mtdblock0,然后执行清空命令

```bash
sudo dd if=/dev/zero of=/dev/mtdblock0
sync
```

## 方法二: 在 Linux PC / Mac 下

首先让设备[进入 MaskRom 模式](./maskrom.md), 然后通过USB线连接 PC 和 设备，
然后下载 [zero.img](https://dl.radxa.com/rock5/sw/images/others/zero.img.gz) 并解压，然后执行下面的命令

```bash
rkdeveloptool db rk3588_spl_loader_v1.08.111.bin (其他设备需选择对应的loader文件)
rkdeveloptool wl 0 zero.img
rkdeveloptool rd
```

## 方法三 ： window 下使用 RKDevTool

首先让设备[进入 MaskRom 模式](./maskrom.md)，然后打开 RkDevTool 工具，选择 “Advanced Function”，按照下图上的顺序执行.

![Erase Data](/img/common/rkdevtool/700px-Eraseall_new.webp)
