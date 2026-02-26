---
sidebar_position: 12
---

# Antenna Interface

The Radxa ROCK 4D comes with an onboard WiFi 6 and Bluetooth 5.4 chipset, featuring 2 antenna connectors for enhanced signal strength.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-ante.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## User Guide

Connect the two antennas to their corresponding antenna interfaces. The antenna interface uses 1st generation IPEX connectors.

After successfully booting the system, you can check the WiFi signal strength using the following command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo nmcli device wifi list
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-ante-install.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
