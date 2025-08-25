---
sidebar_position: 6
---

# 开始使用

## 系统设置

### 启动您的树莓派 5

1. 将安装好操作系统的 microSD 卡插入树莓派 5 的 microSD 卡插槽
2. 将[所需的电源](./power-supply)连接到瑞莎 Dual 2.5G Router HAT 上的 12V DC 插孔
3. 等待系统完全启动

### 连接到您的树莓派 5

您可以通过以下方式连接到您的树莓派 5：

#### 选项 1：SSH 连接（无头设置）

如果您在系统安装过程中启用了 SSH，您可以远程连接：

```bash
# 如果您在安装过程中更改了用户名，请替换 'pi'

ssh pi@raspberrypi.local
```

如果上述命令不起作用，您可能需要在网络上找到您的树莓派的 IP 地址并使用：

```bash
ssh pi@192.168.x.x  # 替换为您的树莓派的实际 IP 地址
```

#### 选项 2：直接连接

或者，您可以直接将显示器、键盘和鼠标连接到您的树莓派 5。

## 启用树莓派 5 上的 PCIe

树莓派 5 上的 PCIe 接口默认是禁用的。您需要启用它，以便 Dual 2.5G Router HAT 正常工作。

### 步骤 1：编辑配置文件

1. 使用文本编辑器打开配置文件：

```bash
sudo nano /boot/firmware/config.txt
```

2. 在文件末尾添加以下行：

```
dtparam=pciex1
```

3. 按 `Ctrl+O` 保存文件，然后按 `Ctrl+X` 退出

![编辑 config.txt 以启用 PCIe](/img/accessories/dual-2.5-router-hat/rpi-using-1.webp)

4. 重启您的树莓派 5：

```bash
sudo reboot
```

> **注意：**有关更多信息，请参阅[树莓派官方文档中关于 PCIe 连接器的部分](https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#raspberry-pi-connector-for-pcie)。

## 验证硬件检测

### 检查 PCIe 设备

重启后，验证 Dual 2.5G Router HAT 上的 PCIe 设备是否被正确检测：

```bash
sudo lspci
```

您应该能看到 Realtek RTL8125 以太网控制器和已安装的 NVMe SSD（如果有）的条目：

![lspci 命令检测到的 PCIe 设备](/img/accessories/dual-2.5-router-hat/rpi-using-2.webp)

### 检查 NVMe SSD

如果您安装了 NVMe SSD，请验证系统是否正确检测到它：

```bash
lsblk
```

此命令列出所有块设备。您的 NVMe SSD 应该显示为 `nvme0n1` 或类似名称：

![lsblk 命令检测到的 NVMe SSD](/img/accessories/dual-2.5-router-hat/rpi-using-3.webp)

#### NVMe SSD 性能测试

您可以使用以下命令对 NVMe SSD 进行简单的写入速度测试：

```bash
sudo dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=1000 status=progress oflag=direct
```

> **警告：**此命令直接写入原始磁盘设备。请确保您使用的是正确的设备名称，并且 SSD 不包含任何重要数据。

![NVMe SSD 速度测试结果](/img/accessories/dual-2.5-router-hat/rpi-using-4.webp)

### 优化 PCIe 性能（可选）

默认情况下，树莓派 5 可能使用 PCIe Gen 2。为了使 NVMe SSD 获得最大性能，您可以强制其使用 PCIe Gen 3：

1. 再次编辑配置文件：

```bash
sudo nano /boot/firmware/config.txt
```

2. 添加以下行：

```
dtparam=pciex1_gen=3
```

![编辑 config.txt 以启用 PCIe Gen 3](/img/accessories/dual-2.5-router-hat/rpi-using-5.webp)

3. 保存文件并重启：

```bash
sudo reboot
```

4. 重启后，验证 PCIe 链接状态：

```bash
sudo lspci
sudo lspci -vvv -s 0000:03:00.0 | grep LnkSta
```

寻找“Speed 8GT/s”，这表示 PCIe Gen 3：

![验证 PCIe Gen 3 状态](/img/accessories/dual-2.5-router-hat/rpi-using-6.webp)

5. 再次运行速度测试，查看改进的性能：

```bash
sudo dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=1000 status=progress oflag=direct
```

![使用 PCIe Gen 3 后改进的 NVMe SSD 速度](/img/accessories/dual-2.5-router-hat/rpi-using-7.webp)

### 检查网络接口

验证两个 2.5G 以太网端口是否被正确检测：

```bash
ip a
```

除了内置的以太网端口外，您应该还能看到额外的网络接口（通常是 `eth1` 和 `eth2`）：

![检测到的网络接口](/img/accessories/dual-2.5-router-hat/rpi-using-8.webp)

## 网络性能测试

### 测试以太网速度

要验证您的 2.5G 以太网端口是否以全速运行，您可以使用 `iperf3` 工具进行网络吞吐量测试。

#### 步骤 1：安装 iperf3

```bash
sudo apt-get update
sudo apt-get install iperf3
```

#### 步骤 2：设置测试环境

您需要网络上的另一台设备，该设备：

- 支持至少 2.5G 以太网
- 已安装 iperf3
- 连接到支持 2.5G 或更高速度的同一网络交换机

#### 步骤 3：运行 iperf3 服务器

在另一台设备上，以服务器模式启动 iperf3：

```bash
iperf3 -s
```

#### 步骤 4：运行 iperf3 客户端

在您的树莓派 5 上，以客户端模式运行 iperf3，连接到服务器：

```bash
iperf3 -c 192.168.1.100  # 替换为您的服务器的 IP 地址
```

如果所有配置正确，您应该能看到接近 2.5 Gbps 的吞吐量结果：

![网络速度测试结果](/img/accessories/dual-2.5-router-hat/rpi-using-9.webp)

## 配置网络接口

您可以通过编辑网络配置文件来永久配置网络接口：

```bash
sudo nano /etc/dhcpcd.conf
```

### 静态 IP 配置示例

添加以下行为您的网络接口分配静态 IP：

```
interface eth1
static ip_address=192.168.1.100/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1 8.8.8.8

interface eth2
static ip_address=192.168.2.100/24
```

保存文件并重启，使更改生效。

## 故障排除

### 常见问题

1. **PCIe 设备未被检测到**

   - 确保在 config.txt 中启用了 PCIe
   - 检查 FPC 连接线是否正确连接
   - 验证 12V 电源是否已连接

2. **网络接口不工作**

   - 检查网络线缆连接
   - 验证交换机/路由器是否支持 2.5G 速度
   - 尝试更新内核：`sudo apt update && sudo apt full-upgrade`

3. **NVMe SSD 未被检测到**
   - 确保 SSD 正确插入 M.2 插槽
   - 尝试使用不同的 SSD 排除兼容性问题
   - 检查内核日志：`dmesg | grep -i nvme`

## 后续步骤

现在您的瑞莎 Dual 2.5G Router HAT 已正确配置，您可以将其用于各种应用，例如：

- 设置高性能路由器或防火墙
- 创建网络附加存储 (NAS) 解决方案
- 构建具有快速网络连接的媒体服务器
- 开发需要高速网络的边缘计算应用
