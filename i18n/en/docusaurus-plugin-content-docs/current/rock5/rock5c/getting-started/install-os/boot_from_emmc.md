---
sidebar_position: 2
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# 安装系统到 EMMC Module

## 文件下载

<Images loader={false} system_img={true} spi_img={false} />

## EMMC Module 准备

Insert the [EMMC Module](../../../../accessories/emmc_module) into the [EMMC Reader](../../../../accessories/emmc_reader), and then insert the Reader into the USB port of the PC.

## Burn the image

<Etcher/>

## Boot up the system

After successfully burning the EMMC Module according to the above steps, insert the EMMC Module into the EMMC Module slot (as shown in the following figure), and then power on the system, the system will start booting and HDMI will display the desktop.

<img
src="/img/rock5c/rock5c_with_emmc_module.webp"
alt="emmc slot"
style={{ width: "60%"}}
/>

## Log in to the System

After the system boots, log in using the radxa account with the password radxa.

:::tip
The entire process lasts about 40 seconds from powering up the system to booting it to the system desktop.
:::
