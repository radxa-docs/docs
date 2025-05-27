---
sidebar_position: 3
---

# 使用平台：Windows

主要介绍用户如何在 Windows 平台上重新安装 Radxa Rock 4D 系统。

Radxa Rock 4D 支持 MicroSD 卡、 NVME、 UFS 启动系统。

## 1. 系统镜像下载

进入[资源下载汇总](../../download)页面下载对应的操作系统镜像压缩包,下载完成后解压系统镜像压缩包，得到的 `*.img` 后缀文件就是后面安装系统镜像需要的文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件写入到系统启动介质中。
:::

## 2. 硬件连接

用户可以根据自己的系统启动介质选择对应的硬件连接方式，如 Micro SD 卡、 NVME、 UFS 等。

<Tabs queryString="write-system">

<TabItem value="MicroSD 卡">

将 MicroSD 卡插入读卡器中，然后将读卡器插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="UFS">

将 UFS 模块安装到 eMMC/UFS 模块读卡器上，然后将读卡器插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/write-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
参考配件：

- [UFS 模块](https://radxa.com/products/accessories/ufs-module)
- [eMMC/UFS 模块读卡器](https://radxa.com/products/accessories/emmc-ufs-module-reader)
  :::

</TabItem>

<TabItem value="NVME">

将 M.2 接口的 NVME 插入固态硬盘盒中，然后将固态硬盘盒插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/write-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
参考配件：

- M.2 接口的固态硬盘盒： 需要自行购买。
- M.2 接口的固态硬盘（NVME）： 需要自行购买，用户可以查看 [Radxa 双 2.5G 拓展板](https://radxa.com/products/accessories/dual-2-5g-router-hat)支持的固态硬盘规格。
- [Radxa 双 2.5G 拓展板](https://radxa.com/products/accessories/dual-2-5g-router-hat): 用于 Radxa ROCK 4D 连接 M.2 接口的 NVME。
  :::

</TabItem>

</Tabs>

## 3. 写入系统镜像

无论是使用 Micro SD 卡、 UFS 模块还是 NVME，使用 Etcher 软件写入系统镜像的步骤都是类似的。

参考[使用工具： Etcher](./tool_etcher)教程安装 Etcher 软件和写入系统镜像到 Micro SD 卡/UFS 模块/NVME 中。

## 4. 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Debian Linux

用户账号：radxa

用户密码：radxa

## 5. 启动系统

<Tabs queryString="install-storage">

<TabItem value="MicroSD 卡">

完成系统镜像的写入后，将 MicroSD 卡从读卡器上取下来，然后将卡插入主板的 MicroSD 卡槽中。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-sd.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

我们将 MicroSD 卡安装到 Radxa ROCK 4D 的主板上，然后使用 5V Type-C 电源适配器启动系统。

</TabItem>

<TabItem value="UFS">

完成系统镜像的写入后，将 UFS 模块安装到 Radxa ROCK 4D 的 eMMC/UFS 模块接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

我们将 UFS 模块安装到 Radxa ROCK 4D 的主板上，然后使用 5V Type-C 电源适配器启动系统。

</TabItem>

<TabItem value="NVME">

完成系统镜像的写入后，将 M.2 接口的固态硬盘（NVME）安装到 Radxa 双 2.5G 拓展板上，然后拓展板通过 FPC 连接到Radxa ROCK 4D。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme.webp" style={{width: '60%', maxWidth: '1200px'}} />
</div>

**注意： 相比于 Micro SD 卡和 UFS 模块启动系统，NVME 启动系统需要通过 Radxa 双 2.5G 拓展板上的 DC5525 的 12V 供电接口进行供电。**

我们完成 NVME 和 Radxa 双 2.5G 拓展板安装后，使用 12V DC5525 电源适配器启动系统。

:::tip

Radxa 双 2.5G 拓展板仅支持 12V 电源输入，建议电流 2A 及以上，以确保所有外设稳定运行。

参考电源：

- [瑞莎 DC12 36W电源适配器](https://radxa.com/products/accessories/power-dc12-36w)(推荐使用)
- [瑞莎 DC12 60W电源适配器](https://radxa.com/products/accessories/power-dc12-60w)
- 标准12V/2A DC电源适配器(DC5525接口)

:::

</TabItem>

</Tabs>

## 6. 使用系统

完成系统启动后，您可以使用系统提供的图形界面或命令行工具登录系统。

1. 若您有显示器，启动 Radxa ROCK 4D 后可以使用 HDMI 数据线连接显示器和主板，直接通过显示器查看系统界面。

2. 若您没有显示器，可以参考[快速上手 → 串口登录系统](../quickly_start#6-串口登录系统)教程，确认系统是否启动成功以及登录系统使用 Radxa ROCK 4D。
