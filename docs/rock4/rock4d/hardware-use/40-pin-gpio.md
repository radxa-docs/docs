---
sidebar_position: 4
---

# 40 Pin GPIO 接口

Radxa ROCK 4D 板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-40-pin-gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
使用 40-Pin GPIO 接口时，请注意引脚和外设的接线，请确保引脚连接正确，不当操作可能导致设备硬件损坏。
:::

## GPIO 功能

ROCK 4D 支持给板载的 GPIO 引脚外接外部设备，支持 UART、SPI、I2C、I2S、PWM、CAN、ADC 等。

<TabItem value="ROCK 4D">
     <div className='gpio_style' style={{ overflow :"auto"}} >

|   Function7   |  Function6   |  Function5  |  Function4   |  Function3  |   Function2   | Function1  |               Pin#               |              Pin#               | Function1  |     Function2     |   Function3    |  Function4   |  Function5  |  Function6   |   Function7   |
| :-----------: | :----------: | :---------: | :----------: | :---------: | :-----------: | :--------: | :------------------------------: | :-----------------------------: | :--------: | :---------------: | :------------: | :----------: | :---------: | :----------: | :-----------: |
|               |              |             |              |             |               |    3V3     | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |     5V     |                   |                |              |             |              |               |
|               | PDM0_SDI1_M2 |             |              | I2C8_SDA_M1 |  UART2_RX_M0  | GPIO1_C7_d |  <div className='green'>3</div>  |  <div className='red'>4</div>   |     5V     |                   |                |              |             |              |               |
|               | PDM0_SDI0_M2 |             |              | I2C8_SCL_M1 |  UART2_TX_M0  | GPIO1_C6_d |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND     |                   |                |              |             |              |               |
|               |              |             | SPI2_CSN0_M1 | I2C6_SDA_M1 | UART4_CTSN_M1 | GPIO1_C3_u |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_D4_u | UART0_TX_M0_DEBUG |                |              |             |              |               |
|               |              |             |              |             |               |    GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_D5_u | UART0_RX_M0_DEBUG |                |              |             |              |               |
| UART2_RTSN_M0 |              |             | SPI2_MOSI_M1 |             |  UART4_TX_M1  | GPIO1_C4_d | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO1_D1_d |   UART10_RX_M1    | I3C0_SDA_PU_M1 |              |             | SAI2_SCLK_M0 |               |
|               |              | PWM1_CH0_M2 |              |             |               | GPIO2_C0_d | <div className='green'>13</div>  | <div className='black'>14</div> |    GND     |                   |                |              |             |              |               |
| UART2_CTSN_M0 |              |             | SPI2_MISO_M1 |             |  UART4_RX_M1  | GPIO1_C5_d | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO2_B6_d |    UART7_TX_M0    |  I2C8_SCL_M2   |              |             |              |               |
|               |              |             |              |             |               |    3V3     | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO2_B7_d |    UART7_RX_M0    |  I2C8_SDA_M2   |              |             |              |               |
|               | SAI3_LRCK_M1 | PWM1_CH1_M1 | SPI1_MOSI_M0 | I2C9_SCL_M1 |               | GPIO1_B5_d | <div className='green'>19</div>  | <div className='black'>20</div> |    GND     |                   |                |              |             |              |               |
|               | SAI3_SDO_M1  |             | SPI1_MISO_M0 |             | UART3_CTSN_M2 | GPIO1_B6_d | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO2_D7_d |                   |                |              | PWM2_CH7_M2 |              |               |
|               | SAI3_SCLK_M1 | PWM1_CH0_M1 | SPI1_CLK_M0  | I2C9_SDA_M1 |               | GPIO1_B4_d | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO1_B7_d |                   |                | SPI1_CSN0_M0 |             | SAI3_SDI_M1  | UART3_RTSN_M2 |
|               |              |             |              |             |               |    GND     | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO1_C0_d |    UART3_TX_M2    |                | SPI1_CSN1_M0 | PWM0_CH0_M1 | PDM0_SDI2_M2 |               |
|  CAN1_RX_M1   | SAI4_SCLK_M2 | PWM2_CH3_M1 |              | I2C6_SDA_M3 |               | GPIO4_C7_d |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO4_C6_d |                   |  I2C6_SCL_M3   |              | PWM2_CH2_M1 | SAI4_SDI_M2  |  CAN1_TX_M1   |
|  CAN1_TX_M3   |              |             |              |             |               | GPIO3_A2_d | <div className='green'>29</div>  | <div className='black'>30</div> |    GND     |                   |                |              |             |              |               |
| PDM0_CLK0_M2  | SAI3_MCLK_M1 |             |              |             |  UART3_RX_M2  | GPIO1_C1_d | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO1_D5_d |  UART10_CTSN_M1   |  I2C5_SDA_M1   | SPI2_CLK_M1  |             | PDM0_CLK1_M2 |               |
|               |              | PWM1_CH2_M1 | SPI2_CSN1_M1 | I2C6_SCL_M1 | UART4_RTSN_M1 | GPIO1_C2_u | <div className='green'>33</div>  | <div className='black'>34</div> |    GND     |                   |                |              |             |              |               |
|               | SAI2_LRCK_M0 | PWM1_CH3_M1 |              | I3C0_SCL_M1 |               | GPIO1_D2_d | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO1_D4_d |  UART10_RTSN_M1   |  I2C5_SCL_M1   |              |             | SAI2_MCLK_M0 | PDM0_SDI3_M2  |
|  CAN1_RX_M3   |              |             |              |             |               | GPIO3_A3_d | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO1_D3_d |                   |  I3C0_SDA_M1   |              | PWM1_CH4_M1 | SAI2_SDI_M0  |               |
|               |              |             |              |             |               |    GND     | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO1_D0_d |   UART10_TX_M1    |                |              |             | SAI2_SDO_M0  |               |

   </div>
