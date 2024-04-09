---
sidebar_position: 3
---

# Format UFS

The UFS formatting tool can only be run in a Linux environment. You need to use a Linux PC.

The steps to follow when formatting the UFS

- Install the modemanger API tool on your host device.

```
sudo apt install modemmanger
```

- Download the latest version of SP Flash Tool by [clicking here] (https://dl.radxa.com/nio12l/tools/sp_flash_tool.tar.gz)

- Unzip the downloaded file.

```
tar zxvf sp_flash_tool.tar.gz
```

- Run the following script file.

```
cd /sp_flash_tool
sudo ./format_ufs.sh
```

- Press and hold the download key and use the TYPE C data cable to connect the TYPE-C OTG port and your PC. After entering the burning mode, it will be formatted.

- When it’s get done you will see the following output:

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
