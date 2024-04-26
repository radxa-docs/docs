---
sidebar_position: 1
sidebar_class_name: hidden
---

# 安装系统到 EMMC

## 准备工作

- ROCK 5C 主板
- eMMC module
- 1x USB 线 （USB A接口）
- 5V电源适配器 (推荐使用 [Radxa Power PD30W](../accessories/pd-30w))

## 镜像下载

请到 [资源下载汇总](../download) 下载对应的镜像文件

## 进入 Maskrom 模式

- 使用杜邦线短接 **Maskrom key**
- 将 USB A-A 电缆插入 ROCK 5C 的双层USB3.0端口的顶层口，另一端插入电脑。
- 确认 ROCK 5C 处于 Maskrom 模式。

```bash
# MacOS 端:
执行 lsusb 后的结果
Output:Bus 000 Device 004: ID 2207:350b Fuzhou Rockchip Electronics Co., Ltd. Composite Device

# Linux 端:
执行 lsusb 后的结果
Output:Bus 001 Device 030: ID 2207:350b Fuzhou Rockchip Electronics Company

# Windows 端:
打开 RKDevTool，就会看到设备处于 Found One MASKROM Device（找到一个 MASKROM 设备）状态。
```

## 安装系统到 eMMC

[Windows 环境下安装](../low-level-dev/rkdevtool)

[Linux 环境下安装](../low-level-dev/rkdeveloptool)

## 启动系统

给开发板上电，然后系统开始启动，蓝色状态灯闪烁。

## 常见问题

Q:无法进入Maskrom模式<br/>
确认是否正确短接，是否错误短接成 `recovery key` 了。

Q:安装失败<br/>
确认是否有安装好 emmc。
