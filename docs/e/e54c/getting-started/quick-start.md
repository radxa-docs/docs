---
sidebar_position: 2
---

import { Section, Image } from "@site/src/utils/docs";

import Images from "../\_image.mdx"
import Etcher from '../../../common/general/\_etcherV2.mdx';

# 快速上手

## 实物图

:::tip
目前 E54C 有多种配置，有带外壳的，有裸板的，有带板载 EMMC 的，有不带板载 EMMC 的，请在操作前注意分辨自己的产品型号。
:::

<img src="/img/e/e54c/e54c-ports-cn.webp" width="800" alt="radxa-e54c" />

要启动 Radxa E54C，您需要以下设备：

- 一个 12V/2A 的 DC 5.5 x 2.5mm 孔径的电源适配器（E54C 只支持 12V 输入）更多供电详情，请参考[电源方案](./power-supply)。
- 一根 USB TYPE-A 转 TYPE-C 数据线，用于调试和访问系统。
- 网线（根据需要连接到四个以太网端口）
- 一个 microSD 卡和读卡器用于安装操作系统

## 安装操作系统

<Tabs queryString="mode">

<TabItem value="withoutemmc" label="不带板载EMMC" default>

对于不带 eMMC 的 E54C，需要使用 MicroSD 卡安装系统。

### 文件下载

请到[镜像下载页面](../download)下载对应的操作系统镜像。

### MicroSD 卡准备

将 MicroSD 卡插入到 SD 卡读卡器中，然后将读卡器插入到 PC 的 USB 端口上

### 镜像烧录

<Etcher/>

## 启动系统

按照上述步骤成功烧录 MicroSD Card 后， 将 MicroSD Card 插入到 MicroSD Card 插槽内，然后插上 12V DC 适配器，系统开始自动启动，LED 指示灯 SYS 灯开始闪烁。

<img src="/img/e/e54c/radxa-e54c-insert-sd.webp" width="500" alt="radxa-e54c pack" />

## 登录系统

如果是 Debian 系统启动后， 默认账号是 radxa，密码为 radxa

如果是 iStoreOS 系统启动后，默认账号是 root，密码是 password

</TabItem>

<TabItem value="withemmc" label="带板载EMMC">

出厂自带 [iStoreOS](../istoreos) 系统，上电自启动，不需要烧录。

</TabItem>

</Tabs>

## 接线和上电

连接网线一端到 PC，另一端接到 E54C 的以太网 LAN 端口，RJ45 的 LED 会开始闪烁，表示网络连接正常。

<img src="/img/e/e54c/e54c-rj45-cable.webp" width="500" alt="e54c-rj45" />

## 登录

### 浏览器登录

在 PC 上可以通过浏览器通过 iStoreOS 默认的 ip 192.168.100.1 登录到 iStoreOS 系统后台, iStoreOS 后台默认用户名为 root， 密码为 password.

<img src="/img/e/e54c/e54c-istoreos-login.webp" width="700" alt="e54c-istoreos" />

<img src="/img/e/e54c/e54c-istoreos-login-enter.webp" width="700" alt="e54c-istoreos" />

### 串口登录

在 E54C 通电的情况下，将 USB TYPE-A 转 TYPE-C 数据线的 TYPE-A 口接电脑，TYPE-C 口接 Radxa E54C 调试口，波特率设置为 `1500000 8n1`

<img src="/img/e/e54c/e54c-serial.webp" width="500" alt="e54c-serial" />

### Windows 系统

#### 安装 CH340 驱动

将 USB TYPE-A 转 TYPE-C 数据线的 TYPE-A 口接电脑，TYPE-C 口接 Radxa E54C 调试口，在电脑的设备管理器查看是否已经有 CH340 驱动

<img src="/img/e/e54c/e54c-ch340-install.webp" width="500" alt="e54c-ch340" />

