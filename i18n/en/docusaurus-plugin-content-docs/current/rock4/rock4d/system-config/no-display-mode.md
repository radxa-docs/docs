---
sidebar_position: 2
---

# Headless Mode

Headless Mode refers to using the Radxa ROCK 4D without a display, controlling the board through Serial/UART, SSH, or VNC. This mode is suitable for users with some development experience.

Control Method: Obtain the ROCK 4D's IP address via serial debugging, then configure the corresponding SSH and VNC environments to remotely control the ROCK 4D through SSH or VNC.

:::tip

- Serial Debugging: Refer to the [Serial Debugging](./uart_debug) tutorial for detailed steps
- SSH Remote Login: Refer to the [Remote Login](./ssh-remote) tutorial for detailed steps
- VNC Remote Login: Refer to the [VNC Remote Login](./vnc-remote) tutorial for detailed steps
  :::

## Prerequisites

You can follow the [Serial Debugging](./uart_debug) and [Remote Login](./remote-login) tutorials to connect to the ROCK 4D.

## Control Interface

In headless mode, Serial/SSH control uses command-line interface, while VNC control provides a graphical interface.

### Command Line Mode

Serial control requires a physical cable connection, while SSH control only requires both devices to be on the same local network.

① : Open a Linux terminal and log in to ROCK 4D via Serial

② : Open a Linux terminal and log in to ROCK 4D via SSH

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/nodiplay-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Graphical Interface Mode

VNC control requires both the controlling and controlled devices to be on the same local network.

<div style={{textAlign: 'center'}}>
VNC Remote Login Successful
    <img src="/img/rock4/4d/vnc-connect-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
