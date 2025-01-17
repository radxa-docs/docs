---
sidebar_position: 6
---

# 硬件接口说明

## 芯片框图

<img src="/img/o6/cd8180-block-diagram.webp" alt="cd8180 system diagram" width="700" />

## 系统框图

<img src="/img/o6/o6-system-block-diagram.webp" alt="o6 system diagram" width="700" />

# 主板布局

详细的 O6 <span id="o6-layout">主板布局</span>，带有编号标签如下：

![Orion O6 主板布局及组件标签](/img/o6/rs600_layout.webp)

| 编号 | 描述                       | 编号 | 描述                            | 编号 | 描述                               |
| ---- | -------------------------- | ---- | ------------------------------- | ---- | ---------------------------------- |
| ①    | [PCIe X16 插槽](#circle-1) | ⑩    | [双 USB 3.2](#circle-10)        | ⑲    | [ATX 电源连接器](#circle-19)       |
| ②    | [M.2 M 键](#circle-2)      | ⑪    | [双 USB 2.0](#circle-11)        | ⑳    | [F_USB 连接器](#circle-20)         |
| ③    | [M.2 E 键](#circle-3)      | ⑫    | [USB-C 端口](#circle-12)        | ㉑   | [F_Audio 连接器](#circle-21)       |
| ④    | [板载状态 LED](#circle-4)  | ⑬    | [电源按钮](#circle-13)          | ㉒   | [TP 连接器](#circle-22)            |
| ⑤    | [复位按钮](#circle-5)      | ⑭    | [风扇连接器](#circle-14)        | ㉓   | [F_Panel 前面板连接器](#circle-23) |
| ⑥    | [耳机插孔](#circle-6)      | ⑮    | [BIOS 闪存座](#circle-15)       | ㉔   | [调试连接器](#circle-24)           |
| ⑦    | [RJ45 以太网](#circle-7)   | ⑯    | [40 针 GPIO 连接器](#circle-16) | ㉕   | [eDP 连接器](#circle-25)           |
| ⑧    | [DP 端口](#circle-8)       | ⑰    | [CPU Cix CD8180](#circle-17)    | ㉖   | [RTC 电池座](#circle-26)           |
| ⑨    | [HDMI 端口](#circle-9)     | ⑱    | [LPDDR5 内存](#circle-18)       |      |                                    |

**组件列表**

## 背板

### <span id="circle-13">电源按钮</span> <span id="#o6-layout">⑬</span>

O6 主板包含一个专用的电源按钮，用于手动电源控制。

- **当操作系统正在运行时**：短按电源按钮会触发电源事件。根据操作系统的设置，此操作可能会显示电源菜单、启动关机或使系统进入挂起模式。
- **当操作系统已关闭时**：短按电源按钮可开启主板。
- **长按（4 秒）**：强制主板关闭电源。

### <span id="circle-12">USB-C 端口</span> [⑫](#o6-layout)

O6 上的双 USB-C 端口支持 **USB 3.2 Gen 2**（10Gbps）、**DP 替代模式**（4K@60Hz）和 **电源传输 (PD)**。

- 建议使用 **65W PD 电源（20V / 3.25A）** 从 USB-C 端口为 O6 供电。
- 任一 USB-C 端口都可为主板供电。如果同时连接了两个电源（例如，当使用两个具有 PD 功能的 USB-C 显示器时），第一个插入的 PD 电源将为主板供电。
- 每个 USB-C 端口可为外部 USB-C 设备提供高达 **3A** 的电流。

### <span id="circle-11">双 USB 2.0</span> [⑪](#o6-layout)

双层 USB 2.0 主机端口提供标准的 USB 支持。两个端口的总电流限制为 **1.4A**。

### <span id="circle-10">双 USB 3.2</span> [⑩](#o6-layout)

O6 上的双 USB 3.2 主机端口提供 **超高速 USB**（10Gbps）。每个端口的电流限制为 **1A**。

### <span id="circle-9">HDMI</span> [⑨](#o6-layout)

O6 上的 HDMI A 型端口支持的最大分辨率为 **4K@60Hz**。请注意，**HDMI CEC** 不受支持。

### <span id="circle-8">DP</span> [⑧](#o6-layout)

O6 上的显示端口 (DP) 支持的最大分辨率为 **4K@120Hz**，并提供 **2x MST（多流传输）** 功能。

### <span id="circle-7">双 5GbE</span> [⑦](#o6-layout)

双以太网端口提供高达 **5Gbps** 的有线连接。这些端口的 LED 指示灯描述如下：

### <span id="circle-6">耳机插孔</span> [⑥](#o6-layout)

O6 上的 **3.5mm 耳机插孔** 支持音频输入和输出。它可以驱动标准耳机，并兼容常用的环型配置。

### <span id="circle-5">复位按钮</span> [⑤](#o6-layout)

O6 配备了一个复位按钮用于系统复位。短按将重新启动系统。

## 内部组件

### <span id="circle-17">CPU - Cix CD8180</span> [⑰](#o6-layout)

O6 主板上的 CPU（Cix CD8180）直接焊接在主板上，不可更换。

### <span id="circle-18">DRAM</span> [⑱](#o6-layout)

O6 上的 DRAM 直接焊接在主板上，不可更换。它由四个 32 位 LPDDR5 芯片组合成一个 128 位内存总线，速度高达 **5500 MT/s**，总带宽为 **80 GB/s**。

### <span id="circle-1">PCIe X16 插槽</span> [①](#o6-layout)

O6 具有一个全尺寸 PCIe X16 插槽，支持 **PCIe Gen4 x8** 信号。此端口不支持 PCIe 分叉。

- 电源供应：
  - 使用 ATX 电源时：PCIe 插槽的最大功率为 **60W**。
  - 使用 USB-C PD 电源时：PCIe 插槽的最大功率为 **15W**。

### <span id="circle-2">M.2 M 键</span> [②](#o6-layout)

O6 上提供了一个 M.2 M 键连接器，支持 **2230**、**2242**、**2260** 和 **2280** 类型的 SSD。该连接器提供 **PCIe Gen4 x4** 信号。

- 电源供应：
  - **恒定功率**：**15W**
  - **峰值功率**：**28W**

### <span id="circle-3">M.2 E 键</span> [③](#o6-layout)

O6 上提供了一个 M.2 E 键连接器，支持 2230 WiFi/BT 卡。该连接器可提供 PCIe Gen4 x2 和 USB 2.0 信号。该连接器提供恒定 15W、峰值 28W 的功率。

### <span id="circle-4">板载 LED</span> [④](#o6-layout)

O6 主板上包含两个 LED：

- **绿色 LED**：指示电源状态。
- **蓝色 LED**：指示系统状态。
  - 当 BIOS 运行时，蓝色 LED 保持亮起。
  - 当操作系统运行时，蓝色 LED 闪烁以表示系统心跳。

### <span id="circle-14">风扇连接器</span> [⑭](#o6-layout)

O6 具有一个标准的 ATX 风扇连接器。引脚定义如下：

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_fan.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>2</td>
            <td>VCC12V</td>
            <td>电源（12V）</td>
          </tr>
          <tr>
            <td>3</td>
            <td>TACH</td>
            <td>转速计信号（风扇速度反馈）</td>
          </tr>
          <tr>
            <td>4</td>
            <td>PWM</td>
            <td>脉冲宽度调制控制信号（3.3V）</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**F\_面板连接器引脚图**

### <span id="circle-15">BIOS 闪存芯片座</span> [⑮](#o6-layout)

O6 主板包括一个 BIOS 闪存芯片座，供开发人员轻松拆卸或更换 BIOS 芯片。

- **芯片兼容性**：支持 SOP8 封装的闪存芯片。
- **芯片容量**：8MB（64Mbit）。
- **电压等级**：1.8V。

此功能通过允许方便地更换 BIOS 芯片，方便了固件开发和调试。

### <span id="circle-16">40 针 GPIO 连接器</span> [⑯](#o6-layout)

O6 主板上包含一个 40 针 GPIO 连接器，用于低速总线连接和通用输入/输出 (GPIO) 功能。

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_gpio.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>3.3 V</td>
            <td>电源（3.3V）</td>
          </tr>
          <tr>
            <td>2</td>
            <td>5V</td>
            <td>电源（5V）</td>
          </tr>
          <tr>
            <td>3</td>
            <td>SDA</td>
            <td>I2C 数据线（3.3V）</td>
          </tr>
          <tr>
            <td>4</td>
            <td>5V</td>
            <td>电源（5V）</td>
          </tr>
          <tr>
            <td>5</td>
            <td>SCL</td>
            <td>I2C 时钟线（3.3V）</td>
          </tr>
          <tr>
            <td>6</td>
            <td>UART3_TXD</td>
            <td>UART3 发送信号（3.3V）</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>8</td>
            <td>UART3_RXD</td>
            <td>UART3 接收信号（3.3V）</td>
          </tr>
          <tr>
            <td>9</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>10</td>
            <td>I2S4_SCK</td>
            <td>I2S4 串行时钟（3.3V）</td>
          </tr>
          <tr>
            <td>11</td>
            <td>GPIO_PWM</td>
            <td>具有 PWM 功能的 GPIO（3.3V）</td>
          </tr>
          <tr>
            <td>12</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>13</td>
            <td>GPIO_PWM</td>
            <td>具有 PWM 功能的 GPIO（3.3V）</td>
          </tr>
          <tr>
            <td>14</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>15</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>16</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>17</td>
            <td>3.3 V</td>
            <td>电源（3.3V）</td>
          </tr>
          <tr>
            <td>18</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>19</td>
            <td>SPI2_MOSI</td>
            <td>SPI2 主出从入信号（3.3V）</td>
          </tr>
          <tr>
            <td>20</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>21</td>
            <td>SPI2_MISO</td>
            <td>SPI2 主入从出信号（3.3V）</td>
          </tr>
          <tr>
            <td>22</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>23</td>
            <td>SPI2_CLK</td>
            <td>SPI2 时钟信号（3.3V）</td>
          </tr>
          <tr>
            <td>24</td>
            <td>SPI2_CS0</td>
            <td>SPI2 芯片选择 0（3.3V）</td>
          </tr>
          <tr>
            <td>25</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>26</td>
            <td>SPI2_CS1</td>
            <td>SPI2 芯片选择 1（3.3V）</td>
          </tr>
          <tr>
            <td>27</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>28</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>29</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>30</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>31</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>32</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>33</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>34</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>35</td>
            <td>I2S4_TWS</td>
            <td>I2S4 字选（3.3V）</td>
          </tr>
          <tr>
            <td>36</td>
            <td>I2S4_MCLK</td>
            <td>I2S4 主时钟（3.3V）</td>
          </tr>
          <tr>
            <td>37</td>
            <td>GPIO</td>
            <td>通用 I/O（3.3V）</td>
          </tr>
          <tr>
            <td>38</td>
            <td>I2S4_DATA_IN</td>
            <td>I2S4 数据输入（3.3V）</td>
          </tr>
          <tr>
            <td>39</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>40</td>
            <td>I2S4_DATA_OUT</td>
            <td>I2S4 数据输出（3.3V）</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**40 针 GPIO 引脚图**

### <span id="circle-19">ATX 电源连接器</span> [⑲](#o6-layout)

O6 主板上包含一个与 ATX 兼容的 24 针电源连接器，以实现标准的 ATX 电源兼容性。

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_atx_power.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>3</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>5</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>8</td>
            <td>PWR_OK</td>
            <td>电源正常信号（逻辑高电平：3.3V 或 5V）</td>
          </tr>
          <tr>
            <td>9</td>
            <td>5VSB</td>
            <td>备用电源（+5V，始终开启）</td>
          </tr>
          <tr>
            <td>10</td>
            <td>12V</td>
            <td>电源（+12V）</td>
          </tr>
          <tr>
            <td>11</td>
            <td>12V</td>
            <td>电源（+12V）</td>
          </tr>
          <tr>
            <td>13</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>14</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>15</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>16</td>
            <td>PS_ON</td>
            <td>电源开启（低电平有效信号）</td>
          </tr>
          <tr>
            <td>17</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>18</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>19</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>20</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>21</td>
            <td>NC</td>
          <td>未连接</td>
        </tr>
        <tr>
          <td>22</td>
          <td>NC</td>
          <td>未连接</td>
        </tr>
        <tr>
          <td>23</td>
          <td>NC</td>
          <td>未连接</td>
        </tr>
        <tr>
          <td>24</td>
          <td>GND</td>
          <td>接地连接</td>
        </tr>
      </tbody>
    </table>
  </td>
</tr>
</table>

**ATX 电源连接器引脚图**

### <span id="circle-20">F_USB 连接器</span> [⑳](#o6-layout)

O6 主板上的 F_USB 连接器旨在支持机箱的前面板 USB 功能。引脚配置如下：

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_f_usb.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>5V_1</td>
            <td>电源（+5V）</td>
          </tr>
          <tr>
            <td>2</td>
            <td>5V_2</td>
            <td>电源（+5V）</td>
          </tr>
          <tr>
            <td>3</td>
            <td>USB_DM_1</td>
            <td>USB 数据负信号</td>
          </tr>
          <tr>
            <td>4</td>
            <td>USB_DM_2</td>
            <td>USB 数据负信号</td>
          </tr>
          <tr>
            <td>5</td>
            <td>USB_DP_1</td>
            <td>USB 数据正信号</td>
          </tr>
          <tr>
            <td>6</td>
            <td>USB_DP_2</td>
            <td>USB 数据正信号</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>8</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>9</td>
            <td>/</td>
            <td>保留或未连接</td>
          </tr>
          <tr>
            <td>10</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**F_USB 连接器引脚图**

### <span id="circle-21">F\_音频连接器</span> [㉑](#o6-layout)

O6 主板上的 F_Audio 音频连接器旨在支持机箱的前面板音频功能。引脚配置如下：

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_f_audio.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>MIC_INL</td>
            <td>麦克风输入（左）</td>
          </tr>
          <tr>
            <td>2</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>3</td>
            <td>MIC_INR</td>
            <td>麦克风输入（右）</td>
          </tr>
          <tr>
            <td>4</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>5</td>
            <td>HP_OUT_R</td>
            <td>耳机输出（右）</td>
          </tr>
          <tr>
            <td>6</td>
            <td>FRONT_MIC_JD</td>
            <td>前面板麦克风插孔检测</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>8</td>
            <td>/</td>
            <td>保留或未连接</td>
          </tr>
          <tr>
            <td>9</td>
            <td>HP_OUT_L</td>
            <td>耳机输出（左）</td>
          </tr>
          <tr>
            <td>10</td>
            <td>FRONT_HP_JD</td>
            <td>前面板耳机插孔检测</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**F\_音频连接器引脚图**

### <span id="circle-22">TP 连接器</span> [㉒](#o6-layout)

O6 主板上的 TP 连接器用于实现触摸面板集成。与 eDP 连接器结合使用，可为连接触摸屏提供直接接口。

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_tp.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Reset</td>
            <td>触摸控制器的复位信号（3.3V）</td>
          </tr>
          <tr>
            <td>2</td>
            <td>VCC</td>
            <td>触摸面板电源（3.3V）</td>
          </tr>
          <tr>
            <td>3</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>4</td>
            <td>EINT</td>
            <td>外部中断信号（3.3V）</td>
          </tr>
          <tr>
            <td>5</td>
            <td>SDA</td>
            <td>用于触摸通信的 I2C 数据线（3.3V）</td>
          </tr>
          <tr>
            <td>6</td>
            <td>SCL</td>
            <td>用于触摸通信的 I2C 时钟线（3.3V）</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>8</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**触摸面板连接器引脚图**

### <span id="circle-23">F_Panel 前面板连接器</span> [㉓](#o6-layout)

O6 主板上的 F_Panel 前面板连接器用于支持机箱的前面板电源按钮、复位按钮和 LED 功能。引脚配置如下：

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_f_panel.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>SSD_LED+</td>
            <td>固态硬盘 (SSD) 活动 LED（+）</td>
          </tr>
          <tr>
            <td>2</td>
            <td>PWR_LED+</td>
            <td>电源 LED（+）</td>
          </tr>
          <tr>
            <td>3</td>
            <td>SSD_LED-</td>
            <td>SSD 活动 LED（-）</td>
          </tr>
          <tr>
            <td>4</td>
            <td>PWR_LED-</td>
            <td>电源 LED（-）</td>
          </tr>
          <tr>
            <td>5</td>
            <td>RESET-</td>
            <td>复位开关（-）</td>
          </tr>
          <tr>
            <td>6</td>
            <td>PWR_ON</td>
            <td>电源开启信号</td>
          </tr>
          <tr>
            <td>7</td>
            <td>RESET+</td>
            <td>复位开关（+）</td>
          </tr>
          <tr>
            <td>8</td>
            <td>PWR_GND</td>
            <td>电源接地</td>
          </tr>
          <tr>
            <td>9</td>
            <td>RSV(5V)</td>
            <td>保留引脚（5V 电源）</td>
          </tr>
          <tr>
            <td>10</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**F_Panel 前面板连接器引脚图**

### <span id="circle-24">调试连接器</span> [㉔](#o6-layout)

O6 主板上包含四个专用的 UART 接口，用于各种调试目的。此外，还提供了一个 EC UART 用于 EC 串行控制台。

- **UART2**：BIOS 和操作系统调试日志
- **UART4**：电源管理、电压和频率监控
- **UART5**：安全 BootROM 调试日志
- **EC UART**：板载嵌入式控制器调试日志

UART 引脚配置如下：

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_uart.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th colspan="3">UART_x 引脚图</th>
          </tr>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
          <tr>
            <td>2</td>
            <td>UART_TX</td>
            <td>UART 发送信号（3.3V）</td>
          </tr>
          <tr>
            <td>3</td>
            <td>UART_RX</td>
            <td>UART 接收信号（3.3V）</td>
          </tr>
        </tbody>
      </table>
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th colspan="3">BOOT 引脚图</th>
          </tr>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>BOOT_STRAP</td>
            <td>引导引脚</td>
          </tr>
          <tr>
            <td>2</td>
            <td>GND</td>
            <td>接地连接</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**调试连接器引脚图**

### <span id="circle-25">eDP 连接器</span> [㉕](#o6-layout)

O6 主板上包含一个 40 针 eDP 连接器，用于直接连接 eDP 面板，支持高达 **4K@60Hz** 的分辨率。该连接器采用 **IPEX 40 针，0.5mm 间距** 设计。eDP 连接器提供的最大输出功率为 **12V / 2A**。

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_eDP.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>引脚</th>
            <th>名称</th>
            <th>描述</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>2</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>3</td>
            <td>3N</td>
            <td>eDP 通道 3 负信号</td>
          </tr>
          <tr>
            <td>4</td>
            <td>3P</td>
            <td>eDP 通道 3 正信号</td>
          </tr>
          <tr>
            <td>5</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>6</td>
            <td>2N</td>
            <td>eDP 通道 2 负信号</td>
          </tr>
          <tr>
            <td>7</td>
            <td>2P</td>
            <td>eDP 通道 2 正信号</td>
          </tr>
          <tr>
            <td>8</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>9</td>
            <td>1N</td>
            <td>eDP 通道 1 负信号</td>
          </tr>
          <tr>
            <td>10</td>
            <td>1P</td>
            <td>eDP 通道 1 正信号</td>
          </tr>
          <tr>
            <td>11</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>12</td>
            <td>0N</td>
            <td>eDP 通道 0 负信号</td>
          </tr>
          <tr>
            <td>13</td>
            <td>0P</td>
            <td>eDP 通道 0 正信号</td>
          </tr>
          <tr>
            <td>14</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>15</td>
            <td>AUXP</td>
            <td>eDP 辅助通道正</td>
          </tr>
          <tr>
            <td>16</td>
            <td>AUXN</td>
            <td>eDP 辅助通道负</td>
          </tr>
          <tr>
            <td>17</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>18</td>
            <td>VDD1</td>
            <td>电源（+3.3V）</td>
          </tr>
          <tr>
            <td>19</td>
            <td>VDD2</td>
            <td>电源（+3.3V）</td>
          </tr>
          <tr>
            <td>20</td>
            <td>VDD3</td>
            <td>电源（+3.3V）</td>
          </tr>
          <tr>
            <td>21</td>
            <td>VDD4</td>
            <td>电源（+3.3V）</td>
          </tr>
          <tr>
            <td>22</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>23</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>24</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>25</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>26</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>27</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>28</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>29</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>30</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>31</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
          <tr>
            <td>32</td>
            <td>BL_EN</td>
            <td>背光使能信号</td>
          </tr>
          <tr>
            <td>33</td>
            <td>PWM</td>
            <td>用于背光控制的 PWM 信号</td>
          </tr>
          <tr>
            <td>34</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>35</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>36</td>
            <td>VBL1</td>
            <td>背光电源</td>
          </tr>
          <tr>
            <td>37</td>
            <td>VBL2</td>
            <td>背光电源</td>
          </tr>
          <tr>
            <td>38</td>
            <td>VBL3</td>
            <td>背光电源</td>
          </tr>
          <tr>
            <td>39</td>
            <td>VBL4</td>
            <td>背光电源</td>
          </tr>
          <tr>
            <td>40</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>41</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>42</td>
            <td>NC</td>
            <td>未连接</td>
          </tr>
          <tr>
            <td>43</td>
            <td>GND</td>
            <td>接地</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**eDP 连接器引脚图**

### <span id="circle-26">RTC 电池座</span> [㉖](#o6-layout)

O6 主板上的 RTC 电池座用于安装 **CR1220 电池**，提供计时功能。请注意，取下 RTC 电池不会清除 BIOS 设置。
