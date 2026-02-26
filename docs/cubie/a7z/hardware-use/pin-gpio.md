---
sidebar_position: 5
---

# 40 Pin GPIO 接口

瑞莎 Cubie A7Z 板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7z/a7z-gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
使用 40-Pin GPIO 接口时，请注意引脚和外设的接线，请确保引脚连接正确，不当操作可能导致设备硬件损坏。
:::

## GPIO 功能

Cubie A7Z 支持给板载的 GPIO 引脚外接外部设备，支持 UART、SPI、I2C、ADC 等。

<TabItem value="Cubie A7Z">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| Function8 |  Function7  | Function6 | Function5  |  Function4  |  Function3  |  Function2  | Function1 |               Pin#               |              Pin#               | Function1 |  Function2  |  Function3  |  Function4  |  Function5  |  Function6   |  Function7  | Function8 | Function9 |
| :-------: | :---------: | :-------: | :--------: | :---------: | :---------: | :---------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :---------: | :---------: | :---------: | :---------: | :----------: | :---------: | :-------: | :-------: |
|           |             |           |            |             |             |             |   3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |    5V     |             |             |             |             |              |             |           |           |
| PJ-EINT23 |  TWI11-SDA  | TWI3-SDA  |  TWI7-SDA  |  UART2-CTS  |  UART3-RX   |   PWM1-5    |   PJ23    |  <div className='green'>3</div>  |  <div className='red'>4</div>   |    5V     |             |             |             |             |              |             |           |           |
| PJ-EINT23 |  TWI11-SCK  | TWI3-SCK  |  TWI7-SCK  |  UART2-RTS  |  UART3-TX   |   PWM1-4    |   PJ22    |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |             |             |             |             |              |             |           |           |
| PB-EINT1  |   JTAG-MS   |           |            |  SPI2-CS0   |  UART0-TX   |  UART2-TX   |    PB0    |  <div className='green'>7</div>  | <div className='green'>8</div>  |    PB9    |  UART0-TX   |  I2S0-DIN2  | I2S0-DOUBT2 |   PWM1-1    | WATCHDOG-SIG |  TWI8-SCK   | TWI0-SCK  | PB-EINT9  |
|           |             |           |            |             |             |             |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |   PB10    |  UART0-RX   |  I2S0-DIN3  | I2S0-DOUBT3 |   PWM1-2    | PLL-LOCK-DBG |  TWI8-SDA   | TWI0-SDA  | PB-EINT10 |
| PB-EINT1  |             |  JTAG-CK  |            |  SPI2-CLK   |  UART0-RX   |  UART2-RX   |    PB1    | <div className='green'>11</div>  | <div className='green'>12</div> |    PB5    |  I2S0-BCLK  |  SPI2-CS2   |   PWM0-1    | TRACE-DATA0 |   TWI1-SDA   |  PB-EINT5   |           |           |
| PL-EINT6  |             | S-PWM0-4  |  S-IR-RX   | S-SPI0-MOSI | S-UART0-TX  |  S-JTAG-DO  |    PL6    | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |             |             |             |             |              |             |           |           |
| PL-EINT7  |             |           |  S-PWM0-5  | S-SPI0-MISO | S-UART0-RX  |  S-JTAG-DI  |    PL7    | <div className='green'>15</div>  | <div className='green'>16</div> |   PJ24    |   PWM1-6    |  UART4-TX   |  TWI4-SCK   |  SPI3-CLK   |  PJ-EINT24   |             |           |           |
|           |             |           |            |             |             |             |   3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> |   PJ25    |   PWM1-7    |  UART4-RX   |  TWI4-SDA   |  SPI3-MOSI  |  PJ-EINT25   |             |           |           |
| PD-EINT12 |   PWM1-2    | SPI1-MOSI |  EINK-D12  |  DSI1-D1P   |  LVDS1-D1P  |             |   PD12    | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |             |             |             |             |              |             |           |           |
| PD-EINT13 |   PWM1-3    | SPI1-MISO |  EINK-D13  |  DSI1-D1N   |  LVDS1-D1N  |             |   PD13    | <div className='green'>21</div>  | <div className='green'>22</div> |    PL5    |  S-JTAG-CK  | S-TWI2-SDA  | S-SPI0-CLK  |  S-PWM0-3   |   PL-EINT5   |             |           |           |
| PD-EINT11 |   PWM1-1    | SPI1-CLK  |  EINK-D11  |  DSI1-D0N   |  LVDS1-D0N  |             |   PD11    | <div className='green'>23</div>  | <div className='green'>24</div> |   PD10    |  LVDS1-D0P  |  DSI1-D0P   |  EINK-D10   |  SPI1-CS0   |    PWM1-0    |  PD-EINT10  |           |           |
|           |             |           |            |             |             |             |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> |   PD14    |  LVDS1-D2P  |  DSI1-CKP   |  EINK-D14   |  SPI1-HOLD  |  UART3-RTS   |  PD-EINT14  |           |           |
| PD-EINT17 |  UART3-RX   | TWI2-SDA  |  EINK-LEH  |  DSI1-D2N   |  LVDS1-CKN  |             |   PD17    |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |   PD16    |  LVDS1-CKP  |  DSI1-D2P   |  EINK-OEH   |  TWI2-SCK   |   UART3-TX   |  PD-EINT16  |           |           |
| PB-EINT2  |  TWI0-SCK   |  JTAG-DO  |            |  HDMI-SCL   |  SPI2-MOSI  |  UART2-RTS  |    PB2    | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |             |             |             |             |              |             |           |           |
| PB-EINT3  |  TWI0-SDA   |  JTAG-DI  |            |  HDMI-SDA   |  SPI2-MISO  |  UART2-CTS  |    PB3    | <div className='green'>31</div>  | <div className='green'>32</div> |    PM5    | S-UART0-RX  | S-TWI2-SDA  | S-TWI1-SDA  | S-UART1-RX  |   S-PWM0-1   |   S-IR-RX   | PM-EINT5  |           |
| PM-EINT3  |             | S-PWM0-5  | S-UART1-RX | S-UART0-RX  | S-SPI0-MISO |  S-JTAG-DI  |    PM3    | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |             |             |             |             |              |             |           |           |
| PB-EINT6  | TRACE-DATA1 |  PWM0-8   |   PWM0-2   |  SPI2-CS3   |  I2S0-LRCK  | CLK-FANOUT1 |    PB6    | <div className='green'>35</div>  | <div className='green'>36</div> |    PB4    |   PWM0-0    |  I2S0-MCLK  |  SPI2-CS1   |  HDMI-CEC   |              |  TRACE-CLK  | TWI1-SCK  | PB-EINT4  |
| PM-EINT4  |   S-IR-RX   | S-PWM0-0  | S-UART1-TX | S-TWI1-SCK  | S-TWI2-SCK  | S-UART0-TX  |    PM4    | <div className='green'>37</div>  | <div className='green'>38</div> |    PB8    | CLK-FANOUT3 |  I2S0-DIN0  | I2S0-DOUBT1 |   PWM1-0    |   OWA0-OUT   | TRACE-DATA3 | TWI1-SDA  | PB-EINT8  |
|           |             |           |            |             |             |             |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |    PB7    | CLK-FANOUT2 | I2S0-DOUBT0 |  I2S0-DIN1  |   PWM0-9    |   OWA0-IN    | TRACE-DATA2 | TWI1-SCK  | PB-EINT7  |

   </div>
