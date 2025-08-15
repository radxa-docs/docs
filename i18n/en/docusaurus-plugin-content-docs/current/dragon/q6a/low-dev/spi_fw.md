---
sidebar_position: 6
---

# Burn SPI boot firmware

:::tip Firmware Notes
The Dragon Q6A comes with SPI boot firmware pre-installed. Under normal circumstances, there is no need to re-flash the boot firmware. However, if the system fails to boot properly, you can try re-flashing the SPI boot firmware.

The primary function of the SPI boot firmware (BootROM + bootloader) is to initialize hardware in stages (CPU → memory → storage) and ultimately load the operating system kernel from the storage device.
:: :

When the device cannot boot normally, you can enter [QDL mode](./qdl_mode) and then use the EDL tool to flash the SPI boot firmware.

Go to the [Resource Download](../../download) page, download the `edl-ng` compressed package and unzip it, then select the corresponding version based on your system platform to download the SPI firmware.

<Tabs queryString = "qdlplatform">
  <TabItem value="Windows" label="Windows" default>

    ## Install edl-ng

    - Confirm the current location of edl-ng.

    <img src="/img/dragon/q6a/spi_by_win_1.webp" style={{width: '80%', maxWidth: '1200px'}} />

    For example, the current location is **C:\Users\radxa\Desktop\edl-ng\windows-x64**

    -

    <img src="/img/dragon/q6a/spi_by_win_2.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - Open **This PC** and select **Properties**.

    <img src="/img/dragon/q6a/spi_by_win_3.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - Click **Environment Variables**.

    <img src="/img/dragon/q6a/spi_by_win_4.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - Double-click **Path** in **System Variables**.

    <img src="/img/dragon/q6a/spi_by_win_5.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - Create a new environment variable named edl-ng Location

    <img src="/img/dragon/q6a/spi_by_win_6.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - Open **powershell**, run it as an administrator, enter “edl-ng.exe --version”, and see if the version number is displayed successfully.

    <img src="/img/dragon/q6a/spi_by_win_7.webp" style={{width: '80%', maxWidth: '1200px'}} />

    ## Firmware burning

    - [Enter QDL mode](qdl_mode)

    - Open**powershell**

    <img src="/img/dragon/q6a/spi_by_win_8.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - Go to the location of the firmware.

    <img src="/img/dragon/q6a/spi_by_win_9.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - Enter the following command to burn

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    edl-ng.exe rawprogram .\rawprogram0.xml -l .\prog_firehose_ddr.elf --memory=spinor write-part XBL_CONFIG xbl_config.elf

    ```

    </NewCodeBlock>

    <img src="/img/dragon/q6a/spi_by_win_10.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - Erase using the following command

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    edl-ng.exe -l .\prog_firehose_ddr.elf --memory=spinor erase-part xbl

    ```

    </NewCodeBlock>

    <img src="/img/dragon/q6a/spi_by_win_11.webp" style={{width: '80%', maxWidth: '1200px'}} />

    ## FAQ

    - If prompted Unable to loda DLL 'libusb-1.0'

    Install [vc_redist](https://aka.ms/vs/17/release/vc_redist.x64.exe)

  </TabItem>
  <TabItem value="Linux" label="Linux">

Add the Linux version of the `edl-ng` tool to the system environment variables so that you can use the `edl-ng` command directly from any terminal.

- View the path

You can open a terminal in the folder where the `edl-ng` tool is located, use the `realpath` command to view the full path of `edl-ng` in the current folder, and then create a soft link for `edl-ng`.

<NewCodeBlock tip="Linux$" type="host">

```
realpath edl-ng
```

</NewCodeBlock>

Terminal output example:

```
/home/user/edl-ng-dist/linux-x64/edl-ng
```

- Create soft links

<NewCodeBlock tip="Linux$" type="host">

```
sudo ln -s [edl-ng path] /usr/local/bin/edl-ng
# Example
sudo ln -s /home/user/edl-ng-dist/linux-x64/edl-ng /usr/local/bin/edl-ng
```

</NewCodeBlock>

Parameter description:

- `[edl-ng path]` : Needs to be changed to the full path of your own `edl-ng` tool

- Verification

You can open a terminal at any location and use the `edl-ng --version` command to view the version information.

<NewCodeBlock tip="Linux$" type="host">

```
edl-ng --version
```

</NewCodeBlock>

If the terminal prints the version information, it means that the `edl-ng` tool has successfully set the soft link.

- Erase SPI boot firmware

Go to the [Resource Summary Download](../../download) page, download the `spi firmware` file, then unzip it into the directory where the `prog_firehose_ddr.elf` file is located and open the terminal. Use the `edl-ng` command to erase the SPI boot firmware.

<NewCodeBlock tip="Linux$" type="host">

```
sudo edl-ng --memory spinor erase-part xbl  -l prog_firehose_ddr.elf
```

</NewCodeBlock>

After successful erasure, the terminal will output information similar to the following:

```
11:55:49.251 [INFO]  Found device using LibUsbDotNet on Linux / MacOS.
11:55:49.253 [INFO]  Kernel driver is active on interface 0, attempting manual detach...
11:55:49.253 [INFO]  Manual detach successful.
11:55:49.253 [INFO]  Detected device mode: Sahara
11:55:49.253 [INFO]  Device is in Sahara mode. Uploading loader...
11:55:49.254 [INFO]  Serial Number: ACAB22CD
11:55:49.254 [INFO]  Product ID: 408 (QCS_KODIAK)
11:55:49.355 [INFO]  Uploading loader: ~/prog_firehose_ddr.elf
11:55:49.556 [INFO]  Loader uploaded and started successfully via Sahara.
11:55:50.056 [INFO]  Found device using LibUsbDotNet on Linux / MacOS.
11:55:51.122 [INFO]  Sending Firehose configure command...
11:55:51.140 [INFO]  Firehose configured for Memory: SPINOR, MaxPayload: 1048576

11:55:51.288 [INFO]  Found partition 'xbl' on LUN 0 with sector size 4096.
11:55:51.288 [INFO]  Attempting to erase partition 'xbl' (LUN 0, LBA 52, 256 sectors)...
11:55:58.699 [INFO]  Successfully erased partition 'xbl' in 7.41s.

```

- Burn SPI boot firmware

<NewCodeBlock tip="Linux$" type="host">

```
sudo edl-ng rawprogram rawprogram0.xml --loader=prog_firehose_ddr.elf --memory=spinor write-part XBL_CONFIG xbl_config.elf
```

</NewCodeBlock>

  </TabItem>
</Tabs>
