---
sidebar_position: 6
---

# Flashing SPI Boot Firmware

:::tip Firmware Information
The Radxa Dragon Q6A comes with SPI boot firmware pre-installed by default. Under normal circumstances, there is no need to flash the boot firmware. However, if the system fails to boot properly, you may try re-flashing the SPI boot firmware.

The core function of the SPI boot firmware (BootROM + Bootloader) is to initialize hardware in stages (CPU → Memory → Storage) and ultimately load the operating system kernel from the storage device.
:::

When the device cannot boot normally, you can put the device into [EDL Mode](./edl_mode) and then use the EDL tool to flash the SPI boot firmware.

Go to the [Resource Download](../download) page, download the `edl-ng` package and extract it. Then select the appropriate version for your system platform to download the SPI firmware.

## Flashing SPI Boot Firmware

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [Enter EDL mode](edl_mode)

    - Enter the following command to flash the SPI boot firmware

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    .\edl-ng.exe --memory=spinor --loader C:\path\to\prog_firehose_ddr.elf rawprogram C:\path\to\rawprogram0.xml C:\path\to\patch0.xml

    ```

    </NewCodeBlock>

  </TabItem>
  <TabItem value="Linux" label="Linux">

Add the Linux version of the `edl-ng` tool to your system's environment variables so you can use the `edl-ng` command from any terminal location.

- Check the path

You can open a terminal in the folder where the `edl-ng` tool is located, use the `realpath` command to view the full path of `edl-ng` in the current folder, and then create a symbolic link for `edl-ng`.

<NewCodeBlock tip="Linux$" type="host">

```
realpath edl-ng
```

</NewCodeBlock>

Terminal output example:

```
/home/user/edl-ng-dist/linux-x64/edl-ng
```

- Create a symbolic link

<NewCodeBlock tip="Linux$" type="host">

```
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

```
edl-ng --version
```

</NewCodeBlock>

If the terminal prints the version information, the `edl-ng` tool symbolic link has been set up successfully.

- [Enter EDL mode](edl_mode)

- Flash SPI Boot Firmware

Go to the [Resource Download](../../download) page, download the `spi firmware` file, then extract it and navigate to the directory containing the `prog_firehose_ddr.elf` file. Open a terminal in this directory and use the `edl-ng` command to flash the SPI boot firmware.

<NewCodeBlock tip="Linux$" type="host">

```
sudo edl-ng --memory=spinor rawprogram rawprogram0.xml patch0.xml --loader=prog_firehose_ddr.elf
```

</NewCodeBlock>

  </TabItem>
</Tabs>

## Erase SPI Boot Firmware

Erasing the SPI boot firmware will prevent the device from booting. You will need to re-flash the SPI boot firmware to restore normal operation. Do not erase the SPI boot firmware unless absolutely necessary.

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [Enter EDL mode](edl_mode)

    - Erase SPI Boot Firmware

    Open a terminal and enter the following commands to erase:

    <NewCodeBlock tip="Windows$" type="host">

    ```
    .\edl-ng.exe --memory spinor erase-part ddr -l C:\path\to\prog_firehose_ddr.elf
    .\edl-ng.exe --memory spinor erase-part uefi  -l C:\path\to\prog_firehose_ddr.elf
    .\edl-ng.exe --memory spinor erase-part devcfg  -l C:\path\to\prog_firehose_ddr.elf
    .\edl-ng.exe --memory spinor erase-part xbl  -l C:\path\to\prog_firehose_ddr.elf
    ```

    </NewCodeBlock>

  </TabItem>
  <TabItem value="Linux" label="Linux">

    - [Enter EDL mode](edl_mode)

    Add the Linux version of the `edl-ng` tool to your system's environment variables so you can use the `edl-ng` command from any terminal location.

    - Check the path

    You can open a terminal in the folder where the `edl-ng` tool is located, use the `realpath` command to view the full path of `edl-ng` in the current folder, and then create a symbolic link for `edl-ng`.

    <NewCodeBlock tip="Linux$" type="host">

    ```
    realpath edl-ng
    ```

    </NewCodeBlock>

    Terminal output example:

    ```
    /home/user/edl-ng-dist/linux-x64/edl-ng
    ```

    - Create a symbolic link

    <NewCodeBlock tip="Linux$" type="host">

    ```
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

    ```
    edl-ng --version
    ```

    </NewCodeBlock>

    If the terminal prints the version information, the `edl-ng` tool symbolic link has been set up successfully.

    - Erase SPI Boot Firmware

    Enter the `prog_firehose_ddr.elf` file directory and open a terminal, input the following command to erase

    <NewCodeBlock tip="Linux$" type="host">

    ```
    sudo edl-ng --memory spinor erase-part ddr -l prog_firehose_ddr.elf
    sudo edl-ng --memory spinor erase-part uefi  -l prog_firehose_ddr.elf
    sudo edl-ng --memory spinor erase-part devcfg  -l prog_firehose_ddr.elf
    sudo edl-ng --memory spinor erase-part xbl  -l prog_firehose_ddr.elf
    ```

    </NewCodeBlock>

  </TabItem>
</Tabs>

## FAQ

- If it prompts "Unable to load DLL 'libusb-1.0'"

Install [vc_redist](https://aka.ms/vs/17/release/vc_redist.x64.exe)
