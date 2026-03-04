---
sidebar_position: 1
---

# 安装系统到 eMMC

## 准备工作

1. 准备 USB 数据线。
2. 准备可用的系统镜像文件。
3. 根据主机系统选择烧录工具。

## 进入 Maskrom 模式

请先让设备进入 Maskrom 模式，再进行烧录操作。

## 烧录到 eMMC

- Windows：参考 [使用 RKDevTool 烧录](rkdevtool)
- Linux/macOS：参考 [使用 rkdeveloptool 烧录](rkdeveloptool)

## 启动系统

烧录完成后断开 USB，重新上电启动，系统将从 eMMC 启动。

## 常见问题

若无法启动，请确认镜像型号与设备匹配，并重新进入 Maskrom 模式后再次烧录。
