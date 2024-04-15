---
sidebar_position: 3
---

# SATA HAT top board

The Radxa ROCK Penta SATA HAT has a 2x5 seat with the following signal:

| Pin | Signal   | Pin | Signal     |
| --- | -------- | --- | ---------- |
| 1   | I2C_SDA  | 2   | VCC3V3_SYS |
| 3   | I2C_SCL  | 4   | VCC5V0_SYS |
| 5   | GPIO4_D2 | 6   | GPIO4_C2   |
| 7   | GND      | 8   | PWM_33     |
| 9   | GND      | 10  | NC         |

This seat can be used to link to the top plate, which has a 0.91 inch OLED display and a 4010 fan, which can display IP address and storage information, etc., and the fan is used for cooling.

![SATA HAT top board](/img/accessories/penta/sata-hat-top-board.webp)

## Software support

In order to get the top panel OLED display and fan working properly, we provide the `rockpi-penta` package, which can be installed with the following command.

```shell
sudo apt update
sudo apt install python3-dev
wget https://github.com/radxa/rockpi-penta/releases/download/0.2/rockpi-penta-v0.2.deb
sudo apt install -y ./rockpi-penta-v0.2.deb
```

### Software configuration

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
