---
sidebar_position: 3
---

# 安装系统到 M.2 NVMe SSD

本节教程主要介绍如何给 M.2 NVMe SSD 安装系统。

:::tip
M.2 NVMe SSD是指支持 M.2 接口和 NVMe 协议的固态硬盘。
:::

## 1. 硬件准备

若用户想通过 M.2 NVMe SSD 启动系统，我们提供两种方式给用户演示如何安装系统到 M.2 NVMe SSD 中。

注意：无论哪种方式使用 M.2 NVMe SSD 启动系统都需要搭配我们的 [Radxa 双 2.5G 拓展板](https://radxa.com/products/accessories/dual-2-5g-router-hat) 使用。

使用 Radxa 双 2.5G 拓展板就不需要使用 Radxa ROCK 4D 自带的电源适配器, 直接通过 Radxa 双 2.5G 拓展板的电源接口给开发板供电即可。

:::tip
参考电源：

Radxa 双 2.5G 拓展板仅支持 12V 电源输入，建议电流 2A 及以上，以确保所有外设稳定运行。

- [瑞莎 DC12 36W电源适配器](https://radxa.com/products/accessories/power-dc12-36w)(推荐使用)
- [瑞莎 DC12 60W电源适配器](https://radxa.com/products/accessories/power-dc12-60w)
- 标准12V/2A DC电源适配器(DC5525接口)
  :::

- **方式一：无 M.2 NVMe 固态硬盘盒**

该方式需要 Radxa ROCK 4D 通过 MicroSD 卡启动系统正常。

我们会在 MicroSD 卡上的系统进行操作，使用 `dd` 命令将系统安装到 M.2 NVMe SSD 中。

注意： 若 MicroSD 卡启动异常，可以参考 [安装系统到 MicroSD 卡](./boot_sd)教程，先安装系统到 MicroSD 卡上。

- **方式二：有 M.2 NVMe 固态硬盘盒**

该方式不需要依赖MicroSD 卡，直接将 M.2 NVMe SSD 插入固态硬盘盒中，使用 Etcher 软件安装系统到 M.2 NVMe SSD 中。

**您可以根据自己的实际情况准备对应的方式和硬件设备。**

<Tabs queryString="web-mode">

<TabItem value="无 M.2 NVMe 固态硬盘盒">
- 开发板：Radxa ROCK 4D
- M.2 NVMe SSD: 自行购买
- 电源适配器：12V/2A DC电源适配器(DC5525接口)

</TabItem>

<TabItem value="有 M.2 NVMe 固态硬盘盒">
- 开发板：Radxa ROCK 4D
- M.2 NVMe SSD: 自行购买
- M.2 NVMe 固态硬盘盒:自行购买
- 电源适配器：12V/2A DC电源适配器(DC5525接口)

</TabItem>
</Tabs>

## 2. 重装系统

重装系统会格式化 M.2 NVMe 固态硬盘，如果有重要数据请提前备份。

### 2.1 下载系统镜像

<Tabs queryString="web-mode">

<TabItem value="无 M.2 NVMe 固态硬盘盒">

下载 Radxa ROCK 4D 的系统镜像文件到 Radxa ROCK 4D 上：可以直接使用 `wget` 命令下载文件到当前目录，其中网址链接可以进入 [资源汇总下载](../../download) 复制。

:::tip
你也可以通过其他方式将系统镜像文件复制到 Radxa ROCK 4D 上，比如通过 FTP、SCP 等方式
:::

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
# 安装 wget
sudo apt-get install wget

# 下载系统镜像文件

wget [URL]

```
</NewCodeBlock>
- wget : 下载文件，将 [URL] 替换成实际下载链接。
</TabItem>

<TabItem value="有 M.2 NVMe 固态硬盘盒">

在 PC 上访问 [资源下载汇总](../../download) 页面，在下载页面找到 M.2 NVMe SSD 对应的系统镜像文件，下载并解压。

下载完成后，得到的 `*.img` 文件就是待烧写到 M.2 NVMe 固态硬盘中的系统镜像文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件安装到 M.2 NVMe SSD , 未解压就直接烧录到 M.2 NVMe SSD ，可能出现安装系统失败或者启动系统失败的情况。
:::
</TabItem>
</Tabs>

### 2.2 硬件连接

<Tabs queryString="web-mode">

<TabItem value="无 M.2 NVMe 固态硬盘盒">

将 M.2 NVMe 固态硬盘安装到 Radxa 双 2.5G 拓展板上，然后拓展板通过 FPC接口 连接到Radxa ROCK 4D。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme.webp" style={{width: '60%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="有 M.2 NVMe 固态硬盘盒">

将 M.2 NVMe 固态硬盘插入固态硬盘盒中，然后将固态硬盘盒插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/write-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>
</Tabs>

### 2.3 安装系统镜像

<Tabs queryString="web-mode">

<TabItem value="无 M.2 NVMe 固态硬盘盒">

#### 2.3.1 写入系统镜像到 M.2 NVMe SSD

使用命令将压缩的系统镜像解压并直接写入到 M.2 NVMe SSD，请根据实际下载的系统镜像文件名进行修改。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```

sudo xzcat ~/radxa-rk3576_bookworm_kde_t2.output_512.img.xz | sudo dd of=/dev/nvme0n1 bs=1M status=progress

```
</NewCodeBlock>

- xzcat : 解压 xz 格式的系统镜像文件
- dd : 复制并写入到 M.2 NVMe SSD 设备（⚠️注意：使用dd命令时请确认设备名称，错误的设备名可能导致数据丢失）
- of=/dev/nvme0n1 : 指定写入的设备为 nvme0n1（可以根据实际情况修改）
- bs=1M : 指定写入的块大小为 1M，提高写入速度
- status=progress : 显示写入进度，让您了解写入状态

#### 2.3.2 验证写入结果

写入完成后，您可以验证 M.2 NVMe SSD 中的分区表是否正确创建：

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```

sudo fdisk -l /dev/nvme0n1

```
</NewCodeBlock>

正确写入后，应该会看到类似以下的分区信息：
<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```

Disk /dev/nvme0n1: 465.76 GiB, 500107862016 bytes, 976773168 sectors
Disk model: Samsung SSD 980 500GB  
Units: sectors of 1 \* 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 16384 bytes / 131072 bytes
Disklabel type: gpt
Disk identifier: 9ABAF4B4-329B-41A8-908A-088211D43542

Device Start End Sectors Size Type
/dev/nvme0n1p1 32768 65535 32768 16M Linux filesystem
/dev/nvme0n1p2 65536 679935 614400 300M EFI System
/dev/nvme0n1p3 679936 15620800 14940865 7.1G EFI System

```
</NewCodeBlock>


</TabItem>

<TabItem value="有 M.2 NVMe 固态硬盘盒">

使用开源镜像烧录工具 Etcher 烧写系统镜像文件到 M.2 NVMe 固态硬盘中。

#### 2.3.1 下载 Etcher

进入 Balena Etcher 官网下载系统对应平台的软件：balenaEtcher。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

根据自己的系统平台和架构下载对应的软件安装包。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 2.3.2 使用 Etcher

下载完成后，双击打开 Etcher 应用。

:::tip
- Windows

下载的文件是 `*.exe` 格式的安装包，双击程序就可以运行。

- Linux

推荐下载 `*.zip` 格式的压缩包，解压后双击程序就可以运行。

- MacOS

根据自己的系统架构下载对应的 `*.dmg` 文件,双击打开后，将软件拖拽到 Applications 文件夹进行安装，安装完成后双击应用图标运行。

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 2.3.3 安装系统镜像

1. 选择镜像文件

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. 选择存储设备

点击 `Select target` 选项，选择自己待安装系统镜像对应存储设备。

:::danger
请勿选错存储设备，否则 Etcher 将格式化被选中的存储设备，造成重要数据丢失！

您可以插拔存储设备，观察可选存储设备的变化，从而进一步判断待安装的存储设备。
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： 选择需要安装系统镜像的存储设备

② ： 点击 `Select 1` 选项确认设备选择

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. 安装系统镜像

点击 `Flash` 选项，等待软件自动进行系统镜像的安装和校验。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统安装完成
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统校验完成
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
  成功安装系统镜像后，关闭 Etcher 软件！
</div>

</TabItem>
</Tabs>

## 3. 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Debian Linux

用户账号：radxa

用户密码：radxa

## 4. 启动系统

<Tabs queryString="web-mode">

<TabItem value="无 M.2 NVMe 固态硬盘盒">

完成系统镜像的安装后：

1. 关闭系统：`sudo shutdown -h now`
2. 断开 Radxa ROCK 4D 的 DC 12V 电源
3. 移除 MicroSD 卡
4. 重新连接DC 12V 电源
5. 等待系统从 M.2 NVMe SSD 启动

</TabItem>

<TabItem value="有 M.2 NVMe 固态硬盘盒">

完成系统镜像的安装后：

1. 将 M.2 NVMe SSD 安装到 Radxa 双 2.5G 拓展板上，然后拓展板通过 FPC接口 连接到Radxa ROCK 4D。
2. 连接DC 12V 电源
3. 等待系统从 M.2 NVMe SSD 启动

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme.webp" style={{width: '60%', maxWidth: '1200px'}} />
</div>

</TabItem>
</Tabs>

## 5. 系统使用

### 5.1 有屏模式

若您是 Radxa ROCK 4D 搭配显示器使用，使用系统就变的比较简单，你可以根据显示器上的系统界面进行操作。

### 5.2 无屏模式

若您是 Radxa ROCK 4D 搭配 USB 转 TTL 模块使用，您可以通过 [串口调试](../../system-config/uart_debug) 方式进行系统操作。

:::tip
对于无屏模式的用户，我们提供以下建议助力您快速熟悉系统使用。

1. 配置网络

您可以直接给 Radxa ROCK 4D 插入网线，确保系统能够连接网络。

2. 配置 SSH 远程

配置 [SSH 远程](../../system-config/ssh-remote) 登录可以去掉 USB 转 TTL 模块，直接使用 SSH 远程登录系统。

3. 配置 VNC 远程

若系统本身带有图形化界面，配置 [VNC 远程](../../system-config/vnc-remote) 登录可以让您直接看到系统画面，无需使用显示器。
:::
```
