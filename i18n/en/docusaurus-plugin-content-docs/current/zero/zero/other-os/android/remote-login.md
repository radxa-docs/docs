---
sidebar_position: 3

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/general/_serial.mdx
---

import Serial from "../../../../common/general/\_serial.mdx"

# Remote login

Introduce how to access development board through a personal computer (PC) via serial port, adb, etc.

## Serial Login

<Serial platform="aml" />

## Adb Login

ADB is a bridge between your Android device and your computer, and is used to fully operate and manage your Android device on your computer.

### Wired Login

#### Requirements

1. a USB cable
2. a computer or laptop with the ADB tool installed on it
3. a Radxa ZERO

#### Steps

1. Connect the USB cable between the USB connector of the computer and the OTG Type C connector of the Radxa ZERO.
2. Open the computer terminal and enter adb devices to confirm that the Radxa ZERO is recognized.
   Type adb shell to login

```bash
$ adb devices
  List of devices attached
  e74a71a469bf207c device

$ adb shell
  rk356x_radxa_zero3:/ $
```
