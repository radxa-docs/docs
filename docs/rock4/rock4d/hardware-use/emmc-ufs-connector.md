---
sidebar_position: 2
---

# eMMC / UFS 模块接口

瑞莎 ROCK 4D 板载 eMMC / UFS 二合一模块接口，支持安装 eMMC / UFS 模块，可以用于系统启动盘或扩展存储空间。

:::tip
由于 ROCK 4D 出厂默认贴 SPI Nor Flash，所以无法使用 eMMC 模块，教程只介绍使用 UFS 模块
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-ufs-emmc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

eMMC 模块适用于小容量存储（8-128GB）, UFS 模块适用于大容量存储（64GB-1TB）。

- 拓展存储空间

您可以直接将 UFS 模块安装到 eMMC / UFS 模块接口上，然后启动系统，使用 `lsblk` 命令查看 UFS 模块是否被识别。

- 作为系统启动盘

您可以参考 [安装系统到 UFS 模块](../getting-started/install-system/ufs-system) 教程，将系统镜像安装到 UFS 模块中，然后将 UFS 模块插入 eMMC / UFS 模块接口上，测试启动系统是否正常。

ROCK 4D 推荐搭配我们的 [瑞莎 UFS 模块](https://radxa.com/products/accessories/ufs-module) 使用。

:::caution
UFS 模块安装步骤：

1. 确保 UFS 模块的缺角和 ROCK 4D 的 eMMC / UFS 模块接口方向一致
2. 确保 UFS 模块底部卡槽接口和 ROCK 4D 的 eMMC / UFS 模块接口对齐
3. 轻微用力按压 UFS 模块一端的接口，听到滴的声音说明安装成功，同样的方法按压另一端的接口，确保 UFS 模块安装成功。

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name                   | Pin# | Name                  | Pin# | Name               | Pin# | Name                |
| :--: | :--------------------- | :--: | :-------------------- | :--: | :----------------- | :--: | :------------------ |
|  1   | GND                    |  17  | GND                   |  33  | FSPI0_D6 / EMMC_D6 |  49  | GND                 |
|  2   | FSPI0_D5 / EMMC_D5     |  18  | GND                   |  34  | GND                |  50  | GND                 |
|  3   | GND                    |  19  | GND                   |  35  | GND                |  51  | VCC1V2_UFS_VCCQ_S0  |
|  4   | FSPI0_D4 / EMMC_D4     |  20  | VCCIO_FLASH           |  36  | UFS_TX_D0P         |  52  | VCC1V2_UFS_VCCQ_S0  |
|  5   | GND                    |  21  | VCCIO_FLASH           |  37  | UFS_TX_D0N         |  53  | VCC1V8_UFS_VCCQ2_S0 |
|  6   | FSPI0_D0 / EMMC_D0     |  22  | VCC_3V3_S3            |  38  | GND                |  54  | VCC1V8_UFS_VCCQ2_S0 |
|  7   | GND                    |  23  | VCC_3V3_S3            |  39  | UFS_TX_D1P         |  55  | VCC_UFS_S0          |
|  8   | FSPI0_CLK / EMMC_CLK   |  24  | GND                   |  40  | UFS_TX_D1N         |  56  | VCC_UFS_S0          |
|  9   | GND                    |  25  | FSPI0_RSTN / EMMC_CMD |  41  | GND                |  57  | UFS_RSTn            |
|  10  | FSPI0_D3 / EMMC_D3     |  26  | GND                   |  42  | UFS_REFCLK         |  58  | GND                 |
|  11  | GND                    |  27  | FSPI0_D2 / EMMC_D2    |  43  | GND                |  59  | UFS_RX_D1N          |
|  12  | FSPI0_CSNO / EMMC_RSTN |  28  | GND                   |  44  | NC                 |  60  | UFS_RX_D1P          |
|  13  | GND                    |  29  | FSPI0_D1 / EMMC_D1    |  45  | NC                 |  61  | GND                 |
|  14  | GND                    |  30  | GND                   |  46  | UFS_PLUG           |  62  | UFS_RX_D0N          |
|  15  | FSPI0_DQS / EMMC_STRB  |  31  | FSPI0_D7 / EMMC_D7    |  47  | NC                 |  63  | UFS_RX_D0P          |
|  16  | GND                    |  32  | GND                   |  48  | NC                 |  64  | GND                 |
