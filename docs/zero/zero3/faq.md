---
sidebar_position: 60
---

# FAQ

## Q1： 联系社区

请参考 https://docs.radxa.com/welcome

## Q2： Radxa ZERO 3 无法从 microSD 卡启动

如果您的 Radxa ZERO 3 无法从 microSD 卡启动，请按照以下步骤排查：

### 检查电源
- 确保使用 **5V** 电源适配器
- 推荐使用 [Radxa Power PD30W](accessories/pd-30w)
- 检查 Type-C 线缆是否正常工作
- 确保电源接口连接正确（USB 2.0 OTG Type-C 端口）

### 检查 microSD 卡
1. **卡质量**：使用高质量、品牌可靠的 microSD 卡
2. **容量**：确保卡容量 ≥8GB
3. **烧录工具**：使用推荐的烧录工具（如 balenaEtcher）
4. **镜像完整性**：重新下载镜像并验证哈希值
5. **烧录过程**：确保烧录过程完整完成，没有中断

### 启动指示灯
- 正常启动时，电源指示灯应常亮
- 如果指示灯闪烁或不亮，可能是电源问题

### 串口调试
如果以上步骤都正常，可以通过串口连接查看启动日志：
1. 连接 UART 转 USB 适配器到调试串口
2. 使用串口工具（如 minicom、screen）查看输出
3. 观察启动过程中的错误信息

## Q3： Radxa ZERO 3 支持哪些存储设备启动？

Radxa ZERO 3 支持从以下设备启动：
- **microSD 卡**（主要启动方式）
- **eMMC**（需要额外模块）
- **USB 存储设备**（通过 USB 启动）

## Q4： 如何安装操作系统到 eMMC？

请参考 [安装操作系统到 eMMC](../low-level-dev/install-os-on-emmc) 指南。

## Q5： Radxa ZERO 3 的供电要求是什么？

Radxa ZERO 3 **只支持 5V 供电**：
- **输入电压**：5V DC
- **推荐功率**：≥15W（用于稳定运行）
- **接口**：USB 2.0 OTG Type-C 端口

:::warning 重要提示
请勿使用高于 5V 的电源适配器，这可能会损坏设备。
:::

## Q6： 如何通过串口调试 Radxa ZERO 3？

1. **连接串口**：
   - 使用 UART 转 USB 适配器
   - 连接 GND、TX、RX 引脚
   - 波特率：1500000

2. **查看启动日志**：
   - 连接串口后上电
   - 在串口终端中查看启动过程

3. **常见串口工具**：
   ```bash
   # Linux/macOS
   screen /dev/ttyUSB0 1500000
   
   # Windows
   # 使用 PuTTY 或 Tera Term
   ```

## Q7： Radxa ZERO 3 的默认登录凭证是什么？

对于 Radxa OS 镜像：
- **用户名**：`radxa`
- **密码**：`radxa`

对于 Debian/Ubuntu 镜像：
- **用户名**：`root`
- **密码**：`radxa`

## Q8： 如何更新系统软件包？

```bash
# 更新软件包列表
sudo apt update

# 升级已安装的软件包
sudo apt upgrade

# 清理不再需要的包
sudo apt autoremove
```

## Q9： Radxa ZERO 3 支持 Wi-Fi 和蓝牙吗？

是的，Radxa ZERO 3 支持 Wi-Fi 和蓝牙：
- **Wi-Fi**：支持 2.4GHz 和 5GHz 频段
- **蓝牙**：支持 Bluetooth 5.0

如果遇到连接问题：
1. 检查天线是否连接（如有）
2. 确保驱动已正确加载
3. 检查网络配置

## Q10： 如何检查硬件信息？

```bash
# 查看 CPU 信息
cat /proc/cpuinfo

# 查看内存信息
free -h

# 查看存储设备
lsblk

# 查看网络接口
ip addr

# 查看系统版本
cat /etc/os-release
```

## Q11： 遇到其他问题怎么办？

1. **查看官方文档**：https://docs.radxa.com/zero/zero3
2. **访问社区论坛**：获取社区支持
3. **联系技术支持**：通过官方渠道提交问题

:::tip
在寻求帮助时，请提供以下信息：
- 使用的镜像版本
- 硬件配置
- 错误日志或截图
- 已尝试的解决步骤
:::