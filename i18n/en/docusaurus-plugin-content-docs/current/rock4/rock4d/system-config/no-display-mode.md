---
sidebar_position: 2
---

# No Display Mode

No display mode refers to using Radxa ROCK 4D without a display screen, controlling the development board through serial port/SSH/VNC, suitable for users with some development experience.

The control approach: Obtain the IP address of Radxa ROCK 4D through serial port debugging, then configure the corresponding SSH and VNC environment, and further control Radxa ROCK 4D through SSH or VNC remote login.

:::tip

- Serial Port Debugging: Refer to the [Serial Port Debugging](./uart_debug) guide for detailed steps
- SSH Remote Login: Refer to the [Remote Login](./ssh-remote) guide for detailed steps
- VNC Remote Login: Refer to the [VNC Remote Login](./vnc-remote) guide for detailed steps
  :::

## Preparation

Follow the [Serial Port Debugging](./uart_debug) and [Remote Login](./remote-login) guides to connect Radxa ROCK 4D.

## Control Interface

In no display mode, serial port/SSH control is in command-line mode, while VNC control is in graphical interface mode.

### Command Line Mode

Serial port control requires a data cable, while SSH control does not require a data cable, it only needs to ensure that the device is on the same local network.

① : Open Linux terminal and log in to Radxa ROCK 4D through serial port

② : Open Linux terminal and log in to Radxa ROCK 4D through SSH

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/nodiplay-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Graphical Interface Mode

VNC control requires both the control and controlled devices to be on the same local network.

<div style={{textAlign: 'center'}}>
VNC Remote Login Successful
    <img src="/img/rock4/4d/vnc-connect-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