</TabItem>

### GPIO 引脚号

控制指定引脚，你想需要根据以下公式来计算引脚号：

| GPIO 芯片 | 引脚号 |      计算公式       |
| :-------: | :----: | :-----------------: |
| GPIOCHIP0 | A ~ K  | NUM + 32 \* (A ~ K) |
| GPIOCHIP1 |  L ~   | NUM + 32 \* (L ~ )  |

计算示例：

- PB7

GPIOCHIP0 -> 7 + 32 \* (A ~ K) -> 7 + 32 \* 1 -> 39

## GPIO 使用

通过板载的 40-Pin GPIO 接口，演示常见的 GPIO 使用方法。

## 安装 python-periphery

使用 `python-periphery` 库来控制 GPIO 引脚。

<NewCodeBlock tip="radxa@cubie-a7z$" type="device">

```bash
sudo pip3 install python-periphery
```

</NewCodeBlock>

## GPIO 读取

### 硬件准备

- 主板
- 杜邦线

### 软件准备

#### 测试代码

以下代码是使用 python-periphery 库来读取 PB7 引脚的高低电平。

<details>
<summary>gpio_input.py</summary>

```text
from periphery import GPIO
import time

def read_gpio_input():
    # Configure GPIO input (modify pin number according to actual hardware)
    # Using pin 39 of /dev/gpiochip0 here (corresponds to PB7)
    try:
        # Initialize GPIO in input mode
        gpio_in = GPIO("/dev/gpiochip0", 39, "in")

        print("Starting GPIO input reading (press Ctrl+C to exit)")
        while True:
            # Read pin value
            value = gpio_in.read()
            print(f"GPIO input value: {value} (True=High, False=Low)")
            time.sleep(1)  # Read once per second

    except KeyboardInterrupt:
        print("\nProgram exited")
    except Exception as e:
        print(f"Error occurred: {e}")
    finally:
        # Ensure resources are released
        try:
            gpio_in.close()
        except:
            pass

if __name__ == "__main__":
    read_gpio_input()
```

