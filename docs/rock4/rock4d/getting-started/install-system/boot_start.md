---
sidebar_position: 4
---

# 下载并烧录 SPI 启动固件文件

您可以将 SPI 启动固件文件想象成您个人电脑中的 **BIOS/UEFI**。正如 PC 的 BIOS/UEFI 负责在 Windows 或 Linux 等操作系统启动前初始化基本硬件（如内存、硬盘、键盘等）一样，嵌入式设备上的 SPI 启动固件也承担着类似的角色。

SPI 启动固件的核心任务是**初始化关键硬件**，例如：

- **DDR 内存**：为主系统运行准备好内存空间。
- **时钟频率**：设置芯片各部分的工作速度。
- **存储控制器**：让系统能够访问 Micro SD 卡、UFS 模块或 M.2 NVMe SSD 等存储设备。
- **GPIO (通用输入输出引脚)**：配置引脚功能，用于连接各种外设。

完成这些初始化后，SPI 启动固件就从 eMMC / SD卡 / NVMe SSD / U 盘 加载操作系统内核。这个 SPI 启动固件文件通常存储在主板上的一个特殊存储芯片中，称为 **SPI Nor Flash**，这块芯片的角色也类似于 PC 主板上存储 BIOS/UEFI 的那块芯片。

## 1. 何时需要烧录 SPI 启动固件？

ROCK 4D 出厂时已预装适配的 SPI 启动固件。**如果您的设备工作正常，或未执行过擦除 SPI Nor Flash 的操作，通常无需进行此步骤。**

仅在以下情况下需要重新烧录 SPI 启动固件：

- **SPI Flash 内容损坏**：类似于个人电脑 BIOS 损坏导致无法启动
- **需要升级固件版本**：获取新功能支持或修复已知问题
- **特定开发需求**：例如从空白 SPI Flash 开始，或需要引导非官方支持的系统
- **学习探索目的**：深入了解设备的底层启动机制

本教程将指导您完成 SPI 启动固件的烧录过程，这是在常规安装系统的基础上增加的初始引导程序写入步骤。

## 2. 更新系统

你需要让 Radxa ROCK 4D 通过 MicroSD 卡启动系统，可以参考 [快速上手](../quickly_start) 教程完成。

成功启动系统并且确保系统连接网络正常，我们可以打开 Radxa ROCK 4D 终端命令行，使用 Rsetup 工具来更新系统。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo rsetup
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
Rsetup 首页界面
<img src="/img/rock4/4d/rsetup-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
rsetup 工具使用指南：详细使用教程参考 [Rsetup 工具](../../system-config/rsetup)

- 选中选项 ： 对应选项会高亮显示
- 确认选择 ： 按 `Enter`
- 取消选择 ： 按 `ESC`
- 切换选项 ： 按 `Up` 、 `Down` 、 `Left` 、 `Right` 控制
- 多选界面 ： 按 `Space` 选择，按 `Enter` 确认选择
  :::

进入 Rsetup 工具后，选择 `System` → `System Update`:

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择 yes 继续操作，然后按照系统提示完成剩下操作：

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

完成后所有操作后，使用命令重启系统。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo reboot
```
</NewCodeBlock>

## 3. 烧录 SPI 启动固件

重启系统后，再次打开 Rsetup 工具。

选择 `System` → `Bootloader Management` → `Update SPI Bootloader` :

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择 yes 继续操作，然后按照系统提示完成剩下操作。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择安装的 Bootloader 文件:若选择的 Bootloader 有多个选项，优先选择带有 spi 后缀的选项。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

系统会自动下载最新的 `spi.img` 然后烧录到 SPI Nor Flash 中。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

完成后所有操作后，使用命令重启系统。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo reboot
```
</NewCodeBlock>
