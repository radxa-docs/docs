---
sidebar_position: 2
---

# 快速上手

## 包装清单

瑞莎星睿 O6 标准包装清单包括以下物品：

- 1x O6 主板
- 1x I/O 挡板
- 1x 散热器 （型号 8420B，预装）
- 1x 亚克力外壳（预装）
- 2x M.2 固定螺丝（预装）
- 1x 贴纸

收到 **瑞莎星睿 O6** 包装后，首先请先核对包装内容。

![包装清单](/img/o6/package_list_01.webp)

1. 打开包装盒，您会看到主板安全地放置在防静电包装袋中。小心取出主板，并将其放置在一个干净、无杂物的表面上。

2. 参考上面的详细包装清单，确认所有配件是否齐全。主板默认预装 **Heatsink 8420B** 散热器和 **瑞莎星睿 O6 亚克力外壳**。在检查时，请特别关注以下关键组件：

- **瑞莎 8420B 散热器**：确保其稳固固定在 SoC 上，散热鳍片排列整齐。检查散热风扇是否能顺畅旋转，无卡顿或异常噪音，并确认电源线完好无损。

- **亚克力外壳**：检查是否有可见的划痕或裂纹，确保边缘打磨光滑，以防刮伤。确认固定外壳和主板的螺丝及支架完好无损。

如果发现任何配件缺失、损坏或与包装清单不符，请立即联系销售商或瑞莎客服团队，以便及时解决问题。

## 额外所需物品

要正常使用 **瑞莎星睿 O6**，您需要以下物品：

- **USB PD 电源适配器**：建议使用 **65W USB-C PD（20V/3.25A）** 或 **USB-C DC（20V/3.25A）** 电源。

- **M.2 NVMe SSD**：

  - 支持的规格：**2230**、**2242**、**2260**、**2280**
  - 支持的接口：**PCIe Gen3** 或 **Gen4**（不支持 SATA M.2 SSD）。

- **USB 键盘和鼠标**：用于操作系统交互。
- **USB 设备**：用于操作系统安装。

  - 兼容 **USB 2.0/3.0**，支持 USB-A 或 USB-C 设备（建议使用 USB 3.0 以提高安装速度）。

- **显示器或电视**：必须支持 **HDMI**、**DP** 或 **USB-C 视频输入**。

**可选配件：**

- **M.2 无线模块**：用于 WiFi/蓝牙功能。

## 创建可启动 USB 设备

要创建可启动的 USB 设备，您需要使用另一台运行 **Windows、Linux 或 macOS** 的计算机（宿主机）。

### 1. **下载系统镜像**：

- 访问 [下载页面](../download.md#debian-12-预装版系统镜像)，下载 **Debian 12 预装版系统镜像**。

### 2. **下载烧录工具**：

- 使用 [Etcher](https://www.balena.io/etcher/) 等工具，将镜像写入 USB 设备。

### 3. **烧录系统镜像**：

- 将 USB 设备插入宿主机。
- 打开 Etcher，选择已下载的系统镜像，并将其写入 USB 设备。
- 烧录过程可能需要 **10 分钟或更长时间**，具体取决于 USB 设备和宿主机的速度。

# 拆卸顶盖

1. 使用十字螺丝刀拧下固定亚克力上盖的 **4 颗 CM3x5x5 螺丝**，操作时请施加温和、均匀的力，以避免损坏螺丝。

2. 小心拆下亚克力上盖，如下图所示：

![快速入门第一步](/img/o6/acrylic_shell_02.webp)

**注意**：

在拆装前，请务必确保主板处于断电状态。

# 安装 NVMe SSD

**瑞莎星睿 O6** 主板默认不包含 SSD，请按照以下步骤安装 M.2 NVMe SSD：

1. 找到主板上的 **M.2 M Key 插槽**，根据 SSD 的尺寸确认合适的铜柱安装位置。

![NVMe SSD 安装步骤 01](/img/o6/nvme_ssd_01.webp)

2. 牢固安装铜柱，为 SSD 提供稳定支撑。

3. 将 NVMe SSD 与 M.2 插槽对齐，确保方向正确，然后轻轻插入，避免损坏。

4. 使用 **CM2x2.5 螺丝** 固定 SSD。

![NVMe SSD 安装步骤 02](/img/o6/nvme_ssd_02.webp)

# 安装 WiFi 模块（可选）

如果需要 WiFi/蓝牙功能，可安装无线模块：

1. 找到主板上的 **M.2 E Key 插槽**，将无线模块（如 **瑞莎无线模块 A8**）对齐插槽，轻轻插入。

![安装瑞莎无线模块 A8 01](/img/o6/wireless_module_01.webp)

2. 使用 **CM2x4x5 螺丝** 固定无线模块。

# 连接外设

1. 将 USB 设备插入 **USB 3.2 端口** ⑫。

2. 将 USB 键盘和鼠标连接到 **USB 2.0 端口** ⑫。

3. 通过 **HDMI** ⑩ 或 **DP** ⑨ 连接显示器或电视。

![连接外设](/img/o6/connecting_peripherals_01.webp)

# 开机并安装操作系统至 NVMe SSD

1. 将 **USB Type-C 电源适配器** 插入任意 **USB-C 端口**。绿灯亮起后，蓝灯将亮起，风扇开始运转。

![USB Type-C 电源连接](/img/o6/typec_power_01.webp)

2. BIOS 界面将出现在显示器上。按下 **ESC** 键进入 **UEFI/BIOS 菜单**。

![BIOS 画面](/img/o6/os-install/os-install-bios-esc.webp)

![BIOS 菜单](/img/o6/os-install/os-install-bios-menu.webp)

3. 在 BIOS 菜单中：
   - 选择 **Boot Manager** 并按 **Enter**，然后从 **Boot Manager Menu** 中选择 USB 设备，界面如下：

![BIOS 启动设备](/img/o6/os-install/os-install-boot-device.webp)

4. 设备将从 USB 设备启动。此过程大约需要 **20 秒** 或更长时间，具体取决于 USB 设备的速度。在此期间，显示器可能会保持黑屏。

![Grub 菜单](/img/o6/os-install/os-install-grub.webp)

5. 成功引导 USB 设备后，Debian 桌面将出现在显示器上。

![Debian 桌面](/img/o6/os-install/os-install-desktop.webp)

6. 点击底部任务栏的 **应用程序菜单**，选择 **balenaEtcher**。

![选择 Etcher](/img/o6/os-install/os-install-select-ecther.webp)

7. 点击左侧 **Flash from file**，然后选择 **Home 文件夹** 中的镜像文件：

   - **orion-o6-debian12-preinstalled-desktop-b1.img**

![选择镜像文件](/img/o6/os-install/os-install-select-image.webp)

8. 点击 **Change**（更改）按钮，然后点击 **Show 1 Hidden**（显示 1 个隐藏设备）。取消勾选 **USB 设备**，选择 **系统盘（即 NVMe SSD）**。

![选择安装盘](/img/o6/os-install/os-install-select-drive.webp)

9. 点击 **Flash**，然后确认 **“Yes, I’m sure”** 开始写入镜像。

![确认擦除](/img/o6/os-install/os-install-erase-confirm.webp)

![开始写入](/img/o6/os-install/os-install-start-writing.webp)

![写入完成](/img/o6/os-install/os-install-write-finish.webp)

10. 镜像已成功安装至 NVMe SSD。现在可以关闭主板电源并移除 USB 设备。重新开机后，系统将从 NVMe SSD 启动。

![关机](/img/o6/os-install/os-install-power-off.webp)
