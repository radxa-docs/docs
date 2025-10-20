---
sidebar_position: 6
---

# 烧录 SPI 启动固件

:::tip 固件说明
瑞莎 Dragon Q6A 出厂默认烧录 SPI 启动固件，正常情况下无需烧录启动固件，若系统启动异常，可以尝试重新烧录 SPI 启动固件。

SPI启动固件（BootROM + 引导程序）的核心任务是分阶段初始化硬件（CPU → 内存 → 存储），最终通过存储设备加载操作系统内核。
:::

当设备无法正常启动时，我们可以让设备进入 [EDL 模式](./edl_mode)，然后通过 EDL 工具烧录 SPI 启动固件。

进入 [资源汇总下载](../download) 页面，下载 `edl-ng` 压缩包并解压，然后根据自己的系统平台选择对应的版本进行 SPI 固件的下载。

## 烧录 SPI 启动固件

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [进入 EDL mode](edl_mode)

    - 输入以下命令进行 SPI 启动固件的烧录

    <NewCodeBlock tip="Windows$" type="host">

    ```bash

    .\edl-ng.exe --memory=spinor --loader C:\path\to\prog_firehose_ddr.elf rawprogram C:\path\to\rawprogram0.xml C:\path\to\patch0.xml

    ```

    </NewCodeBlock>

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

- [进入 EDL mode](edl_mode)

- 烧录 SPI 启动固件

进入 [资源汇总下载](../../download) 页面，下载 `spi firmware` 文件,然后解压进入到 `prog_firehose_ddr.elf` 文件所在目录并打开终端，使用 `edl-ng` 命令烧录 SPI 启动固件。

<NewCodeBlock tip="Linux$" type="host">

```
sudo edl-ng --memory=spinor rawprogram rawprogram0.xml patch0.xml --loader=prog_firehose_ddr.elf
```

</NewCodeBlock>

  </TabItem>
</Tabs>

## 擦除 SPI 启动固件

擦除 SPI 启动固件将导致设备无法启动，需要重新烧录 SPI 启动固件才可正常启动，若非必要，请勿擦除 SPI 启动固件。

<Tabs queryString = "EDLplatform">
  <TabItem value="Windows" label="Windows" default>

    - [进入 EDL mode](edl_mode)

    - 擦除 SPI 启动固件

    打开终端，输入以下命令进行擦除：

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

    - [进入 EDL mode](edl_mode)

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

    进入 `prog_firehose_ddr.elf` 文件所在目录打开终端，输入以下命令进行擦除

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

- 若提示 Unable to loda DLL 'libusb-1.0'

安装 [vc_redist](https://aka.ms/vs/17/release/vc_redist.x64.exe)
