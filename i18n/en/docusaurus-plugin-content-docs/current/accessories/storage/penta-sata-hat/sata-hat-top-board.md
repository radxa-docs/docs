---
sidebar_position: 3
---

# Penta SATA HAT top board

The Radxa Penta SATA HAT has a 2x5 seat with the following signal:

| Pin | Signal   | Pin | Signal     |
| --- | -------- | --- | ---------- |
| 1   | I2C_SDA  | 2   | VCC3V3_SYS |
| 3   | I2C_SCL  | 4   | VCC5V0_SYS |
| 5   | GPIO4_D2 | 6   | GPIO4_C2   |
| 7   | GND      | 8   | PWM_33     |
| 9   | GND      | 10  | NC         |

**Technical Specifications:**
- **Connector Type:** 2x5 pin header
- **Pitch:** 2.0mm
- **Compatible Connectors:** Standard 2.0mm pitch 2x5 pin header (2x5 pin header, 2.0mm pitch)

This seat can be used to link to the top plate, which has a 0.91 inch OLED display and a 4010 fan, which can display IP address and storage information, etc., and the fan is used for cooling.

![SATA HAT top board](/img/accessories/storage/penta/sata-hat-top-board.webp)

## Software support

In order to get the top panel OLED display and fan working properly, we provide the `rockpi-penta` package, which can be installed with the following command.

```shell
sudo apt update
sudo apt install wget
wget https://github.com/radxa/rockpi-penta/releases/download/v0.2.2/rockpi-penta-0.2.2.deb
sudo apt install -y ./rockpi-penta-0.2.2.deb
```

### ROCK 4 series: Enable the I2C7 overlay

On newer Radxa OS (Debian Bookworm) images, the **I2C7** bus used by the top board is not enabled by default. After installing `rockpi-penta`, if you see any of the following symptoms, the I2C7 overlay is likely not enabled:

- The OLED stays on "ROCKPI SATA HAT loading..."
- The fan does not spin, or always runs at full speed
- Service logs show errors like `FileNotFoundError: /sys/class/pwm/pwmchip1/pwm0/period` or `Device or resource busy`

To enable it:

```bash
sudo rsetup
```

Select `I2C7` in the Overlays menu (also select `PWM1` if the fan still misbehaves), save and reboot.

### Check which I2C bus the top board is on

The top board OLED (SSD1306) uses I2C address `0x3c`. Use the following commands to check whether the top board is detected and which bus it is on:

```bash
# List all I2C buses
sudo i2cdetect -l

# Scan each bus; the one showing 0x3c is where the top board is connected
sudo i2cdetect -y <bus_number>
```

After enabling the I2C7 overlay, scanning the corresponding bus should show the OLED device (usually i2c-7 on ROCK 4; check the `i2cdetect -l` output):

```bash
sudo i2cdetect -y 7
```

Seeing `3c` in the output means the top board OLED is detected.

### Software configuration

:::note
**Notes for latest Raspberry Pi OS (Debian trixie) users**

The `rockpi-penta` package may not install cleanly on a fresh Raspberry Pi OS (Debian trixie / Debian 13) system. Systems that upgrade from Debian 12 to trixie usually install the package without issues, but a fresh trixie install may fail. After installing or running on trixie, you may also encounter the following issues:
- OLED display only shows static message "RADXA SATA HAT Loading..."
- Fan stuck at 100% power
- Service startup error `FileNotFoundError: No such file or directory`

Additional fixes may be required. Please refer to the solutions reported by users in [GitHub issue #1792](https://github.com/radxa-docs/docs/issues/1792) and [#1540](https://github.com/radxa-docs/docs/issues/1540): https://github.com/HabiRabbu/rockpi-penta-pi5-fix
:::

After installing the package, if you need to modify the configuration, you can edit the configuration file `/etc/rockpi-penta.conf`, the following is the default value of the configuration file.

```ini
[fan]
# When the temperature is above lv0 (35'C), the fan at 25% power,
# and lv1 at 50% power, lv2 at 75% power, and lv3 at 100% power.
# When the temperature is below lv0, the fan is turned off.
# You can change these values if necessary.
lv0 = 35
lv1 = 40
lv2 = 45
lv3 = 50

[key]
# You can customize the function of the key, currently available functions are
# slider: oled display next page
# switch: fan turn on/off switch
# reboot, poweroff
# If you have any good suggestions for key functions,
# please add an issue on https://rock.sh/rockpi-sata
click = slider
twice = switch
press = none

[time]
# twice: maximum time between double clicking (seconds)
# press: long press time (seconds)
twice = 0.7
press = 1.8

[slider]
# Whether the oled auto display next page and the time interval (seconds)
auto = true
time = 10

[oled]
# Whether rotate the text of oled 180 degrees, whether use Fahrenheit
rotate = false
f-temp = false
```

After modifying the configuration, run the `sudo systemctl restart rockpi-penta.service` command to restart the service for the configuration to take effect.
