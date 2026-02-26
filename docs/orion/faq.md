---
sidebar_position: 200
---

# 常见问题

## 1.为什么我的 O6 / O6N 开机后内存占用很大？

系统默认会为 NPU 预留一部分内存，用于保障 NPU 正常工作，因此可用内存看起来偏少。

### 临时禁用 NPU（重启后恢复）：

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo rmmod aipu
```

</NewCodeBlock>

### 永久禁用 NPU（blacklist）：

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo vim /etc/modprobe.d/blacklist-aipu.conf
```

</NewCodeBlock>

添加：

<NewCodeBlock tip="Linux$" type="host">

```bash
blacklist aipu
```

</NewCodeBlock>

保存并重启：

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo reboot
```

</NewCodeBlock>

说明：禁用后将释放 NPU 预留内存，如需恢复，删除 blacklist 配置并重启即可。
