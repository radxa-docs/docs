---
sidebar_position: 4
---

# 40 Pin GPIO 接口

瑞莎 Cubie A5E 板载 40 Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40 Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a5e/a5e_gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
使用 40 Pin GPIO 接口时，请注意引脚和外设的接线，请确保引脚连接正确，不当操作可能导致设备硬件损坏。
:::

## GPIO 功能

Cubie A5E 支持给板载的 GPIO 引脚外接外部设备，支持 UART、SPI、I2C、ADC 等。

<TabItem value="Cubie A5E">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

|  Function7  |  Function6  | Function5  |  Function4  | Function3  | Function2  | Function1 |               Pin#               |              Pin#               | Function1 | Function2  | Function3  | Function4   | Function5   | Function6   | Function7   |
| :---------: | :---------: | :--------: | :---------: | :--------: | :--------: | :-------: | :------------------------------: | :-----------------------------: | :-------- | :--------- | :--------- | :---------- | :---------- | :---------- | :---------- |
|             |             |            |             |            |            |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   | +5.0V     |            |            |             |             |             |             |
|  PB-EINT5   |  HDMI-SDA   |   PWM0-9   |  TRACE-CLK  | I2S0-BCLK  |  TWI1-SDA  |    PB5    |  <div className='green'>3</div>  |  <div className="red">4</div>   | +5.0V     |            |            |             |             |             |             |
|  PB-EINT4   |  HDMI-SCL   |   PWM0-8   | TRACE-DATA2 | I2S0-MCLK  |  TWI1-SCK  |    PB4    |  <div className='green'>5</div>  | <div className='black'>6</div>  | GND       |            |            |             |             |             |             |
|             |  PI-EINT7   |  SPI2-CLK  |   PWM0-8    | UART4-CTS  |  UART6-RX  |    PI7    |  <div className='green'>7</div>  | <div className='green'>8</div>  | PB9       | UARTO-TX   | TWIO-SCK   | TRACE-DATA1 | I2S0-DIN2   | I2S0-DOUBT2 | PB-EINT9    |
|             |             |            |             |            |            |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> | PB10      | UARTO-RX   | TWIO-SDA   | PWM0-1      | I2S0-DIN3   | I2S0-DOUBT3 | PB-EINT10   |
|             |             |  PI-EINT9  |   PWM0-10   | DMIC-DATA2 |  TWI5-SDA  |    PI9    | <div className='green'>11</div>  | <div className='green'>12</div> | PI2       | UART5-TX   | SPI1-CSO   | PWM0-3      | I2S2-BCLK   | I2S2-BCLK   | PI-EINT2    |
|             |  PI-EINT10  | I2S2-MCLK  |   PWM0-11   | DMIC-DATA1 |  OWA-OUT   |   PI10    | <div className='green'>13</div>  | <div className='black'>14</div> | GND       |            |            |             |             |             |             |
| S-PL-EINT12 | S-SPI0-MOSI | DMIC-DATA2 | S-UART0-TX  | MCU-PWM0-6 | S-TWI2-SCK |   PL12    | <div className='green'>15</div>  | <div className='green'>16</div> | PI11      | UART3-TX   | DMIC-DATA0 | PWM0-12     | PI-EINT11   |             |             |
|             |             |            |             |            |            |   +3.3V   | <div className="yellow">17</div> | <div className='green'>18</div> | PI14      | UART6-RTS  | DMIC-CLK   | PWM0-15     | PI-EINT14   |             |             |
|             |  SPI1-MOSI  | PI-EINT13  |   PWM0-4    |  UART7-TX  |  TWI4-SCK  |   PB13    | <div className='green'>19</div>  | <div className='black'>20</div> | GND       |            |            |             |             |             |             |
|             |  PB-EINT14  |   PWM0-5   |  SPI1-MISO  |  UART7-RX  |  TWI4-SDA  |   PB14    | <div className='green'>21</div>  | <div className='green'>22</div> | PL13      | S-TWI2-SDA | MCU-PWM0-7 | S-UARTO-RX  | DMIC-DATA3  | S-SPI-MISO  | S-PL-EINT13 |
|             |  PB-EINT12  |   PWM0-3   |  SPI1-CLK   | UART7-CTS  |  TWI5-SDA  |   PB12    | <div className='green'>23</div>  | <div className='green'>24</div> | PB11      | TWI5-SCK   | UART7-RTS  | PWM0-2      | SPI1-CSO    | PB-EINT11   |             |
|             |             |            |             |            |            |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | PI0       | TWI4-SCK   | UART4-TX   | PWM0-1      | I2S2-DIN3   | I2S2-DOUBT3 | PI-EINTO    |
|             |  (USB2-DM)  | PI-EINT16  |   PWM1-1    |  TWI2-SDA  | UART3-CTS  |   PI16    |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | PI15      | TWI2-SCK   | UART3-RTS  | PWM1-0      | PI-EINT15   | (USB2-DM)   |             |
|             |  PI-EINT8   | SPI2-MOSI  |   PWM0-9    |   IR-RX    |  TWI5-SCK  |    PI8    | <div className='green'>29</div>  | <div className='black'>30</div> | GND       |            |            |             |             |             |             |
|             |             | PI-EINT12  |  SPI2-MISO  |  PWM0-13   |  UART3-RX  |   PI12    | <div className='green'>31</div>  | <div className='green'>32</div> | PI1       | TWI4-SDA   | UART4-RX   | PWM0-2      | I2S2-DIN2   | I2S2-DOUBT2 | PI-EINT1    |
|             |  PI-EINT6   |  SPI2-CSO  |   PWM0-7    |  UART6-TX  | UART4-RTS  |    PI6    | <div className='green'>33</div>  | <div className='black'>34</div> | GND       |            |            |             |             |             |             |
|             |  PI-EINT13  | I2S2-MCLK  |   PWM0-14   | DMIC-DATA3 | UART6-CTS  |   PI13    | <div className='green'>35</div>  | <div className='green'>36</div> | PI3       |            | UART5-RX   | PWM0-4      | I2S2-LRCK   | SPI1-CLK    | PI-EINT3    |
|             |             |            |             |            |            |  GPADC2   | <div className='green'>37</div>  | <div className='green'>38</div> | PI5       | UART5-CTS  | SPI1-MISO  | PWM0-6      | I2S2-DINO   | I2S2-DOUBT1 | PI-EINT5    |
|             |             |            |             |            |            |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> | PI4       | UART5-RTS  | SPI1-MOSI  | PWM0-5      | I2S2-DOUBT0 | I2S2-DIN1   | PI-EINT4    |

   </div>
