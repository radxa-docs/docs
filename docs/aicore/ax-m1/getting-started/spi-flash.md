---
sidebar_position: 5
---

# 升级 SPI Flash 固件

通过主板更新智核 AX-M1 的 SPI Flash 固件。

## 前置说明

- 本操作会写入 SPI Flash，请确保供电稳定，升级过程中不要断电。
- 以下命令在主板（Host）侧执行。

## 安装软件

访问 [资源汇总下载](../download.md) 页面下载所需的软件安装包，并将安装包放在同一目录下。

<NewCodeBlock tip="Host" type="host">

```bash
sudo dpkg -i axclhost-firmware_3.6.5-1_all.deb
sudo dpkg -i task-axclhost_3.6.5-1_all.deb
sudo dpkg -i axclhost-dkms_3.6.5-1_all.deb
sudo systemctl restart systemd-modules-load
```

</NewCodeBlock>

## 识别设备

验证主板是否识别到智核 AX-M1 的 SPI Flash 设备节点。

<NewCodeBlock tip="Host" type="host">

```bash
axcl-smi sh "ls /dev/mtd0"
```

</NewCodeBlock>

若输出显示存在 `/dev/mtd0`，表示设备节点正常。

## 升级固件

访问 [资源汇总下载](../download.md) 页面下载对应的 SPI Flash 固件文件，并确认固件文件名与命令参数一致。

<NewCodeBlock tip="Host" type="host">

```bash
axcl_spl_update -i spl_AX650_card_signed.bin -d 0
```

</NewCodeBlock>

其中 `-d 0` 表示选择编号为 0 的设备。

## 升级后验证

升级完成后，建议重启主板并再次检查设备节点是否正常。