</TabItem>

## GPIO 使用

通过板载的 40-Pin GPIO 接口，演示常见的 GPIO 使用方法。

### GPIO Input

#### 硬件准备

- 开发板: Radxa ROCK 4D
- 1 根母对母杜邦线

#### 硬件连接

使用 GPIO_Pin_3 进行 GPIO 输入测试，你可以使用母对母杜邦线将 PIN_3 引脚引出。

#### 读取测试

使用 `gpiofind` 命令找到 GPIO 引脚对应的设备节点，然后使用 `gpioget` 命令读取引脚状态。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
gpioget $(gpiofind PIN_3)
```
</NewCodeBlock>

我们可以将 PIN3 引出的杜邦线连接到 GND 或者 3.3 V，然后读取引脚状态。

终端输出示例：我将引脚连接到 GND 输出的结果（终端输出 0 表示引脚为低电平，输出 1 表示引脚为高电平）。
<NewCodeBlock tip="radxa@radxa-4d$" type="device">

```
0
```

</NewCodeBlock>

### GPIO Output

#### 硬件准备

- 开发板: Radxa ROCK 4D
- 1 根母对母杜邦线

#### 硬件连接

使用 GPIO_Pin_3 进行 GPIO 输出测试，你可以使用母对母杜邦线将 PIN_3 引脚引出。

#### 输出测试

使用 `gpiofind` 命令找到 GPIO 引脚对应的设备节点，然后使用 `gpioset` 命令设置引脚状态。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
#
# 输出高电平
gpioset -m signal $(gpiofind PIN_3)=1
# 输出低电平
gpioset -m signal $(gpiofind PIN_3)=0
```
</NewCodeBlock>

- `-m signal`：设置引脚为信号模式
- `$(gpiofind PIN_3)`：找到 GPIO 引脚对应的设备节点
- `=1`：设置引脚状态为高电平

你可以通过万用表测量引脚电压判断引脚状态，或者将引脚连接到其他可控制引脚，来读取引脚状态。

### UART 使用

UART（通用异步收发传输器） 是一种广泛使用的串行通信协议，用于在嵌入式系统、计算机和外设之间进行异步串行数据传输。

#### 硬件准备

- 开发板: Radxa ROCK 4D
- 1 根母对母杜邦线

#### 硬件连接