</details>

#### 测试步骤

1. 将 PB7 引脚接 GND 或 3.3V 引脚

2. 将代码保存为 `gpio_input.py`

3. 使用 `python3 gpio_input.py` 命令运行测试代码

### 实验现象

终端会输出 False 或 True 信息。

False 代表低电平，True 代表高电平。

## GPIO 输出

### 硬件准备

- 主板
- 杜邦线

### 软件准备

#### 测试代码

以下代码是使用 python-periphery 库来控制 PB7 引脚输出高低电平，然后通过 PB8 引脚读取 PB7 引脚的高低电平。

<details>
<summary>gpio_output.py</summary>

```text
from periphery import GPIO
import time

def gpio_output_with_feedback():
    # GPIO Configuration (modify pin numbers based on your hardware)
    # PB7 (output) → maps to pin 39 of /dev/gpiochip0
    # PB8 (input)  → maps to pin 40 of /dev/gpiochip0
    OUTPUT_PIN_CHIP = "/dev/gpiochip0"
    OUTPUT_PIN_NUMBER = 39  # PB7 (output pin, controlled by the script)
    INPUT_PIN_NUMBER = 40   # PB8 (input pin, reads PB7's output state)

    # Initialize GPIO objects as None first (for safe release later)
    gpio_out = None
    gpio_in = None

    try:
        # Initialize PB7 as OUTPUT mode
        gpio_out = GPIO(OUTPUT_PIN_CHIP, OUTPUT_PIN_NUMBER, "out")
        # Initialize PB8 as INPUT mode
        gpio_in = GPIO(OUTPUT_PIN_CHIP, INPUT_PIN_NUMBER, "in")

        # Print test initialization info
        print("=== GPIO Output-Input Feedback Test Started ===")
        print(f"Controlled Pin (PB7): {OUTPUT_PIN_CHIP} - Pin {OUTPUT_PIN_NUMBER} (OUTPUT)")
        print(f"Monitoring Pin (PB8): {OUTPUT_PIN_CHIP} - Pin {INPUT_PIN_NUMBER} (INPUT)")
        print("Test Behavior: PB7 toggles HIGH/LOW every 1s; PB8 verifies PB7's state")
        print("Press Ctrl+C to stop the test\n")

        # Main loop: Toggle PB7 and read PB8 feedback
        while True:
            # 1. Set PB7 to HIGH level
            gpio_out.write(True)
            time.sleep(0.1)  # Short delay for signal stabilization (avoid read lag)
            pb8_reading = gpio_in.read()
            print(f"PB7 Output: HIGH (True) | PB8 Reading: {pb8_reading}")

            # Keep PB7 HIGH for 1 second
            time.sleep(1)

            # 2. Set PB7 to LOW level
            gpio_out.write(False)
            time.sleep(0.1)  # Short delay for signal stabilization
            pb8_reading = gpio_in.read()
            print(f"PB7 Output: LOW (False) | PB8 Reading: {pb8_reading}")

            # Keep PB7 LOW for 1 second
            time.sleep(1)

    # Handle user-initiated exit (Ctrl+C)
    except KeyboardInterrupt:
        print("\n\nTest stopped by user (Ctrl+C)")
    # Handle other unexpected errors (e.g., GPIO access failure)
    except Exception as e:
        print(f"\nError during test: {str(e)}")
    # Ensure GPIO resources are released even if an error occurs
    finally:
        print("\nReleasing GPIO resources...")
        # Safely close PB7 (set to LOW first to avoid residual high level)
        if gpio_out:
            try:
                gpio_out.write(False)
                gpio_out.close()
                print(f"Successfully closed PB7 (Pin {OUTPUT_PIN_NUMBER})")
            except Exception as close_err:
                print(f"Failed to close PB7 (Pin {OUTPUT_PIN_NUMBER}): {str(close_err)}")
        # Safely close PB8
        if gpio_in:
            try:
                gpio_in.close()
                print(f"Successfully closed PB8 (Pin {INPUT_PIN_NUMBER})")
            except Exception as close_err:
                print(f"Failed to close PB8 (Pin {INPUT_PIN_NUMBER}): {str(close_err)}")
        print("Resource release complete.")

# Run the test when the script is executed directly
if __name__ == "__main__":
    gpio_output_with_feedback()
```

