---
sidebar_position: 30
---

# Uart 通信

## 硬件连接

IT8613E/LX 与 RP2040 在内部通过连接进行 uart 通信，以下是两者之间的连接方式

```
IT8613E/LX          RP2040

uart0 rx            GP00
uart0 tx            GP01
```

## PICO-EXAMPLES 下 Uart 通信的示例

- 进入 pico-examples 目录下，做出如下修改

```
diff --git a/uart/hello_uart/CMakeLists.txt b/uart/hello_uart/CMakeLists.txt
index 0931f38..70df60e 100644
--- a/uart/hello_uart/CMakeLists.txt
+++ b/uart/hello_uart/CMakeLists.txt
@@ -10,3 +10,6 @@ pico_add_extra_outputs(hello_uart)

 # add url via pico_set_program_url
 example_auto_set_url(hello_uart)
+
+pico_enable_stdio_usb(hello_uart 1)
+pico_enable_stdio_uart(hello_uart 1)
diff --git a/uart/hello_uart/hello_uart.c b/uart/hello_uart/hello_uart.c
index 6fbad0e..79575a5 100644
--- a/uart/hello_uart/hello_uart.c
+++ b/uart/hello_uart/hello_uart.c
@@ -38,7 +38,10 @@ int main() {
     uart_putc(UART_ID, 'B');

     // Send out a string, with CR/LF conversions
-    uart_puts(UART_ID, " Hello, UART!\n");
+    while(true) {
+        uart_puts(UART_ID, "Hello, UART!\r\n");
+        sleep_ms(1000);
+    }
 }

 /// \end::hello_uart[]
```

- 进入 pico-exmaples/build 目录下编译

```
make -j4
```

- 将编译后的产物 hello_uart.uf2 烧录到 RP2040 中

- 在终端打开 minicom 进行查看

```
sudo minicom -D /dev/ttyS0 -b 115200
```

程序烧录成功后每隔一秒就能看到 RP2040 从 Uart0 发送过来的 "Hello, UART!"

## 更多可参考 pico-examples/uart 目录下的示例
