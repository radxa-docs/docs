---
sidebar_position: 30
---

# Uart Communication

## Hardware Connection

The IT8613E/LX communicates internally with the RP2040 via a connection for uart communication.

```
IT8613E/LX RP2040

uart0 rx GP00
uart0 tx GP01
```

## Example of Uart Communication under PICO-EXAMPLES

- Go to the pico-examples directory and make the following changes

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
+ +pico_enable_stdio_uart(hello_uart 1)
diff --git a/uart/hello_uart/hello_uart.c b/uart/hello_uart/hello_uart.c
index 6fbad0e..79575a5 100644
--- a/uart/hello_uart/hello_uart.c
+++ b/uart/hello_uart/hello_uart.c
@@ -38,7 +38,10 @@ int main() {
     uart_putc(UART_ID, 'B');

     // Send out a string, with CR/LF conversions
- uart_puts(UART_ID, " Hello, UART!\n"); // Send out a string, with CR/LF conversions; // Send out a string, with CR/LF conversions.
+ while(true) {
+ uart_puts(UART_ID, "Hello, UART!\r\n"); + sleep_ms(1000); + sleep_ms(1000); + sleep_ms(1000); + sleep_ms(1000)
+ sleep_ms(1000);
+ }
 }

 /// \end::hello_uart[]
```

- Go into the pico-exmaples/build directory and compile it

```
make -j4
```

- Burn the compiled product hello_uart.uf2 into the RP2040.

- Open minicom in a terminal to view it

```
sudo minicom -D /dev/ttyS0 -b 115200
```

Every second after the program is burned successfully, you will see "Hello, UART!" sent by the RP2040 from Uart0.

## See the examples in the pico-examples/uart directory for more information.
