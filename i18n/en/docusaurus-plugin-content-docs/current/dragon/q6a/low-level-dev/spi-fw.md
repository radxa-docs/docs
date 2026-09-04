---
sidebar_position: 5
---

# Flashing BIOS Firmware

:::tip Firmware Information
The Radxa Dragon Q6A comes with BIOS firmware pre-installed by default. Under normal circumstances, there is no need to flash the boot firmware. However, if the system fails to boot properly, you may try re-flashing the BIOS firmware.

The core function of the BIOS firmware (BootROM + Bootloader) is to initialize hardware in stages (CPU → Memory → Storage) and ultimately load the operating system kernel from the storage device.
:::

When the device cannot boot normally, you can put the device into [EDL Mode](./edl-mode) and then use the EDL tool to flash the BIOS firmware.

Go to the [Resource Download](../download) page, download the `edl-ng` package and extract it. Then select the appropriate version for your system platform to download the BIOS firmware.

## Flashing BIOS Firmware

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [Enter EDL mode](edl-mode)

    - Enter the following command to flash the BIOS firmware

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    .\edl-ng.exe --memory=spinor --loader C:\path\to\prog_firehose_ddr.elf rawprogram C:\path\to\rawprogram0.xml C:\path\to\patch0.xml

    ```

    </NewCodeBlock>

    Parameter description:

    - `C:\path\to\` : Replace with the actual path of the extracted BIOS firmware

  </TabItem>
  <TabItem value="Linux" label="Linux">

Add the Linux version of the `edl-ng` tool to your system's environment variables so you can use the `edl-ng` command from any terminal location.

- Check the path

You can open a terminal in the folder where the `edl-ng` tool is located, use the `realpath` command to view the full path of `edl-ng` in the current folder, and then create a symbolic link for `edl-ng`.

<NewCodeBlock tip="Linux$" type="host">

```bash
realpath edl-ng
```

</NewCodeBlock>

Terminal output example:

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

- `[edl-ng path]` : Replace with your own full path to the `edl-ng` tool

- Verification

You can open a terminal from any location and use the `edl-ng --version` command to check the version information.

<NewCodeBlock tip="Linux$" type="host">

```bash
edl-ng --version
```

</NewCodeBlock>

If the terminal prints the version information, the `edl-ng` tool symbolic link has been set up successfully.

- [Enter EDL mode](edl-mode)

- Flash BIOS Firmware

Go to the [Resource Download](../../download) page, download the BIOS firmware file, then extract it and navigate to the directory containing the `prog_firehose_ddr.elf` file. Open a terminal in this directory and use the `edl-ng` command to flash the BIOS firmware.

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

Erasing the BIOS firmware will prevent the device from booting. You will need to re-flash the BIOS firmware to restore normal operation. Do not erase the BIOS firmware unless absolutely necessary.

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [Enter EDL mode](edl-mode)

    - Erase BIOS Firmware

    Open a terminal and enter the following commands to erase:

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

    - [Enter EDL mode](edl-mode)

    Add the Linux version of the `edl-ng` tool to your system's environment variables so you can use the `edl-ng` command from any terminal location.

    - Check the path

    You can open a terminal in the folder where the `edl-ng` tool is located, use the `realpath` command to view the full path of `edl-ng` in the current folder, and then create a symbolic link for `edl-ng`.

    <NewCodeBlock tip="Linux$" type="host">

    ```text
    realpath edl-ng
    ```

    </NewCodeBlock>

    Terminal output example:

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

    - `[edl-ng path]` : Replace with your own full path to the `edl-ng` tool

    - Verification

    You can open a terminal from any location and use the `edl-ng --version` command to check the version information.

    <NewCodeBlock tip="Linux$" type="host">

    ```text
    edl-ng --version
    ```

    </NewCodeBlock>

    If the terminal prints the version information, the `edl-ng` tool symbolic link has been set up successfully.

    - Erase BIOS Firmware

    Enter the `prog_firehose_ddr.elf` file directory and open a terminal, input the following command to erase

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

- If it prompts "Unable to load DLL 'libusb-1.0'"

Install [vc_redist](https://aka.ms/vs/17/release/vc_redist.x64.exe)
