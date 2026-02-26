---
sidebar_position: 2
---

# 擦除/烧录 SPI 启动固件

主要介绍如何使用 RKRKDevTool 工具擦除和烧录 SPI 启动固件。

:::tip
瑞莎 ROCK 4D 出厂默认下载 Linux 系统对应的 SPI 启动固件到 SPI Flash；若你不使用 Android 系统，可以不进行 SPI Flash 擦除和烧录操作。
:::

## SPI 启动固件说明

SPI启动固件（BootROM + 引导程序）的核心任务是分阶段初始化硬件（CPU → 内存 → 存储），最终通过存储设备加载操作系统内核。

## 擦除 SPI 启动固件

:::danger
擦除 SPI 启动固件操作会擦除 SPI Flash 中的 SPI 启动固件，擦除后 SPI Flash 中的数据将被清空，系统将无法启动。
:::

我们需要让 ROCK 4D 处于 Maskrom 模式，然后使用 RKDevTool 工具进行 SPI Flash 擦除操作，用户可以先参考 [RKDevTool 使用](./tool_rkdevtool) 教程进行 RKDevTool 工具的安装和使用。

<Tabs queryString="platform">

<TabItem value="Windows">

① : 确保 ROCK 4D 处于 Maskrom 模式，可以参考 [Maskrom 按键](../hardware-use/maskrom) 教程。

② : 选择 ROCK 4D 对应的 Loader 文件，可以去 [资源汇总下载](../download) 下载 Loader 文件。

③ : 点击 `Download` 选项，运行 Loader 文件。

④ : 选择 `SPINOR` 选项。

⑤ : 选择 `Switch Storage` 选项切换存储。

⑥ : 选择 `Erase ALL` 选项擦除 SPI Flash。

⑦ : 可以通过该界面观察操作进度。

重启系统，擦除 SPI Flash 的操作生效。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rk-earse-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux / MacOS">

1. 确保 ROCK 4D 处于 Maskrom 模式，可以参考 [Maskrom 按键](../hardware-use/maskrom) 教程。

2. 验证 Maskrom 模式

使用 rkdeveloptool ld 命令查看识别到的设备信息：

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：说明识别到一个 Maskrom 设备

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. 运行 Loader 文件

你需要将 `demo.bin` 换成 ROCK 4D 对应的 Loader 文件，可以去 [资源汇总下载](../download) 下载 Loader 文件。

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool db  demo.bin
```
</NewCodeBlock>

4. 擦除 SPI Flash

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool ef
```
</NewCodeBlock>

5. 重启系统，擦除 SPI Flash 的操作生效

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>

## 烧录 SPI 启动固件

使用 RKDevTool 工具烧录 SPI 启动固件。

<Tabs queryString="platform">

<TabItem value="Windows">

① 确认 ROCK 4D 处于 Maskrom 模式，可以参考 [Maskrom 按键](../hardware-use/maskrom) 教程。

② 选择 ROCK 4D 对应的 Loader 文件，可以去 [资源汇总下载](../download) 下载 Loader 文件。

③ 选择对应存储设备，我们这里选择 `SPINOR` 选项。

④ 选择你需要烧录进去 SPI Flash 的 `spi.img` 文件。

⑤ 勾选 `Write by Address` 选项。

⑥ 点击 `RUN` 选项执行所有操作。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rk-down-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux / MacOS">

1. 确保 ROCK 4D 处于 Maskrom 模式，可以参考 [Maskrom 按键](../hardware-use/maskrom) 教程。

2. 验证 Maskrom 模式

使用 rkdeveloptool ld 命令查看识别到的设备信息：

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：说明识别到一个 Maskrom 设备

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. 运行 Loader 文件

你需要将 `demo.bin` 换成 ROCK 4D 对应的 Loader 文件，可以去 [资源汇总下载](../download) 下载 Loader 文件。

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool db  demo.bin
```
</NewCodeBlock>

4. 烧录 SPI 启动固件

你需要将 `spi.img` 换成 ROCK 4D 对应的 SPI 启动固件，可以去 [资源汇总下载](../download) 下载 SPI 启动固件。

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool wl 0 spi.img
```
</NewCodeBlock>

5. 重启系统，烧录 SPI Flash 的操作生效

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>