</TabItem>

### GPIO 引脚号

控制指定引脚，你想需要根据以下公式来计算引脚号：

| GPIO 芯片 | 引脚号 |      计算公式       |
| :-------: | :----: | :-----------------: |
| GPIOCHIP1 | A ~ K  | NUM + 32 \* (A ~ K) |
| GPIOCHIP0 |  L ~   | NUM + 32 \* (L ~ )  |

计算示例：

- PI4

GPIOCHIP1 -> 4 + 32 \* (A ~ K) -> 4 + 32 \* 8 -> 260

## GPIO 使用

通过板载的 40-Pin GPIO 接口，演示常见的 GPIO 使用方法。

## 安装 python-periphery

使用 `python-periphery` 库来控制 GPIO 引脚。

<NewCodeBlock tip="radxa@cubie-a5e$" type="device">

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

以下代码是使用 python-periphery 库来读取 PI4 引脚的高低电平。

<details>
<summary>gpio_input.py</summary>

```text
from periphery import GPIO
import time

def read_gpio_input():
    # Configure GPIO input (modify pin number according to actual hardware)
    # Using pin 260 of /dev/gpiochip1 here (corresponds to PI4)
    try:
        # Initialize GPIO in input mode
        gpio_in = GPIO("/dev/gpiochip1", 260, "in")

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

1. 将 PI4 引脚接 GND 或 3.3V 引脚

2. 将代码保存为 `gpio_input.py`

3. 使用 `sudo python3 gpio_input.py` 命令运行测试代码

### 实验现象

终端会输出 False 或 True 信息。

False 代表低电平，True 代表高电平。

## GPIO 输出

### 硬件准备

- 主板
- 杜邦线

### 软件准备

#### 测试代码

以下代码是使用 python-periphery 库来控制 PI4 引脚输出高低电平，然后通过 PI5 引脚读取 PI4 引脚的高低电平。

<details>
<summary>gpio_output.py</summary>

```text
from periphery import GPIO
import time

