---
sidebar_position: 6
---

# 蓝牙使用

Cuibe A7A 板载蓝牙 5.4 模块，通过蓝牙连接和配对蓝牙设备使用。

<Tabs queryString="interface-mode">
<TabItem value="图形界面">
通过系统自带的蓝牙管理工具来管理蓝牙设备。

- 开启蓝牙功能

① ： 点击桌面右上角的蓝牙图标

② ： 点击 `Enable Bluetooth` 选项使能蓝牙功能

<div style={{textAlign: 'center'}}>
    <img src="/img/cubie/a7a/a7a-blue-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- 连接蓝牙设备

① : 点击 `Search` 选项扫描周围的蓝牙设备

② : 鼠标右击你需要连接的蓝牙设备

③ ： 选择 `Connect` 选项连接蓝牙设备

:::tip
连接蓝牙设备的工程中，需要进行蓝牙设备的配对，按照系统提示完成操作。
:::

<div style={{textAlign: 'center'}}>
    <img src="/img/cubie/a7a/a7a-blue-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- 连接成功

蓝牙设备连接成功后，桌面的蓝牙图标会显示为绿色。

<div style={{textAlign: 'center'}}>
    <img src="/img/cubie/a7a/a7a-blue-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="命令行模式">
通过命令行来管理蓝牙设备。

- 启动蓝牙服务

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
sudo systemctl start bluetooth
```

</NewCodeBlock>

- 设置开机自启

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
sudo systemctl enable bluetooth
```

</NewCodeBlock>

- 检查服务状态

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
systemctl status bluetooth
```

</NewCodeBlock>

- 连接和配对蓝牙设备

使用 `bluetoothctl` 命令行工具来管理蓝牙设备。

:::tip
终端输入 `bluetoothctl` 会进入交互式命令行界面。

退出 `bluetoothctl` 命令行界面，输入 `exit`。
:::

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
bluetoothctl
```
</NewCodeBlock>

- 打开蓝牙适配器

在 `bluetoothctl` 交互命令行界面输入 `power on` 打开蓝牙。
<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
power on
```

</NewCodeBlock>

- 启用代理

在 `bluetoothctl` 交互命令行界面输入 `agent on` 启用代理。
<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
agent on
```

</NewCodeBlock>

- 扫描蓝牙设备

在 `bluetoothctl` 交互命令行界面输入 `scan on` 扫描蓝牙设备。
<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
scan on
```

</NewCodeBlock>

扫描到的蓝牙设备会在终端出现蓝牙设备的物理地址和名称，类似输出以下信息：其中 `EC:30:B3:40:0A:20` 为蓝牙设备的物理地址，`Redmi K50 Ultra` 为蓝牙设备的名称。

```
[NEW] Device EC:30:B3:40:0A:20 Redmi K50 Ultra
```

- 停止扫描

如果不停止扫描，`bluetoothctl` 交互命令行界面会一直处于扫描状态，建议自动扫描几次后停止扫描，然后查找自己需要连接的蓝牙设备物理地址。
<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
scan off
```

</NewCodeBlock>

- 配对设备

在 `bluetoothctl` 交互命令行界面输入 `pair <device_address>` 配对蓝牙设备：配对过程需要自己手动确认，根据蓝牙设备的提示进行操作。
<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
pair <device_address>

# 示例
pair EC:30:B3:40:0A:20
```

</NewCodeBlock>

- 信任设备

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
trust <device_address>

# 示例
trust EC:30:B3:40:0A:20
```

</NewCodeBlock>

- 连接设备

在 `bluetoothctl` 交互命令行界面输入 `connect <device_address>` 连接蓝牙设备。
<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
connect <device_address>

# 示例
connect EC:30:B3:40:0A:20
```

</NewCodeBlock>

- 断开设备

在 `bluetoothctl` 交互命令行界面输入 `disconnect <device_address>` 断开蓝牙设备。
<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
disconnect <device_address>

# 示例
disconnect EC:30:B3:40:0A:20
```

</NewCodeBlock>

- 取消配对

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
remove <device_address>

# 示例
remove EC:30:B3:40:0A:20
```

</NewCodeBlock>

- 关闭蓝牙适配器

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">

```
power off
```

</NewCodeBlock>

</TabItem>

</Tabs>
