---
sidebar_position: 13
---

# Radiofrequency Compliance Guidance

CE / FCC certification requires that the device's wireless signal operates at a specified frequency. This tutorial will guide you on how to set up Wi-Fi / Bluetooth for such test.

## Installation tools and environment configuration

Please set up an environment on the device to be verified according to the specific module:

<Tabs groupId="module" queryString>
<TabItem value="ap6256" label="AP6XXX series" default>

```bash
## Disable the brcmfmac driver
echo "blacklist brcmfmac" >> /etc/modprobe.d/blacklist.conf

sudo wget -O /usr/local/sbin/wl https://dl.radxa.com/fix_freq_docs/wl
sudo chmod +x /usr/local/sbin/wl
## Install armel dependencies
sudo dpkg --add-architecture armel
sudo apt update
sudo apt install libc6:armel
```

</TabItem>
<TabItem value="rtl" label="RTLXXXX series" default>

```bash
# Installation tool
sudo wget -O /usr/local/sbin/rtwpriv https://dl.radxa.com/fix_freq_docs/rtl8852be/rtwpriv
sudo wget -O /usr/local/sbin/rtlbtmp https://dl.radxa.com/fix_freq_docs/rtl8852be/rtlbtmp
sudo chmod +x /usr/local/sbin/rtwpriv
sudo chmod +x /usr/local/sbin/rtlbtmp

# RTL8852BE fixed frequency needs to use the vendor driver, if using the official radxa image,
# it is recommended to use the Debian11 bullseye version, which can directly switch the vendor driver, as follows

## Disable upstream driver
echo "blacklist rtw_8852be" >> /etc/modprobe.d/dkms.conf
sudo apt update -y && sudo apt install -y 8852be-dkms
sudo reboot

## How to distinguish between upstream and vendor drivers
lsmod | grep 8852     # The following is vendor driver
  8852be               4063232  0

lsmod | grep 8852     # The following is upstream driver
  rtw_8852be             16384  0
  rtw_8852b             356352  1 rtw_8852be
  rtw89pci               49152  1 rtw_8852be
  rtw89core             421888  2 rtw89pci,rtw_8852b


```

</TabItem>

</Tabs>

## Replace the specialized firmware

Please execute the following command on the device to be verified:

<Tabs groupId="module" queryString>
<TabItem value="ap6256" label="AP6256" default>

```bash
sudo mv /lib/firmware/brcm/fw_bcm43456c5_ag.bin /lib/firmware/brcm/fw_bcm43456c5_ag.bin.bak
sudo wget -O /lib/firmware/brcm/fw_bcm43456c5_ag.bin https://dl.radxa.com/fix_freq_docs/ap6256/fw_bcm43456c5_ag_mfg.bin
reboot
sudo wl ver                 # The word WLTEST appears, indicating that the firmware replacement was successful.
sudo hcitool cmd 0x03 0x003 # No error, means Bluetooth is working.
```

</TabItem>

<TabItem value="ap6212" label="AP6212">

```bash
sudo mv /lib/firmware/brcm/fw_bcm43438a1.bin /lib/firmware/brcm/fw_bcm43438a1.bin.bak
sudo wget -O /lib/firmware/brcm/fw_bcm43438a1.bin https://dl.radxa.com/fix_freq_docs/ap6212/fw_bcm43438a1_mfg.bin
reboot
sudo wl ver                 # The word WLTEST appears, indicating that the firmware replacement was successful.
sudo hcitool cmd 0x03 0x003 # No error, means Bluetooth is working.
```

</TabItem>

<TabItem value="cm256" label="AW-CM256SM">

```bash
sudo mv /lib/firmware/brcm/cyw43455.bin /lib/firmware/brcm/cyw43455.bin.bak
sudo wget -O /lib/firmware/brcm/cyw43455.bin hhttps://dl.radxa.com/fix_freq_docs/cm256/cyw43455-mfgtest-7.45.100.18.bin
reboot
sudo wl ver                 # The word WLTEST appears, indicating that the firmware replacement was successful.
sudo hcitool cmd 0x03 0x003 # No error, means Bluetooth is working.
```

</TabItem>

<TabItem value="rtl8723ds" label="RTL8723DS">

```bash
sudo wget -O /lib/firmware/mp_rtl8723ds_config   https://dl.radxa.com/fix_freq_docs/rtl87123ds/mp_rtl8723ds_config
sudo wget -O /lib/firmware/mp_rtl8723d_fw       https://dl.radxa.com/fix_freq_docs/rtl87123ds/mp_rtl8723d_fw

reboot
```

The rtl8723ds-btfw-load.service service needs to be shut down before the bt fix can be performed

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
# WiFi verification, the return value is ok.
sudo su
rtwpriv wlan0 mp_start
rtwpriv wlan0 1 0 a 11M 1 2000
rtwpriv wlan0 mp_txpower dbm=19
rtwpriv wlan0 stop

# BT verification, return Success is ok.
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

## Continue to complete the test

AP6XXX Please refer to the following documentation for testing:

[Wi-Fi RF Test Commands for Linux-v05.pdf](https://dl.radxa.com/fix_freq_docs/Wi-Fi+RF+Test+Commands+for+Linux_BCM4339-v05.pdf)

[BT+RF+Test+Commands+for+Linux-v07.pdf](https://dl.radxa.com/fix_freq_docs/BT+RF+Test+Commands+for+Linux-v07.pdf)

RTL8723DS Please refer to the following documents for testing

[Realtek_linuxFixed Frequency Instruction Guide.pdf](https://dl.radxa.com/fix_freq_docs/Realtek_linuxFixed-Frequency-Instruction-Guide.pdf)

[MP tool user guide for linux20181108.pdf](https://dl.radxa.com/fix_freq_docs/MP-tool-user-guide-for-linux20181108.pdf)

RTL8852BE Please refer to the following documents for testing

[AW_XB547NF_RTL8852BE_Linux_RF_Test_Commands_User_Guide.pdf](https://dl.radxa.com/fix_freq_docs/AW_XB547NF_Linux_RF_Test_Commands_User_Guide_v02_20230315.pdf)

## Caution

Bluetooth needs to be turned off when testing Wi-Fi:

```bash
sudo rfkill block bluetooth
sudo rfkill unblock wlan
```

Wi-Fi needs to be turned off when testing Bluetooth:

```bash
sudo rfkill block wlan
sudo rfkill unblock bluetooth
```
