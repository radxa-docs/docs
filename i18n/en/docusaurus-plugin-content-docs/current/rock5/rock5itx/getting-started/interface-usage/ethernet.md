---
sidebar_position: 12
---

# Ethernet

## Introduction

Ethernet (English: Εthernet) is a computer-based local area network (LAN) technology.The IEEE's IEEE 802.3 standard establishes the technical standard for Ethernet, which specifies wiring, electrical signalling, and media access control, including the physical layer. Ethernet is the most commonly used LAN technology today, replacing other LAN standards such as Token Ring, FDDI, and ARCNET.

### Interface test methods

#### unique MAC address

The MAC address of the ROCK 5 ITX is unique and fixed. The MAC remains the same after every power or software reboot, and also after a re-flash.

#### Port Speed Test

- Install the iperf3 utility

```bash
sudo apt-get install iperf3
```

- Run the command on the server side:

```bash
iperf -s
```

- Measuring speed

1. Test the upload speed

```bash
iperf3 -c server-ip -t 60
```

2. Test download speed

```bash
iperf3 -c server-ip -t 60 -R
```
