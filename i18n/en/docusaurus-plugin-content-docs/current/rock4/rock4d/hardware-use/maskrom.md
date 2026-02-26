---
sidebar_position: 4
---

# Maskrom Button

The Radxa ROCK 4D features an onboard Maskrom button for entering Maskrom mode.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rock4d-maskrom.webp" style={{width: '100%', maxWidth: '1200px'}} alt="ROCK 4D Maskrom Button Location" />
</div>

## User Guide

### Entering Maskrom Mode

1. Before powering on the motherboard, press and hold the Maskrom button. You can release the button after power is on.

2. Use a USB cable to connect the motherboard's USB 3.0 Type-A OTG port to your computer's port.

### Verifying Device Mode

Use the RKDevTool utility to verify if the device has entered Maskrom mode.

:::tip
For instructions on using RKDevTool, please refer to the [RKDevTool Usage](../low-level-dev/tool_rkdevtool) guide.
:::

Normally, the RKDevTool software will automatically detect the ROCK 4D board's current mode. If no device is detected, please repeat the above steps.

<Tabs queryString="maskrom-display">

<TabItem value="Windows">
Open the RKDevTool software to view the detected device information:
<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/maskrom-mode.webp" style={{width: '100%', maxWidth: '1200px'}} alt="RKDevTool Detecting Maskrom Mode" />
</div>

</TabItem>

<TabItem value="Linux/MacOS">
Use the `rkdeveloptool ld` command to view the detected device information:
<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool ld
```
</NewCodeBlock>

Example output showing a detected Maskrom device:

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```
</NewCodeBlock>

</TabItem>

</Tabs>
