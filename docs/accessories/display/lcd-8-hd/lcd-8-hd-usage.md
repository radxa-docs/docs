---
sidebar_position: 6
---

# 瑞莎 8 寸高清触摸屏使用教程

## 概述

[Radxa Display 8 HD](lcd-8-hd-product) 显示面板现已支持以下瑞莎产品：

| 适配产品  | 使用 FPC 线材种类           | 实物图                                        |
| --------- | --------------------------- | --------------------------------------------- |
| 4C+/5A/5B | 39 pin 转 40 pin FPC 连接线 | ![AC012](/img/accessories/display/ac013.webp) |
| 3A/3C/4SE | 15 pin 转 40 pin FPC 连接线 | ![AC013](/img/accessories/display/ac012.webp) |

其中，15 pin 转 40 pin 的 FPC 排线有需要额外连接的 7 pin 排针，其定义如下：

![AC012 Pin Definition](/img/accessories/display/ac012-pin-definition.webp)

## 使用教程

<Tabs queryString="mode">
<TabItem value="39pin" label="4C+/5A/5B">

### 准备

- ROCK 4C+/5A/5B SBC

:::note
此处以 ROCK 5A 为演示对象，其他产品操作方式类似。
:::

- Radxa Display 8 HD 显示面板
- 39 pin 转 40 pin FPC 连接线
- 产品适配的电源适配器

