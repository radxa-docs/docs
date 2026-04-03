# ROCK 5A 驱动 ST7789 横屏（320×240）完全指南

## 背景

ST7789 是一款常见的液晶控制芯片，最大分辨率 240×320。这块屏幕原生是竖屏（240 宽 × 320 高），通过 MADCTL 寄存器旋转后可以配置为横屏（320 宽 × 240 高）。

在 ROCK 5A 上用 Python + spidev 调试时，遇到了 X 坐标超过 240 后画面"折回"到左侧的问题——根本原因是横屏旋转后显存地址窗口没有正确设置。

---

## 硬件连接

| 功能 | GPIO | 物理引脚 | 说明 |
|------|------|----------|------|
| MOSI | SPI4_MOSI | Pin 19 | SPI 数据线 |
| CLK | SPI4_CLK | Pin 23 | SPI 时钟线 |
| CS | GPIO40 | Pin 18 | 软件控制片选 |
| DC | GPIO37 | Pin 16 | 数据/命令切换 |
| RST | GPIO45 | Pin 22 | 复位信号（低有效）|
| BLK | GPIO24 | Pin 28 | 背光控制（拉高即亮）|

---

## SPI 配置

- 总线：SPI4，设备 0
- 模式：0（CPOL=0, CPHA=0）
- 速率：1 MHz
- 颜色格式：RGB565（16 位，每像素 2 字节）

---

## ST7789 核心寄存器解析

### 1. MADCTL (0x36) — 控制显示方向和颜色顺序

这是最关键的寄存器。MX、MY、MV 三个位控制方向：

| Bit | 名称 | 作用 |
|-----|------|------|
| MX | 列地址反转 | MX=1 时列从右往左 |
| MY | 行地址反转 | MY=1 时行从下往上 |
| MV | 行/列交换 | MV=1 时行列互换（旋转的关键位）|
| RGB | 颜色顺序 | 0=RGB，1=BGR |

**横屏配置：MADCTL = 0x60**

```
0x60 = 01100000b
     = MY=0, MX=1, MV=1, ML=0, MH=0, RGB=0
```

MV=1（行/列交换）+ MX=1（列镜像），将原生 240×320 旋转为 320×240 横屏。

**四种旋转方向对照（源自官方驱动）：**

| MADCTL | 效果 | 宽×高 |
|--------|------|--------|
| 0x00 | 竖屏（正常方向）| 240×320 |
| 0x60 | 横屏（顺时针 90°，MV+MX）| 320×240 |
| 0xC0 | 竖屏（上下颠倒）| 240×320 |
| 0xA0 | 横屏（逆时针 90°，MV+MY）| 320×240 |

### 2. COLMOD (0x3A) — 颜色格式

设置每个像素的颜色位数：

| 值 | 格式 | 说明 |
|----|------|------|
| 0x03 | RGB444 | 12 位，4K 颜色 |
| 0x55 | RGB565 | 16 位，65K 颜色（最常用）|
| 0x66 | RGB666 | 18 位，262K 颜色 |

我们用 RGB565（0x55），每个像素 2 字节，格式为：

```
RRRRRGGGGGGBBBBB
 RRRRR     GGGGGG      BBBBB
```

### 3. CASET (0x2A) / RASET (0x2B) / RAMWR (0x2C) — 地址窗口

- **CASET**：设置列地址范围 `[XS, XE]`
- **RASET**：设置行地址范围 `[YS, YE]`
- **RAMWR**：写入显存

对于 240×320 的屏幕，竖屏模式下地址范围是：
- 列：XS=0 (0x00), XE=239 (0xEF)
- 行：YS=0 (0x00), YE=319 (0x13F)

横屏旋转后（320×240）：
- 列：0 - 319
- 行：0 - 239

**地址必须用 16 位格式（高字节+低字节）发送**，否则坐标超过 255 时会出错。

---

## 初始化序列

