---
sidebar_position: 2
---

# U-Boot 开发

BSP 是 Radxa 提供的一套构建工具，可用于快速构建 U-Boot 与 Linux 内核。

## 配置 BSP 环境

请先参考 [BSP 环境配置](https://radxa-repo.github.io/bsp/) 完成环境准备。

## 编译 U-Boot

```bash
cd bsp
mkdir -p output
cd output
../bsp --no-prepare-source u-boot latest radxa-zero3
```

参数说明：

- `--no-prepare-source`：使用本地源码，不从远端覆盖同步。

编译完成后会在 `bsp/output` 目录生成 `deb` 包。

## 安装与写入引导

```bash
sudo dpkg -i u-boot-latest_2023.10-1_arm64.deb
cd /usr/lib/u-boot/radxa-zero3/
sudo ./setup.sh update_bootloader /dev/mmcblk1
sudo reboot
```

重启后可通过串口日志确认 U-Boot 是否更新成功。
