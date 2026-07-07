---
sidebar_position: 1
---

# Android 15

目前瑞莎 Dragon Q6A 的 Android 15 系统启动需要烧录 SPI 固件启动，且系统启动介质仅支持 eMMC 模块或 UFS 模块启动系统。

## 产品实物

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/dragon-q6a-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 |       视图        | 序号 |       视图        | 序号 |       视图        |
| :--: | :---------------: | :--: | :---------------: | :--: | :---------------: |
|  ①   | Dragon Q6A 正视图 |  ②   | Dragon Q6A 侧视图 |  ③   | Dragon Q6A 背视图 |

## 使用前提

您需要提前准备以下硬件设备：

- 主板：瑞莎 Dragon Q6A
- 主机：X86 架构的 Windows 或 Linux
- 显示设备：HDMI 数据线和显示器
- 系统启动介质：瑞莎 eMMC 或 UFS 模块
- 电源适配器：12V Type-C 电源适配器（兼容 PD 协议）

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
- 标准 12V Type-C 电源适配器，建议电流 2A 及以上

:::

## 软件准备

我们需要提前下载好系统镜像、SPI 固件和高通工具。

:::tip 推荐配件
目前 Dragon Q6A 的 Android 系统镜像只支持使用使用高通官方工具进行系统镜像烧录。
:::

### 下载文件

系统镜像和 SPI 固件在同一个压缩包中，可以在[资源汇总下载](../download)页面下载。

### 高通工具

我们需要下载并安装 `Qualcomm Software Center` 软件，安装完成后，打开 `Qualcomm Software Center` 软件，若没有高通账号的可以自行注册账号并登录。

在 `Qualcomm Software Center` 的 `Catalog` -> `Tools` 类别里面依次搜索并安装以下工具：

- Qualcomm USB Driver
- Qualcomm Unifiled Tools Services
- Qualcomm® Chipset Core Tools Stack -> Qualcomm Product Configuration Assistant Tool

## 硬件连接

将瑞莎 eMMC 或 UFS 模块安装到 Dragon Q6A 上。

<Tabs queryString="Module">

<TabItem value="eMMC 模块">

eMMC 模块安装步骤：

1. 观察 eMMC 模块上的缺角方向和主板上的 eMMC 模块接口的缺角丝印，以确定正确的安装方向。

2. 将 eMMC 模块放置到主板 eMMC 模块接口上方，确保 eMMC 模块接口与主板的 eMMC 模块接口基本对齐。

3. 稍用力按压 eMMC 模块的一端，听到“咔哒”声表示安装成功，再以同样方式按压另一端，确保 eMMC 模块安装成功。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/emmc-moudle-board.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

</TabItem>

<TabItem value="UFS 模块">

UFS 模块安装步骤：

1. 观察 UFS 模块上的缺角方向和主板上的 UFS 模块接口的缺角丝印，以确定正确的安装方向。

2. 将 UFS 模块放置到主板 UFS 模块接口上方，确保 UFS 模块接口与主板的 UFS 模块接口基本对齐。

3. 稍用力按压 UFS 模块的一端，听到“咔哒”声表示安装成功，再以同样方式按压另一端，确保 UFS 模块安装成功。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/ufs-moudle-board.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

</TabItem>

</Tabs>

## 烧录系统

线刷系统需要让主板先进入 EDL 模式。

### 进入 EDL 模式

主板上电前，按住 EDL 按键；主板上电后，松开 EDL 按键，进入 EDL 模式。

具体操作步骤：

<div style={{textAlign: 'center'}}>
   <img src="/img/common/radxa-os/install-system/qualcomm/enter-edl-mode-dragon-q6a.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： 按住 EDL 按键

② ： 连接 12V Type-C 电源适配器（兼容 PD 协议）

③ ： 松开 EDL 按键

④ ： 使用双头 USB Type-A 数据线连接 Dragon Q6A 的 USB 3.1 Type-A 接口和电脑的 USB Type-A 接口

### 连接 EDL 设备

打开 `xPCATApp` 应用（完成高通官方工具的步骤后，系统的软件应用列表会出现 `xPCATApp` 应用），连接主板对应的 EDL 设备，详细步骤如下：

① ： 点击 `CONNECT A DEVICE` 选项选择设备

② ： 选择主板对应的设备

③ ： 点击 `CONNECT` 选项进行连接

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q8b/xpcatapp_connect.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 烧录 SPI 固件

主板启动 Android 系统镜像需要烧录对应的 SPI 固件，系统镜像和 SPI 固件压缩在同一个文件，解压系统镜像压缩包的 `spinor` 文件夹就是 SPI 固件文件夹。

详细步骤如下：

① ： 选择 `Download` 选项

② ： 选择文件类型

③ ： 选择系统镜像文件解压后的 `spinor` 文件夹

④ ： `Memory Type` 选择 `MEMORY_TYPE_SPINOR` 选项

⑤：点击 `DOWNLOAD` 选项进行下载

⑥：下载成功后，会输出 `SUCCESS` 提示

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q8b/xpcatapp_spi.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 烧录系统镜像

线刷系统到 UFS 相比 eMMC 需要多一步下载 UFS 配置文件步骤，eMMC 不需要该步骤。

#### 下载 UFS 配置文件

只有烧录系统到 UFS 模块才需要操作，烧录系统到 eMMC 模块跳过该步骤。

详细步骤如下：

① ： 选择 `UFS PROVISIONING` 选项

② ： 选择 `provision_ufs31.xml` 文件

③ ： 点击 `OK` 会自动完成 UFS 配置

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q8b/xpcatapp_ufs_provisioning.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip

选择 `provision_ufs31.xml` 文件时也需要确认 `Device Programmer` 选项自动加载了 `prog_firehose_ddr.elf` 文件，若没有则手动选择该文件。

:::

#### 烧录系统镜像

烧录 eMMC 系统到 eMMC 模块的区别和 UFS 系统到 UFS 模块的区别主要选择的系统镜像文件和存储类型不同。

详细步骤如下：示意图以 UFS 烧录系统为例

① ： 选择文件类型

② ： 选择系统镜像文件解压后的 `asic` 文件夹 -> eMMC 对应 `<path>\emmc\asic`，UFS 对应 `<path>\ufs\asic`

③ ： `Memory Type` 选项根据对应的存储模块进行选择 -> eMMC 对应 `MEMORY_TYPE_EMMC`，UFS 对应 `MEMORY_TYPE_UFS`

④ ：点击 `DOWNLOAD` 选项进行镜像烧录

⑤：下载成功后，会输出 `SUCCESS` 提示

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q8b/xpcatapp_ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
