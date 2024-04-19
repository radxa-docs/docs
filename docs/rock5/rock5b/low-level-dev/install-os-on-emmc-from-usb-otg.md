---
sidebar_position: 21
---

# 安装系统到 EMMC

## 准备工作

- ROCK 5B 主板
- eMMC module
- 1x USB 线 （一端 USB C，一端 USB A）
- 1x 9V/2A 或者 12V/2A、15V/2A 和 20V/2A 的电源适配器 (推荐使用 [Radxa Power PD30W](../accessories/pd-30w))

## 镜像下载

请到 [资源下载汇总](/rock5/rock5b/getting-started/download.md) 下载对应的镜像文件

## 进入 Maskrom 模式

- 按住 **Maskrom 按钮 **
- 将 USB A-C 电缆插入 ROCK 5B 的 Type-C 端口，另一端插入电脑。
- 确认 ROCK 5B 处于 Maskrom 模式。

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

- 给开发板上电，然后系统开始启动，状态灯闪烁。

:::tip
ROCK 5B 支持 `5V/12V/20V` 供电。瑞莎推荐使用 [Radxa Power PD30W](../accessories/pd-30w)。
:::

## 登录系统

官方镜像默认有两个账号：

1. 用户名: radxa 密码: radxa

2. 用户名: rock 密码: rock

更多信息请参考 [RadxaOS](../radxa-os)

## 常见问题
