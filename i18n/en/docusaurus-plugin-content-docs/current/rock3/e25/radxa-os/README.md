---
sidebar_position: 15
---

import VNC from "../../../common/general/\_vnc.mdx"
import SSH from "../../../common/general/\_ssh.mdx"

# Radxa OS

Introduces system login, network connection, etc to let user to be familiar with the system quickly.

## User name and Password

The user name and password added by default to the Radxa ZERO 3 series are:

```text
User name：radxa
Password： radxa
```

## Serial Debug

Radxa E25 has an onboard CH340 chip. The USB TYPE C interface on the board can be used for serial port debugging. The default baud rate is `115200`

:::tip
When using USB TYPE C to debug the serial port, it may continue to restart due to power supply. It is recommended to use a powered USB TYPE C HUB for debugging.
:::

## Setting Network

### Ethernet

Radxa E25 is equipped with two 2.5G Ethernet onboard. You only need to connect the network cable to enable Internet access. Use the `ip a` command to view the ip.

## Remote Login

### SSH Login

<SSH />

### VNC remote desktop

<VNC />