使用 UART4-M1 对应的引脚进行回环测试，我们需要使用母对母杜邦线将 PIN_11 (UART4_TX_M1) 和 PIN_15 (UART4_RX_M1) 进行短接。

:::tip
我们是通过回环测试 UART 功能，我们只需要连接 TX 和 RX 引脚即可。

若后续外接其他串口模块，最少还需要连接 GND 引脚，确保通讯双方共地。
:::

#### 回环测试

1. 使能 UART4-M1

使用 `rsetup` 工具使能 UART4-M1： `Overlays` --> `Manage Overlays` --> 勾选 `Enable UART4-M1` 功能。

使能 UART4-M1 后，需要重启系统才能生效。

:::tip
有关 `rsetup` 工具的使用，可以参考 [Rsetup 工具](../system-config/rsetup) 教程
:::

2. 设置串口权限

我们使能的是 `UART4-M1`，对应的设备节点是 `/dev/ttyS4`，我们需要设置串口权限，确保当前用户有权限访问该设备节点。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo chmod 777 /dev/ttyS4
```
</NewCodeBlock>

3. 设置串口参数

使用下面命令设置串口通讯参数：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo stty -F /dev/ttyS4 115200 cs8 -parenb -cstopb -echo
```
</NewCodeBlock>

- `115200` ：波特率
- `cs8`：8 位数据位
- `-parenb`：无校验位
- `-cstopb`：1 停止位
- `-echo`：禁用回显

4. 串口发送数据

打开一个终端，在终端输入下面命令：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
while true; do echo "UART4 test" > /dev/ttyS4; sleep 1; done
```
</NewCodeBlock>

5. 串口接收数据

再开一个终端，在终端输入下面命令：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
cat /dev/ttyS4
```
</NewCodeBlock>

若回环测试正常，我们可以在串口接收数据的终端看到每隔 1 秒输出一次 `UART4 test` 的信息。

### I2C 使用

I2C 是一种广泛使用的同步串行通信协议，由飞利浦（现恩智浦）开发，主要用于短距离芯片间通信。

#### 硬件准备

- 开发板: Radxa ROCK 4D
- 4 根母对母杜邦线
- OLED 屏幕 (I2C 通讯)

#### 硬件连接

使用 4 根母对母杜邦线连接 Radxa ROCK 4D 对应的引脚和 OLED 屏幕。

|    Radxa ROCK 4D    | OLED 屏幕 |
| :-----------------: | :-------: |
|    PIN_1 (3.3V)     |    VCC    |
| PIN_3 (I2C8_SDA_M1) |    SDA    |
| PIN_5 (I2C8_SCL_M1) |    SCL    |
|     PIN_9 (GND)     |    GND    |

#### I2C 测试

1. 使能 I2C8-M1

使用 `rsetup` 工具使能 I2C8-M1： `Overlays` --> `Manage Overlays` --> 勾选 `Enable I2C8-M1` 功能。

使能 I2C8-M1 后，需要重启系统才能生效。

2. 查询 I2C 总线设备

使用 `i2cdetect` 命令可以查询 I2C 总线设备相关信息。

- 安装依赖

打开终端，输入下面命令安装 Python3-periphery 和 i2c-tools。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo apt update
sudo apt install python3-periphery i2c-tools
```
</NewCodeBlock>

- 查看 I2C 总线

使用 `i2cdetect` 命令查看设备所有 I2C 总线。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo i2cdetect -l
```
</NewCodeBlock>

终端输出示例：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
i2c-1   i2c             rk3x-i2c                                I2C adapter
i2c-2   i2c             rk3x-i2c                                I2C adapter
i2c-3   i2c             rk3x-i2c                                I2C adapter
i2c-6   i2c             rk3x-i2c                                I2C adapter
i2c-8   i2c             rk3x-i2c                                I2C adapter
i2c-10  i2c             ddc                                     I2C adapter
```
</NewCodeBlock>

- 查看 I2C 总线设备

使用 `i2cdetect` 命令查看指定 I2C 总线上挂载的设备：其中 `*` 可以替换成数字，例如填写 8 就表示查看 `i2c-8` 上挂载的设备。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo i2cdetect -y -r *
# 示例
sudo i2cdetect -y -r 8
```
</NewCodeBlock>

