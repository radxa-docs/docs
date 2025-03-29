---
sidebar_position: 5
---

# 操作系统安装

## 先决条件

- 一张 microSD 卡（最小 8GB，建议 16GB 或更大）
- 一台配备 microSD 卡读卡器的电脑
- 网络连接，用于下载必要的软件

## 安装 Raspberry Pi OS

### 步骤 1：下载并安装 Raspberry Pi Imager

1. 访问树莓派官方网站 [https://www.raspberrypi.com/software/](https://www.raspberrypi.com/software/)
2. 下载适用于您电脑操作系统（Windows、macOS 或 Linux）的 Raspberry Pi Imager 应用程序
3. 按照屏幕上的说明安装应用程序
4. 将 microSD 卡插入电脑的读卡器

### 步骤 2：将操作系统写入 microSD 卡

1. 启动 Raspberry Pi Imager 应用程序

   ![打开 Raspberry Pi Imager](/img/accessories/dual-2.5-router-hat/rpi-install-os-1.webp)

2. 点击“选择设备”并从列表中选择“Raspberry Pi 5”

   ![选择 Raspberry Pi 5 设备](/img/accessories/dual-2.5-router-hat/rpi-install-os-2.webp)

3. 点击“选择操作系统”并从推荐选项中选择“Raspberry Pi OS (64-bit)”

   > **注意：**建议使用 64 位版本，以获得与 Dual 2.5G Router HAT 的最佳性能

   ![选择 Raspberry Pi OS (64-bit)](/img/accessories/dual-2.5-router-hat/rpi-install-os-3.webp)

4. 点击“选择存储”并从列表中选择您的 microSD 卡

   > **警告：**请仔细选择正确的存储设备，因为所选设备上的所有数据将被擦除

   ![选择存储设备](/img/accessories/dual-2.5-router-hat/rpi-install-os-4.webp)

5. 点击齿轮图标 (⚙️) 访问高级选项

   ![访问高级设置](/img/accessories/dual-2.5-router-hat/rpi-install-os-5.webp)

6. 配置用户设置：

   - 为您的树莓派设置主机名（可选）
   - 创建用户名和密码
   - 配置您的 WiFi 网络（如需要）

   ![配置用户设置](/img/accessories/dual-2.5-router-hat/rpi-install-os-6.webp)

7. 启用 SSH 访问（强烈建议用于无头设置）：

   - 勾选“启用 SSH”
   - 选择“使用密码认证”

   ![启用 SSH 访问](/img/accessories/dual-2.5-router-hat/rpi-install-os-7.webp)

8. 点击“保存”确认您的设置，然后点击“写入”开始安装过程

   ![开始写入过程](/img/accessories/dual-2.5-router-hat/rpi-install-os-8.webp)

9. 等待过程完成。完成后，您将看到确认消息

   ![安装完成](/img/accessories/dual-2.5-router-hat/rpi-install-os-9.webp)

## 后续步骤

成功将操作系统写入 microSD 卡后：

1. 安全地从电脑中弹出 microSD 卡
2. 将 microSD 卡插入树莓派 5 的 microSD 卡插槽
3. 连接必要的外设（键盘、鼠标、显示器），如果不使用 SSH
4. 连接电源启动您的树莓派 5

## 为 Dual 2.5G Router HAT 配置系统

使用新安装的操作系统启动树莓派 5 后，您需要确保系统识别并正确配置 Dual 2.5G Router HAT。请转到[开始使用](/accessories/dual-2.5-router-hat/dual-2.5-router-for-rpi5/start-use)部分，获取有关配置网络接口和测试设置的详细说明。
