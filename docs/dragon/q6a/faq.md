---
sidebar_position: 7
---

# 常见问题

## 打开串口设备失败

若打开串口出现 `Error: Permission denied, cannot open /dev/ttyUSB0` 错误提示！

您可以按照以下步骤排查问题：

1. 检查串口设备是否正确连接 PC

2. 检查串口设备权限

以 Linux 系统为例，若串口设备权限不足，您需要在终端命令行运行以下命令，让当前用户有权限访问设备。

- 查看串口设备信息

以 `/dev/ttyUSB0` 作为演示：

<NewCodeBlock tip="Linux$" type="host">

```
ls -l /dev/ttyUSB0
```

</NewCodeBlock>

若系统存在该设备，您会看到类似以下的输出：

```
crw-rw---- 1 root dialout 188, 0 Sep 10 21:24 /dev/ttyUSB0
```

- 添加当前用户到 `dialout` 组

<NewCodeBlock tip="Linux$" type="host">

```
sudo usermod -a -G dialout $USER
```

</NewCodeBlock>

- 重新登录

<NewCodeBlock tip="Linux$" type="host">

```
newgrp dialout
```

</NewCodeBlock>

3. 检查串口设备是否被其他程序占用