:::tip
推荐使用[瑞莎 PD 30W 适配器](https://radxa.com/products/accessories/power-pd-30w)。
:::

- 已烧录对应产品官方最新固件的存储介质
- USB 串口线或 HDMI 显示器及线缆

### 操作步骤

1. 将系统盘存储介质安装到 SBC 上

2. 通过 FPC 线连接产品和显示面板
   其中，40 pin 一端接到显示面板上：向上拨起 FPC 接头黑色卡扣，将 FPC 排线插入连接器，然后按下黑色卡扣固定 FPC 排线
   ![Radxa Display 8 HD](/img/accessories/display/8hd-connect-fpc.webp)
   39 pin 一端接到产品 DSI 连接器上：向上拨起 FPC 接头黑色卡扣，将 FPC 排线插入连接器，然后按下黑色卡扣固定 FPC 排线
   ![ROCK 5A-Radxa Display 8 HD](/img/accessories/display/8hd-connect-fpc.webp)

3. 连接显示器或 USB 串口调试，通电进入系统

4. 通过终端打开 `Radxa Display 8 HD` 的 overlay 选项。不同板型的具体操作可参考：
   - [ROCK 5A MIPI DSI 使用说明](../../../rock5/rock5a/getting-started/interface-usage/mipi-dsi)
   - [ROCK 5B / 5B+ MIPI DSI 使用说明](../../../rock5/rock5b/getting-started/interface-usage/mipi-dsi)

5. 重启 SBC 以启用 overlay，显示屏输出画面

</TabItem>
<TabItem value="15pin" label="3A/3C/4SE">

### 准备

- ROCK 3A/3C/4SE SBC

:::note
此处以 ROCK 3C 为演示对象，其他产品操作方式类似。
:::

- Radxa Display 8 HD 显示面板
- 15 pin 转 40 pin FPC 连接线
- 产品适配的电源适配器

:::tip
推荐使用[瑞莎 PD 30W 适配器](https://radxa.com/products/accessories/power-pd-30w)。
:::

- 已烧录对应产品官方最新固件的存储介质
- USB 串口线或 HDMI 显示器及线缆

### 操作步骤

1. 将系统盘存储介质安装到 SBC 上

2. 通过 FPC 线连接产品和显示面板
   其中，40 pin 端子接到显示面板上：向上拨起 FPC 接头黑色卡扣，将 FPC 排线插入连接器，然后按下黑色卡扣固定 FPC 排线
   ![Radxa Display 8 HD](/img/accessories/display/8hd-connect-fpc.webp)

15 pin 端子接到产品 DSI 连接器上：
Step 1：将连接器白色卡扣向上拨起
Step 2：排线金手指背对白色卡扣插入连接器
Step 3：将卡扣向下按紧，固定排线
![FPC 15 Pin Connecting](/img/accessories/display/fpc-15-pin-connecting.webp)

3. 通过杜邦线连接额外接口，接法如下：

<Tabs queryString="model">
<TabItem value="3c" label="ROCK 3C">
<div className='gpio_style'>

| FPC 线引脚 |       |          单板机 GPIO 引脚           |
| :--------: | :---: | :---------------------------------: |
|   VCC_5V   | \<--> |  <div className='red'>+5.0V</div>   |
|    GND     | \<--> |  <div className='black'>GND</div>   |
|    PWM     | \<--> |        PWM14_M0(GPIO Pin 7)         |
|   TP-RST   | \<--> |        GPIO3_B2(GPIO Pin 18)        |
|   YP-INT   | \<--> |        GPIO3_B1(GPIO Pin 16)        |
|  LCD-RST   | \<--> | <div className='yellow'>+3.3V</div> |
|    GINT    | \<--> |                None                 |

实物连接图参考如下：

![3C FPC Connected](/img/accessories/display/3c-fpc-connected.webp)

</div>
</TabItem>
<TabItem value="3a" label="ROCK 3A">
<div className='gpio_style'>

| FPC 线引脚 |       |          单板机 GPIO 引脚           |
| :--------: | :---: | :---------------------------------: |
|   VCC_5V   | \<--> |  <div className='red'>+5.0V</div>   |
|    GND     | \<--> |  <div className='black'>GND</div>   |
|    PWM     | \<--> |        PWM14_M0(GPIO Pin 11)        |
|   TP-RST   | \<--> |        GPIO3_B2(GPIO Pin 18)        |
|   YP-INT   | \<--> |        GPIO0_B6(GPIO Pin 16)        |
|  LCD-RST   | \<--> | <div className='yellow'>+3.3V</div> |
|    GINT    | \<--> |                None                 |

实物连接图参考如下：

![3A FPC Connected](/img/accessories/display/3a-fpc-connected.webp)

</div>
</TabItem>
<TabItem value="4se" label="ROCK 4SE">
<div className='gpio_style'>

| FPC 线引脚 |       |          单板机 GPIO 引脚           |
| :--------: | :---: | :---------------------------------: |
|   VCC_5V   | \<--> |  <div className='red'>+5.0V</div>   |
|    GND     | \<--> |  <div className='black'>GND</div>   |
|    PWM     | \<--> |          PWM1(GPIO Pin 13)          |
|   TP-RST   | \<--> |        GPIO4_D2(GPIO Pin 16)        |
|   YP-INT   | \<--> |        GPIO4_D4(GPIO Pin 18)        |
|  LCD-RST   | \<--> | <div className='yellow'>+3.3V</div> |
|    GINT    | \<--> |                None                 |

实物连接图参考如下：

![4SE FPC Connected](/img/accessories/display/4se-fpc-connected.webp)

</div>
</TabItem>
</Tabs>

4. 连接显示器或 USB 串口调试，通电进入系统

5. 通过终端打开 `Radxa Display 8 HD` 的 overlay 选项。不同板型的具体操作可参考：
   - [ROCK 3A 显示屏使用说明](../../../rock3/rock3a/accessories/display)
   - [ROCK 3C 显示配置说明](../../../rock3/rock3c/radxa-os/display)
   - [ROCK 4SE DSI 使用说明](../../../rock4/rock4ab-se/getting-started/interface-usage/dsi)

6. 重启 SBC 以启用 overlay，显示屏将会输出画面

</TabItem>
<TabItem value="rpi" label="Raspberry Pi">

瑞莎 8 寸高清触摸屏同样支持在 Raspberry Pi 4B 上使用。完整教程维护在 [radxa-displays-on-raspberry-pi](https://github.com/radxa/radxa-displays-on-raspberry-pi) 仓库中。

### 准备

- Raspberry Pi 4B
- Radxa Display 8 HD 显示面板
- 15 pin 转 40 pin FPC 连接线

### 硬件连接

使用 15 pin 转 40 pin FPC 连接线，将额外的 7 pin 排针与 Raspberry Pi 4B 的 40 pin GPIO 按下表连接：

| Radxa Display 8 HD | Raspberry Pi 4B |
| :----------------- | :-------------- |
| VCC-5V             | PIN 2: 5V Power |
| GND                | PIN 6: GND      |
| BL-PWM             | PIN 1: 3V3 Power |
| TP-RST             | PIN 11: GPIO 17 |
| TP-INT             | PIN 7: GPIO 4   |
| LCD-RESET          | PIN 17: 3V3 Power |

*第七个引脚目前未使用。*

### 软件设置

1. 安装所需软件包：

   ```bash
   sudo apt update
   sudo apt install dkms raspberrypi-kernel-headers
   ```

2. 安装内核驱动（可从 [releases 页面](https://github.com/radxa/radxa-displays-on-raspberry-pi/releases) 下载，或使用 wget）：

   ```bash
   wget https://github.com/radxa/radxa-displays-on-raspberry-pi/releases/download/1.0.0/panel-radxa-dsi-dkms_1.0.0_all.deb
   sudo dpkg -i panel-radxa-dsi-dkms_1.0.0_all.deb
   ```

3. 修改配置文件 `/boot/firmware/config.txt`，在 `[all]` 之后添加以下内容：

   ```
   [all]
   display_auto_detect=0
   dtoverlay=vc4-kms-v3d
   dtoverlay=vc4-kms-dsi-radxa-panel
   ```

4. 保存并重启：

   ```bash
   sync
   sudo reboot
   ```

重启后屏幕即可正常显示。

:::note
最新操作步骤请参考 [radxa-displays-on-raspberry-pi](https://github.com/radxa/radxa-displays-on-raspberry-pi) 仓库。
:::

</TabItem>
</Tabs>