</details>

#### 测试步骤

1. 将 PB7 引脚和 PB8 引脚进行短接

2. 将代码保存为 `gpio_output.py`

3. 使用 `sudo python3 gpio_output.py` 命令运行测试代码

### 实验现象

终端会输出 False 或 True 信息。

False 代表低电平，True 代表高电平。

## PWM 输出

### 硬件准备

- 主板
- LED
- 杜邦线

### 软件准备

#### 测试代码

以下代码是使用 python-periphery 库来测试 PWM 输出。

<details>
<summary>pwm_output.py</summary>

```text
from periphery import PWM
import time

def pwm_test():
    try:
        # Configure PWM parameters - modify according to your hardware
        # Common PWM paths: /sys/class/pwm/pwmchip0/pwm0, etc.
        PWM_CHIP = 10       # PWM chip number
        PWM_CHANNEL = 2     # PWM channel number

        # Initialize PWM
        pwm = PWM(PWM_CHIP, PWM_CHANNEL)

        print(f"PWM Test: Using PWM{PWM_CHIP}.{PWM_CHANNEL} (Pin: PD12)")

        # Set PWM frequency to 1kHz
        frequency = 1000  # 1000 Hz
        pwm.frequency = frequency
        print(f"  Set frequency: {frequency} Hz")

        # Enable PWM output
        pwm.enable()
        print("  PWM enabled")

        # Test different duty cycles (0% to 100%)
        duty_cycles = [0.0, 0.25, 0.5, 0.75, 1.0]

        for duty in duty_cycles:
            pwm.duty_cycle = duty
            print(f"  Set duty cycle: {duty*100:.1f}%")
            time.sleep(1)  # Maintain current duty cycle for 1 second

        # Cleanup
        pwm.disable()
        pwm.close()
        print("  PWM disabled and closed")
        print("PWM Test completed successfully")

    except Exception as e:
        print(f"PWM Test failed: {e}")

if __name__ == "__main__":
    print("Starting PWM Signal Test...\n")
    pwm_test()
```

</details>

#### 测试步骤

1. 进入 `rsetup` 的 `Overlay` -> `Manage overlays` 勾选 `Enable PWM1-2` 选项，勾选后重启系统

2. 将 LED 的正极连接到 PD12 引脚

3. 将 LED 的负极连接到 GND 引脚

4. 将代码保存为 `pwm_output.py`

5. 使用 `sudo python3 pwm_output.py` 命令运行测试代码

### 实验现象

外接的 LED 会以不同的亮度闪烁，从亮到暗变化。

## UART 使用

UART（通用异步收发传输器） 是一种广泛使用的串行通信协议，用于在嵌入式系统、计算机和外设之间进行异步串行数据传输。

### 硬件准备

- 主板
- 杜邦线

### 软件准备

#### 测试代码

以下代码是使用 python-periphery 库来测试 UART4 回环通信。

<details>
<summary>uart_example.py</summary>

```text
from periphery import Serial
import time

def uart_test():
    try:
        # Modify the serial device path according to your hardware, common paths include /dev/ttyS0, /dev/ttyS1, /dev/ttyUSB0, etc.
        # PJ24(TX)  PJ25(RX)
        UART_DEVICE = "/dev/ttyAS4"
        BAUDRATE = 115200

        # Initialize serial port
        serial = Serial(UART_DEVICE, BAUDRATE)

        print(f"UART Test: Opening serial port {UART_DEVICE}, baud rate {BAUDRATE}")

        # Send test data
        test_message = "Hello, UART Test!\n"
        serial.write(test_message.encode())
        print(f"  Sent data: {test_message.strip()}")

        # Wait for data transmission
        time.sleep(0.1)

        # Try to read data (if loopback or other device responds)
        if serial.input_waiting() > 0:
            received_data = serial.read(serial.input_waiting())
            print(f"  Received data: {received_data.decode().strip()}")
        else:
            print("  No data received (normal unless loopback is connected)")

        serial.close()
        print("UART test completed")

    except Exception as e:
        print(f"UART test failed: {e}")

if __name__ == "__main__":
    uart_test()
```

</details>

#### 测试步骤

1. 进入 `rsetup` 的 `Overlay` -> `Manage overlays` 勾选 `Enable UART4` 选项，勾选后重启系统

2. 将 PJ24 引脚和 PJ25 引脚短接

3. 将代码保存为 `uart_example.py`

