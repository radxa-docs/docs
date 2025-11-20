---
sidebar_position: 4
---

# Recovery Pins

:::tip
In hardware version v1.12 and later, the Recovery pins have been removed and replaced with power supply pins. To enter Loader mode, please use the `reboot loader` command after entering the system.
:::

The Radxa ROCK 4D features dedicated Recovery pins for entering Loader mode.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-recovery.webp" style={{width: '100%', maxWidth: '1200px'}} alt="ROCK 4D Recovery Pins Location" />
</div>

## User Guide

### Entering Loader Mode

Before powering on the board, short the Recovery pins using a jumper cap or DuPont wires. The short can be removed after powering on.

### Verifying Device Mode

Use the RKDevTool utility to verify if the device has entered Loader mode.

:::tip
For instructions on using RKDevTool, please refer to the [RKDevTool Guide](../low-level-dev/tool_rkdevtool) tutorial.
:::

Normally, the RKDevTool software will automatically detect the current mode of the ROCK 4D board. If the device is not detected, please repeat the above steps.

<Tabs queryString="recovery-display">

<TabItem value="Windows">
Open the RKDevTool software to view the detected device information:
<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/loader-mode.webp" style={{width: '100%', maxWidth: '1200px'}} alt="RKDevTool Showing Loader Mode" />
</div>

</TabItem>

<TabItem value="Linux/MacOS">
Use the `rkdeveloptool ld` command to view the detected device information:
<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

Example output showing a detected Loader device:

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Loader
```
</NewCodeBlock>

</TabItem>

</Tabs>