终端输出示例：其中 OLED 对应的 I2C 地址是 0x3c。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- 3c -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
```
</NewCodeBlock>

3. I2C 通讯测试

- Python 脚本

新建名称为 `oled_test.py` 的 Python 脚本，脚本内容如下：其中 `I2C_ADDR` 是 OLED 对应的 I2C 地址，`I2C_BUS` 是 OLED 挂载的 I2C 总线，请根据实际情况修改。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
from periphery import I2C
import time

I2C_ADDR = 0x3c
I2C_BUS = "/dev/i2c-8"

i2c = I2C(I2C_BUS)

init_cmds = [
0xAE, # Display off
0x00, # Set lower column address
0x10, # Set higher column address
0x40, # Set display start line
0xB0, # Set page address
0x81, # Set contrast control
0xCF,
0xA1, # Set segment remap
0xA6, # Normal display
0xA8, # Set multiplex ratio
0x3F,
0xC8, # Set COM output scan direction
0xD3, # Set display offset
0x00,
0xD5, # Set display clock divide ratio/oscillator frequency
0x80,
0xD9, # Set pre-charge period
0xF1,
0xDA, # Set COM pins hardware configuration
0x12,
0xDB, # Set VCOMH deselect level
0x40,
0x8D, # Enable charge pump regulator
0x14,
0xAF # Display on
]

for cmd in init_cmds:
i2c.transfer(I2C_ADDR, [I2C.Message([0x00, cmd])])

def oled*clear():
for page in range(8):
i2c.transfer(I2C_ADDR, [I2C.Message([0x00, 0xB0 + page])])
i2c.transfer(I2C_ADDR, [I2C.Message([0x00, 0x00])])
i2c.transfer(I2C_ADDR, [I2C.Message([0x00, 0x10])])
for * in range(128):
i2c.transfer(I2C_ADDR, [I2C.Message([0x40, 0x00])])

char_map = {
"H": [0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F,],
"R": [0x00, 0x7F, 0x09, 0x19, 0x29, 0x46],
"e": [0x00, 0x38, 0x54, 0x54, 0x54, 0x18],
"l": [0x00, 0x00, 0x41, 0x7F, 0x40, 0x00],
"o": [0x00, 0x38, 0x44, 0x44, 0x44, 0x38],
"r": [0x00, 0x7C, 0x08, 0x04, 0x04, 0x08],
"a": [0x00, 0x20, 0x54, 0x54, 0x54, 0x78],
"d": [0x00, 0x38, 0x44, 0x44, 0x48, 0x7F],
"x": [0x00, 0x44, 0x28, 0x10, 0x28, 0x44]
}

def string_to_bytes(string):
bytes_list = []
for char in string:
bytes_list.extend(char_map.get(char, [0x00] \* 4))
bytes_list.append(0x00)
return bytes_list

oled_clear()
hello_world_bytes = string_to_bytes("Hello Radxa")
i2c.transfer(I2C_ADDR, [I2C.Message([0x00, 0xB0])])
i2c.transfer(I2C_ADDR, [I2C.Message([0x00, 0x00])])
i2c.transfer(I2C_ADDR, [I2C.Message([0x00, 0x10])])
for byte in hello_world_bytes:
i2c.transfer(I2C_ADDR, [I2C.Message([0x40, byte])])

i2c.close()

```
</NewCodeBlock>

- 运行脚本

打开终端，输入下面命令运行脚本：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```

python3 oled_test.py

```
</NewCodeBlock>

若一切正常，我们可以在 OLED 屏幕上看到 `Hello Radxa` 的输出。

### SPI 使用

SPI（串行外设接口）是一种高速、全双工、同步串行通信协议，由 Motorola（现为 NXP ）开发，主要用于短距离芯片间通信，常见于传感器、存储器（如 Flash ）、显示屏等设备与微控制器之间的数据传输。

#### 硬件准备

- 开发板: Radxa ROCK 4D
- 1 根母对母杜邦线

#### 硬件连接

