---
sidebar_position: 12
---

# 天线接口

瑞莎 Dragon Q6A 板载 WiFi 6 和蓝牙 5.4 天线接口，预留两个天线接口，用于增强信号接收能力。

## 硬件连接

将天线安装到 Dragon Q6A 的天线接口。

:::tip 接口位置
可以参考 [硬件信息](./hardware-info) 教程找到对应硬件接口位置
:::

## 查看信号

完成天线的安装后，可以打开终端使用命令对比安装天线前后的信号强度：

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli device wifi list
```
</NewCodeBlock>
