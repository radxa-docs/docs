---
sidebar_position: 200
---

# FAQ

## 1.Why does my O6 / O6N have high memory usage after booting?

System reserves a part of memory for NPU to ensure NPU works properly, so the available memory looks like short.

### Temporarily disable NPU (restores after reboot):

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo rmmod aipu
```

</NewCodeBlock>

### Permanently disable NPU (blacklist):

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo vim /etc/modprobe.d/blacklist-aipu.conf
```

</NewCodeBlock>

Add:

<NewCodeBlock tip="Linux$" type="host">

```bash
blacklist aipu
```

</NewCodeBlock>

Save and reboot:

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo reboot
```

</NewCodeBlock>

Note: Disabling will free the memory reserved for NPU. To restore, delete the blacklist configuration and reboot.
