---
sidebar_position: 1
---

# 安装系统到 EMMC

## 准备工作

- Radxa ROCK 3A 主板
- eMMC module
- 1x USB 线 （一端 USB C，一端 USB A）
- 1x 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../accessories/power/pd_30w))

## 镜像下载

请到 [资源下载汇总](../getting-started/download) 下载对应的镜像文件

## 进入 Maskrom 模式

- 断开开发板电源
- 移除 SD 卡，并插入 eMMC 模块
- 用 USB A-A 连接 Radxa ROCK 3A 的 USB3.0 口 和 PC 端
- 短接下面引脚
- 给开发板上电
- 摘下右边的黄色跳线帽，保留左边的黄色跳线帽

<img src="/img/rock3/3a/rock3a-maskrom.webp" alt="rock 3a maskrom" width="500" />

- 查看是否有 USB 设备
  _ Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  _ Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".
  <img src="/img/rock3/3a/rock3a-select-loader-bin.webp" alt="rock 3a select loader bin" width="500" />

## 安装系统到 eMMC

[Windows 环境下安装](../low-level-dev/rkdeveloptool)

[Linux 环境下安装](../low-level-dev/rkdeveloptool)

## 启动系统

- 给开发板上电，然后系统开始启动，状态灯闪烁。

:::tip
Radxa ROCK 3A 支持 `5V/12V` 供电。瑞莎推荐使用 [Radxa Power PD30W](../accessories/power/pd_30w)。
:::

## 常见问题
