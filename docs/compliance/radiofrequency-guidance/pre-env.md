---
sidebar_position: 13
---

# 定频认证指导

进行 CE / FCC 认证的时候，会要求设备的无线信号工作在指定频率。本教程会指引你如何进行 Wi-Fi / 蓝牙相关的定频设置。

## 安装工具与环境配置

请根据具体模块，在待验证设备上搭建环境：
<Tabs groupId="module" queryString>
<TabItem value="ap6256" label="AP6XXX 系列" default>

```bash
## 禁用默认 brcmfmac 驱动程序
echo "blacklist brcmfmac" >> /etc/modprobe.d/blacklist.conf

sudo wget -O /usr/local/sbin/wl https://dl.radxa.com/fix_freq_docs/wl
sudo chmod +x /usr/local/sbin/wl
## 安装 armel 依赖
sudo dpkg --add-architecture armel
sudo apt update
sudo apt install libc6:armel
```

</TabItem>
<TabItem value="rtl" label="RTLXXXX 系列" default>

```bash
# 安装工具
sudo wget -O /usr/local/sbin/rtwpriv https://dl.radxa.com/fix_freq_docs/rtl8852be/rtwpriv
sudo wget -O /usr/local/sbin/rtlbtmp https://dl.radxa.com/fix_freq_docs/rtl8852be/rtlbtmp
sudo chmod +x /usr/local/sbin/rtwpriv
sudo chmod +x /usr/local/sbin/rtlbtmp

# rtl8852be 定频需要使用 vendor 驱动，如果使用 radxa 官方镜像
# 推荐使用 Debian11 bullseye 版本，可直接切换 vendor 驱动，如下

## 需要禁用 upstream 驱动
echo "blacklist rtw_8852be" >> /etc/modprobe.d/dkms.conf
sudo apt update -y && sudo apt install -y 8852be-dkms
sudo reboot

## 如何区别使用的是 upstream 还是 vendor 的驱动
lsmod | grep 8852     # 以下情况是 vendor 驱动
  8852be               4063232  0

lsmod | grep 8852     # 以下情况是 upstream 驱动
  rtw_8852be             16384  0
  rtw_8852b             356352  1 rtw_8852be
  rtw89pci               49152  1 rtw_8852be
  rtw89core             421888  2 rtw89pci,rtw_8852b


```

</TabItem>

</Tabs>

## 替换专用固件

请在待验证设备上执行以下命令：

<Tabs groupId="module" queryString>
<TabItem value="ap6256" label="AP6256" default>

```bash
sudo mv /lib/firmware/brcm/fw_bcm43456c5_ag.bin /lib/firmware/brcm/fw_bcm43456c5_ag.bin.bak
sudo wget -O /lib/firmware/brcm/fw_bcm43456c5_ag.bin https://dl.radxa.com/fix_freq_docs/ap6256/fw_bcm43456c5_ag_mfg.bin
reboot
sudo wl ver                       # 出现 WLTEST 字样，说明固件替换成功
sudo hcitool cmd 0x03 0x003       # 没有报错，说明蓝牙环境正常
```

</TabItem>

<TabItem value="ap6212" label="AP6212">

```bash
sudo mv /lib/firmware/brcm/fw_bcm43438a1.bin /lib/firmware/brcm/fw_bcm43438a1.bin.bak
sudo wget -O /lib/firmware/brcm/fw_bcm43438a1.bin https://dl.radxa.com/fix_freq_docs/ap6212/fw_bcm43438a1_mfg.bin
reboot
sudo wl ver                       # 出现 WLTEST 字样，说明固件替换成功
sudo hcitool cmd 0x03 0x003       # 没有报错，说明蓝牙环境正常
```

</TabItem>

<TabItem value="cm256" label="AW-CM256SM">

```bash
sudo mv /lib/firmware/brcm/cyw43455.bin /lib/firmware/brcm/cyw43455.bin.bak
sudo wget -O /lib/firmware/brcm/cyw43455.bin hhttps://dl.radxa.com/fix_freq_docs/cm256/cyw43455-mfgtest-7.45.100.18.bin
reboot
sudo wl ver                       # 出现 WLTEST 字样，说明固件替换成功
sudo hcitool cmd 0x03 0x003       # 没有报错，说明蓝牙环境正常
```

</TabItem>

<TabItem value="rtl8723ds" label="RTL8723DS">

```bash
sudo wget -O /lib/firmware/mp_rtl8723ds_config   https://dl.radxa.com/fix_freq_docs/rtl87123ds/mp_rtl8723ds_config
sudo wget -O /lib/firmware/mp_rtl8723d_fw       https://dl.radxa.com/fix_freq_docs/rtl87123ds/mp_rtl8723d_fw

reboot
```

在进行bt定频之前，需要先关闭 rtl8723ds-btfw-load.service 服务

```bash
sudo systemctl stop rtl8723ds-btfw-load.service
```

</TabItem>

<TabItem value="rtl8852be" label="RTL8852BE">

```bash
sudo wget -O /lib/firmware/mp_rtl8852b_config   https://dl.radxa.com/fix_freq_docs/rtl8852be/mp_rtl8852b_config
sudo wget -O /lib/firmware/mp_rtl8852b_fw       https://dl.radxa.com/fix_freq_docs/rtl8852be/mp_rtl8852b_fw

sudo reboot
```

```
# wifi 定频验证，返回值为 ok 即可
sudo su
rtwpriv wlan0 mp_start
rtwpriv wlan0 1 0 a 11M 1 2000
rtwpriv wlan0 mp_txpower dbm=19
rtwpriv wlan0 stop

# bt 验证, 返回Success 即可
ip link set wlan0 up
rtwpriv wlan0 mp_start
rtwpriv wlan0 mp_btc_path bt
rtwpriv wlan0 mp_ant_tx a

rtlbtmp
:::::::::::::::::::::::::::::::::::::::::::::::::
:::::::: Bluetooth MP Test Tool Starting 2024.05.9 ::::::::
> enable usb:/dev/rtk_btusb

```

</TabItem>

</Tabs>

## 继续完成测试

AP6XXX 请参考以下文档进行测试：

[Wi-Fi RF Test Commands for Linux-v05.pdf](https://dl.radxa.com/fix_freq_docs/Wi-Fi+RF+Test+Commands+for+Linux_BCM4339-v05.pdf)

[BT+RF+Test+Commands+for+Linux-v07.pdf](https://dl.radxa.com/fix_freq_docs/BT+RF+Test+Commands+for+Linux-v07.pdf)

RTL8723DS 请参考以下文档进行测试

[Realtek_linuxFixed Frequency Instruction Guide.pdf](https://dl.radxa.com/fix_freq_docs/Realtek_linuxFixed-Frequency-Instruction-Guide.pdf)

[MP tool user guide for linux20181108.pdf](https://dl.radxa.com/fix_freq_docs/MP-tool-user-guide-for-linux20181108.pdf)

RTL8852BE 请参考以下文档进行测试

[AW_XB547NF_RTL8852BE_Linux_RF_Test_Commands_User_Guide.pdf](https://dl.radxa.com/fix_freq_docs/AW_XB547NF_Linux_RF_Test_Commands_User_Guide_v02_20230315.pdf)

## 注意事项

测试 Wi-Fi 时，需要关闭蓝牙：

```bash
sudo rfkill block bluetooth
sudo rfkill unblock wlan
```

测试蓝牙时，需要关闭 Wi-Fi：

```bash
sudo rfkill block wlan
sudo rfkill unblock bluetooth
```
