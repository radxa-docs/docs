---
sidebar_position: 2
---

# U-boot 开发

[bsp](https://github.com/radxa-repo/bsp) 是 Radxa 提供的一套快速构建 U-Boot Kernel 的工具，使用 bsp 非常方便就能构建出自己的 U-Boot 和 Kernel.  
下面将为您展示如何使用 bsp 构建 Radxa ROCK S0 的 U-Boot

## [bsp 环境配置](https://radxa-repo.github.io/bsp/)

## 编译 U-Boot

完成 bsp 环境配置后，需要先编译一次 U-Boot 才会从仓库拉取相关代码，可以执行`./bsp u-boot latest rock-s0`构建 U-Boot, U-Boot 源码的路径位于 bsp 目录下的 `.src/u-boot`

```text
cd bsp
mkdir output
cd output
../bsp --no-prepare-source u-boot latest rock-s0

参数说明：
--no-prepare-source   # 使用本地修改进行编译，如果不加这个参数将会从 Radxa U-Boot 仓库同步最新代码并覆盖本地修改
```

更多 bsp 参数使用说明可以执行 `./bsp`查看

编译完成后会在 bsp/output 目录生成许多 `deb` 包， 只需要安装下面的 `deb` 即可

```text
u-boot-latest_2023.10-1_arm64.deb
```

将上面两个 `deb` 包复制到板子上使用 `dpkg` 指令安装即可完成 U-Boot 安装

```bash
sudo dpkg -i u-boot-latest_2023.10-1_arm64.deb
```

安装完成后需要将 U-Boot 刷到启动介质中

```text
cd /usr/lib/u-boot/rock-s0/
sudo ./setup.sh update_bootloader /dev/mmcblk1   #/dev/mmcblk1 为你当前使用的启动介质，需要根据实际使用的设备来选择
sudo reboot
```

重启后可以观察 U-Boot 启动 log 查看 U-Boot 是否更新成功
