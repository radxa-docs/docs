---
sidebar_position: 8
---

# Maskrom 模式

Radxa CM5 支持 Maskrom 模式，这是 CPU 通过 USB OTG 端口接收命令的一种特殊操作模式。
本指南将会指导您如何将 Radxa CM5 进入 Maskrom 模式进行操作。

## 准备工作

- Radxa CM5 SBC
- 12V DC 电源适配器
- USB-A 转 USB-C 转接线

## 操作步骤

1. 烧录工具安装及使用

   <Tabs queryString="host_os">
   <TabItem value="Windows">

   Windows 下使用 RKDevTool 进行镜像烧录，其安装及教程请参阅：[RKDevTool 指南](../low-level-dev/rkdevtool)。

   </TabItem>
   <TabItem value="Linux_MacOS">

   在 Linux 及 MacOS 的环境下，可使用 rkdeveloptool 及 upgrade_tool 进行操作。  
   对应的安装及教程请参阅：[rkdeveloptool 指南](../low-level-dev/rkdevtool)，[upgrade_tool 指南](../low-level-dev/upgrade-tool)。

   </TabItem>
   </Tabs>

2. 移除 microSD 卡等存储设备

3. 将 USB-A 转 USB-C 转接线的USB-A端接到主机端口，USB-C端接到 Radxa CM5 的 OTG 端口 (耳机口旁边的type-c口)，如下图所示

   ![OTG connection](/img/cm5/cm5io-otg-connect.webp)

4. 长按 CM5 上的Maskrom按键

   ![Long press maskrom key](/img/cm5/cm5-maskrom-key.webp)

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
