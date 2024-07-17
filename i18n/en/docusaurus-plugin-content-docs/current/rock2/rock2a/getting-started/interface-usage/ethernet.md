---
sidebar_position: 3
---

# Ethernet Interface

ROCK 2A provides a Gigabit Ethernet port.

## Network Port Speed Test

- Install the iperf3 tool:

```bash
sudo apt-get install iperf3
```

- Run the following command on the server side:

```bash
iperf -s
```

- Testing the Speed

1. Test upload speed

```bash
iperf3 -c server-ip -t 60
```

2. Test download speed

```bash
iperf3 -c server-ip -t 60 -R
```
