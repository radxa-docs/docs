---
sidebar_position: 10
---

# Penta SATA HAT 安装与使用指南

本文档提供 Radxa Penta SATA HAT 在 Rock 4A/B/SE 系列上的安装与使用指南。

## 准备工作

- **Radxa Penta SATA HAT 套件**：确保您拥有完整的 Penta SATA HAT 套件，包括：
  - Penta SATA HAT 主板
  - M.2 E key 转 M key 转接板
  - IPEX 线缆
  - 固定用铜柱（M2.5x18+6, M2.5x5, M2.5x5+5）
  - 螺丝

- **兼容性确认**：Penta SATA HAT 兼容以下 Rock 4 系列产品：
  - Rock 4A
  - Rock 4B
  - Rock 4SE
  - Rock 4A+
  - Rock 4B+

- **系统要求**：建议使用最新版本的 Radxa OS 或 Debian 11 Bookworm 及以上版本。

## 安装教程

### 步骤 1：准备 IPEX 线缆

请先区分 IPEX 线缆的正反面。如图所示，环扣需要卡入连接器中以确保固定。

![IPEX 线缆方向](/img/accessories/storage/m2-extension-board-04.webp)

### 步骤 2：安装转接板

1. 将 IPEX 线缆连接到 M.2 E key 转 M key 转接板上。
2. **注意**：IPEX 线缆正面朝上，环扣需要卡在接口上，确保固定。

![转接板安装](/img/accessories/storage/m2-extension-board-02.webp)

### 步骤 3：安装 Penta SATA HAT

1. 将 IPEX 线缆的另一端连接到 Penta SATA HAT 主板上。
2. 同样确保 IPEX 线缆正面朝上，环扣卡在接口上。

![Penta SATA HAT 连接](/img/rock5a/rock5a-penta-sata-hat-04.webp)

### 步骤 4：安装铜柱

1. 将产品附带的 M2.5x18+6 铜柱和 M2.5x5 铜柱安装在 Rock 4A/B/SE 上。
2. 参考下图所示的安装位置：

![铜柱安装位置](/img/rock5a/rock5a-m2-extension-board-04.webp)

### 步骤 5：连接转接板到 Rock 4

1. 将 M.2 E key 转 M key 转接板安装到 Rock 4 的 M.2 E key 接口上。
2. 确保连接牢固。

### 步骤 6：组装 Penta SATA HAT

1. 使用 M2.5x5+5 铜柱将 Penta SATA HAT 组装到 Rock 4 上。
2. 确保所有连接牢固，IPEX 线缆没有过度弯曲。

![完整组装示例](/img/rock5a/rock5a-penta-sata-hat-01.webp)
![侧面视图](/img/rock5a/rock5a-penta-sata-hat-02.webp)

## 检查 Penta SATA HAT 状态

### 硬件识别检查

1. 启动 Rock 4 系统。
2. 通过 `lsblk` 命令查看 SATA 设备是否被识别：

```bash
radxa@rock-4:~$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda            8:0    0 465.8G  0 disk
└─sda1         8:1    0 465.8G  0 part
sdb            8:16   0 465.8G  0 disk
└─sdb1         8:17   0 465.8G  0 part
sdc            8:32   0 465.8G  0 disk
└─sdc1         8:33   0 465.8G  0 part
sdd            8:48   0 465.8G  0 disk
└─sdd1         8:49   0 465.8G  0 part
mmcblk0      179:0    0  14.5G  0 disk
├─mmcblk0p1  179:1    0    16M  0 part /config
└─mmcblk0p2  179:2    0  14.4G  0 part /
```

3. 当系统识别到 Penta SATA HAT 时，您可以看到 SATA 设备（sda/sdb/sdc/sdd）。

### 内核日志检查

如果设备未被识别，检查内核日志：

```bash
sudo dmesg | grep -i sata
sudo dmesg | grep -i ahci
```

## 软件支持

### 安装 rockpi-penta 软件包（可选）

如果您使用的是带 OLED 显示屏和风扇的 Penta SATA HAT 顶板，需要安装 rockpi-penta 软件包：

```bash
sudo apt update
sudo apt install wget
wget https://github.com/radxa/rockpi-penta/releases/download/v0.2.2/rockpi-penta-0.2.2.deb
sudo apt install -y ./rockpi-penta-0.2.2.deb
```

### 软件配置

编辑 `/etc/rockpi-penta.conf` 配置文件：

```bash
sudo nano /etc/rockpi-penta.conf
```

重启服务使配置生效：

```bash
sudo systemctl restart rockpi-penta.service
```

### 默认配置参考

```text
[fan]
# 温度超过 lv0 (35°C) 时，风扇以 25% 功率运行
# lv1 时 50% 功率，lv2 时 75% 功率，lv3 时 100% 功率
# 温度低于 lv0 时，风扇关闭
lv0 = 35
lv1 = 40
lv2 = 45
lv3 = 50

[key]
# 自定义按键功能，当前可用功能：
# slider: OLED 显示下一页
# switch: 风扇开关
# reboot, poweroff
click = slider
twice = switch
press = none

[time]
# twice: 双击最大时间间隔（秒）
# press: 长按时间（秒）
twice = 0.7
press = 1.8

[slider]
# OLED 是否自动翻页及时间间隔（秒）
auto = true
time = 10

[oled]
# 是否旋转 OLED 文本 180 度，是否使用华氏温度
rotate = false
f-temp = false
```

## 故障排除

### 常见问题

1. **SATA 设备未被识别**
   - 检查 IPEX 线缆连接是否牢固
   - 检查内核是否加载了 AHCI/SATA 驱动
   - 运行 `sudo lspci | grep -i sata` 检查 PCIe 设备识别

2. **系统启动失败**
   - 检查铜柱是否短路
   - 移除 Penta SATA HAT 后系统是否能正常启动

3. **OLED 显示屏不工作**
   - 确认已安装 rockpi-penta 软件包
   - 检查 `/etc/rockpi-penta.conf` 配置
   - 检查服务状态：`sudo systemctl status rockpi-penta.service`

### Debian 11 Bookworm 特定说明

在 Debian 11 Bookworm 上，确保已安装必要的内核模块：

```bash
sudo apt update
sudo apt install linux-image-$(uname -r) linux-headers-$(uname -r)
```

## 相关文档

- [瑞莎 Penta SATA HAT 主文档](/accessories/storage/penta-sata-hat)
- [使用 mdadm 创建 RAID 阵列](/accessories/storage/penta-sata-hat/raid-with-mdadm)
- [Penta SATA HAT TOP 板使用指南](/accessories/storage/penta-sata-hat/sata-hat-top-board)

---

**注意**：本文档基于实际技术支持案例创建，客户反馈需要针对 RockPi 4B 运行 Debian 11 Bookworm 的详细安装指南。如果您在使用过程中遇到问题，请参考故障排除部分或联系技术支持。