---
sidebar_position: 3
---

# 通过 SDK Manager 安装系统

瑞莎 C200 载板无法通过 SDK Manager 进入 [MAXN_SUPER](./introduction.md) 模式，其他功能正常使用。

:::tip 安装说明

- 仅支持从 NVMe 固态硬盘启动
- 安装将擦除瑞莎预装的 BIOS 固件和 NVMe 数据，请提前备份

:::

## 环境搭建

我们需要下载和安装 SDK Manager，然后通过 SDK Manager 安装系统。

### 硬件配置

推荐在 Ubuntu 22.04 的主机上进行系统的安装，若是使用虚拟机运行 Ubuntu 22.04，请确保烧录系统的过程中主板连接到虚拟机。

- Ubuntu 22.04

### 下载 SDK Manager

访问 [NVIDIA SDK Manager](https://developer.nvidia.com/sdk-manager) 下载页面，下载 SDK Manager。

:::tip 下载说明

下载 SDK Manager 需要登录 NVIDIA 账号，若没有 NVIDIA 账号，需要先注册。

:::

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/download-sdk-manager.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 安装 SDK Manager

进入下载目录打开终端，运行下面命令安装 SDK Manager。

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```bash
sudo dpkg -i sdkmanager_xxx_amd64.deb
```

</NewCodeBlock>

:::tip 安装说明

若安装过程中遇到 `dpkg: error processing package sdkmanager` 的错误，运行以下命令安装：

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```bash
sudo apt --fix-broken install -y
sudo dpkg -i sdkmanager_xxx_amd64.deb
```

</NewCodeBlock>

:::

## 安装系统

### 硬件连接

1. 将 NVMe 固态硬盘安装到瑞莎 C200 Orin 开发套件的 M.2 M Key 插槽
2. 使用跳线帽或杜邦线将 FC REC 和 GND 引脚短接
3. 使用主板电源适配器给瑞莎 C200 Orin 开发套件供电
4. 使用 USB Type-c 数据线连接主板和电脑

:::tip Recovery 模式

进入 Recovery 模式只需要在开机过程中检测到 FC REC 引脚连接到 GND 即可，烧录系统过程中可拔掉跳线帽或者杜邦线。

:::

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/hardware-connection.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 使用 SDK Manager

打开 `SDK Manager` 应用，登录自己的 NVIDIA 账号。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/login-sdk-manager.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### STEP 1

选择自己的主板型号和 Jetpack 版本，建议按照以下选项进行选择，选择完成后点击 `CONTINUE` 选项。

:::tip 选项说明

若是对环境有特殊要求，可以自行选择该界面的选项。

:::

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/select-sdk-manager.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### STEP 2

选择需要安装的组件和勾选接受协议，选择完成后点击 `CONTINUE` 选项。

:::tip

部分组件可能需要主板联网，建议主板连接网线进行操作。

:::

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/select-sdk-manager-component.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### STEP 3

该界面可以看到组件下载和安装的进度，等待安装完成即可。

说明：若是使用虚拟机运行 Ubuntu 22.04，烧录过程中可能会断开虚拟机和主板的连接，请及时将设备连接到虚拟机，不然会出现连接超时错误！

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/install-sdk-manager-component-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

选择主板型号、OEM配置、系统存储介质选项，点击 `Flash` 选项继续安装系统。

:::tip OEM 配置

OEM 配置支持 `Pre-Config` 和 `Runtime` 两种方式。

Pre-Config：可提前设置用户信息

Runtime：启动系统后设置用户信息

若勾选了组件, 需要使用 `Pre-Config` 方式，提前设置好用户信息，安装组件时需要该信息。
:::

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/install-sdk-manager-component-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

确认安装组件需要选择的信息正确后，点击 `Install` 选项继续安装组件。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/install-sdk-manager-component-03.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### STEP 4

完成系统和组件的安装后，点击 `Finish` 选项关闭 SDK Manager。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/finish-sdk-manager-component.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 使用系统

烧录系统成功后，系统会重新启动，你可以连接 DP 数据线和显示器，根据系统提示完成初次系统配置。

:::tip 注意事项

初次系统配置完成后，将短接 FC REC 引脚和 GND 引脚的跳线帽或者杜邦线拔掉，避免下次启动直接进入 Recovery 模式。

:::
