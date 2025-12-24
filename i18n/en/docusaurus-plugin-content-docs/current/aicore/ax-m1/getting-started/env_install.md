---
sidebar_position: 3
---

# Environment setup

Follow the [hardware installation](./hardware_install) guide to install the Radxa AICore AX-M1 on the host device.

## Check the device connection

- Use `lspci` to confirm that the Radxa AICore AX-M1 is detected.

<NewCodeBlock tip="Host" type="device">

```bash
lspci
```

</NewCodeBlock>

```bash
0000:01:00.0 Multimedia video controller: Axera Semiconductor Co., Ltd Device 0650 (rev 01)
```

## Install the driver

- Install dependencies

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install gcc linux-headers-$(uname -r) make
```

</NewCodeBlock>

- Install the AXCL driver

:::tip
Download the driver package from the resources section on the left panel.
:::

<NewCodeBlock tip="Host" type="device">

```bash
sudo dpkg -i ./axcl_host_aarch64_V3.6.5_20250908154509_NO4973.deb
```

</NewCodeBlock>

- Verify the installation

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi
+------------------------------------------------------------------------------------------------+
| AXCL-SMI  V3.6.5_20250908154509                                  Driver  V3.6.5_20250908154509 |
+-----------------------------------------+--------------+---------------------------------------+
| Card  Name                     Firmware | Bus-Id       |                          Memory-Usage |
| Fan   Temp                Pwr:Usage/Cap | CPU      NPU |                             CMM-Usage |
|=========================================+==============+=======================================|
|    0  AX650N                     V3.6.5 | 0001:11:00.0 |                148 MiB /      945 MiB |
|   --   54C                      -- / -- | 2%        0% |                 18 MiB /     7040 MiB |
+-----------------------------------------+--------------+---------------------------------------+

+------------------------------------------------------------------------------------------------+
| Processes:                                                                                     |
| Card      PID  Process Name                                                   NPU Memory Usage |
|================================================================================================|
```

## Uninstall the driver

If you need to uninstall the AXCL driver, run the following command.

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt remove axclhost
```

</NewCodeBlock>
