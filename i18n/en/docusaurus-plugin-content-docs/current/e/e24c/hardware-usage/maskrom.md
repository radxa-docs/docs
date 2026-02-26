---
sidebar_position: 5
---

# Maskrom Mode

The Radxa E24C board has an onboard Maskrom button, which is used to put the board into Maskrom mode.

## Enter Maskrom Mode

When the board detects that the Maskrom button is pressed during power-on, it will automatically enter Maskrom mode.

Detailed steps:

1. Connect the board and PC using a Type-C data cable
2. Press and hold the Maskrom button with a pin or toothpick
3. Power the board using a power adapter
4. Release the Maskrom button

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e24c/e24c-maskrom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Verify Device Mode

You can use the RKDevTool utility to verify whether the device has entered Maskrom mode.

Normally, the RKDevTool software will automatically detect the current mode of the board. If no device is detected, you can repeat the above steps.

<Tabs queryString="maskrom-display">

<TabItem value="Windows">
Open the RKDevTool software and check the detected device information:
<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/maskrom-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">
Use the `rkdeveloptool ld` command to check the detected device information:
<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool ld
```
</NewCodeBlock>

Output similar to the following indicates that a Maskrom device has been detected:

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

</TabItem>
</Tabs>
