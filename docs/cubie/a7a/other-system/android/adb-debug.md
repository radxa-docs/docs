---
sidebar_position: 4
---

# ADB 调试

ADB（Android Debug Bridge，安卓调试桥）是 Android 官方提供的一种命令行工具，用于调试和管理 Android 设备。

我们教程使用 Android SDK Platform-Tools 进行 ADB 调试。

:::tip
Android SDK Platform-Tools 是 Android 软件开发工具包（SDK）中的一个核心组件，专为开发者和高级用户提供与 Android 设备及模拟器进行交互和管理的实用工具集合。

Android SDK Platform-Tools 包含 ADB（Android Debug Bridge）、Fastboot 等工具，支持 Linux、Windows、Mac 等主流操作系统。
:::

## 硬件准备

- 主板：瑞莎 Cubie A7A
- 系统启动介质：支持 MicroSD 卡、eMMC 模块、UFS 模块启动系统（选中其中一种系统启动介质即可）
- 电源适配器：5V Type-C 电源适配器
- Type-C 数据线：用于连接主板和电脑

您需要确认 Cubie A7A 的安卓系统已经成功启动，否则无法进行后面的 ADB 调试。

:::tip
Cubie A7A 的 Type-C 接口支持供电和 OTG 功能，我们可以使用 Type-C 接口进行供电和 ADB 有线调试。
:::

## 下载 SDK Platform-Tools

官方下载页面：[Android SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools)

根据自己的系统平台选择对应的 SDK Platform-Tools 压缩包下载并解压。

## 使用 SDK Platform-Tools

我们主要使用 SDK Platform-Tools 中的 ADB 工具。

打开终端，进入解压后的 `platform-tools` 文件夹目录下，使用 `./adb <command>` 命令运行 ADB 工具。

### 查看版本信息

使用 `./adb version` 命令查看 ADB 工具的版本信息。

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb version
```

</NewCodeBlock>

运行成功会显示 ADB 工具的版本信息，类似以下信息：

```text
Android Debug Bridge version 1.0.41
Version 36.0.0-13206524
```

### 开启调试功能

:::tip
Cubie A7A 的 Android 系统默认开启 USB 调试功能，Android 11 版本以后支持无线 ADB 调试。

**有线连接**：您需要在 Cubie A7A 的 Android 系统中开启 USB 调试功能。

**无线连接**：您需要在 Cubie A7A 的 Android 系统中开启无线调试功能。
:::

#### 有线连接

使用 Type-C 数据线连接 Cubie A7A 和电脑，通过这根 Type-C 数据线进行供电和有线调试。

#### 无线连接

使用 Type-C 电源适配器连接 Cubie A7A，Cubie A7A 的 WiFi 和电脑需要连接同一个网络，确保处于同一局域网。

#### 开启调试功能

我们需要让 Cubie A7A 进入开发者模式，在该模式下检查 USB 和无线调试功能是否开启。

开启 USB 和无线调试功能步骤：

1. 进入 Cubie A7A 的 Android 系统的 `Settings` → `About tablet` 界面。
2. 点击 `Build number` 七次，进入开发者模式。
3. 进入 Cubie A7A 的 Android 系统的 `Settings` → `System` → `Developer options` 界面。
4. 勾选 `USB debugging` 和 `Wireless debugging` 功能。
5. 点击 `Wireless debugging` 选项可以看到 `IP address & Port`，无线调试需要使用到 IP 地址和端口信息。

### 查看设备列表

使用 `./adb devices` 命令查看设备列表。

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb devices
```

</NewCodeBlock>

运行成功会显示设备列表，类似以下信息：

```text
List of devices attached
7c0016117200887238d	device
```

### 连接 Android 设备

<Tabs queryString="adb-connect">
<TabItem value="有线连接">

在 `platform-tools` 文件夹目录下，使用 `./adb shell` 命令进入 Android 设备的终端 Shell。

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb shell
```

</NewCodeBlock>

连接成功后会显示 Android 设备的终端 Shell，类似以下信息：

```text
radxa-a7a:/ $
```

</TabItem>
<TabItem value="无线连接">

在 `platform-tools` 文件夹目录下，使用 `./adb connect <device_ip>` 命令连接 Android 设备。

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb connect <device_ip:port>

# 示例

./adb connect 192.168.31.201:43167

```

</NewCodeBlock>

连接成功后会显示类似以下信息：

```text
already connected to 192.168.31.201:43167
```

连接成功后，使用 `./adb shell` 命令进入 Android 设备的终端 Shell。

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb shell
```

</NewCodeBlock>

进入成功后会显示 Android 设备的终端 Shell，类似以下信息：

```text
radxa-a7a:/ $
```

</TabItem>
</Tabs>
