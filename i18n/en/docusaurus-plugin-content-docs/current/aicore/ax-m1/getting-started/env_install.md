---
sidebar_position: 3
---

# Environment Installation

Please follow the [Hardware Installation](./hardware_install) guide to install the Radxa AICore AX-M1 on the host device.

## Check Device Connection Status

- Use `lspci` to confirm if the Radxa AICore AX-M1 is recognized.

<NewCodeBlock tip="Host" type="Device">

```bash
lspci
```

</NewCodeBlock>

```bash
0000:01:00.0 Multimedia video controller: Axera Semiconductor Co., Ltd Device 0650 (rev 01)
```

## Install Driver

- Install Dependencies

<NewCodeBlock tip="Host" type="Device">

```bash
sudo apt install gcc linux-headers-$(uname -r) make
```

</NewCodeBlock>

- Install AXCL Driver

<NewCodeBlock tip="Host" type="Device">

```bash
sudo dpkg -i ./axcl_host_aarch64_V3.6.5_20250908154509_NO4973.deb
```

</NewCodeBlock>

- Verify Installation

<NewCodeBlock tip="Host" type="Device">

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

## Uninstall Driver

If you need to uninstall the AXCL driver, you can use the following command to uninstall.

<NewCodeBlock tip="Host" type="Device">

```bash
sudo apt remove axclhost
```

</NewCodeBlock>
