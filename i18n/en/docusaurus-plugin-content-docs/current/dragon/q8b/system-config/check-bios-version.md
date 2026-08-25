---
sidebar_position: 10
---

# Check the BIOS Version

This tutorial describes how to check the current BIOS version on Dragon Q8B.

## Check in the System

If the system can boot normally, run the following command in the system to check the current BIOS version:

<NewCodeBlock tip="radxa@radxa-dragon-q8b$" type="device">

```bash
sudo dmidecode -s bios-version
```

</NewCodeBlock>

The terminal will output something like the following. The `260821` portion indicates the BIOS firmware date/version:

```text
6.0.260821.BOOT.MXF.1.1.c1-00167-MAKENA-1
```

## Check in the BIOS Setup

You can also press the **F2** key during boot to enter the BIOS setup. The BIOS firmware version is displayed at the top of the main screen.

For more information about the BIOS, see [BIOS Overview](../low-level-dev/bios).