```python
def init():
    # 1. 硬件复位
    gpio_write(GPIO_RST, 0)
    time.sleep(0.01)
    gpio_write(GPIO_RST, 1)
    time.sleep(0.120)          # 复位后至少等 120ms

    # 2. 软件复位
    write_cmd(0x01)           # SWRESET
    time.sleep(0.2)

    # 3. 退出睡眠
    write_cmd(0x11)           # SLPOUT
    time.sleep(0.12)

    # 4. 设置横屏（关键！）
    write_cmd(0x36)           # MADCTL
    write_data(0x60)         # MV + MX = 横屏

    # 5. 设置颜色格式 RGB565
    write_cmd(0x3A)           # COLMOD
    write_data(0x55)         # 16-bit RGB565

    # 6. 开启显示
    write_cmd(0x29)           # DISPON
```

**要点：**
- 复位后必须等待足够时间（≥120ms）才能发命令
- 横屏旋转通过 MADCTL=0x60 实现，这是最核心的一步

---

## 地址窗口设置（踩坑最多的一步）

每次画图前都要重新设置地址窗口，坐标格式为 **高字节在前、低字节在后**：

```python
def write_addr(x, y, w, h):
    x2 = x + w - 1
    y2 = y + h - 1

    # CASET: 列地址窗口
    write_cmd(0x2A)
    write_data((x  >> 8) & 0xFF)   # XS 高字节
    write_data( x         & 0xFF)    # XS 低字节
    write_data((x2 >> 8) & 0xFF)   # XE 高字节
    write_data((x2      ) & 0xFF)   # XE 低字节

    # RASET: 行地址窗口
    write_cmd(0x2B)
    write_data((y  >> 8) & 0xFF)
    write_data( y         & 0xFF)
    write_data((y2 >> 8) & 0xFF)
    write_data((y2      ) & 0xFF)

    # 开始写入显存
    write_cmd(0x2C)           # RAMWR
```

**常见错误：坐标超过 255 时数据出错**

部分 SPI 实现直接传 16 位整数会导致高位丢失。正确做法是手动拆分为两个字节：

```python
# ❌ 错误写法（x=300 时可能出错）
write_data(x)

# ✅ 正确写法
write_data((x >> 8) & 0xFF)  # 高字节
write_data(x & 0xFF)          # 低字节
```

---

## 横屏坐标系

旋转后（320×240 横屏模式）：

| 坐标 | 范围 | 含义 |
|------|------|------|
| X | 0 - 319 | 0 在最左边，319 在最右边 |
| Y | 0 - 239 | 0 在最上边，239 在最下边 |
| 原点 | (0, 0) | 屏幕左上角 |

---

## RGB565 颜色速查

| 颜色 | 十进制 | 高字节 | 低字节 |
|------|--------|--------|--------|
| 黑色 | 0x0000 | 0x00 | 0x00 |
| 白色 | 0xFFFF | 0xFF | 0xFF |
| 红色 | 0xF800 | 0xF8 | 0x00 |
| 绿色 | 0x07E0 | 0x07 | 0xE0 |
| 蓝色 | 0x001F | 0x00 | 0x1F |
| 黄色 | 0xFFE0 | 0xFF | 0xE0 |
| 青色 | 0x07FF | 0x07 | 0xFF |
| 紫色 | 0xF81F | 0xF8 | 0x1F |

Python 中可以用这个函数从 RGB 转 RGB565：

```python
def rgb565(r: int, g: int, b: int) -> tuple:
    """将 R,G,B (0-255) 转换为 RGB565 (高字节, 低字节)"""
    color = ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3)
    return [(color >> 8) & 0xFF, color & 0xFF]
```

---

## 完整测试代码

