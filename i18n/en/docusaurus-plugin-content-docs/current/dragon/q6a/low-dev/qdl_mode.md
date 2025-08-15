---
sidebar_position: 1
---

# Entering QDL Mode

Qualcomm Download Mode (QDL) is an emergency download mode for Qualcomm processor devices, primarily used for emergency repairs, firmware flashing, or device unlocking.

## Entering QDL Mode

Before powering on the motherboard, hold down the EDL button; after powering on the motherboard, release the EDL button to enter QDL mode.

Specific steps:

①: Hold down the EDL button

②: Connect a 12V Type-C power adapter (compatible with PD protocol)

③: Release the EDL button

④: Use a dual-headed USB Type-A data cable to connect the Dragon Q6A's USB 3.1 Type-A port to the computer's USB Type-A port

## Verify QDL Mode

<Tabs queryString = "qdlplatform">
  <TabItem value="Windows" label="Windows" default>
    - Download the EDL tool

    On the Windows platform, you need to go to the [Resource Summary Download](../download) page to download the EDL tool (the EDL tool includes EDL software and EDL drivers).

    - Install the EDL driver

    Double-click the `qcom_winusb_drv_inst.exe` driver installation package and follow the steps below to complete the driver installation.

    ① : Click the `Install Certificate` option to install the certificate

    ② : Click the `Install Driver` option to install the driver

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_edl_driver.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

    - Device recognition

    In Windows systems, you can go to the system's Device Manager to check whether the device is being recognized normally.

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_device_manager.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

  </TabItem>
  <TabItem value="Linux" label="Linux">
  In Linux systems, you can use the `lsusb` command to check whether the device has entered QDL mode.

  <NewCodeBlock tip="Linux$" type="host">

```
lsusb
```

  </NewCodeBlock>

After the device enters QDL mode, it will display information similar to the following:

```
Bus 001 Device 008: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL mode)
```

  </TabItem>
</Tabs>
