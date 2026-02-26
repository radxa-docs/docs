---
sidebar_position: 2
---

# 驱动安装

## 前置说明

- 建议先通过 U 盘离线安装网络驱动，待系统联网正常后再安装其它驱动。
- 若安装完成后功能仍不正常，建议先重启系统后再验证。
- 部分驱动安装包与其它机型共用下载目录（例如链接中出现 `x4`），不影响在 X5 上使用。

## 芯片组 INF

给 Windows 提供芯片组设备的识别信息（INF），让一堆 Intel 平台控制器显示为正确的设备名并绑定到合适的系统驱动栈，避免出现一堆 Unknown device 或通用占位驱动。

### 驱动下载

- [Intel Chipset Device Software](https://dl.radxa.com/x/x4/Intel_Chipset_Driver.zip)

### 驱动安装

解压下载的 `Intel_Chipset_Driver.zip` 文件，以管理员身份运行 `SetupChipset.exe` 程序，然后按照提示安装驱动，最后根据提示重启系统。

## ME 驱动

让系统能够通过 MEI 接口与 Intel 管理引擎固件通信。

### 驱动下载

- [Intel Management Engine Driver](https://dl.radxa.com/x/x4/Intel_ME_driver.zip)

### 驱动安装

解压下载的 `Intel_ME_driver.zip` 文件，鼠标右击 `heci.inf` 文件，然后选择安装选项进行安装。

## ISH 驱动

启用 Intel 传感器集线器相关设备，使系统能正确枚举和使用通过 ISH 管理的传感器类设备。

### 驱动下载

- [Intel Integrated Sensor Hub Driver](https://dl.radxa.com/x/x4/Intel_ISH_Driver.zip)

### 驱动安装

解压下载的 `Intel_ISH_Driver.zip` 文件，鼠标右击 `AlderLakePCH-NSystemISH.inf` 文件，然后选择安装选项进行安装。

## GPU 显卡驱动

启用 Intel UHD 图形的完整能力，包括 3D 加速、视频硬解码/编码、显示输出能力与更好的能耗管理。

### 驱动下载

- [Intel Graphics Driver](https://www.intel.com/content/www/us/en/download/864990/intel-11th-14th-gen-processor-graphics-windows.html)

### 驱动安装

以管理员身份运行 `gfx_win_***.exe` 程序，然后按照提示安装驱动，最后根据提示重启系统。

## GPIO 驱动

为 Intel 平台的 GPIO 控制器提供正确驱动与设备枚举，让系统可以正常使用板级控制信号（各类使能脚、复位脚、中断线等）。

### 驱动下载

- [GPIO Driver](https://dl.radxa.com/x/x4/radxa_x4_gpio_driver.zip)

### 驱动安装

解压下载的 `radxa_x4_gpio_driver.zip` 文件，鼠标右击 `ialpss2_gpio2_adl_n.inf` 文件，然后选择安装选项进行安装。

## 网络驱动

瑞莎 X5 板载 2.5G 以太网口，以及 WiFi 6 / 蓝牙模组。

### 驱动下载

<Tabs queryString="Network">

<TabItem value="有线">

- [Intel Network Adapter Driver](https://www.intel.com/content/www/us/en/download/18293/intel-network-adapter-driver-for-windows-10.html)

</TabItem>

<TabItem value="无线">

- [WiFi 6](https://dl.radxa.com/x/x2l/accessories/radxa_wireless_module_a8.zip)

</TabItem>

</Tabs>

### 驱动安装

<Tabs queryString="Network">

<TabItem value="有线">

从 Intel 官网下载对应的网卡驱动安装包后，以管理员身份运行安装程序（通常为 `.exe`），然后按照向导完成安装。

</TabItem>

<TabItem value="无线">

该驱动包适用于 Radxa 无线模组 A8（WiFi 6 / 蓝牙）。

解压下载的 `radxa_wireless_module_a8.zip` 文件，以管理员身份分别运行 `wlan` 和 `bt` 文件夹下的 `InstallDriver.cmd` 文件，然后按照提示等待驱动安装成功。

</TabItem>

</Tabs>

### 功能验证

完成以上驱动安装后，可以在系统状态栏发现对应网络功能入口。

说明：有线网络需要连接网线才可以看到对应图标。

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/radxa-x5-network.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
