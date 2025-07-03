---
sidebar_position: 2
---

# eMMC / UFS 模块接口

瑞莎 Cubie A7A 板载 eMMC / UFS 二合一模块接口，支持安装 eMMC 或 UFS 模块，可以用于系统启动盘或扩展存储空间。

## 使用指南

eMMC 模块适用于小容量存储（8-128GB）, UFS 模块适用于大容量存储（64GB-1TB）。

- 拓展存储空间

您可以直接将 eMMC 或 UFS 模块安装到 eMMC / UFS 二合一模块接口上，然后启动系统，使用 `lsblk` 命令查看 eMMC 或 UFS 模块是否被识别。

- 作为系统启动盘

eMMC 模块作为系统启动盘使用：可以参考 [安装系统到 eMMC 模块](../getting-started/install-system/emmc-system/) 教程。

UFS 模块作为系统启动盘使用：可以参考 [安装系统到 UFS 模块](../getting-started/install-system/ufs-system/) 教程。

<Tabs queryString="boot_system">

<TabItem value="eMMC 模块">

将 eMMC 模块插入 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-emmc-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="UFS 模块">

将 UFS 模块插入 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-ufs-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>
</Tabs>

:::caution
eMMC / UFS 模块安装步骤：

1. 确保 eMMC / UFS 模块的缺角和 Cubie A7A 的 eMMC / UFS 模块接口方向一致
2. 确保 eMMC / UFS 模块底部卡槽接口和 Cubie A7A 的 eMMC / UFS 模块接口对齐
3. 轻微用力按压 eMMC / UFS 模块一端的接口，听到"滴"的声音说明安装成功，同样的方法按压另一端的接口，确保 eMMC / UFS 模块安装成功。
   :::

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name            | Pin# | Name     | Pin# | Name          | Pin# | Name      |
| :--: | :-------------- | :--: | :------- | :--: | :------------ | :--: | :-------- |
|  1   | GND             |  17  | GND      |  33  | EMMC-D6       |  49  | GND       |
|  2   | EMMC-D5         |  18  | GND      |  34  | GND           |  50  | GND       |
|  3   | GND             |  19  | GND      |  35  | GND           |  51  | UFS-VCCQ  |
|  4   | EMMC-D4         |  20  | VCC-PC   |  36  | UFS-TX0-P     |  52  | UFS-VCCQ  |
|  5   | GND             |  21  | VCC-PC   |  37  | UFS-TX0-N     |  53  | UFS-VCCQ2 |
|  6   | EMMC-D0         |  22  | VCC-EMMC |  38  | GND           |  54  | UFS-VCCQ2 |
|  7   | GND             |  23  | VCC-EMMC |  39  | UFS-TX1-P     |  55  | VCC-UFS   |
|  8   | EMMC-CLK        |  24  | GND      |  40  | UFS-TX1-N     |  56  | VCC-UFS   |
|  9   | GND             |  25  | EMMC-CMD |  41  | GND           |  57  | UFS-RST-N |
|  10  | EMMC-D3         |  26  | GND      |  42  | AP-UFS-CLKOUT |  58  | GND       |
|  11  | GND             |  27  | EMMC-D2  |  43  | GND           |  59  | UFS-RX1-N |
|  12  | EMMC-RST/VCC-PC |  28  | GND      |  44  | NC            |  60  | UFS-RX1-P |
|  13  | GND             |  29  | EMMC-D1  |  45  | NC            |  61  | GND       |
|  14  | GND             |  30  | GND      |  46  | UFS-PLUG      |  62  | UFS-RX0-N |
|  15  | EMMC-DS         |  31  | EMMC-D7  |  47  | NC            |  63  | UFS-RX0-P |
|  16  | EMMC-PLUG       |  32  | GND      |  48  | NC            |  64  | GND       |
