---
sidebar_position: 5
---

# 构建系统

## 硬件要求

- Ubuntu

可在 Windows 平台的 WSL2 上运行 Ubuntu。

- 32GB 内存

## 环境搭建

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```
sudo apt-get update
sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 liblz4-tool locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd repo -y
```

</NewCodeBlock>

## 获取源码

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```
mkdir ~/yocto-rockchip-sdk && cd ~/yocto-rockchip-sdk
repo init -u https://github.com/radxa/yocto-manifests.git -b scarthgap
repo sync
```

</NewCodeBlock>

## 链接配置文件

将瑞莎设备的配置文件链接到 `local.conf`。

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```
cd ~/yocto-rockchip-sdk/build/conf
ln -sf rockchip-rk3576-rock-4d.conf local.conf
```

</NewCodeBlock>

## 开始构建

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```
cd ~/yocto-rockchip-sdk/build
source oe-init-build-env
bitbake rockchip-image-full
```

</NewCodeBlock>

:::tip 常见问题

- `Please make sure locale 'en_US.UTF-8' is available on your system`

若系统中没有 `en_US.UTF-8`，则需要按照下面步骤设置：

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```
sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
sudo echo "export LANG=en_US.UTF-8" >> ~/.bashrc
source ~/.bashrc
```

</NewCodeBlock>

:::
