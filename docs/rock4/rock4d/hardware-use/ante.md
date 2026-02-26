---
sidebar_position: 12
---

# 天线接口

瑞莎 ROCK 4D 板载 WiFi6 和 蓝牙 5.4 芯片，预留 2 个天线连接器，用于增强天线信号。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-ante.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

将两根天线连接到对应的天线接口，天线接口规格 1 代 IPEX。

成功启动系统后，可以使用以下命令查看 WiFi 信号强度：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo nmcli device wifi list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-ante-install.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
