---
sidebar_position: 36
---

# Maskrom 模式

ROCK 5 支持 Maskrom 模式，这是 CPU 通过 USB OTG 端口接收命令的一种特殊操作模式。
我们用来与 ROCK 5 在 Maskrom 模式下进行通信的PC工具是 rkdeveloptool 和 RKDevTool。
在 Linux/MacOS 下使用rkdeveloptool，在 Windows 下使用RKDevTool。

# 准备工作

- ROCK 5A
- USB-A 转 USB-A 线缆
- eMMC 模块
- 电源适配器以及电源线
- 系统镜像

# 步骤

- **在 Windows 下安装工具以及 RK 驱动：**  
  [RKDevTool V2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar)  
  [DriverAssistant V5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

- 把板子启动到 Maskrom 模式：  
  ROCK 5A 进入 maskrom 模式的步骤：

1. 拔掉板子的电源。
2. 将 eMMC 或其他存储介质取下。
3. 把 USB-A 转 USB-A 线一端插入 ROCK 5A **上方的** [USB 3.0端口](../getting-started/overview)(8号标注)， 另一端接入电脑 USB 3.0 端口。
4. 插电启动板子：  
   ![ROCK 5A power on](/img/rock5a/rock5a-OTG.webp)
5. 装上 eMMC 模块或其他安装介质。

另一种方法是在开机前把两个[maskrom针脚](../getting-started/overview)(23号标注)短接，这种方式不需要把eMMC模块和其他存储器拿下来。

-打开 RKdevtool:  
这是没检测到 Maskrom 设备的界面：  
![no device](/img/rock5a/no-device.webp)

这是检测到 Maskrom 设备的界面：  
![on maskrom](/img/rock5a/on-maskrom.webp)

- 选择引导文件和系统镜像：  
  鼠标左键点击最右边空格以选择文件：  
  ![Choose files](/img/rock5a/choose-files.webp)

ROCK 5A 的 SPI 加载文件可以在此下载： **[RK3588 loader](https://dl.radxa.com/rock5/sw/images/loader/rock-5b/rk3588_spl_loader_v1.08.111.bin)**  
系统镜像可在[官方系统镜像页面](../../official-images)下载。  
**提示： RKDevTool 使用的镜像是在下载后解压产生的镜像文件。**

- 选择设备并烧写( run 键):  
  注意:

1. 选择正在使用的存储介质
2. 选择所需的设备
3. 勾选此项  
   ![Attention Point](/img/rock5a/attention-point.webp)

- 等待刷写完成：  
  刷写进度显示在右边，完成后它会提示你：  
  ![Flash completion](/img/rock5a/completion.webp)
