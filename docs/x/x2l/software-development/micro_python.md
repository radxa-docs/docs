---
sidebar_position: 3
---

# MicroPython

我们可以使用 MicroPython 通过RP2040 来控制GPIO，主CPU 通过 UART 与 RP2040 通信，然后通过 RP2040 访问 [GPIO](gpio)。

## 介绍

- 下载 [Micro Python](https://micropython.org/download/RPI_PICO/) (推荐使用我们验证过的v1.22.0版本), 保存为 .uf2 后缀的文件。

- 打开 RP2040 USB 设备 (使用 [usb.sh](flash))

- 安装 Thonny IDE

  ```bash
  sudo apt-get install thonny -y
  ```

- 打开 Thonny IDE 开始写 MicroPython 程序，至此，我们已经成功搭建 micro-python 环境

<img src="/img/x/x2l/flash_micro_python.webp" alt="Flash Micro Python" height="350" width="700" />

## 更多示例

请参考 [UART](uart)

## 异常处理

由于 RP2040 表现得像是带有 USB 和 UART 的 Pi Pico，你可以几乎以任何正常方式使用它，包括像 CircuitPython 和 Arduino 代码这样的软件/固件镜像。

如果 RP2040 崩溃，你可以将 GPIO 60 拉高 1 秒以重置 SoC：

```text
bash
sudo gpioset gpiochip1 60=1
sleep 1
sudo gpioset gpiochip1 60=0
```
