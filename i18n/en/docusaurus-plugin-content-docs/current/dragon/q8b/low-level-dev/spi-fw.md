---
sidebar_position: 5
---

# Flashing BIOS Firmware

:::tip Firmware Notes
Radxa Dragon Q8B ships with BIOS firmware preinstalled. Normally you do not need to flash the boot firmware. If the system fails to boot properly, you can try reflashing the BIOS firmware.

The core task of BIOS firmware (BootROM + bootloader) is to initialize hardware in stages (CPU -> memory -> storage), then load the operating system kernel from the storage device.
:::

When the device cannot boot properly, enter [EDL Mode](./edl-mode), then use the EDL tool to flash the BIOS firmware.

Go to the [Resource Downloads](../download) page, download and extract the `edl-ng` archive, then select the corresponding version for your system platform to download the BIOS firmware.

## Flashing BIOS Firmware

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [Enter EDL Mode](edl-mode)

    - Run the following command to flash the BIOS firmware

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    .\edl-ng.exe --memory=spinor --loader C:\path\to\prog_firehose_ddr.elf rawprogram C:\path\to\rawprogram0.xml C:\path\to\patch0.xml

    ```

    </NewCodeBlock>

    Parameter description:

    - `C:\path\to\` : Replace with the actual path of the extracted BIOS firmware

  </TabItem>
  <TabItem value="Linux" label="Linux">

Add the Linux version of the `edl-ng` tool to the system environment path so that you can run `edl-ng` from any terminal location.

- Check the path

Open a terminal in the folder that contains the `edl-ng` tool. Use `realpath` to view the full path of `edl-ng`, then create a symbolic link for it.

<NewCodeBlock tip="Linux$" type="host">

```bash
realpath edl-ng
```

</NewCodeBlock>

Example terminal output:

```text
/home/user/edl-ng-dist/linux-x64/edl-ng
```

- Create a symbolic link

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo ln -s [edl-ng path] /usr/local/bin/edl-ng
# Example
sudo ln -s /home/user/edl-ng-dist/linux-x64/edl-ng /usr/local/bin/edl-ng
```

</NewCodeBlock>

Parameter description:

- `[edl-ng path]` : Replace this with the full path to your own `edl-ng` tool

- Verify

Open a terminal in any location and run `edl-ng --version` to view version information.

<NewCodeBlock tip="Linux$" type="host">

```bash
edl-ng --version
```

</NewCodeBlock>

If the terminal prints version information, the symbolic link for `edl-ng` was created successfully.

- [Enter EDL Mode](edl-mode)

- Flash BIOS Firmware

Go to the [Resource Downloads](../../download) page, download the BIOS firmware file, extract it, open a terminal in the directory containing `prog_firehose_ddr.elf`, and use `edl-ng` to flash the BIOS firmware.

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo edl-ng --memory=spinor rawprogram rawprogram0.xml patch0.xml --loader=prog_firehose_ddr.elf
```

</NewCodeBlock>

  </TabItem>
</Tabs>

:::warning Restart the device after flashing
After the BIOS firmware is successfully flashed, please restart the device using either of the following methods:

- Re-plug the device power
- Run the `edl-ng reset` command in the terminal
:::

## Erase BIOS Firmware

Erasing the BIOS firmware will prevent the device from booting. You must reflash the BIOS firmware before the device can boot normally. Do not erase the BIOS firmware unless necessary.

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [Enter EDL Mode](edl-mode)

    - Erase BIOS Firmware

    Open a terminal and run the following commands to erase it:

    <NewCodeBlock tip="Windows$" type="host">

    ```text
    .\edl-ng.exe --memory spinor -l prog_firehose_ddr.elf erase-part ddr
    .\edl-ng.exe --memory spinor -l prog_firehose_ddr.elf erase-part uefi
    .\edl-ng.exe --memory spinor -l prog_firehose_ddr.elf erase-part devcfg
    .\edl-ng.exe --memory spinor -l prog_firehose_ddr.elf erase-part xbl
    .\edl-ng.exe --memory spinor -l prog_firehose_ddr.elf erase-part VarStore
    ```

    </NewCodeBlock>

  </TabItem>
  <TabItem value="Linux" label="Linux">

    - [Enter EDL Mode](edl-mode)

    Add the Linux version of the `edl-ng` tool to the system environment path so that you can run `edl-ng` from any terminal location.

    - Check the path

    Open a terminal in the folder that contains the `edl-ng` tool. Use `realpath` to view the full path of `edl-ng`, then create a symbolic link for it.

    <NewCodeBlock tip="Linux$" type="host">

    ```text
    realpath edl-ng
    ```

    </NewCodeBlock>

    Example terminal output:

    ```text
    /home/user/edl-ng-dist/linux-x64/edl-ng
    ```

    - Create a symbolic link

    <NewCodeBlock tip="Linux$" type="host">

    ```bash
    sudo ln -s [edl-ng path] /usr/local/bin/edl-ng
    # Example
    sudo ln -s /home/user/edl-ng-dist/linux-x64/edl-ng /usr/local/bin/edl-ng
    ```

    </NewCodeBlock>

    Parameter description:

    - `[edl-ng path]` : Replace this with the full path to your own `edl-ng` tool

    - Verify

    Open a terminal in any location and run `edl-ng --version` to view version information.

    <NewCodeBlock tip="Linux$" type="host">

    ```text
    edl-ng --version
    ```

    </NewCodeBlock>

    If the terminal prints version information, the symbolic link for `edl-ng` was created successfully.

    - Erase BIOS Firmware

    Open a terminal in the directory containing `prog_firehose_ddr.elf`, then run the following commands to erase it

    <NewCodeBlock tip="Linux$" type="host">

    ```bash
    sudo edl-ng --memory spinor -l prog_firehose_ddr.elf erase-part ddr
    sudo edl-ng --memory spinor -l prog_firehose_ddr.elf erase-part uefi
    sudo edl-ng --memory spinor -l prog_firehose_ddr.elf erase-part devcfg
    sudo edl-ng --memory spinor -l prog_firehose_ddr.elf erase-part xbl
    sudo edl-ng --memory spinor -l prog_firehose_ddr.elf erase-part VarStore
    ```

    </NewCodeBlock>

  </TabItem>
</Tabs>

## FAQ

- If you see Unable to load DLL 'libusb-1.0'

Install [vc_redist](https://aka.ms/vs/17/release/vc_redist.x64.exe)
