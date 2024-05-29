---
sidebar_position: 20
---

# 烧录 BootLoader 到 SPI Nor Flash

SPI Nor Flash 存储 bootloader 文件，像 idbloader.img 和 u-boot.itb。
而 PCIe NVME SSD 存储所有 system img。

## 介绍

ROCK 5B 上有一个 SPI Flash（SPI 闪存）,在 ROCK 5A 上则为与 eMMC 模块复用 B2B 插槽的 SPI Flash 模块，它包含用于备份引导的bootloader，并支持引导其他介质（比如 NVMe、SATA、USB 3），并支持引导其他 SoC 本身不支持启动的介质。

以下介绍两个烧录 SPI 的方式

1. 初级方法：通过 ROCK 5B 自身烧录 SPI
2. 高级方法：通过主机和 Maskrom 模式烧录 SPI（**目前 ROCK 5A 只能通过这种方式烧录 SPI 模块**）

<Tabs queryString="method">
<TabItem value="basic" label="初级方法" default>

## 初级方法

### 准备

    - ROCK 5B
    - 良好的电源适配器
    - 用于 ROCK 5B 的 Linux 镜像，不支持 Android 镜像
    - Micro SD 卡 或 eMMC 模块

### 步骤

1. 从SD card 或 eMMC 启动 Linux 系统

   详细教程请看入门使用教程中的[烧录方式选择](../rock5b/getting-started/)

2. 在 ROCK 5B 上下载必要的文件

   你可以通过 wget 下载到 ROCK 5B ,前提是 ROCK 5B 连接网络。

   - 下载 clear the spi 文件

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/others/zero.img.gz
   ```

   - 下载最新版本 spi bootloader
     推荐除 Armbian 用户之外的用户使用通用版本，注意这个 img 已经关闭 u-boot 串行控制台

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rock-5b-spi-image-g49da44e116d.img
   ```

   如果您想从 M.2 NVME SSD 启动 armbian ，请使用此选项

   ```bash
   wget https://github.com/huazi-yg/rock5b/releases/download/rock5b/rkspi_loader.img
   ```

   针对高级用户的 bootloader ，已启动 u-boot 串行控制台。

   ```bash
   wget https://dl.radxa.com/rock5/sw/images/loader/rock-5b/debug/rock-5b-spi-image-g3caf61a44c2-debug.img
   ```

3. 检查下载文件的完整性：

   ```bash
   md5sum zero.img.gz
   ```

   正确显示如下：

   ```bash
   ac581b250fda7a10d07ad11884a16834  zero.img.gz
   ```

4. 解压缩之前下载的 clear the spi 文件

   ```bash
   gzip -d zero.img.gz
   md5sum zero.img
   ```

   正确显示如下：

   ```bash
   2c7ab85a893283e98c931e9511add182  zero.img
   ```

5. 检查你想要的 bootloader image

   ```bash
   md5sum rock-5b-spi-image-g49da44e116d.img
   ```

   显示正确结果如下：

   ```bash
   46de85de37b8e670883e6f6a8bb95776  rock-5b-spi-image-g49da44e116d.img
   958cbdb6cf9b2e0841fd76c26930db8f  rock-5b-spi-image-g3caf61a44c2-debug.img
   1b83982a5979008b4407552152732156  rkspi_loader.img
   ```

6. 烧录 SPI Flash

   - 确保 SPI Flash 是可以使用的

   ```bash
   ls /dev/mtdblock*
   # 返回
   /dev/mtdblock0
   ```

   - 清理 SPI Flash ，这过程需要5分钟以上。

   ```bash
   sudo dd if=zero.img of=/dev/mtdblock0
   ```

   - 检查是否被清除成功

   ```bash
   sudo md5sum /dev/mtdblock0 zero.img
   # 正确返回
   2c7ab85a893283e98c931e9511add182  /dev/mtdblock0
   2c7ab85a893283e98c931e9511add182  zero.img
   ```

   - 烧录你下载的 bootloader 到 SPI Flash，例如 rock-5b-spi-image-g49da44e116d.img

   ```bash
   sudo dd if=rock-5b-spi-image-g49da44e116d.img of=/dev/mtdblock0
   sync
   # 检查是否成功烧录
   sudo md5sum /dev/mtdblock0 rock-5b-spi-image-g49da44e116d.img
   ```

   返回的结果是相同的才是正确的。如果不是，请重新烧录一遍 bootloader。

7. 重启生效

现在，您已经完成了烧录支持 NVMe 引导的引导加载程序。

- 如果您没有在 NVMe SSD 烧录系统，请查看[安装镜像到 NVMe](../rock5a/getting-started/install-os) 以进行烧录。
- 如果您已经在 NVMe SSD 烧录了系统，请关闭 ROCK 5B 的电源，取出 µSD 卡或 eMMC 模块并重新通电。现在应该从 NVMe 启动

</TabItem>
<TabItem value="advanced" label="高级方法">

## 高级方法

### 准备

- ROCK 5B/ROCK 5A
- 良好的电源适配器
- Linux 镜像，不支持 Android
- Micro SD 卡或 eMMC 模块
- USB Type C 线材
- 主机 PC（Windows/linux/macOS）

### 步骤

1. 安装驱动和工具

- 请查看工具教程，在 Windows/Linux/MacOS PC 上安装 RockChip Flash tools。
- 我们将 ROCK 5B/ROCK 5A 设置为 Maskrom 模式，通过 Linux/macOS 上的rkdevelopool 和 Windows PC 上的 RkDevtool，与 RockChip 工具通信。

2. 获取 RK3588 loader 和 U-boot images

