---
sidebar_position: 10
---

# Penta SATA HAT 使用教程

## 准备工作

- 图片为带 Radxa PENTA SATA HAT 的 ROCK 5A。

![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-05.webp)

- 下图是 [RADXA Penta SATA HAT](/accessories/storage/penta-sata-hat) 和包含的零件。

![ROCK5A Install M.2 Extension Board](/img/accessories/storage/penta-sata-hat-01.webp)

- 请先区分 IPEX 线缆的正反面。如图所示。 **我们为 ROCK5A 提供的 IPEX 线的两端方向相同。**

![ROCK5A Install M.2 Extension Board](/img/accessories/storage/m2-extension-board-04.webp)

- 请注意，环扣需要卡入连接器中。

![E key to M key](/img/accessories/storage/ekey-to-mkey-01.webp)

## 安装教程

### 步骤

1、M.2 E key to M.2 M key Board 带 IPEX 电缆。 **注意这里安装的 IPEX 线是正面朝上的，环扣需要卡在接口上，确保固定。**

![ROCK5A Install M.2 Extension Board](/img/accessories/storage/m2-extension-board-02.webp)

2、Radxa Penta SATA HAT 主板，带 IPEX 电缆。 **注意这里安装的 IPEX 线是正面朝上的，环扣需要卡在接口上，确保固定。**

![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-04.webp)

3、请将产品附带的 M2.5x18+6 铜柱和 M2.5x5 铜柱安装在 ROCK5A 上，如图所示。

![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-04.webp)

4、请将 IPEX 线的一端连接到 M.2 E key to M Key board，另一端连接到 Radxa Penta SATA HAT 并将 M.2 E key to M key board 安装到 M.2 E key ROCK5A 的连接器。如图所示。

![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-03.webp)

5、最后，使用 M2.5x5+5 铜柱组装 Radxa Penta SATA HAT。

![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-01.webp)
![ROCK5A Install Penta SATA HAT](/img/rock5a/rock5a-penta-sata-hat-02.webp)

### 检查 Penta SATA HAT 挂载状态

1、通过`lsblk`查看 SATA 设备是否被识别。

```
radxa@rock-5a:~$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda            8:0    0 465.8G  0 disk
└─sda1         8:1    0 465.8G  0 part
sdb            8:16   0 465.8G  0 disk
└─sdb1         8:17   0 465.8G  0 part
sdc            8:32   0 465.8G  0 disk
└─sdc1         8:33   0 465.8G  0 part
sdd            8:48   0 465.8G  0 disk
└─sdd1         8:49   0 465.8G  0 part
mmcblk0      179:0    0  14.5G  0 disk
├─mmcblk0p1  179:1    0    16M  0 part /config
└─mmcblk0p2  179:2    0  14.4G  0 part /
mmcblk0boot0 179:32   0     4M  1 disk
mmcblk0boot1 179:64   0     4M  1 disk
zram0        254:0    0   3.8G  0 disk [SWAP]
radxa@rock-5a:~$
```

2、当系统识别到 Penta SATA HAT 时，你可以查看到 SATA devices(sda/sdb/sdc/sdd)。

## 软件支持

我们提供了一个安装脚本来帮助您安装我们提供的软件，它能让 Penta 顶板显示信息和控制风扇。

```
curl -sL https://rock.sh/get-rockpi-penta | sudo -E bash -
```

只需复制上面的命令并将其粘贴到终端并按回车键即可。

### 软件配置

编辑 /etc/rockpi-penta.conf, 并使用下面的命令使它生效。

```
sudo systemctl restart rockpi-penta.service
```

### 默认配置

下面是 /etc/rockpi-penta.conf 的默认配置，你可以根据注释进行修改。

```
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
