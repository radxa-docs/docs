---
sidebar_position: 9
---

# 40-Pin GPIO Interface

The Radxa Dragon Q8B features an onboard 40-pin GPIO (General-Purpose Input/Output) interface, providing highly flexible interface support for hardware expansion.

Users can connect various sensors, actuators, communication modules, displays, and other embedded peripherals via the 40-pin GPIO interface, enabling rapid prototyping and functional verification in fields such as the Internet of Things (IoT), robotics control, and industrial automation.

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q8b/q8b_gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
When using the 40-pin GPIO interface, pay attention to the wiring of the pins and peripherals, and ensure that the pins are connected correctly. Improper operation may result in damage to the device hardware.
:::

## GPIO Functions

Dragon Q8B supports connecting external devices to the onboard GPIO pins and provides multiple multiplexed functions, including UART, SPI, and I2C.

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

## GPIO Usage

This section demonstrates common GPIO usage through the onboard 40-pin GPIO interface.

### Install Python Library

Use the `python-periphery` library to control GPIO pins.

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash
sudo apt update
sudo apt install -y python3-periphery
```

</NewCodeBlock>

### GPIO Output/Input

#### Hardware Requirements

- Board
- Dupont wire

#### Software Requirements

- python-periphery library

#### Test Code

The following code uses the python-periphery library to control the GPIO_42 pin for outputting high/low levels and reads the GPIO_42 pin's state through the GPIO_175 pin.

<details>
<summary>gpio_output_input.py</summary>

```text
from periphery import GPIO
import time

def gpio_output_with_feedback():
    # GPIO Configuration (modify pin numbers based on your hardware)
    # GPIO_42 (output)  → maps to line 42 of /dev/gpiochip4
    # GPIO_175 (input)  → maps to line 175 of /dev/gpiochip4
    OUTPUT_PIN_CHIP = "/dev/gpiochip4"
    OUTPUT_PIN_NUMBER = 42    # GPIO_42 (output pin, controlled by the script)
    INPUT_PIN_NUMBER = 175    # GPIO_175 (input pin, reads GPIO_42's output state)

    # Initialize GPIO objects as None first (for safe release later)
    gpio_out = None
    gpio_in = None

    try:
        # Initialize GPIO_42 as OUTPUT mode
        gpio_out = GPIO(OUTPUT_PIN_CHIP, OUTPUT_PIN_NUMBER, "out")
        # Initialize GPIO_175 as INPUT mode
        gpio_in = GPIO(OUTPUT_PIN_CHIP, INPUT_PIN_NUMBER, "in")

        # Print test initialization info
        print("=== GPIO Output-Input Feedback Test Started ===")
        print(f"Controlled Pin (GPIO_42): {OUTPUT_PIN_CHIP} - Line {OUTPUT_PIN_NUMBER} (OUTPUT)")
        print(f"Monitoring Pin (GPIO_175): {OUTPUT_PIN_CHIP} - Line {INPUT_PIN_NUMBER} (INPUT)")
        print("Test Behavior: GPIO_42 toggles HIGH/LOW every 1s; GPIO_175 verifies GPIO_42's state")
        print("Press Ctrl+C to stop the test\n")

        # Main loop: Toggle GPIO_42 and read GPIO_175 feedback
        while True:
            # 1. Set GPIO_42 to HIGH level
            gpio_out.write(True)
            time.sleep(0.1)  # Short delay for signal stabilization (avoid read lag)
            gpio175_reading = gpio_in.read()
            print(f"GPIO_42 Output: HIGH (True) | GPIO_175 Reading: {gpio175_reading}")

            # Keep GPIO_42 HIGH for 1 second
            time.sleep(1)

            # 2. Set GPIO_42 to LOW level
            gpio_out.write(False)
            time.sleep(0.1)  # Short delay for signal stabilization
            gpio175_reading = gpio_in.read()
            print(f"GPIO_42 Output: LOW (False) | GPIO_175 Reading: {gpio175_reading}")

            # Keep GPIO_42 LOW for 1 second
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
        # Safely close GPIO_42 (set to LOW first to avoid residual high level)
        if gpio_out:
            try:
                gpio_out.write(False)
                gpio_out.close()
                print(f"Successfully closed GPIO_42 (Line {OUTPUT_PIN_NUMBER})")
            except Exception as close_err:
                print(f"Failed to close GPIO_42 (Line {OUTPUT_PIN_NUMBER}): {str(close_err)}")
        # Safely close GPIO_175
        if gpio_in:
            try:
                gpio_in.close()
                print(f"Successfully closed GPIO_175 (Line {INPUT_PIN_NUMBER})")
            except Exception as close_err:
                print(f"Failed to close GPIO_175 (Line {INPUT_PIN_NUMBER}): {str(close_err)}")
        print("Resource release complete.")

# Run the test when the script is executed directly
if __name__ == "__main__":
    gpio_output_with_feedback()
```

</details>

#### Test Steps

1. Short-circuit the GPIO_42 and GPIO_175 pins using a Dupont wire (these are pins 5 and 7 of the 40-pin header, respectively)

2. Save the code as `gpio_output_input.py`

3. Run the test code using the command: `sudo python3 gpio_output_input.py`

### Expected Results

The terminal will display the output level of GPIO_42 and the level read by GPIO_175.

- False represents a LOW level
- True represents a HIGH level
