---
sidebar_position: 1
---

# Entering EDL Mode

Qualcomm EDL (Qualcomm Download Mode) is an emergency download mode for Qualcomm processor devices. It is mainly used for emergency repair, firmware flashing, or unlocking devices.

## Entering EDL Mode

Before powering on the board, hold the EDL button. After powering on the board, release the EDL button to enter EDL mode.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q8b/dragon-q8b-enter-edl-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

1.  Hold the EDL button

2.  Connect a 20V Type-C power adapter (PD compatible)

3.  Release the EDL button

4.  Connect the Dragon Q8B USB-C port to a computer USB port using a USB Type-C cable

## Verify EDL Mode

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>
    - Download the EDL driver

    On Windows, go to the [Resource Downloads](../download) page to download the EDL driver file.

    - Install the EDL driver

    Extract the downloaded driver file, then run `Install.bat` as administrator to install the driver.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/q6a_driver_install.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

    - Device Recognition

    In Windows, open `Device Manager` to check whether the device is recognized properly.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/q6a_device_manager.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

  </TabItem>
  <TabItem value="Linux" label="Linux">
  On Linux, use the `lsusb` command to check whether the device has entered EDL mode.

  <NewCodeBlock tip="Linux$" type="host">

```bash
lsusb
```

  </NewCodeBlock>

After the device enters EDL mode, output similar to the following is displayed:

```bash
Bus 001 Device 008: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (EDL mode)
```

  </TabItem>
</Tabs>
