---
sidebar_position: 7
---

# 常见问题

## 打开串口设备失败

若打开串口出现 `Error: Permission denied, cannot open /dev/ttyUSB0` 错误提示！

您可以按照以下步骤排查问题：

1. 检查串口设备是否正确连接 PC

2. 检查串口设备权限

以 Linux 系统为例，若串口设备权限不足，您需要在终端命令行运行以下命令，让所有用户都有权限访问串口设备。

<NewCodeBlock tip="Linux$" type="host">

```
sudo chmod 777 /dev/ttyUSB0
```

</NewCodeBlock>

3. 检查串口设备是否被其他程序占用
