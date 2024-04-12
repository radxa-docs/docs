---
sidebar_position: 3
---

# SATA HAT top board

Radxa ROCK Penta SATA HAT 有一个 2x5 的座子，座子的信号如下：

| Pin | Signal   | Pin | Signal     |
| --- | -------- | --- | ---------- |
| 1   | I2C_SDA  | 2   | VCC3V3_SYS |
| 3   | I2C_SCL  | 4   | VCC5V0_SYS |
| 5   | GPIO4_D2 | 6   | GPIO4_C2   |
| 7   | GND      | 8   | PWM_33     |
| 9   | GND      | 10  | NC         |

这个座子可以用来链接顶板，顶板上有一个 0.91 寸的 OLED 显示屏和一个 4010 风扇，显示屏可以显示 IP 地址和存储信息等，风扇用于散热。

![SATA HAT top board](/img/accessories/penta/sata-hat-top-board.webp)

## 软件支持

为了让顶板的 OLED 显示屏和风扇正常工作，我们提供了 `rockpi-penta` 软件包，可以通过下面的命令安装。

```shell
sudo apt update
sudo apt install python3-dev
wget https://github.com/radxa/rockpi-penta/releases/download/0.2/rockpi-penta-v0.2.deb
sudo apt install -y ./rockpi-penta-v0.2.deb
```

### 软件配置

安装软件包后，如果需要修改配置，可以编辑配置文件 `/etc/rockpi-penta.conf`，下面是配置文件的默认值。

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

修改配置后，执行 `sudo systemctl restart rockpi-penta.service` 命令，重启服务使配置生效。
