---
sidebar_position: 10
---

# 移远 LTE EC25

以下以 ROCK 4B+ 为例，介绍移远 LTE EC25-AU 模块的配置方法。

## 安装相关软件

请在终端中执行以下命令以安装拨号上网相关软件：

```bash
sudo apt update
sudo apt install ppp picocom
```

## 连结外设

首先，请通过 USB 连结 ROCK 4B+ 以及移远 LTE EC25-AU。

你可以通过以下命令检查设备是否已连接：

```bash
rock@rock-pi-4b-plus:~$ lsusb | grep -i Quectel
Bus 002 Device 002: ID 2c7c:0125 Quectel Wireless Solutions Co., Ltd. EC25 LTE modem
```

调制解调器通常是通过串口和宿主机进行通信。请检查系统是否正确枚举出对应的串口设备：

```bash
rock@rock-pi-4b-plus:~$ ls /dev/ttyUSB*
/dev/ttyUSB0  /dev/ttyUSB1  /dev/ttyUSB2  /dev/ttyUSB3
```

## 使用 `at` 指令测试调制解调器

首先，使用 `picocom` 打开串口：

```bash
sudo picocom -b 115200 /dev/ttyUSB3
```

程序启动后，可输入以下 `at` 指令检查调制解调器状态：

```bash
at+cpin?
+CPIN: READY

OK  #查看 SIM 卡是否就位

at+csq
+CSQ: 14,99

OK  #检测信号，99 代表无信号。

at+cops?
+COPS: 1,0,"CHN-UNICOM",7

OK  #查看运营商

at+creg?
+CREG: 0,1

OK  #获得手机的注册状态(0,1:表示注册正常)

at+qeng="servingcell"
+QENG: "servingcell","NOCONN","LTE","FDD",460,01,19A358C,366,100,1,5,5,774E,-108,-5,-83,9,13

OK  #显示当前连接服务小区的信号强度和质量
```

如果调制解调器均返回正常状态，可使用 `Ctrl+A Ctrl+X` 组合键退出 `picocom`。

## 通过 `ppp` 进行拨号上网

在终端中，执行以下命令来添加 `ppp` 拨号配置脚本。

你将鼠标移动到代码框右上角，使用复制按钮来复制全文，然后将命令粘贴到终端中。

```bash
cat << EOF
# 连接调试时隐藏密码
hide-password

# 该手机不需要身份验证
noauth

# 用于呼叫控制脚本
connect '/usr/sbin/chat -s -v -f /etc/ppp/peers/rasppp-chat-connect'

# 断开连接脚本
disconnect '/usr/sbin/chat -s -v -f /etc/ppp/peers/rasppp-chat-disconnect'

# 调试信息
debug

# 4G模块
/dev/ttyUSB3

# 串口波特率
115200

# 使用默认路由
defaultroute

# 不使用默认IP
noipdefault

# 不使用PPP压缩
novj
novjccomp
noccp
ipcp-accept-local
ipcp-accept-remote
local

# 最好锁定串行总线，创建一个锁定文件，其他程序在发现存在这个文件后，就能得知相应的串口已经被使用。
lock
dump

nodetach

# 用户名 密码 （配置因运营商不同而不同）
user ctnet@mycdma.cn
password vnet.mobi

# 硬件控制流
crtscts
remotename 3gppp
ipparam 3gppp

# 使用服务器端协商的DNS就可以设置参数usepeerdns
usepeerdns
EOF | sudo tee /etc/ppp/peers/rasppp

cat << EOF
TIMEOUT 15
ABORT   "BUSY"
ABORT   "ERROR"
ABORT   "NO ANSWER"
ABORT   "NO CARRTER"
ABORT   "NO DIALTONE"

""AT
OK \rATZ

OK \rAT+CGDCONT=1,"IP",""

OK-AT-OK ATDT#777
CONNECT \d\c
EOF | sudo tee /etc/ppp/peers/rasppp-chat-connect

cat << EOF
ABORT "ERROR"
ABORT "NO DIALTONE"
SAY "\NSending break to the modem\n"

""\k"

""+++ATH"
SAY "\nGood bye !\n"
EOF | sudo tee /etc/ppp/peers/rasppp-chat-disconnect
```

你现在可以使用 `ppp` 尝试拨号：

```bash
sudo pppd call rasppp &    #后台进行拨号
```

完整拨号过程如图所示。

![拨号过程一](/img/4G-module/pppd_process1.webp)
![拨号过程二](/img/4G-module/pppd_process2.webp)

从程序的输出中我们可以获得以下信息：

1. 本机 IP 地址： `10.224.236.90`
2. 主要 DNS 服务器： `120.80.80.80`
3. 次要 DNS 服务器： `221.5.88.88`

我们现在可以根据以上信息来配置网络：

```bash
sudo ip route add default via 10.224.236.90 # 配置网关
echo "nameserver 120.80.80.80" | sudo tee -a /etc/resolv.conf # 配置主要 DNS
echo "nameserver 221.5.88.88" | sudo tee -a /etc/resolv.conf # 配置次要 DNS
```

你现在可以使用 `ping` 命令检查是否连接到互联网：

![成功上网](/img/4G-module/ping-success.webp)

## 疑难解答

1. 我的系统没有列出 USB 串口设备。

请检查对应的驱动是否包含在你当前运行的系统中。你可以执行以下命令检查：

```bash
rock@rock-pi-4b-plus:~$ lsmod | grep usb
usb_wwan               20480  1 option
usbserial              36864  2 usb_wwan,option
```
