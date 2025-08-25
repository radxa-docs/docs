---
sidebar_position: 1
---

# MicroSD 卡槽

瑞莎 ROCK 4D 板载标准的 MicroSD 卡槽，兼容 MicroSD / MicroSDHC / MicroSDXC 卡，主要用作系统启动盘或扩展存储空间。

推荐使用容量 32GB 及以上的 MicroSD 卡，以获得更好的存储空间。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-microsd-slot.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

## 使用指南

您可以参考 [快速上手](../getting-started/quickly_start) 或 [安装系统到 MicroSD 卡](../getting-started/install-system/boot_sd) 教程，将系统镜像安装到 MicroSD 卡中，然后将 MicroSD 卡插入 MicroSD 卡槽中，测试启动系统是否正常。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-sd.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name                  | Pin# | Name         | Pin# | Name |
| :--: | :-------------------- | :--: | :----------- | :--: | :--- |
|  1   | SDMMC0_D2/JTAG_TCK_M0 |  7   | SDMMC0_D0    |  13  | GND  |
|  2   | SDMMC0_D3/JTAG_TMS_M0 |  8   | SDMMC0_D1    |  14  | GND  |
|  3   | SDMMC0_CMD            |  9   | SDMMC0_DET_L |  15  | GND  |
|  4   | VCC_3V3_S3            |  10  | GND          |  16  | GND  |
|  5   | SDMMC0_CLK            |  11  | GND          |  17  | GND  |
|  6   | GND                   |  12  | GND          |  18  | GND  |
