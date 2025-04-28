---
sidebar_position: 1
---

# Radxa OS Usage

## System Installation

Please refer to [System Installation](../getting-started/install-os/)

## Usage Instructions

Please refer to [Getting Started Guide](../getting-started/)

## System Login

Default account: radxa password: radxa

## E54C Specific Features

On the Debian system, E54C's four gigabit Ethernet ports can be flexibly configured using network configuration tools:

- Network Bridging: Multiple network interfaces can be bridged into one logical interface to increase network throughput
- Network Bonding: Supports various bonding modes, such as load balancing, active-backup mode, etc.
- Virtual Networks: Can be configured as multiple virtual network interfaces for network isolation or container networking

## Network Configuration Examples

Here is an example command for configuring network bridging:

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```bash
# Install bridge-utils
sudo apt-get install bridge-utils

# Create a bridge
sudo brctl addbr br0

# Add network interfaces to the bridge
sudo brctl addif br0 eth0
sudo brctl addif br0 eth1

# Enable the bridge
sudo ip link set dev br0 up
```

</NewCodeBlock>

## Software Development

Debian provides a comprehensive development environment, making E54C suitable for various application developments:

- **Web Server**: Install Apache, Nginx, or Node.js to set up a web server
- **Database Server**: Deploy MySQL, PostgreSQL, or MongoDB
- **Container Platform**: Run Docker to deploy containerized applications
- **AI Development**: Utilize the built-in NPU for AI applications

## System Optimization

For optimal performance on Debian:

- Regularly update the system with `apt update && apt upgrade`
- Monitor system resources with tools like `htop` and `iftop`
- Use `systemctl` to manage services and disable unnecessary ones
- Consider using `cron` for scheduled tasks and maintenance
