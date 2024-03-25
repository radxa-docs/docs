---
sidebar_position: 8
---

# Maskrom 模式

ROCK 3C 支持 Maskrom 模式，这是 CPU 通过 USB OTG 端口接收命令的一种特殊操作模式。
本指南将会指导您如何将 ROCK 3C 进入 Maskrom 模式进行操作。

## 准备工作

- ROCK 3C SBC
- Type-C 电源适配器
- USB-A 转 USB-A 转接线
- 公对公杜邦线或其他导线
- eMMC 模块或 microSD 卡 （可选项）

## 操作步骤

1. 安装开发工具

   <Tabs queryString="host_os">
   <TabItem value="Windows">

   Windows 下使用 RKDevTool 进行开发，其安装及教程请参阅：[RKDevTool 指南](../low-level-dev/rkdevtool)。

   </TabItem>
   <TabItem value="Linux_MacOS">

   在 Linux 及 MacOS 的环境下，可使用 rkdeveloptool 及 upgrade_tool 进行操作。  
   对应的安装及教程请参阅：[rkdeveloptool 指南](../low-level-dev/rkdeveloptool)，[upgrade_tool 指南](../low-level-dev/upgrade-tool)。

   </TabItem>
   </Tabs>

2. 移除 eMMC 模块和 microSD 卡等存储设备

3. 将 USB-A 转 USB-A 转接线的一端接到主机端口，另一端接到 ROCK 3C 的 OTG 端口 (其位于 USB 3.0 端口的上方)，如下图所示

   ![OTG connection](/img/rock3/3c/3c-otg-connect.webp)

4. 短接 SPI 端口

   ![Connect SPI Pin](/img/rock3/3c/3c-shortconnect-spipin.webp)

5. 上电启动，随后可通过对应工具查看是否成功进入 Maskrom 模式，以下是正确进入后的示例

   <Tabs queryString="app">
   <TabItem value="RKDevTool">

   ![Connect SPI Pin](/img/configuration/rkdevtool-maskrom.webp)

   </TabItem>
   <TabItem value="rkdeveloptool">

   ```bash
       sudo rkdeveloptool ld  # 列出已连接设备
       DevNo=1 Vid=0x2207,Pid=0x350b,LocationID=106 Maskrom
   ```

   </TabItem>
   <TabItem value="upgrade_tool">

   ```bash
       $ sudo ./upgrade_tool  # 列出已连接设备
       Using /home/rock/Linux_Upgrade_Tool/config.ini
       Program Log will save in the /root/upgrade_tool/log/
       List of rockusb connected
       DevNo=1 Vid=0x2207,Pid=0x350b,LocationID=21     Mode=Maskrom
       Found 1 rockusb,Select input DevNo,Rescan press <R>,Quit press <Q>:
   ```

   </TabItem>
   </Tabs>

## 特殊情况

由于 SoC 设计的逻辑限制，在 SPI Flash 中刷入 SPI image 后，使用 eMMC 或 microSD 卡启动时可能出现直接进入 Maskrom 模式的情况。该情况下需要短接 SPI 才可进入系统，擦除 SPI 后即可恢复。

通过 RKDevTool 擦除 SPI Flash：

- 移除系统存储介质
- 上电进入 Maskrom 模式
- 下载 [loader 文件](https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/rk356x_spl_loader_ddr1056_v1.10.111.bin)：图示 1 选择 loader 文件，图示 2 下载 loader 文件
- 擦除所有：图示 3 擦除所有，图示 4 擦除完成
- 重启设备：图示 5 重启设备

![Erase All](/img/rock3/3c/3c-erase-all.webp)

特别地，如果短接预留 SPI 短接孔依然无法进入系统且需要进入系统，可直接将 SPI Flash 的 clk 脚接地后上电进入系统，具体操作如下:

- 安装烧录有系统的 eMMC 或 microSD 卡
- 使用公对母杜邦线的母座端接 40 pin 连接座的接地引脚，其在连接座上标注为黑色
- 使用公对母杜邦线的公头端连接 SPI Flash 的 clk 脚，在 ROCK 3C 上为下图所示引脚
- 上电开机
- 待串口启动到 U-Boot 后断开连接

![SPI clk connect](/img/rock3/3c/3c-spi-connect.webp)

进入系统后，可执行以下命令查看 SPI Flash 分块号：

```bash
    ls /dev/mtdblock*
    # 通常，SPI Flash 的区块号如下，可通过分区大小来确认
    /dev/mtd0
```

随后，可通过以下命令清除 SPI Flash：

```bash
    sudo erase_flashall /dev/mtd0
```
