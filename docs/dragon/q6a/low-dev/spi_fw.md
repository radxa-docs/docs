---
sidebar_position: 6
---

# 烧录 SPI 启动固件

:::tip 固件说明
瑞莎 Dragon Q6A 出厂默认烧录 SPI 启动固件，正常情况下无需烧录启动固件，若系统启动异常，可以尝试重新烧录 SPI 启动固件。

SPI启动固件（BootROM + 引导程序）的核心任务是分阶段初始化硬件（CPU → 内存 → 存储），最终通过存储设备加载操作系统内核。
:::

当设备无法正常启动时，我们可以让设备进入 [QDL 模式](./qdl_mode)，然后通过 EDL 工具烧录 SPI 启动固件。

进入 [资源汇总下载](../../download) 页面，下载 `edl-ng` 压缩包并解压，然后根据自己的系统平台选择对应的版本进行 SPI 固件的下载。

<Tabs queryString = "qdlplatform">
  <TabItem value="Windows" label="Windows" default>

    ## 安装 edl-ng

    - 确认当前 edl-ng 的位置

    <img src="/img/dragon/q6a/spi_by_win_1.webp" style={{width: '80%', maxWidth: '1200px'}} />

    如，当前位置为 **C:\Users\radxa\Desktop\edl-ng\windows-x64**

    - 打开 **此电脑**，选择**属性**

    <img src="/img/dragon/q6a/spi_by_win_2.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - 点击**高级系统设置**

    <img src="/img/dragon/q6a/spi_by_win_3.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - 点击**环境变量**

    <img src="/img/dragon/q6a/spi_by_win_4.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - 在**系统变量**中双击**Path**

    <img src="/img/dragon/q6a/spi_by_win_5.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - 新建一个环境变量，变量名为 edl-ng 所在位置

    <img src="/img/dragon/q6a/spi_by_win_6.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - 打开 **powershell**, 以管理员身份运行，输入 "edl-ng.exe --version", 看是否成功输出版本号

    <img src="/img/dragon/q6a/spi_by_win_7.webp" style={{width: '80%', maxWidth: '1200px'}} />

    ## 烧录 Firmware

    - [进入 QDL mode](qdl_mode)

    - 打开**powershell**

    <img src="/img/dragon/q6a/spi_by_win_8.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - 进入固件所在位置

    <img src="/img/dragon/q6a/spi_by_win_9.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - 输入以下命令进行烧录

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    edl-ng.exe rawprogram .\rawprogram0.xml -l .\prog_firehose_ddr.elf --memory=spinor write-part XBL_CONFIG xbl_config.elf

    ```

    </NewCodeBlock>

    <img src="/img/dragon/q6a/spi_by_win_10.webp" style={{width: '80%', maxWidth: '1200px'}} />

    - 使用以下命令擦除

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    edl-ng.exe -l .\prog_firehose_ddr.elf --memory=spinor erase-part xbl

    ```

    </NewCodeBlock>

    <img src="/img/dragon/q6a/spi_by_win_11.webp" style={{width: '80%', maxWidth: '1200px'}} />

    ## FAQ

    - 若提示 Unable to loda DLL 'libusb-1.0'

    安装 [vc_redist](https://aka.ms/vs/17/release/vc_redist.x64.exe)

  </TabItem>
  <TabItem value="Linux" label="Linux">

将 Linux 版本的 `edl-ng` 工具添加到系统环境变量中，这样可以在任意位置打开终端就直接使用 `edl-ng` 命令。

- 查看路径

你可以在 `edl-ng` 工具所在的文件夹下打开终端，使用 `realpath` 命令查看当前文件夹下 `edl-ng` 的完整路径，然后给 `edl-ng` 创建软链接。

<NewCodeBlock tip="Linux$" type="host">

```
realpath edl-ng
```

</NewCodeBlock>

终端输出示例：

```
/home/user/edl-ng-dist/linux-x64/edl-ng
```

- 创建软链接

<NewCodeBlock tip="Linux$" type="host">

```
sudo ln -s [edl-ng path] /usr/local/bin/edl-ng
# 示例
sudo ln -s /home/user/edl-ng-dist/linux-x64/edl-ng /usr/local/bin/edl-ng
```

</NewCodeBlock>

参数说明：

- `[edl-ng path]` : 需要修改成自己的 `edl-ng` 工具完整路径

- 验证

可以在任意位置打开终端，使用 `edl-ng --version` 命令查看版本信息。

<NewCodeBlock tip="Linux$" type="host">

```
edl-ng --version
```

</NewCodeBlock>

终端若是打印出版本信息，说明 `edl-ng` 工具设置软链接成功。

- 擦除 SPI 启动固件

进入 [资源汇总下载](../../download) 页面，下载 `spi firmware` 文件,然后解压进入到 `prog_firehose_ddr.elf` 文件所在目录并打开终端，使用 `edl-ng` 命令擦除 SPI 启动固件。

<NewCodeBlock tip="Linux$" type="host">

```
sudo edl-ng --memory spinor erase-part xbl  -l prog_firehose_ddr.elf
```

</NewCodeBlock>

擦除成功后，终端会输出类似下面的信息：

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

- 烧录 SPI 启动固件

<NewCodeBlock tip="Linux$" type="host">

```
sudo edl-ng rawprogram rawprogram0.xml --loader=prog_firehose_ddr.elf --memory=spinor write-part XBL_CONFIG xbl_config.elf
```

</NewCodeBlock>

  </TabItem>
</Tabs>
