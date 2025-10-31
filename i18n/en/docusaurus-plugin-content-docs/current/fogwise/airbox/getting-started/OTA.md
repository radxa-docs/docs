---
sidebar_position: 5
title: OTA Upgrade
---

Airbox supports OTA software updates, allowing you to update to a new version of the SOPHON SDK.
The default SDK version in the [Resource Download](./download) section is v23.10.01.

You can check the current SDK software version using `bm_version`:

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

## Upgrade libsophon

If your application requires a newer SDK version, you can update the SDK software using the OTA upgrade package.
Here, we use [SDK-23.09 LTS SP3](https://developer.sophgo.com/site/index/material/90/all.html) as an example to upgrade libsophon to 0.5.1.

- Download the target SDK version from the [SOPHGO official website](https://developer.sophgo.com/site/index/material/90/all.html) and extract it to obtain `SDK-23.09_LTS_SP3`.
- Open the `sophon-img` subfolder in the SDK directory, and copy the `bsp_update.tgz` and `system.tgz` files to Airbox (e.g., to `/home/linaro`).
- Extract `bsp_update.tgz` on Airbox and execute the upgrade script:

  ```bash
  tar zxvf bsp_update.tgz
  cd bsp_update
  sudo ./bsp_update.sh
  ```

- Navigate back to the directory where `system.tgz` is located and extract its contents into the `/opt/sophon/libsophon-0.5.0` directory:

  ```bash
  sudo tar xzf system.tgz -C /opt/sophon/libsophon-0.5.0
  sudo sync
  ```

- After rebooting, verify whether `libsophon` has been successfully upgraded using [bm-smi](../local-ai-deploy/ai-tools/bm-smi).

## (Optional) Upgrade sophon-mw

If your application requires a newer version of `sophon-mw`, you can install the updated `.deb` packages included in the latest SDK.
Here, we use [SDK-23.09 LTS SP3](https://developer.sophgo.com/site/index/material/90/all.html) as an example to upgrade `sophon-mw` to version 0.12.0.

- Copy the `sophon-mw-soc-sophon*.deb` files from the SDK `sophon-mw` directory to Airbox (e.g., to `/home/linaro`).
- Uninstall the current version of `sophon-mw`:

  ```bash
  sudo apt remove sophon-mw-soc-sophon-ffmpeg
  sudo apt remove sophon-mw-soc-sophon-opencv
  ```

- Install the new version of `sophon-mw`:

  ```bash
  sudo dpkg -i ./sophon-mw-soc-sophon-ffmpeg_0.12.0_arm64.deb
  sudo dpkg -i ./sophon-mw-soc-sophon-opencv_0.12.0_arm64.deb
  ```

- Check the `sophon-mw` version using `bm_version`:

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
