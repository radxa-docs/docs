---
sidebar_position: 2
---

# 系统安装

本文档将介绍如何把安卓镜像安装到 Radxa ZERO 3 。

## 镜像下载

请到[资源下载汇总](./download) 下载对应的镜像文件。

## 系统安装

基于不同的启动介质, 安装操作系统主要使用以下两种方法（具体使用哪种方法，取决于你想让系统从哪里启动）

**从 SD 卡启动** （**推荐**）

- 通过读卡器将系统镜像烧写到 MicroSD 卡

**从板载eMMC 启动**

- 使用 USB 线将系统镜像直接刷写到 eMMC 上

:::caution 注意
如果板子不带eMMC，则无法从eMMC启动，例如 Radxa ZERO 3E。
:::

<Tabs queryString="install-method">
<TabItem value = "sdcard" label="安装系统到 SD 卡">

### 安装系统到 SD 卡

#### 准备

1. 1x microSD 卡
2. 1x SD 卡读卡器
3. 1x 5V 电源适配器 （瑞莎推荐电源适配器 [Radxa Power PD30W](../../../../accessories/pd_30w)）

#### 通过 Etcher 刷入操作系统镜像到 microSD

1. 把 microSD 卡插入 SD 读卡器, 然后把 SD 读卡器插入 PC 的 USB 接口上

2. [下载](https://etcher.balena.io/)刷写工具 `Etcher`。  
   ![ROCK5A via Etcher 01](/img/rock5a/rock5a-etcher.webp)

3. 打开 Etcher，将准备的操作系统镜像刷写到 microSD 卡。在 Etcher 窗口中，单击 `Flash from file` 选择刚下载的操作系统镜像。
   ![ROCK5A via Etcher 02](/img/rock5a/rock5a-etcher-1.webp)

4. 在 Etcher 窗口中，点击 `Select target`。  
   ![ROCK5A via Etcher 03](/img/rock5a/rock5a-etcher-2.webp)

5. 在 Etcher 窗口中，点击 `Flash!` 然后等待刷写进度条。  
   ![ROCK5A via Etcher 04](/img/rock5a/rock5a-etcher-3.webp)

6. 在 Etcher 窗口中，当刷写成功时将会显示 `Flash Complete!`  
   ![ROCK5A via Etcher 05](/img/rock5a/rock5a-etcher-4.webp)

**如果刷写操作系统镜像错误, 请手动再试一次。**

</TabItem>

<TabItem value = "emmc" label="安装系统到板载 eMMC">

### 安装系统到板载 eMMC

#### 准备

- 准备一条 USB 线 (一端USB C，一端 USB A)
  <img src="/img/common/usb-cable-usb-a-usb-c.webp" width = "400" alt="USB Cable"/>
- 1x 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../../../../accessories/pd_30w))

#### 安装系统

##### 进入MaskRom Mode

按住 [Maskrom 按键](../../hardware-design/hardware-interface)，用 USB 线连接计算机的 USB 接口和 Radxa Zero 3W 的 OTG Type C 接口，然后松开Maskrom
![zero3w](/img/zero/zero3/radxa_zero_3w.webp)

##### 我的电脑是Windows

&emsp;[使用 rkdevtool 安装系统](../../low-level-dev/rkdevtool)

##### 我是电脑是Linux / macOS

&emsp;[使用 rkdeveloptool 安装系统](../../low-level-dev/rkdeveloptool)

&emsp;[使用 upgrade_tool 安装系统](../../low-level-dev/upgrade-tool)（可同时烧录多台设备）

</TabItem>
</Tabs>

## 启动系统

#### 从 SD 卡启动

- 插入刚烧录过系统的 SD 卡到板子的 SD 卡槽，连接板子的 [USB 2.0 OTG Type C port](../../hardware-design/hardware-interface) 到电源适配器上，
  然后系统开始启动，状态灯闪烁。

#### 从板载 EMMC 启动

- 直接连接板子的 [USB 2.0 OTG Type C port](../../hardware-design/hardware-interface) 到电源适配器上，然后系统开始启动，状态灯闪烁。

:::tip
Radxa ZERO 3 只支持 `5V` 供电。瑞莎推荐使用 [Radxa Power PD30W](../../../../accessories/pd_30w)。
:::

## 常见问题