- 下载 [loader images](https://dl.radxa.com/rock5/sw/images/loader/rk3588_spl_loader_v1.15.113.bin)
- 下载最新 SPI 镜像

  - [正式版本](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/release/rock-5b-spi-image-g49da44e116d.img)，u-boot 串口控制台关闭
  - [Debug版本](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/debug/rock-5b-spi-image-g3caf61a44c2-debug.img)，u-boot 串口控制台启动
  - [Armbian版本](https://github.com/huazi-yg/rock5b/releases/download/rock5b/rkspi_loader.img)，需要安装 armbian Image 到 M.2 NVME SSD 时使用
  - [ROCK 5A 版本](https://dl.radxa.com/rock5/sw/images/loader/rock-5a/rock-5a-spi-image-g4b32117-20230605.img)，用于ROCK 5A。

3. ROCK 5B 进入 Maskrom 模式

![rock5b-maskrom](/zh/img/rock5b/rock-5b-maskrom-01.webp)

- ROCK 5B 断开电源，关闭电路板。
- 移除可启动设备，如 Micro SD 卡、eMMC 模块等。
- 按下金色（或某些电路板版本上的银色）按钮并按住。如上图所示
- 将 USB-A 转 Type-C 线缆插入 ROCK 5B Type-C 端口，另一端连接 PC。
- 松开金色按钮，然后检查 USB 设备。

4. ROCK 5A 进入 Maskrom 模式

- 拔掉板子的电源。
- 将 eMMC 或其他存储介质取下。
- 把 USB-A 转 USB-A 线一端插入 ROCK 5A **上方的** [USB 3.0 端口](../rock5a/getting-started/overview)(8号标注)，另一端接入电脑 USB 3.0 端口。
- 插电启动板子：  
  ![ROCK 5A power on](/img/rock5a/rock5a_power.webp)
- 装上 SPI Flash 模块。

- 另一种方法是在开机前把两个 [maskrom 针脚](../rock5a/getting-started/overview)(23号标注)短接，这种方式不需要把 eMMC 模块和其他存储器拿下来。
- 然后检查 USB 设备。
- 对于 macOS 主机：`lsusb` 结果应该是： `... ID 2207:350b Fuzhou Rockchip Electronics Co., Ltd. Composite Device`
- 对于 Linux 主机：`lsusb` 结果应该是：`... ID 2207:350b Fuzhou Rockchip Electronics Company`
- 对于 Windows 主机：打开 RKDevTool，您会看到该设备处于**找到一个 MASKROM 设备**

5. 将 u-boot 镜像写入 SPI NOR flash 或擦除 SPI NOR flash

- 选择1. 使用 Linux PC/Mac 烧录
  在 linux 或 Mac 上，运行 rkdeveloptool

```bash
sudo rkdeveloptool ld
DevNo=1 Vid=0x2207,Pid=0x350b,LocationID=106 Maskrom
```

此命令操作：加载 loader 到 ROCK 5B/ROCK 5A 上运行并初始化内存并准备烧录环境等。

```bash
sudo rkdeveloptool db /path/to/rk3588_spl_loader_v1.15.113.bin
Downloading bootloader succeeded.
```

接下来，将 SPI images 从 PC/Mac 写入 SPI flash
使用步骤2下载的 images

```bash
sudo  rkdeveloptool wl 0 /path/to/spi-image.img
Write LBA from file (100%)
```

重启设备

```bash
rkdeveloptool rd
```

现在设备在 SPI Nor Flash 上启动, 蓝色指示灯亮起。

- 选择2. 使用 Windows PC 烧录

打开 RKDevTool.exe 会看到如下界面：

![RKDevTool-01](/zh/img/rock5b/rock-5b-spi-flash-01.webp)

第1步：确认 ROCK 5B/ROCK 5A 处于 maskrom 模式
如果你的 ROCK 5B 处于 maskrom 模式并连接 PC，你可以看到程序检测到它，如图圆圈2
Found One MASKROM Device

第2步：加载配置文件
在列表框中右击选择 Load Config，圆圈3，然后选择资源管理文件夹下的配置文件（配置文件和 RKDevTool 同目录）

![RKDevTool-02](/zh/img/rock5b/rock-5b-spi-flash-02.webp)

第3步：选择 loader
接下来，单击“Loader”行中右侧的最后一列以选择 rk3588_spl_loader_v1.15.113.bin。图中圆圈4

第4步：选择 SPI image
单击“spi”行中右侧的最后一列以选择 spi-image。

第5步：执行 Run
最后点击“执行”按钮，当进度达到100%时，下载完成。

![RKDevTool-03](/zh/img/rock5b/rock-5b-spi-flash-03.webp)

## 擦除 SPI Nor Flash

选择1：在 ROCK 5B 上操作

- 使用在 µSD 卡或 eMMC 模块上运行的 Linux 启动您的 ROCK 5B：
- 确保 SPI 闪存可用：

```bash
ls /dev/mtdblock*
# 输出以下内容
/dev/mtdblock0
```

- 执行以下命令即可

```bash
sudo dd if=/dev/zero of=/dev/mtdblock0
sync
```

选择2：在主机 Linux PC/Mac 上擦除

在擦除之前，请确保 ROCK 5B/ROCK 5A 进入 Maskrom 模式

- 打开 RKDevTool，选择 Advanced Function。
- 在 Boot 上选择 rk3588_spl_loader_v1.15.113.bin，然后点击下载按钮。
- 进度完成后，点击 EraseALL 按钮
- 结束后重启设备 ResetDevice

![RKDevTool-04](/zh/img/rock5b/rock-5b-spi-flash-04.webp)

</TabItem>
</Tabs>
