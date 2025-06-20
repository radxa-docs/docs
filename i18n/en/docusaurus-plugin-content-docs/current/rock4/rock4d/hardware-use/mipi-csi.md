---
sidebar_position: 7
---

# MIPI CSI Interface

The Radxa ROCK 4D features two onboard MIPI CSI interfaces for connecting camera modules.

The two MIPI CSI interfaces include a 4-lane (4-channel) MIPI CSI and a 2-lane (2-channel) MIPI CSI. The 4-lane MIPI CSI interface supports higher resolution camera modules, allowing users to choose based on their specific requirements.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-mipi-csi-2l.webp" style={{width: '100%', maxWidth: '1200px'}} alt="ROCK 4D 2-lane MIPI CSI Interface" />
  <img src="/img/rock4/4d/rock4d-mipi-csi-4l.webp" style={{width: '100%', maxWidth: '1200px'}} alt="ROCK 4D 4-lane MIPI CSI Interface" />
</div>

## Supported Cameras

Camera module compatibility is currently being tested. A list of supported camera modules will be updated in the future.

## Interface Specifications

:::tip
For detailed interface specifications, please refer to the [Hardware Design: Schematics](../download) in the download section.
:::

<Tabs queryString="camera-mode">

<TabItem value="4-lane MIPI CSI">

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
