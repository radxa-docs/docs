---
sidebar_position: 5
---

# Windows on ARM

:::warning 重要提示

- 当前系统缺失无线网卡驱动，需通过有线网络或其他方式联网安装后续更新；
- 安装过程中可能需要多次重启，请确保电源稳定，避免在关键步骤中断电；
- 安装和驱动部署前请备份重要数据。
- 不建议使用 SD 存储，请使用 UFS 或 NVMe 存储。
  :::

## 功能概览（简要）

在未安装专用驱动之前，Dragon Q6A 可以正常从通用 Windows ARM64 安装镜像启动，基础可用功能包括：

- HDMI 输出（依赖 UEFI GOP）；
- PCIe（可使用 NVMe 作为存储；出厂镜像中可能不包含网卡驱动）；
- eMMC、UFS 存储；
- USB2、USB3（部分情况下需要在开机前接好设备）。

安装官方驱动后，可以进一步获得：

- 硬件视频编解码加速（最高支持 4K@60fps 10-bit 解码等，通过 D3D11VA / MediaFoundation 等接口）；
- GPU 功能（Direct3D 12、OpenCL 3.0、Vulkan 1.3、OpenGL 4.1 等能力，需要在 Microsoft Store 安装对应兼容包）；
- MIPI CSI 摄像头（Qualcomm Spectra 570L ISP，可 4K@30fps 10-bit 录像）；
- 40-Pin GPIO 等扩展能力[示例](https://github.com/strongtz/radxa-wos-gpio-demo/releases/tag/v1)。

## 使用前提

在开始安装 Windows on ARM 之前，请确认：

- 已经准备好一块 Radxa Dragon Q6A 开发板，以及合适的电源适配器；
- 有 HDMI 显示器、USB 键盘和鼠标；
- 有一台运行 Windows 的主机电脑，用于制作 Windows 安装 U 盘；
- Dragon Q6A 已刷入支持 Windows 启动的 UEFI 固件（参考[spi-fw](../low-level-dev/spi-fw.md)）。

## 准备 Windows 安装 U 盘

安装 Windows 推荐使用标准的 Windows 安装流程：先在 PC 上制作 Windows ARM64 安装 U 盘，然后在 Q6A 上从 U 盘启动安装程序。

### 下载 Windows ARM64 ISO 镜像

你需要获取一份 Windows 11 ARM64 的 ISO 镜像，推荐来源包括：

- [Microsoft 官方网站](https://www.microsoft.com/en-us/software-download/windows11)
  ![select windows on arm](/img/dragon/q6a/windows-download1.webp)
- [UUP dump](https://uupdump.net/)

建议，可以选择 Windows 11 24H2 或更新版本，以获得更好的应用兼容性（Prism 模拟器、AVX/AVX2 支持等）。

:::tip
因为 ISO 镜像文件较大，请务必选择合适的下载源，在下载完成后需要使用 MD5 或 SHA256 等校验和工具验证文件完整性。
:::

### 使用 Rufus 制作安装 U 盘

1. 准备一个容量不少于 16 GB 的 USB U 盘（U 盘内数据会被清空）；
2. 从 https://rufus.ie/ 下载最新版本的 Rufus，并在 Windows 主机上运行；
3. 在 Rufus 中选择：
   - 设备：选择你的 U 盘；
   - 启动选项：选择刚才下载的 Windows ARM64 ISO 镜像；
   - 分区类型、目标系统等保持默认（一般为 GPT + UEFI）；
   - 按照下图配置选项
     ![rufus](/img/dragon/q6a/windows-image-flash.webp)
4. 点击“开始”，按照提示完成写入过程；
5. 写入完成后，从主机安全移除 U 盘。

## 从 U 盘启动安装程序

1. 将制作好的 Windows 安装 U 盘插入 Dragon Q6A 的任意 USB 接口；
2. 接好 HDMI 显示器、键盘和鼠标，给开发板上电；
3. 当启动画面出现时，按下 **F12** 键进入启动菜单（Boot Menu）；
4. 在启动菜单中选择对应的 USB 启动项（例如“UEFI: USB ...”），回车确认；
5. 系统会从 U 盘启动标准的 Windows 安装程序，之后可以按常规 Windows 安装流程进行：
   - 选择语言、时间和键盘布局；
   - 选择“自定义安装”，选中目标磁盘（NVMe/UFS/eMMC 等）；
   - 删除、创建分区（如有需要），然后选择目标分区进行安装；
   - 等待复制文件与多次重启完成。

安装完成并进入桌面后，**建议先在“设置”中关闭自动睡眠**，因为在未安装驱动的情况下，设备可能无法从睡眠状态正常唤醒。

## 安装驱动程序

Windows 安装完成后，系统仍然缺少诸如网络、GPU、音频等专用驱动，需要安装 Radxa 提供的 Dragon Q6A Windows 驱动包。

### 准备驱动包

1. 在另一台电脑上从 Radxa 官方渠道下载 **Dragon Q6A Windows 驱动包** [下载链接](https://node0.momosan.cc/mirror/share/dragon-q6a/Q6A_WoS_DriverPackage_251205_testsigned.7z)；
2. 将驱动包解压后，通过 U 盘或网络（如有）拷贝到 Q6A 上的 Windows 系统中；
3. 假设解压后目录中包含如下关键文件：
   - `1-testsigning.bat`
   - `radxa_wos_test_cert.reg`
   - `2-DriverSetInst.bat`
   - 以及各类 `.inf`、驱动文件等。

### 启用测试签名并导入证书

1. 在解压目录中找到 `1-testsigning.bat`；
2. 右键该文件，选择“**以管理员身份运行**”，按照命令提示完成操作；
3. 双击 `radxa_wos_test_cert.reg`，同意导入注册表，以安装测试签名证书；
4. 完成后，重启系统。

> 启用测试签名模式并导入证书是为了允许安装 Radxa 提供的测试签名驱动，否则驱动可能会被系统阻止。

### 安装驱动集合

1. 重启后，再次进入桌面，回到驱动包解压目录；
2. 右键 `2-DriverSetInst.bat`，选择“**以管理员身份运行**”；
3. 等待脚本自动安装所有相关驱动（过程中可能会出现命令行窗口与多次设备刷新）；
4. 安装完成后，再次重启系统。

此时，大部分硬件（包括网络、GPU、多媒体、音频等）应可在 Windows 中正常工作。

## 后续建议

- 通过 Windows Update 检查并安装最新系统更新；
- 从 Microsoft Store 安装 OpenCL、OpenGL、Vulkan 相关兼容包，以获得更完整的 GPU 能力；
- 根据需要安装常用开发工具和应用（推荐优先使用原生 ARM64 或 x64 版本应用）。
