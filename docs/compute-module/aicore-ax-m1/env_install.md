---
sidebar_position: 3
---

# 环境安装

请根据 [硬件安装](./hardware_install) 指导在宿主设备上安装好瑞莎 AICore AX-M1 加速卡

## 检查设备连接状态

- 使用 `lspci` 确认是否能识别到瑞莎 AICore AX-M1

<NewCodeBlock tip="Host" type="Device">

```bash
lspci
```

</NewCodeBlock>

```bash
0000:01:00.0 Multimedia video controller: Axera Semiconductor Co., Ltd Device 0650 (rev 01)
```

## 安装驱动

- 安装依赖

<NewCodeBlock tip="Host" type="Device">

```bash
sudo apt install gcc linux-headers-$(uname -r) make
```

</NewCodeBlock>

- 安装 AXCL 驱动

<NewCodeBlock tip="Host" type="Device">

```bash
sudo dpkg -i ./axcl_host_aarch64_V3.0.2_20250326020141_NO4723.deb
```

</NewCodeBlock>

- 验证安装

<NewCodeBlock tip="Host" type="Device">

```bash
axcl-smi
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ axcl-smi
+------------------------------------------------------------------------------------------------+
| AXCL-SMI  V3.0.2_20250326020141                                  Driver  V3.0.2_20250326020141 |
+-----------------------------------------+--------------+---------------------------------------+
| Card  Name                     Firmware | Bus-Id       |                          Memory-Usage |
| Fan   Temp                Pwr:Usage/Cap | CPU      NPU |                             CMM-Usage |
|=========================================+==============+=======================================|
|    0  AX650N                     V3.0.2 | 0000:01:00.0 |                149 MiB /      945 MiB |
|   --   66C                      -- / -- | 1%        0% |                 18 MiB /     7040 MiB |
+-----------------------------------------+--------------+---------------------------------------+

+------------------------------------------------------------------------------------------------+
| Processes:                                                                                     |
| Card      PID  Process Name                                                   NPU Memory Usage |
|================================================================================================|
```

## 卸载驱动

如果要卸载 AXCL 驱动，可使用以下命令进行卸载

<NewCodeBlock tip="Host" type="Device">

```bash
sudo apt remove axclhost
```

</NewCodeBlock>
