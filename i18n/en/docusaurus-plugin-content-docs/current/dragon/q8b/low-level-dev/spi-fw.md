---
sidebar_position: 6
---

# Flashing SPI Boot Firmware

:::tip Firmware Notes
Radxa Dragon Q8B ships with SPI boot firmware preinstalled. Normally you do not need to flash the boot firmware. If the system fails to boot properly, you can try reflashing the SPI boot firmware.

The core task of SPI boot firmware (BootROM + bootloader) is to initialize hardware in stages (CPU -> memory -> storage), then load the operating system kernel from the storage device.
:::

When the device cannot boot properly, enter [EDL Mode](./edl-mode), then use the EDL tool to flash the SPI boot firmware.

Go to the [Resource Downloads](../download) page, download and extract the `edl-ng` archive, then select the corresponding version for your system platform to download the SPI firmware.

## Flashing SPI Boot Firmware

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [Enter EDL Mode](edl-mode)

    - Run the following command to flash the SPI boot firmware

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    .\edl-ng.exe --memory=spinor --loader C:\path\to\prog_firehose_ddr.elf rawprogram C:\path\to\rawprogram0.xml C:\path\to\patch0.xml

    ```

    </NewCodeBlock>

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

- Flash SPI Boot Firmware

Go to the [Resource Downloads](../../download) page, download the `spi firmware` file, extract it, open a terminal in the directory containing `prog_firehose_ddr.elf`, and use `edl-ng` to flash the SPI boot firmware.

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo edl-ng --memory=spinor rawprogram rawprogram0.xml patch0.xml --loader=prog_firehose_ddr.elf
```

</NewCodeBlock>

  </TabItem>
</Tabs>

## Erase SPI Boot Firmware

Erasing the SPI boot firmware will prevent the device from booting. You must reflash the SPI boot firmware before the device can boot normally. Do not erase the SPI boot firmware unless necessary.

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [Enter EDL Mode](edl-mode)

    - Erase SPI Boot Firmware

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

    - Erase SPI Boot Firmware

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
