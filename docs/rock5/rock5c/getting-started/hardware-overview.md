---
sidebar_position: 5
---

# 硬件接口总览

## 实物照片

<img src="/img/rock5c/rock-5c-overview-new.webp" alt="rock 5c new overview" width="700" />

## 接口说明

<table>
  <tr>
    <th>编号</th>
    <th>接口名</th>
    <th>编号</th>
    <th>接口名</th>
    <th>编号</th>
    <th>接口名</th>
    <th>编号</th>
    <th>接口名</th>
    <th>编号</th>
    <th>接口名</th>
  </tr>
  <tr>
    <th>1</th>
    <th>用户自定义指示灯</th>
    <th>6</th>
    <th>MIPI DSI 屏接口</th>
    <th>11</th>
    <th>风扇座</th>
    <th>16</th>
    <th>外接电源预留</th>
    <th>21</th>
    <th>网络供电座</th>
  </tr>
  <tr>
    <th>2</th>
    <th>电源按键</th>
    <th>7</th>
    <th>40P GPIO排针</th>
    <th>12</th>
    <th>3.5 毫米耳机口</th>
    <th>17</th>
    <th>USB-C 5V 供电</th>
    <th>22</th>
    <th>eMMC 模块插座</th>
  </tr>
  <tr>
    <th>3</th>
    <th>电源指示灯</th>
    <th>8</th>
    <th>千兆以太网</th>
    <th>13</th>
    <th>Recovery 短接脚</th>
    <th>18</th>
    <th>核心主控芯片 RK3588S2 或者 RK3582</th>
    <th>23</th>
    <th>RTC 电池座(默认未焊接)</th>
  </tr>
  <tr>
    <th>4</th>
    <th>外置天线座</th>
    <th>9</th>
    <th>双层 USB 3.0 座(上面 OTG，下面 HOST)</th>
    <th>14</th>
    <th>Maskrom 短接脚</th>
    <th>19</th>
    <th>WIFI 6 / BT 5.4 芯片</th>
    <th>24</th>
    <th>MIPI CSI 摄像头接口</th>
  </tr>
  <tr>
    <th>5</th>
    <th>PCIe 扩展接口</th>
    <th>10</th>
    <th>双层 USB 2.0 座</th>
    <th>15</th>
    <th>HDMI 高清显示输出</th>
    <th>20</th>
    <th>LPDDR4x 内存 2 片</th>
    <th>25</th>
    <th>MicroSD 卡座</th>
  </tr>
</table>


## 特性

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">ROCK 5C 标准版</td>
        <td align="center">ROCK 5C Lite 版</td>
    </tr>
    <tr>
        <td align="center">处理器</td>
        <td align="center">瑞芯微 RK3588S2</td>
      <td align="center">瑞芯微 <strong>RK3582</strong></td>
    </tr>
    <tr>
        <td align="center">CPU</td>
      <td align="center">四核 Cortex-A76 主频最高达 2.4 GHz<br/>四核 Cortex-A55 主频最高达 1.8GHz</td>
      <td align="center"><strong>双核</strong> Cortex-A76 主频最高达 2.4 GHz<br/>四核 Cortex-A55 主频最高达 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td align="center"> Arm Mali‑G610MC4 </td>
      <td align="center"> <strong>无 GPU</strong> </td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td align="center">2/4/8/16/32GB 64位 LPDDR4x</td>
        <td align="center">1/2/4/8/16GB 64位 LPDDR4x</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center" colspan="2"> 1x eMMC 座子 <br/> 1x microSD 卡座 <br/> 无板载 SPI Flash，支持外接 SPI Flash 模块 </td>
    </tr>
    <tr>
        <td align="center">视频输出</td>
        <td align="center" colspan="2">1x HDMI 2.1 支持最高8K画面输出<br/>1x MIPI DSI 最高2K画面输出</td>
    </tr>
    <tr>
        <td align="center">多媒体</td>
        <td align="center">H.265 / VP9 8K@60fps 解码<br/>H.264 8K@30fps 解码<br/>AV1 4K@60fps 解码<br/>H.264 / H.265 8K@30fps 编码</td>
        <td align="center">H.264 / H.265 4K@60fps 编码</td>
    </tr>
    <tr>
        <td align="center">以太网</td>
        <td align="center" colspan="2">支持PoE 功能的千兆以太网口<br/>PoE 需要额外的 HAT</td>
    </tr>
    <tr>
        <td align="center">无线网</td>
        <td align="center" colspan="2">1x WiFi6 / BT5.4 带外部天线接口</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td align="center" colspan="2">2x USB2.0 端口<br/>1x USB3.0 Host 端口, 1x USB3.0 OTG 端口</td>
    </tr>
    <tr>
        <td align="center">摄像头</td>
        <td align="center" colspan="2"> 1x 4 通道 MIPI CSI 接口(支持 2x 2 通道 MIPI CSI 摄像头)</td>
    </tr>
    <tr>
        <td align="center">其他</td>
        <td align="center" colspan="2">40 针脚扩展座</td>
    </tr>
        <tr>
        <td align="center">供电</td>
        <td align="center" colspan="2">支持 5V</td>
    </tr>
        <tr>
        <td align="center">尺寸</td>
        <td align="center" colspan="2">86 x 56 mm</td>
    </tr>
</table>


## 系统框图

<img src="/img/rock5c/rock-5c-system-block-diagram.webp" alt="rock 5c system diagram" width="700" />

## 芯片框图

<Tabs queryString="target">
  <TabItem value="rk3588s2" label="RK3588S2">
  <img src="/img/rock5c/rk3588s2_blockdiagram.webp" alt="rock 5c overview" width="700" />
  </TabItem>
  <TabItem value="rk3582" label="RK3582">
  <img src="/img/rock5c/rk3582_blockdiagram.webp" alt="rock 5c lite overview" width="700" />
  </TabItem>
</Tabs>
