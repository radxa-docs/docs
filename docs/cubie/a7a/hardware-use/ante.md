---
sidebar_position: 12
---

# 天线接口

瑞莎 Cubie A7A 板载 WiFi6 和 蓝牙 5.4 芯片，预留 1 个天线连接器，用于增强天线信号。

:::tip
天线接口具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 使用指南

将天线连接到对应的天线接口，天线接口规格 1 代 IPEX。

成功启动系统后，可以使用以下命令查看 WiFi 信号强度：

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo nmcli device wifi list
```
</NewCodeBlock>
