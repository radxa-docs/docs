---
sidebar_position: 2
---

# Kernel 开发

[bsp](https://github.com/radxa-repo/bsp) 是 Radxa 提供的一套快速构建 U-Boot Kernel 的工具，使用 bsp 非常方便就能构建出自己的 U-Boot 和 Kernel.  
下面将为您展示如何使用 bsp 构建 Radxa ROCK S0 的内核

## [bsp 环境配置](https://radxa-repo.github.io/bsp/)

## 编译内核

完成 bsp 环境配置后，需要先编译一次内核才会从仓库拉取内核代码，可以执行`./bsp linux stable`构建内核, 内核源码的路径位于 bsp 目录下的 `.src/linux`

```
cd bsp
mkdir output
cd output
../bsp --no-prepare-source linux stable -r 20

参数说明：
stable                # rock s0 指定使用主线6.1内核
--no-prepare-source   # 使用本地修改进行编译，如果不加这个参数将会从 Radxa kernel 仓库同步最新代码并覆盖本地修改
-r 20                 # 指定内核的版本号为 20, 系统启动会按照顺序加载内核
```

更多 bsp 参数使用说明可以执行 `./bsp`查看

编译完成后会在 bsp/output 目录生成许多 `deb` 包， 只需要安装下面两个 `deb` 即可

```
linux-headers-6.1.68-20-stable_6.1.68-20_arm64.deb
linux-image-6.1.68-20-stable_6.1.68-20_arm64.deb
```

将上面两个 `deb` 包复制到板子上使用 `dpkg` 指令安装即可完成内核安装

```
sudo dpkg -i linux-headers-6.1.68-20-stable_6.1.68-20_arm64.deb
sudo dpkg -i linux-image-6.1.68-20-stable_6.1.68-20_arm64.deb
sudo reboot
```

重启完成后可以通过 `uname -a` 查看当前启动的内核版本号来查看是否安装成功
