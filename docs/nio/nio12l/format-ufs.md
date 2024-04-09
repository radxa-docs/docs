---
sidebar_position: 3
---

# 格式化UFS

UFS 格式化工具只能在linux环境下运行，你需要使用 Linux 系统的主机。

格式化 UFS 步骤：

- 在您的主机设备上安装 modemanger API 工具。

```
sudo apt install modemmanger
```

- 单击此处下载 [SP Flash Tool](https://dl.radxa.com/nio12l/tools/sp_flash_tool.tar.gz)

- 解压下载的文件

```
tar zxvf sp_flash_tool.tar.gz
```

- 运行以下脚本文件

```
cd /sp_flash_tool
sudo ./format_ufs.sh
```

- 按住 download key ,使用 TYPE C 数据线连接 TYPE-C OTG 口和你的 PC,进入烧录模式后会进行格式化

- 完成后您将看到以下输出：

```
...
Formatting Flash(2)... addr(0x0), len(0x0)
0% of flash has been formatted.
Formatting Flash(2)... addr(0x0), len(0x0)
10% of flash has been formatted.
20% of flash has been formatted.
30% of flash has been formatted.
40% of flash has been formatted.
50% of flash has been formatted.
60% of flash has been formatted.
70% of flash has been formatted.
80% of flash has been formatted.
90% of flash has been formatted.
100% of flash has been formatted.
Format Succeeded.
All command exec done!
Disconnect!
```
