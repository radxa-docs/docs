---
sidebar_position: 2
---

# 内核开发

BSP 是 Radxa 提供的一套构建工具，可用于快速构建 U-Boot 与 Linux 内核。

## 配置 BSP 环境

请先参考 [BSP 环境配置](https://radxa-repo.github.io/bsp/) 完成环境准备。

## 编译内核

```bash
cd bsp
mkdir -p output
cd output
../bsp --no-prepare-source linux rk356x -r 20
```

参数说明：

- `--no-prepare-source`：使用本地源码，不从远端覆盖同步。
- `-r 20`：指定内核版本号。

编译完成后会在 `bsp/output` 目录生成 `deb` 包。

## 安装内核包

将生成的 `linux-image` 与 `linux-headers` 包拷贝到板端后执行：

```bash
sudo dpkg -i linux-image-5.10.160-20-rk356x_5.10.160-20_arm64.deb
sudo dpkg -i linux-headers-5.10.160-20-rk356x_5.10.160-20_arm64.deb
sudo reboot
```

重启后可通过 `uname -a` 检查当前内核版本。
