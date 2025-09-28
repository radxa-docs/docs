---
sidebar_position: 5
title: OTA 升级
---

Airbox 支持 OTA 软件更新，可以更新新版本的 SOPHON SDK，
在 [资源下载](./download) 提供的下载镜像中默认 SDK 版本为 v23.10.01

使用 `bm_version` 可以查看那当前 SDK 软件版本

```bash
linaro@Airbox:~$ bm_version
SophonSDK version: v23.10.01
sophon-soc-libsophon : 0.5.0
sophon-soc-libsophon-dev : 0.5.0
sophon-mw-soc-sophon-ffmpeg : 0.7.1
sophon-mw-soc-sophon-opencv : 0.7.1
BL2 v2.7(release): Built : 03:20:12, Jun  5 2024
BL31 v2.7(release): Built : 03:20:12, Jun  5 2024
U-Boot 2022.10 (Jun 05 2024 - 03:20:10 +0000) Sophon BM1684X
KernelVersion : Linux Airbox 5.4.217-bm1684-g18c6a7c915a2-dirty #4 SMP Thu May 16 09:59:04 UTC 2024 aarch64 aarch64 aarch64 GNU/Linux
HWVersion: 0x11
MCUVersion: 0x02
```

## 升级 libsophon

若用户对新版 SDK 有硬性要求可以通过下载 OTA 升级包进行 SDK 软件更新，这里以 [SDK-23.09 LTS SP3](https://developer.sophgo.com/site/index/material/90/all.html) 为例子将
libsophon 升级为 0.5.1。

- 在[算能官网](https://developer.sophgo.com/site/index/material/90/all.html)下载目标版本 SDK， 并解压得到 `SDK-23.09_LTS_SP3`
- 打开 SDK 目录下的 sophon-img 子文件夹，将 bsp_update.tgz 和 system.tgz 压缩包复制到 Airbox 上(如路径 `/home/linaro`)
- 在 Airbox 上解压 bsp_update.tgz，并执行升级脚本
  ```bash
  tar zxvf bsp_update.tgz
  cd bsp_update
  sudo ./bsp_update.sh
  ```
- 回退至 system.tgz 所在目录， 执行如下命令将 system.tgz 中的内容解压至 `/opt/sophon/libsophon-0.5.0` 目录下
  ```bash
  sudo tar xzf system.tgz -C /opt/sophon/libsophon-0.5.0
  sudo sync
  ```
- 重启后通过 [bm-smi](../local-ai-deploy/ai-tools/bm-smi) 确认 libsophon 是否升级成功

## （可选）升级 sophon-mw

若用户对新版 sophon-mw 有硬性要求可以通过下载新版 SDK，使用附带的 deb 包进行安装，这里以 [SDK-23.09 LTS SP3](https://developer.sophgo.com/site/index/material/90/all.html) 为例子将
sophon-mw 升级为 0.12.0

- 将 SDK 里 sophon-mw 里的 sophon-mw-soc-sophon\*.deb 复制到 Airbox 上（如路径 `/home/linaro`）
- 卸载当前版本的 sophon-mw
  ```bash
  sudo apt remove sophon-mw-soc-sophon-ffmpeg
  sudo apt remove sophon-mw-soc-sophon-opencv
  ```
- 安装新版 sophon-mw
  ```bash
  sudo dpkg -i ./sophon-mw-soc-sophon-ffmpeg_0.12.0_arm64.deb
  sudo dpkg -i ./sophon-mw-soc-sophon-opencv_0.12.0_arm64.deb
  ```
- 通过 `bm_version` 检查 sophon-mw 版本
  ```bash
  linaro@Airbox:~$ bm_version
  SophonSDK version: v23.10.01
  sophon-soc-libsophon : 0.5.0
  sophon-soc-libsophon-dev : 0.5.0
  sophon-mw-soc-sophon-ffmpeg : 0.12.0
  sophon-mw-soc-sophon-opencv : 0.12.0
  BL2 v2.7(release):b0dc29c Built : 10:20:22, Aug 15 2024
  BL31 v2.7(release):b0dc29c Built : 10:20:22, Aug 15 2024
  U-Boot 2022.10 b0dc29c (Aug 15 2024 - 10:20:18 +0800) Sophon BM1684X
  KernelVersion : Linux Airbox 5.4.217-bm1684-g3357dba62ec6 #1 SMP Thu Aug 15 10:20:28 CST 2024 aarch64 aarch64 aarch64 GNU/Linux
  HWVersion: 0x11
  MCUVersion: 0x02
  ```
