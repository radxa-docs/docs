---
sidebar_position: 4
---

# Maskrom 模式

本指南可帮助您使用 rkdeveloptool 和 RKDevTool，以 maskrom 模式从 USB 端口将镜像安装到 SPI Nor Flash 中。

## 准备工作

- 带有 SPI Nor Flash 以及 maskrom 按钮的 Radxa CM3 核心板和 IO 板。您可以参考下图找到以下 SPI Nor Flash：

![CM3 with SPI](/img/cm3/cm3-with-spi.webp)

- 电源适配器
- USB-A 转 Micro USB 线
- 装有 [RKDevTool](rkdevtool) 或 [rkdeveloptool](rkdeveloptool) 的电脑
- 获取 Radxa CM3 IO loader 和 U-Boot 映像  
  [RK356X loader](https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/rk356x_spl_loader_ddr1056_v1.10.111.bin)  
  [Radxa CM3 IO SPI Image](https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/radxa-cm3-io-spi-image-g8684d740b9f.img.gz)

## 步骤

1. 把 CM3 安装到 IO 板上，如下图所示：

![CM3 on CM3 IO Board](/img/cm3/cm3-with-io.webp)

2. 将 CM3 启动至 Maskrom 模式

   - 将产品断电
   - 移除如 microSD 卡的启动介质
   - 按住 SPI Flash 和 eMMC 短接键

     ![CM3 Button](/img/cm3/cm3-button.webp)

   - 给 CM3 IO 板上电
   - 松开 SPI Flash 和 eMMC 短接键
   - 将 USB-A 转 MicroUSB 连接线插入 Radxa CM3 IO OTG 端口（Micro USB 端口），另一端插入电脑
   - 检查 USB 设备

   <Tabs groupId="os" queryString>
    <TabItem value="windows" label="Windows">

   打开 RKDevTool，如果 Maskrom 设备正常连接，你会看到 **发现一个 Maskrom 设备** 的提示。

   ![RKDevTool zh maskrom](/img/configuration/rkdevtool-zh-maskrom.webp)

    </TabItem>
    <TabItem value="linux_mac" label="Linux/MacOS">

   使用命令行来查看：

   ```bash
   lsusb
   Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company # 类似于此的输出
   ```

    </TabItem>
   </Tabs>

3. 将 U-Boot 映像写入 SPI Nor Flash 或擦除 SPI Nor Flash

   <Tabs groupId="os" queryString>
    <TabItem value="windows" label="Windows PC">
    <Tabs groupId="operation" queryString>
    <TabItem value="write" label="将 U-Boot 写入 SPI">

   1.打开 RKDevTool

   2.使用以下配置：

   ![Write SPINOR](/img/configuration/rkdevtool-zh-spinor.webp)

   3.运行

   最后，点击`执行`按钮，您将看到右侧的输出。当 RKDevTool 显示 "下载完成" 时，下载任务就完成了。

   ![SPINOR Compeled](/img/configuration/rkdevtool-spi-complete-zh.webp)

    </TabItem>
    <TabItem value="erase" label="擦除 SPI Nor Flash">

   打开 RKDevTool 并点击`高级功能`来进入高级功能窗口。  
    整个过程如下图所示：

   ![Progress](/img/configuration/rkdevtool-erase-spi-zh.webp)

   1.确认设备已进入 Maskrom 模式

   2.下载 RK356X Loader  
    选择 loader 文件并点击`下载`来下载。

   ![Download loader](/img/configuration/rkdevtool-download-loader-zh.webp)

   3.擦除设备  
    点击`擦除所有`按钮来擦除设备。

   ![Erase spi](/img/configuration/rkdevtool-erase-device-zh.webp)

   4.重启设备
   点击`重启设备`按钮来重启设备。

   ![Reset device](/img/configuration/rkdevtool-reset-device-zh.webp)

    </TabItem>
    </Tabs>
    </TabItem>
    <TabItem value="linux_mac" label="Linux/MacOS PC">
    <Tabs groupId="operation" queryString>
    <TabItem value="write" label="将 U-Boot 写入 SPI">

   打开终端并执行 rkdeveloptool：

   ```bash
   rkdeveloptool ld
   DevNo=1	Vid=0x2207,Pid=0x350a,LocationID=104	Maskrom
   ```

   下载 loader 来初始化 RAM 并准备烧写环境等：

   ```bash
   rkdeveloptool db rk356x_spl_loader_ddr1056_v1.10.111.bin
   ```

   写入 bootloader：

   ```bash
   rkdeveloptool wl 0 spi_image.img
   ```

   重启设备：

   ```bash
   rkdeveloptool rd
   ```

   现在你的设备就可以从 SPI Nor Flash 来启动系统了。

    </TabItem>
    <TabItem value="erase" label="擦除 SPI Nor Flash">

   请注意，要擦除 SPI Nor Flash 时，请执行以下命令：

   ```bash
   rkdeveloptool db rk356x_spl_loader_ddr1056_v1.10.111.bin
   rkdeveloptool ef
   rkdeveloptool rd
   ```

    </TabItem>
    </Tabs>
    </TabItem>
   </Tabs>
