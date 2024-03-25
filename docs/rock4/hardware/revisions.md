---
sidebar_position: 20
---

# 改版详情

您可以在此查询 ROCK 4 系列主板不同硬件版本之间的差异。

<Tabs queryString="model">
<TabItem value="ROCK_4SE" label="ROCK 4SE">

- **V1.53:**  
  初始版本。

</TabItem>
<TabItem value="ROCK_4C_Plus" label="ROCK 4C+">

- **V1.4:**  
  移除 M.2 连接座。

- **V1.2:**  
  初始版本。

</TabItem>
<TabItem value="ROCK_4AB_Plus" label="ROCK 4A/B+">

- **V1.73:**  
  优化耳机插孔的生产尺寸以便于生产。
  **_<font color='red'>2022-08-05 之后生产的电路板将不贴 SPI。这包括未来的修订版。</font>_**

- **V1.72:**  
  以太网 phy 由 RTL8211E 更改为 RLT8211F（无需更改软件）。
  QC/PD 协议触发芯片更改为 CH224D。

- **V1.6:**  
  初始版本。

</TabItem>
<TabItem value="ROCK_4AB" label="ROCK 4A/B">

- **V1.5:**  
  以太网 phy 芯片从 RTL8211E 更改为 RLT8211F（无需更改软件）。  
  更改耳机检测电路，默认使用耳机插孔中的麦克风。  
  QC/PD 协议触发芯片更改为 CH224D。

- **V1.4:**  
  将 USB 3.0 OTG 的 Device/Host 标签更改为简单的 L/H。  
  增加外置 Wi-Fi 天线选项。  
  将耳机脚位改为通孔脚位。  
  将用户状态 LED 指示灯从红色改为蓝色。  
  默认贴 4MB（32Mbit）SPI 闪存，以便将来支持 SPI 启动。

- **V1.3:**  
  使用 Type-C 接口供电，增加了 QC&PD 触发 IC。  
  LPDDR4 1/2/4GB内存。  
  使用兼容 odroid 的 eMMC 插槽作为存储设备。  
  板载 Wi-Fi 天线。

</TabItem>
<TabItem value="ROCK_4C" label="ROCK 4C">

- **V1.2:**  
  改用更紧凑的 micro HDMI 接口。

</TabItem>
</Tabs>