使用 SPI1-M0 对应的引脚进行回环测试，我们需要使用母对母杜邦线将 PIN_19 (SPI1_MOSI_M0) 和 PIN_21 (SPI1_MISO_M0) 进行短接。

:::tip
我们是通过回环测试 SPI 功能，我们只需要连接 MOSI 和 MISO 引脚即可。

若后续外接其他 SPI 模块，最少还需要连接 GND 引脚，确保通讯双方共地。
:::

#### 回环测试

1. 使能 SPI1-M0

使用 `rsetup` 工具使能 SPI1-M0： `Overlays` --> `Manage Overlays` --> 勾选 `Enable spidev on SPI1-M0 over CS0` 功能。

使能 SPI1-M0 后，需要重启系统才能生效。

2. 查询 SPI 总线设备

使用 `ls /dev/spidev*` 命令可以查询 SPI 总线设备相关信息。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```

ls /dev/spidev\*

```
</NewCodeBlock>

终端输出示例：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```

/dev/spidev1.0

```
</NewCodeBlock>

3. SPI 通讯测试

- C 代码

新建名称为 `spidev_test.c` 的 C 代码，代码内容如下：其中 `static const char *device = "/dev/spidev1.0";` 是 SPI 总线设备节点，请根据实际情况修改。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```

/\*

- SPI testing utility (using spidev driver)
-
- Copyright (c) 2007 MontaVista Software, Inc.
- Copyright (c) 2007 Anton Vorontsov <avorontsov@ru.mvista.com>
-
- This program is free software; you can redistribute it and/or modify
- it under the terms of the GNU General Public License as published by
- the Free Software Foundation; either version 2 of the License.
-
- Cross-compile with cross-gcc -I/path/to/cross-kernel/include
  \*/

#include <stdint.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/ioctl.h>
#include <sys/stat.h>
#include <linux/types.h>
#include <linux/spi/spidev.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))

static void pabort(const char \*s)
{
perror(s);
abort();
}

static const char *device = "/dev/spidev1.0";
static uint32_t mode;
static uint8_t bits = 8;
static char *input_file;
static char \*output_file;
static uint32_t speed = 500000;
static uint16_t delay;
static int verbose;

uint8_t default_tx[] = {
0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
0x40, 0x00, 0x00, 0x00, 0x00, 0x95,
0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
0xF0, 0x0D,
};

uint8_t default_rx[ARRAY_SIZE(default_tx)] = {0, };
char \*input_tx;

static void hex_dump(const void *src, size_t length, size_t line_size,
char *prefix)
{
int i = 0;
const unsigned char *address = src;
const unsigned char *line = address;
unsigned char c;

    printf("%s | ", prefix);
    while (length-- > 0) {
        printf("%02X ", *address++);
        if (!(++i % line_size) || (length == 0 && i % line_size)) {
            if (length == 0) {
                while (i++ % line_size)
                    printf("__ ");
            }
            printf(" | ");  /* right close */
            while (line < address) {
                c = *line++;
                printf("%c", (c < 33 || c == 255) ? 0x2E : c);
            }
            printf("\n");
            if (length > 0)
                printf("%s | ", prefix);
        }
    }

}

/\*

- Unescape - process hexadecimal escape character
- converts shell input "\x23" -> 0x23
  _/
  static int unescape(char _\_dst, char *\_src)
  {
  int ret = 0;
  int match;
  char *src = \_src;
  char \*dst = \_dst;
  unsigned int ch;

      while (*src) {
          if (*src == '\\' && *(src+1) == 'x') {
              match = sscanf(src + 2, "%2x", &ch);
              if (!match)
                  pabort("malformed input string");

              src += 4;
              *dst++ = (unsigned char)ch;
          } else {
              *dst++ = *src++;
          }
          ret++;
      }
      return ret;

  }

static void transfer(int fd, uint8_t const *tx, uint8_t const *rx, size_t len)
{
int ret;
int out_fd;
struct spi_ioc_transfer tr = {
.tx_buf = (unsigned long)tx,
.rx_buf = (unsigned long)rx,
.len = len,
.delay_usecs = delay,
.speed_hz = speed,
.bits_per_word = bits,
};

    if (mode & SPI_TX_QUAD)
        tr.tx_nbits = 4;
    else if (mode & SPI_TX_DUAL)
        tr.tx_nbits = 2;
    if (mode & SPI_RX_QUAD)
        tr.rx_nbits = 4;
    else if (mode & SPI_RX_DUAL)
        tr.rx_nbits = 2;
    if (!(mode & SPI_LOOP)) {
        if (mode & (SPI_TX_QUAD | SPI_TX_DUAL))
            tr.rx_buf = 0;
        else if (mode & (SPI_RX_QUAD | SPI_RX_DUAL))
            tr.tx_buf = 0;
    }

    ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
    if (ret < 1)
        pabort("can't send spi message");

    if (verbose)
        hex_dump(tx, len, 32, "TX");

    if (output_file) {
        out_fd = open(output_file, O_WRONLY | O_CREAT | O_TRUNC, 0666);
        if (out_fd < 0)
            pabort("could not open output file");

        ret = write(out_fd, rx, len);
        if (ret != len)
            pabort("not all bytes written to output file");

        close(out_fd);
    }

    if (verbose || !output_file)
        hex_dump(rx, len, 32, "RX");

}

static void print_usage(const char \*prog)
{
printf("Usage: %s [-DsbdlHOLC3]\n", prog);
puts(" -D --device device to use (default /dev/spidev0.0)\n"
" -s --speed max speed (Hz)\n"
" -d --delay delay (usec)\n"
" -b --bpw bits per word\n"
" -i --input input data from a file (e.g. \"test.bin\")\n"
" -o --output output data to a file (e.g. \"results.bin\")\n"
" -l --loop loopback\n"
" -H --cpha clock phase\n"
" -O --cpol clock polarity\n"
" -L --lsb least significant bit first\n"
" -C --cs-high chip select active high\n"
" -3 --3wire SI/SO signals shared\n"
" -v --verbose Verbose (show tx buffer)\n"
" -p Send data (e.g. \"1234\\xde\\xad\")\n"
" -N --no-cs no chip select\n"
" -R --ready slave pulls low to pause\n"
" -2 --dual dual transfer\n"
" -4 --quad quad transfer\n");
exit(1);
}

static void parse_opts(int argc, char \*argv[])
{
while (1) {
static const struct option lopts[] = {
{ "device", 1, 0, 'D' },
{ "speed", 1, 0, 's' },
{ "delay", 1, 0, 'd' },
{ "bpw", 1, 0, 'b' },
{ "input", 1, 0, 'i' },
{ "output", 1, 0, 'o' },
{ "loop", 0, 0, 'l' },
{ "cpha", 0, 0, 'H' },
{ "cpol", 0, 0, 'O' },
{ "lsb", 0, 0, 'L' },
{ "cs-high", 0, 0, 'C' },
{ "3wire", 0, 0, '3' },
{ "no-cs", 0, 0, 'N' },
{ "ready", 0, 0, 'R' },
{ "dual", 0, 0, '2' },
{ "verbose", 0, 0, 'v' },
{ "quad", 0, 0, '4' },
{ NULL, 0, 0, 0 },
};
int c;

        c = getopt_long(argc, argv, "D:s:d:b:i:o:lHOLC3NR24p:v",
                lopts, NULL);

        if (c == -1)
            break;

        switch (c) {
        case 'D':
            device = optarg;
            break;
        case 's':
            speed = atoi(optarg);
            break;
        case 'd':
            delay = atoi(optarg);
            break;
        case 'b':
            bits = atoi(optarg);
            break;
        case 'i':
            input_file = optarg;
            break;
        case 'o':
            output_file = optarg;
            break;
        case 'l':
            mode |= SPI_LOOP;
            break;
        case 'H':
            mode |= SPI_CPHA;
            break;
        case 'O':
            mode |= SPI_CPOL;
            break;
        case 'L':
            mode |= SPI_LSB_FIRST;
            break;
        case 'C':
            mode |= SPI_CS_HIGH;
            break;
        case '3':
            mode |= SPI_3WIRE;
            break;
        case 'N':
            mode |= SPI_NO_CS;
            break;
        case 'v':
            verbose = 1;
            break;
        case 'R':
            mode |= SPI_READY;
            break;
        case 'p':
            input_tx = optarg;
            break;
        case '2':
            mode |= SPI_TX_DUAL;
            break;
        case '4':
            mode |= SPI_TX_QUAD;
            break;
        default:
            print_usage(argv[0]);
            break;
        }
    }
    if (mode & SPI_LOOP) {
        if (mode & SPI_TX_DUAL)
            mode |= SPI_RX_DUAL;
        if (mode & SPI_TX_QUAD)
            mode |= SPI_RX_QUAD;
    }

}

static void transfer_escaped_string(int fd, char *str)
{
size_t size = strlen(str);
uint8_t *tx;
uint8_t \*rx;

    tx = malloc(size);
    if (!tx)
        pabort("can't allocate tx buffer");

    rx = malloc(size);
    if (!rx)
        pabort("can't allocate rx buffer");

    size = unescape((char *)tx, str);
    transfer(fd, tx, rx, size);
    free(rx);
    free(tx);

}

static void transfer_file(int fd, char *filename)
{
ssize_t bytes;
struct stat sb;
int tx_fd;
uint8_t *tx;
uint8_t \*rx;

    if (stat(filename, &sb) == -1)
        pabort("can't stat input file");

    tx_fd = open(filename, O_RDONLY);
    if (tx_fd < 0)
        pabort("can't open input file");

    tx = malloc(sb.st_size);
    if (!tx)
        pabort("can't allocate tx buffer");

    rx = malloc(sb.st_size);
    if (!rx)
        pabort("can't allocate rx buffer");

    bytes = read(tx_fd, tx, sb.st_size);
    if (bytes != sb.st_size)
        pabort("failed to read input file");

    transfer(fd, tx, rx, sb.st_size);
    free(rx);
    free(tx);
    close(tx_fd);

}

int main(int argc, char \*argv[])
{
int ret = 0;
int fd;

    parse_opts(argc, argv);

    fd = open(device, O_RDWR);
    if (fd < 0)
        pabort("can't open device");

    /*
    * spi mode
    */
    ret = ioctl(fd, SPI_IOC_WR_MODE, &mode);
    if (ret == -1)
        pabort("can't set spi mode");

    ret = ioctl(fd, SPI_IOC_RD_MODE, &mode);
    if (ret == -1)
        pabort("can't get spi mode");

    /*
    * bits per word
    */
    ret = ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &bits);
    if (ret == -1)
        pabort("can't set bits per word");

    ret = ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &bits);
    if (ret == -1)
        pabort("can't get bits per word");

    /*
    * max speed hz
    */
    ret = ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed);
    if (ret == -1)
        pabort("can't set max speed hz");

    ret = ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);
    if (ret == -1)
        pabort("can't get max speed hz");

    printf("spi mode: 0x%x\n", mode);
    printf("bits per word: %d\n", bits);
    printf("max speed: %d Hz (%d KHz)\n", speed, speed/1000);

    if (input_tx && input_file)
        pabort("only one of -p and --input may be selected");

    if (input_tx)
        transfer_escaped_string(fd, input_tx);
    else if (input_file)
        transfer_file(fd, input_file);
    else
        transfer(fd, default_tx, default_rx, sizeof(default_tx));

    close(fd);

    return ret;

}

```
</NewCodeBlock>

- 编译工具

打开终端，输入下面命令安装编译工具：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```

sudo apt update
sudo apt install build-essential

```
</NewCodeBlock>

- 编译代码

打开终端，输入下面命令编译代码：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```

gcc -o spidev_test spidev_test.c

```
</NewCodeBlock>

- 运行代码

打开终端，输入下面命令运行代码：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```

sudo ./spidev_test

```
</NewCodeBlock>

若回环测试正常，我们可以在终端看到输出以下信息：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```

spi mode: 0x0
bits per word: 8
max speed: 500000 Hz (500 KHz)
RX | FF FF FF FF FF FF 40 00 00 00 00 95 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF F0 0D | ......@....�..................�.

```
</NewCodeBlock>
```
