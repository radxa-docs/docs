---
sidebar_position: 7
---

# MIPI CSI 接口

瑞莎 ROCK 4D 板载 两个MIPI CSI 接口，我们可以通过 MIPI CSI 接口连接摄像头。

其中两个 MIPI CSI 接口规格分别是 4-lane(4 通道)MIPI CSI 和 2-lane(2 通道) MIPI CSI，4-lane MIPI CSI 接口支持更高分辨率的摄像头模块，用户可以根据实际需求选择使用。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-mipi-csi-2l.webp" style={{width: '100%', maxWidth: '1200px'}} />
  <img src="/img/rock4/4d/rock4d-mipi-csi-4l.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 支持列表

| 主板    | CSI 摄像头                                                              | 说明             |
| ------- | ----------------------------------------------------------------------- | ---------------- |
| ROCK 4D | [Camera 4K](https://radxa.com/products/accessories/camera4k)            |                  |
| ROCK 4D | [Camera 13M 214](https://radxa.com/products/accessories/camera-13m-214) | 彩色预览效果较差 |
| ROCK 4D | [Camera 8M 219](https://radxa.com/products/accessories/camera-8m-219)   | 彩色预览效果较差 |

## 硬件连接

使用主板的 MIPI CSI 接口连接摄像头，连接方式如下：以 4-lane MIPI CSI 接口连接 Camera 4K 为例

①： 连接主板的 MIPI CSI 接口，金手指（金属接触点）朝向主板方向

②： 连接摄像头的接口，金手指（金属接触点）朝向摄像头方向

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-mipi-csi.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Camera 4K MIPI CSI Interface" />
</div>

## 软件使能

在终端命令行输入 `rsetup` 命令，使用 Rsetup 工具设置摄像头选项。

<NewCodeBlock tip="radxa@device$" type="device">

```
rsetup
```

</NewCodeBlock>

1. 通过方向键选择 Overlays 选项，然后按回车键确认选择。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/rsetup-overlays.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

2. 通过方向键选择 Manage overlays 选项，然后按回车键确认选择。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/rsetup-overlays-manage.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

3. 通过方向键选择对应的 Camera 选项，按空格键并出现 `*` 代表启用该功能，然后回车键确认选择。

4. 重启系统，配置生效。

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

<Tabs queryString="camera-mode">

<TabItem value="4-lane MIPI CSI">

- 4-lane MIPI CSI 接口规格
  - 型号：FH35C-31S-0.3SHW（50）
  - 引脚间距：0.3mm
  - 引脚数：31 Pin

| Pin# | Name                   | Pin# | Name                      | Pin# | Name                  |
| :--: | :--------------------- | :--: | :------------------------ | :--: | :-------------------- |
|  1   | GND                    |  12  | MIPI_DPHY_CSI1_RX_D1P     |  23  | MIPI_CSI0_PDN1_H      |
|  2   | MIPI_DPHY_CSI1_RX_D3N  |  13  | GND                       |  24  | I2C5_SCL_M3_MIPI_CSI1 |
|  3   | MIPI_DPHY_CSI1_RX_D3P  |  14  | MIPI_DPHY_CSI1_RX_D0N     |  25  | I2C5_SDA_M3_MIPI_CSI1 |
|  4   | GND                    |  15  | MIPI_DPHY_CSI1_RX_D0P     |  26  | MIPI_CSI0_PDN2_H      |
|  5   | MIPI_DPHY_CSI1_RX_D2N  |  16  | GND                       |  27  | CAM1_RST_L            |
|  6   | MIPI_DPHY_CSI1_RX_D2P  |  17  | MIPI_DPHY_CSI1_CLKN       |  28  | VCC_3V3_S0            |
|  7   | GND                    |  18  | MIPI_DPHY_CSI1_CLKP       |  29  | VCC_3V3_S0            |
|  8   | MIPI_DPHY_CSI2_RX_CLKN |  19  | GND                       |  30  | VCC5V0_DEVICE_S0      |
|  9   | MIPI_DPHY_CSI2_RX_CLKP |  20  | MIPI_DPHY_CSI1_CAM_CLKOUT |  31  | VCC5V0_DEVICE_S0      |
|  10  | GND                    |  21  | GND                       |  32  | GND                   |
|  11  | MIPI_DPHY_CSI1_RX_D1N  |  22  | MIPI_DPHY_CSI0_CAM_CLKOUT |  33  | GND                   |

</TabItem>

<TabItem value="2-lane MIPI CSI">

- 2-lane MIPI CSI 接口规格
  - 型号：FPC1030-15S-TAG
  - 引脚间距：1 mm
  - 引脚数：15 Pin

| Pin# | Name                      | Pin# | Name                    | Pin# | Name                  |
| :--: | :------------------------ | :--: | :---------------------- | :--: | :-------------------- |
|  1   | VCC_3V3_S0                |  11  | GND                     |  21  | MIPI_DPHY_CSI0_RX_D1N |
|  2   | NC                        |  12  | NC                      |  22  | NC                    |
|  3   | I2C4_SDA_M3_MIPI_CSI0     |  13  | MIPI_DPHY_CS0_RX_CLK0P  |  23  | GND                   |
|  4   | NC                        |  14  | NC                      |  24  | NC                    |
|  5   | I2C4_SCL_M3_MIPI_CSI0     |  15  | MIPI_DPHY_CSI0_RX_CLK0N |  25  | MIPI_DPHY_CSI0_RX_D0P |
|  6   | NC                        |  16  | NC                      |  26  | NC                    |
|  7   | MIPI_DPHY_CSI3_CAM_CLKOUT |  17  | GND                     |  27  | MIPI_DPHY_CSI0_RX_D0N |
|  8   | NC                        |  18  | NC                      |  28  | NC                    |
|  9   | MIPI_CS1_PDN3_H           |  19  | MIPI_DPHY_CSI0_RX_D1P   |  29  | GND                   |
|  10  | NC                        |  20  | NC                      |  30  | NC                    |

</TabItem>

</Tabs>
