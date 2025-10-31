---
sidebar_position: 1
---

# 准备工作

## 电源

Airbox 采用 USB Type-C 接口供电，支持 PD 电压协商，协商电压 20V。Airbox 满载功耗接近 65W，因此，需要 65W(20V/3.25A) 的 PD 适配器支持。也可以使用 20V 直出 3.25A 以上的 Type-C 适配器。

## 访问设备

系统默认的用户名和密码如下：

用户一：

```
用户名：linaro
密 码：linaro
```

用户二：

```
用户名： admin
密 码： admin
```

### 串口登录

使用 USB Type-A 转 Type-C 数据线连接整机 Debug 口和 PC 端，波特率设置为 `115200 8N1`，连接示意图：

<img src="/img/airbox/connection-diagram-1.webp" alt="radxa-aicore-sg2300x interfaces" />

#### Windows 下串口使用

Windows 下需要安装串口驱动，请参考：[安装串口驱动](./serial-driver-install)

在安装好后，以 Putty 工具说明：

1.在 Windows PC 上启动应用程序 Putty，并按如下方式进行设置：

- 在左边栏目中选择Session，将串行线路设置为 COM1，波特率设置 115200，连接类型为 Serial。
- 在 Saved Sessions 列中写入想要设置的名字，然后按 Save

<img src="/img/airbox/putty-setting-1.webp" alt="radxa-aicore-sg2300x interfaces" />

2.在左边栏目选择最底下的 Serial 并按照以下参数配置：

<img src="/img/airbox/putty-setting-2.webp" alt="radxa-aicore-sg2300x interfaces" />

3.设置完成后，点击 Open 打开串口即可。

#### Linux 下串口使用

以 Picocom 工具说明：

1.安装 Picocom ：

```
sudo apt-get update

sudo apt-get install picocom
```

2.开启 Picocom ：

```
sudo picocom -b 115200 /dev/ttyUSBX
```

X是不同设备，一般是0。

### SSH 登录

#### 通过 WAN 口

连接示意图：

<img src="/img/airbox/connection-diagram-2.webp" alt="radxa-aicore-sg2300x interfaces" />

首先，使用 Angryip 查找 IP

在无屏或远程情况下无法直接操作主板来获取 ip 地址时，可使用此方法查询 ip 地址。

- 首先主机 PC 需要下载[Angryip](https://angryip.org/download/)，然后确保主机 PC 和板子处于同一局域网。

- 打开 Angryip，选择 IP 范围，范围在 192.168.2.0 - 192.168.2.255（选择主机与主板所在的网段）， 点击开始，如图所示。

- ![Angryip](/img/configuration/ssh-Angryip.webp)

- Ctrl + F 查找 `bm1684` 关键词，找到板子的 IP 地址。

在获取到板子 IP 后：

##### Debian/Ubuntu

```
ssh [username]@[hostname]
or
ssh [username]@[IP address]
例如：
ssh linaro@192.168.1.100
```

##### Windows

Windows 有许多 SSH 工具，这里以 [Mobaxterm](https://mobaxterm.mobatek.net/) 为你展示连接方法。

点击左上角的 `Session` 新建 SSH 连接，在 `Remote host` 处输入板子的 IP，勾选 `Specify usernema` 并填入登录的用户, 双击会话开始连接后输入登录密码即可连接。

<img src="/img/airbox/angryip.webp" alt="radxa-aicore-sg2300x interfaces" />

#### 通过 LAN 口

连接示意图：

<img src="/img/airbox/connection-diagram-3.webp" alt="radxa-aicore-sg2300x interfaces" />

这种方式不需要先获取IP，LAN口固定IP为192.168.150.1，在知道IP为192.168.150.1后使用和 WAN 口一样的方法即可 SSH 登录系统，但是需要我们将电脑的IP改为150的网段，比如设置我们的电脑IP为为192.168.150.5。
