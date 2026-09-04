---
sidebar_position: 9
---

# 40 Pin GPIO 接口

瑞莎 Dragon Q8B 板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q8b/q8b_gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
使用 40-Pin GPIO 接口时，请注意引脚和外设的接线，请确保引脚连接正确，不当操作可能导致设备硬件损坏。
:::

## GPIO 功能

Dragon Q8B 支持通过板载 GPIO 引脚连接外部设备，并支持 UART、SPI、I2C 等多种复用功能。

<TabItem value="Dragon Q8B">
     <div className='gpio_style' style={{ overflow :"auto"}} >
| Function4       | Function3     | Function2         | Function1      | Function0 | Pin#                             | Pin#                            | Function0 | Function1    | Function2         | Function3     |
|:---------------:|:-------------:|:-----------------:|:--------------:|:---------:|:--------------------------------:|:-------------------------------:|:---------:|:------------:|:-----------------:|:-------------:|
|                 |               |                   |                | 3V3       | <div className='yellow'>1</div>  | <div className='red'>2</div>    | 5V        |              |                   |               |
|                 | SPI9_MISO     | UART9_CTS         | I2C9_SDA       | GPIO_41   | <div className='green'>3</div>   | <div className='red'>4</div>    | 5V        |              |                   |               |
|                 | SPI9_MOSI     | UART9_RFR         | I2C9_SCL       | GPIO_42   | <div className='green'>5</div>   | <div className='black'>6</div>  | GND       |              |                   |               |
|                 |               |                   | SPI4_CS_3      | GPIO_175  | <div className='green'>7</div>   | <div className='green'>8</div>  | GPIO_63   | UART17_TX    |                   |               |
|                 |               |                   |                | GND       | <div className='black'>9</div>   | <div className='green'>10</div> | GPIO_64   | UART17_RX    |                   |               |
|                 | SPI4_CS_1     |                   | I2C5_SDA       | GPIO_111  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO_174  | UART4_RX     | SPI4_CS_0         |               |
| HS-UART18_CTS   | SPI18_MISO    | UART18_CTS        | I2C18_SDA      | GPIO_66   | <div className='green'>13</div>  | <div className='black'>14</div> | GND       |              |                   |               |
| HS-UART18_RFR   | SPI18_MOSI    | UART18_RFR        | I2C18_SCL      | GPIO_67   | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO_68   | UART18_TX    | SPI18_SCKL        | HS-UART18_TX  |
|                 |               |                   |                | 3.3V      | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO_110  |              |                   |               |
|                 | SPI20_MOSI    | UART20_RFR        | I2C20_SCL      | GPIO_88   | <div className='green'>19</div>  | <div className='black'>20</div> | GND       |              |                   |               |
|                 | SPI20_MISO    | UART20_CTS        | I2C20_SDA      | GPIO_87   | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO_92   | SPI20_CS_2   |                   |               |
|                 |               | SPI20_SCKL        | UART20_TX      | GPIO_89   | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO_90   | UART20_RX    | SPI20_CS_0        |               |
|                 |               |                   |                | GND       | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO_91   | SPI20_CS_1   |                   |               |
|                 | SPI9_SCKL     | UART9_TX          | I2C8_SDA       | GPIO_43   | <div className='blue'>27</div>   | <div className='blue'>28</div>  | GPIO_44   | I2C8_SCL     | UART9_RX          | SPI9_CS_0     |
|                 |               | SPI6_CS_0         | UART6_RX       | GPIO_157  | <div className='green'>29</div>  | <div className='black'>30</div> | GND       |              |                   |               |
|                 |               | SPI6_SCKL         | UART6_TX       | GPIO_156  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO_114  | CCI_I2C_SCL0 | GCC_GP2_CLK_MIRA  |               |
|                 |               | GCC_GP3_CLK_MRIA  | CCI_I2C_SDA1   | GPIO_115  | <div className='green'>33</div>  | <div className='black'>34</div> | GND       |              |                   |               |
|                 | SPI4_MISO     | UART4_CTS         | I2C4_SDA       | GPIO_171  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO_112  | I2C5_SCL     | SPI4_CS_2         |               |
|                 | HS-UART18_RX  | SPI18_CS_0        | UART18_RX      | GPIO_69   | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO_172  | I2C4_SCL     | UART4_RFR         | SPI4_MOSI     |
|                 |               |                   |                | GND       | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO_173  | UART4_TX     | SPI4_SCKL         |               |
   </div>
</TabItem>

## GPIO 使用

GPIO 控制器的设备编号和引脚偏移量可能随系统镜像或内核版本变化。控制 GPIO 前，请先确认当前系统中的 GPIO 控制器及对应引脚信息。

### 安装工具

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash
sudo apt update
sudo apt install -y gpiod python3-periphery
```

</NewCodeBlock>

### 确认 GPIO 控制器

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash
gpiodetect
gpioinfo
```

</NewCodeBlock>

根据命令输出确认目标 GPIO 所属的 `/dev/gpiochipN` 和 line offset 后，再通过 `libgpiod` 或 `python-periphery` 控制对应引脚。请勿直接套用其他主板的 GPIO 控制器编号和引脚偏移量。
