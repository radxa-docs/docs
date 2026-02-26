---
sidebar_position: 5
---

# 40-Pin GPIO Interface

The Radxa Cubie A7Z features an onboard 40-Pin GPIO (General Purpose Input/Output) interface, providing highly flexible interface support for hardware expansion.

Users can connect various sensors, actuators, communication modules, displays, and other embedded peripherals through the 40-Pin GPIO interface, enabling rapid prototyping and functional validation in fields such as IoT, robotics control, and industrial automation.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7z/a7z-gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
When using the 40-Pin GPIO interface, please pay attention to pin connections and peripheral wiring. Ensure correct pin connections as improper operation may cause hardware damage.
:::

## GPIO Features

Cubie A7Z supports connecting external devices to the onboard GPIO pins, including UART, SPI, I2C, ADC, and more.

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

### GPIO Pin Numbering

To control a specific pin, you need to calculate the pin number using the following formula:

| GPIO Chip | Pin Range | Calculation Formula |
| :-------: | :-------: | :-----------------: |
| GPIOCHIP0 |   A ~ K   | NUM + 32 \* (A ~ K) |
| GPIOCHIP1 |    L ~    | NUM + 32 \* (L ~ )  |

Calculation Example:

- PB7

GPIOCHIP0 -> 7 + 32 \* (A ~ K) -> 7 + 32 \* 1 -> 39

## GPIO Usage

Through the 40-Pin GPIO interface, demonstrate common GPIO usage.

## Install python-periphery

Use the `python-periphery` library to control GPIO pins.

<NewCodeBlock tip="radxa@cubie-a7z$" type="device">

```bash
sudo pip3 install python-periphery
```

</NewCodeBlock>

## GPIO Input

### Hardware Preparation

- Board
- Dupont wire

### Software Preparation

The following code is used to read the high and low level of the PK4 pin using the python-periphery library.

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

#### Test Steps

1. Connect the PB7 pin to the GND or 3.3V pin

2. Save the code as `gpio_input.py`

3. Run the test code using `python3 gpio_input.py`

### Experimental Phenomenon

The terminal will output False or True information.

False represents a low level, True represents a high level.

## GPIO Output

### Hardware Preparation

- Board
- Dupont wire

### Software Preparation

#### Test Code

The following code is used to control the PB7 pin to output high and low levels, and then read the high and low levels of the PB7 pin through the PB8 pin.

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

#### Test Steps

1. Short the PB7 pin and PB8 pin

2. Save the code as `gpio_output.py`

3. Run the test code using `sudo python3 gpio_output.py`

### Experimental Phenomenon

The terminal will output False or True information.

False represents a low level, True represents a high level.

## PWM Output

### Hardware Preparation

- Board
- LED
- Dupont wire

### Software Preparation

#### Test Code

The following code is used to test PWM output using the python-periphery library.

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

#### Test Steps

1. Enter `rsetup` -> `Overlay` -> `Manage overlays` and check the `Enable PWM1-2` option, then restart the system

2. Connect the positive terminal of the LED to the PD12 pin

3. Connect the negative terminal of the LED to the GND pin

4. Save the code as `pwm_output.py`

5. Run the test code using `sudo python3 pwm_output.py`

### Experimental Phenomenon

The connected LED will flash with different brightness, from bright to dark.

## UART Usage

UART（Universal Asynchronous Receiver/Transmitter） is a widely used serial communication protocol, used for asynchronous serial data transmission between embedded systems, computers, and peripherals.

### Hardware Preparation

- Board
- Dupont wire

### Software Preparation

#### Test Code

The following code is used to test UART4 loopback communication using the python-periphery library.

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

#### Test Steps

1. Enter `rsetup` -> `Overlay` -> `Manage overlays` and check the `Enable UART4` option, then restart the system

2. Short the PJ24 pin and PJ25 pin

3. Save the code as `uart_example.py`

4. Run the test code using `sudo python3 uart_example.py`

### Experimental Phenomenon

The terminal will output the sent and received information, and you can judge whether the UART loopback test is successful based on the terminal output information.

## I2C Usage

I2C is a widely used synchronous serial communication protocol developed by Philips (now NXP), mainly used for short-distance chip-to-chip communication.

### Hardware Preparation

- Board
- I2C device (e.g., OLED display, its corresponding I2C address is 0x3C)
- Dupont wire

### Software Preparation

#### Test Code

The following code is used to test I2C communication using the python-periphery library.

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

#### Test Steps

1. Enter `rsetup` -> `Overlay` -> `Manage overlays` and check the `Enable TWI7` option, then restart the system

2. Connect the SCL pin of the OLED display to the PJ22 pin, connect the SDA pin of the OLED display to the PJ23 pin, connect the VCC to 5V, and connect the GND to GND

3. Save the code as `i2c_example.py`

4. Run the test code using `sudo python3 i2c_example.py`

### Experimental Phenomenon

The script function is to check if a specific I2C device exists on the specified I2C bus, and can determine if the I2C device is working normally.

## SPI Usage

SPI (Serial Peripheral Interface) is a high-speed, full-duplex, synchronous serial communication protocol developed by Motorola (now NXP), mainly used for short-distance chip-to-chip communication, commonly used in data transmission between sensors, storage devices (such as Flash), and displays.

### Hardware Preparation

- Board
- Dupont wire

### Software Preparation

#### Test Code

The following code is used to test SPI loopback communication using the python-periphery library.

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

#### Test Steps

1. Enter `rsetup` -> `Overlay` -> `Manage overlays` and check the `Enable spidev on SPI1` option, then restart the system

2. Connect the PD12 pin and PD13 pin

3. Save the code as `spi_example.py`

4. Run the test code using `sudo python3 spi_example.py`

### Experimental Phenomenon

The terminal will output the sent and received information, and you can judge whether the SPI loopback test is successful based on the terminal output information.