4. 使用 `sudo python3 uart_example.py` 命令运行测试代码

### 实验现象

终端会输出发送和接收的信息，可以根据终端输出的信息判断 UART 回环测试是否成功。

## I2C 使用

I2C 是一种广泛使用的同步串行通信协议，由飞利浦（现恩智浦）开发，主要用于短距离芯片间通信。

### 硬件准备

- 主板
- I2C 设备（如 OLED 显示屏，其对应的 I2C 地址为 0x3C）
- 杜邦线

### 软件准备

#### 测试代码

以下代码是使用 python-periphery 库来测试 I2C 通信。

<details>
<summary>i2c_example.py</summary>

```text
from periphery import I2C

def i2c_device_detection():
    """I2C Test - Check if device exists
    Pin reference: PJ23 (SDA), PJ22 (SCL)
    """
    # Modify according to your hardware connection
    # Common I2C bus devices: /dev/i2c-0, etc.
    I2C_BUS = "/dev/i2c-7"
    TARGET_ADDR = 0x3C  # Target address to check

    i2c = None  # Initialize I2C object reference
    try:
        # Initialize I2C object
        i2c = I2C(I2C_BUS)

        # Attempt a simple read/write operation to detect device
        # Sending a single 0x00 byte as test communication
        msgs = [I2C.Message([0x00])]
        i2c.transfer(TARGET_ADDR, msgs)

        print(f"I2C Test: Device found at address 0x{TARGET_ADDR:02X}")
        return True

    except Exception as e:
        # Exception (e.g., IOError) usually indicates no device or no response
        print(f"I2C Test: No device or no response at address 0x{TARGET_ADDR:02X}: {e}")
        return False
    finally:
        # Ensure I2C resources are released
        if i2c is not None:
            try:
                i2c.close()
            except:
                pass

if __name__ == "__main__":
    print("Starting I2C Device Detection...")
    i2c_device_detection()
    print("I2C Test completed")
```

</details>

#### 测试步骤

1. 进入 `rsetup` 的 `Overlay` -> `Manage overlays` 勾选 `Enable TWI7` 选项，勾选后重启系统

2. 将 OLED 显示屏的 SCL 引脚连接到 PJ22 引脚，SDA 引脚连接到 PJ23 引脚，VCC 连接到 5V，GND 连接到 GND

3. 将代码保存为 `i2c_example.py`

4. 使用 `sudo python3 i2c_example.py` 命令运行测试代码

### 实验现象

脚本功能是检查指定 I2C 总线上的特定地址是否存在可响应的 I2C 设备，可以判断 I2C 设备是否正常工作。

## SPI 使用

SPI（串行外设接口）是一种高速、全双工、同步串行通信协议，由 Motorola（现为 NXP ）开发，主要用于短距离芯片间通信，常见于传感器、存储器（如 Flash ）、显示屏等设备与微控制器之间的数据传输。

### 硬件准备

- 主板
- 杜邦线

### 软件准备

#### 测试代码

以下代码是使用 python-periphery 库来测试 SPI 回环通信。

<details>
<summary>spi_example.py</summary>

```text
from periphery import SPI

def spi_communication_test():
    # Data to be transmitted (4 bytes)
    transmit_data = [0xAA, 0xBB, 0xCC, 0xDD]

    try:
        # Initialize SPI resource
        # Parameters: SPI device path, mode 0, 1MHz clock frequency
        spi = SPI("/dev/spidev1.0", 0, 1000000)

        # Transmit data and receive response simultaneously
        # SPI is full-duplex, so data is sent and received at the same time
        received_data = spi.transfer(transmit_data)

        # Print test results
        print("SPI Test:")
        print("  Transmitted data: [0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}]".format(*transmit_data))
        print("  Received data:    [0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}]".format(*received_data))

    except Exception as e:
        print(f"SPI Test failed: {e}")
    finally:
        # Ensure SPI resource is released
        try:
            spi.close()
        except:
            pass

if __name__ == "__main__":
    print("Starting SPI Communication Test...\n")
    spi_communication_test()
    print("\nSPI Test completed")
```

</details>

#### 测试步骤

1. 进入 `rsetup` 的 `Overlay` -> `Manage overlays` 勾选 `Enable spidev on SPI1` 选项，勾选后重启系统

2. 将 PD12 引脚和 PD13 引脚短接

3. 将代码保存为 `spi_example.py`

4. 使用 `sudo python3 spi_example.py` 命令运行测试代码

### 实验现象

终端会输出发送和接收的信息，可以根据发送和接收的数据是否一致判断 SPI 回环测试是否成功。