```python
#!/usr/bin/env python3
import spidev
import time

GPIO_RST = 45
GPIO_DC  = 37
GPIO_BLK  = 24
GPIO_CS   = 40

def gpio_write(pin, value):
    with open(f'/sys/class/gpio/gpio{pin}/value', 'w') as f:
        f.write('1' if value else '0')

def cs_low():   gpio_write(GPIO_CS, 0)
def cs_high():  gpio_write(GPIO_CS, 1)

def write_cmd(cmd):
    cs_low()
    gpio_write(GPIO_DC, 0)
    spi.xfer([cmd])
    cs_high()

def write_data(data):
    if isinstance(data, int):
        data = [data]
    cs_low()
    gpio_write(GPIO_DC, 1)
    spi.xfer(data)
    cs_high()

def write_addr(x, y, w, h):
    x2, y2 = x + w - 1, y + h - 1
    write_cmd(0x2A)
    write_data([(x >> 8) & 0xFF,  x & 0xFF,
                (x2 >> 8) & 0xFF, x2 & 0xFF])
    write_cmd(0x2B)
    write_data([(y >> 8) & 0xFF,  y & 0xFF,
                (y2 >> 8) & 0xFF, y2 & 0xFF])
    write_cmd(0x2C)

def init():
    # 硬件复位
    gpio_write(GPIO_RST, 0)
    time.sleep(0.01)
    gpio_write(GPIO_RST, 1)
    time.sleep(0.120)

    # 软件复位
    write_cmd(0x01)
    time.sleep(0.2)

    # 退出睡眠
    write_cmd(0x11)
    time.sleep(0.12)

    # 横屏旋转（MV + MX）
    write_cmd(0x36)
    write_data(0x60)

    # RGB565 颜色格式
    write_cmd(0x3A)
    write_data(0x55)

    # 开启显示
    write_cmd(0x29)

def clear_screen():
    write_addr(0, 0, 320, 240)
    cs_low()
    gpio_write(GPIO_DC, 1)
    for _ in range(320 * 240):
        spi.xfer([0x00, 0x00])
    cs_high()

def draw_rect(x, y, w, h, color):
    write_addr(x, y, w, h)
    cs_low()
    gpio_write(GPIO_DC, 1)
    for _ in range(w * h):
        spi.xfer(color)
    cs_high()

spi = spidev.SpiDev()
spi.open(4, 0)
spi.max_speed_hz = 1_000_000
spi.mode = 0

init()
gpio_write(GPIO_BLK, 1)
clear_screen()

# 测试：右上角蓝色方块
draw_rect(300, 0, 20, 20, [0x00, 0x1F])

spi.close()
```

---

## 踩坑总结

### 1. 坐标回绕到左侧 → CASET 高低位字节未拆分

**现象：** X > 240 时，像素出现在左侧而非右侧。

**原因：** SPI 传输时坐标超过 255 的部分丢失。

**解决：** 严格按 `(x >> 8) & 0xFF`, `x & 0xFF` 格式发送。

### 2. 复位后白屏/花屏 → 复位时序不对

**现象：** 复位后屏幕不亮或颜色全乱。

**原因：** 复位脉冲太短或复位后等待时间不够。

**解决：** 复位脉冲 ≥10ms，复位后等待 ≥120ms 再发命令。

### 3. 横屏方向不对 → MADCTL 数值错误

**现象：** 屏幕方向不符合预期。

**原因：** MV 和 MX/MY 组合不对。

**解决：** 记住 `0x60` = 横屏，`0x00` = 竖屏，`0xA0` = 逆时针横屏。

### 4. 颜色错乱 → RGB/BGR 顺序

**现象：** 红色显示成蓝色，绿色正常。

**原因：** MADCTL 的 RGB 位默认值影响颜色顺序。

**解决：** 使用 RGB565 固定字节序，或尝试 MADCTL 加/减 0x08 调整。

---

## 参考资料

- ST7789 数据手册
- [ST7789 MicroPython 驱动（GitHub）](https://github.com/russhughes/st7789_mpy)
- [cnblogs: 树莓派Pico + MicroPython驱动2.4寸SPI串口屏](https://www.cnblogs.com/21207-iHome/p/16062769.html)

---

*测试环境：ROCK 5A + Python 3 + spidev*