def gpio_output_with_feedback():
    # GPIO Configuration (modify pin numbers based on your hardware)
    # PI4 (output) → maps to pin 260 of /dev/gpiochip1
    # PI5 (input)  → maps to pin 261 of /dev/gpiochip1
    OUTPUT_PIN_CHIP = "/dev/gpiochip1"
    OUTPUT_PIN_NUMBER = 260  # PI4 (output pin, controlled by the script)
    INPUT_PIN_NUMBER = 261   # PI5 (input pin, reads PI4's output state)

    # Initialize GPIO objects as None first (for safe release later)
    gpio_out = None
    gpio_in = None

    try:
        # Initialize PI4 as OUTPUT mode
        gpio_out = GPIO(OUTPUT_PIN_CHIP, OUTPUT_PIN_NUMBER, "out")
        # Initialize PI5 as INPUT mode
        gpio_in = GPIO(OUTPUT_PIN_CHIP, INPUT_PIN_NUMBER, "in")

        # Print test initialization info
        print("=== GPIO Output-Input Feedback Test Started ===")
        print(f"Controlled Pin (PI4): {OUTPUT_PIN_CHIP} - Pin {OUTPUT_PIN_NUMBER} (OUTPUT)")
        print(f"Monitoring Pin (PI5): {OUTPUT_PIN_CHIP} - Pin {INPUT_PIN_NUMBER} (INPUT)")
        print("Test Behavior: PI4 toggles HIGH/LOW every 1s; PI5 verifies PI4's state")
        print("Press Ctrl+C to stop the test\n")

        # Main loop: Toggle PI4 and read PI5 feedback
        while True:
            # 1. Set PI4 to HIGH level
            gpio_out.write(True)
            time.sleep(0.1)  # Short delay for signal stabilization (avoid read lag)
            pi5_reading = gpio_in.read()
            print(f"PI4 Output: HIGH (True) | PI5 Reading: {pi5_reading}")

            # Keep PI4 HIGH for 1 second
            time.sleep(1)

            # 2. Set PI4 to LOW level
            gpio_out.write(False)
            time.sleep(0.1)  # Short delay for signal stabilization
            pi5_reading = gpio_in.read()
            print(f"PI4 Output: LOW (False) | PI5 Reading: {pi5_reading}")

            # Keep PI4 LOW for 1 second
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
        # Safely close PI4 (set to LOW first to avoid residual high level)
        if gpio_out:
            try:
                gpio_out.write(False)
                gpio_out.close()
                print(f"Successfully closed PI4 (Pin {OUTPUT_PIN_NUMBER})")
            except Exception as close_err:
                print(f"Failed to close PI4 (Pin {OUTPUT_PIN_NUMBER}): {str(close_err)}")
        # Safely close PI5
        if gpio_in:
            try:
                gpio_in.close()
                print(f"Successfully closed PI5 (Pin {INPUT_PIN_NUMBER})")
            except Exception as close_err:
                print(f"Failed to close PI5 (Pin {INPUT_PIN_NUMBER}): {str(close_err)}")
        print("Resource release complete.")

# Run the test when the script is executed directly
if __name__ == "__main__":
    gpio_output_with_feedback()
```

</details>

#### 测试步骤

1. 将 PI4 引脚和 PI5 引脚进行短接

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
        PWM_CHIP = 0        # PWM chip number
        PWM_CHANNEL = 7     # PWM channel number

        # Initialize PWM
        pwm = PWM(PWM_CHIP, PWM_CHANNEL)

        print(f"PWM Test: Using PWM{PWM_CHIP}.{PWM_CHANNEL} (Pin: PI6)")

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

1. 进入 `rsetup` 的 `Overlay` -> `Manage overlays` 勾选 `Enable PWM0-7` 选项，勾选后重启系统

2. 将 LED 的正极连接到 PI6 引脚

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
        # PI11(TX)  PI31(RX)
        UART_DEVICE = "/dev/ttyAS3"
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

1. 进入 `rsetup` 的 `Overlay` -> `Manage overlays` 勾选 `Enable UART3` 选项，勾选后重启系统

2. 将 PI11 引脚和 PI31 引脚短接

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
    Pin reference: PB5 (SDA), PB4 (SCL)
    """
    # Modify according to your hardware connection
    # Common I2C bus devices: /dev/i2c-0, etc.
    I2C_BUS = "/dev/i2c-1"
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

1. 进入 `rsetup` 的 `Overlay` -> `Manage overlays` 勾选 `Enable TWI1` 选项，勾选后重启系统

2. 将 OLED 显示屏的 SCL 引脚连接到 PB4 引脚，SDA 引脚连接到 PB5 引脚，VCC 连接到 5V，GND 连接到 GND

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

2. 将 PI4 引脚和 PI5 引脚连接

3. 将代码保存为 `spi_example.py`

4. 使用 `sudo python3 spi_example.py` 命令运行测试代码

### 实验现象

终端会输出发送和接收的信息，可以根据发送和接收的数据是否一致判断 SPI 回环测试是否成功。