如果没有，请下载[CH340驱动](https://www.wch.cn/downloads/CH341SET_EXE.html)安装

#### 使用 PuTTY 连接

1. 下载并安装 [PuTTY](https://www.putty.org/)
2. 打开 PuTTY，设置如下：
   - 连接类型选择 Serial
   - Serial line 填写 COM 端口号（在设备管理器中查看）
   - Speed 设置为 1500000
   - Connection type 选择 Serial

<img src="/img/common/putty/putty-rk-1.webp" width="500" alt="putty" />

3. 在左侧导航栏中选择 Session，然后：
   - 在 Saved Sessions 列中写入 radxa-e54c ，然后按 Save。
   - 之后可以直接双击 radxa-e54c 进行连接。

<img src="/img/common/putty/putty-rk-2.webp" width="500" alt="putty" />

4. 点击 Open 按钮，连接到设备。

### macOS 系统

#### 安装 CH340 驱动

1. 下载 [CH340 驱动](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html)
2. 解压并安装驱动
3. 重启电脑

#### 使用 screen 命令连接

1. 打开终端
2. 输入以下命令查看可用的串口设备：

<NewCodeBlock tip="macOS-host$" type="host">

```bash
ls /dev/tty.*
```

</NewCodeBlock>

3. 找到类似 `/dev/tty.wchusbserial14xx0` 的设备名称
4. 使用以下命令连接（替换设备名称）：

<NewCodeBlock tip="macOS-host$" type="host">

```bash
screen /dev/tty.wchusbserial14xx0 1500000
```

</NewCodeBlock>

5. 要退出 screen 会话，按 `Ctrl+A` 然后按 `Ctrl+\`，然后输入 `y` 确认。

### Linux 系统

#### 使用 screen 命令连接

1. 安装 screen（如果尚未安装）：

<NewCodeBlock type="host">

```bash
# Ubuntu/Debian
sudo apt-get install screen

# Fedora
sudo dnf install screen

# Arch Linux
sudo pacman -S screen
```

</NewCodeBlock>

2. 查找串口设备：

<NewCodeBlock type="host">

```bash
ls /dev/ttyUSB*
```

</NewCodeBlock>

3. 连接到设备（通常是 /dev/ttyUSB0）：

<NewCodeBlock type="host">

```bash
sudo screen /dev/ttyUSB0 1500000
```

</NewCodeBlock>

4. 要退出 screen 会话，按 `Ctrl+A` 然后按 `Ctrl+\`，然后输入 `y` 确认。

#### 使用 minicom 连接

1. 安装 minicom：

<NewCodeBlock type="host">

```bash
# Ubuntu/Debian
sudo apt-get install minicom
```

</NewCodeBlock>

2. 配置 minicom：

<NewCodeBlock type="host">

```bash
sudo minicom -s
```

</NewCodeBlock>

3. 设置 minicom：

   - 选择 "Serial port setup"
   - 按 A 修改串口设备为 /dev/ttyUSB0
   - 按 E 修改波特率为 1500000
   - 按 F 和 G 确保硬件流控制和软件流控制都设置为 No
   - 按 Enter 返回主菜单
   - 选择 "Save setup as dfl" 保存设置
   - 选择 "Exit" 退出设置并启动 minicom

4. 要退出 minicom，按 `Ctrl+A` 然后按 `X`，然后选择 "Yes" 确认。

### SSH 登录

1. 将网线连接到 E54C 的以太网端口和您的电脑之间。

<img src="/img/e/e54c/e54c-rj45-cable.webp" width="500" alt="e54c-rj45" />

2. 将电源适配器插入 Radxa E54C 的电源接口。设备上电启动，系统状态灯将亮起。

3. 配置您电脑的 IP 地址为静态 IP，与 E54C 在同一网段（例如 192.168.100.x）。

4. 打开终端或命令提示符，使用 SSH 连接到 E54C：

<NewCodeBlock type="host">

```bash
ssh root@192.168.100.1
```

</NewCodeBlock>

5. 输入默认密码：password

## 更多操作

更多操作请参考：

- [接口使用](./interface-usage)
- [安装系统](./install-os/)
