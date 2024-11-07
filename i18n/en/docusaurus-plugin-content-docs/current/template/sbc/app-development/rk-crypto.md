---
title: "Rockchip Crypto"
---

Rockchip series SoCs typically integrate hardware encryption and decryption modules to accelerate common encryption algorithms.

## Check if Rockchip Crypto is Enabled

Rockchip Crypto needs to be enabled in the device tree for the corresponding node. Once enabled, the system will automatically load the corresponding driver.

If the driver is successfully loaded, you can view the registered encryption algorithms in the system using the following command:

```bash
radxa@rock-5a:~$ cat /proc/crypto | grep rk
driver       : rsa-rk
driver       : hmac-sm3-rk
driver       : hmac-md5-rk
driver       : hmac-sha512-rk
driver       : hmac-sha256-rk
driver       : hmac-sha1-rk
driver       : sm3-rk
driver       : md5-rk
driver       : sha512-rk
driver       : sha384-rk
driver       : sha256-rk
driver       : sha224-rk
driver       : sha1-rk
driver       : ofb-des3_ede-rk
driver       : cfb-des3_ede-rk
driver       : cbc-des3_ede-rk
driver       : ecb-des3_ede-rk
driver       : ofb-des-rk
driver       : cfb-des-rk
driver       : cbc-des-rk
driver       : ecb-des-rk
driver       : gcm-aes-rk
driver       : ctr-aes-rk
driver       : ofb-aes-rk
driver       : cfb-aes-rk
driver       : cbc-aes-rk
driver       : ecb-aes-rk
driver       : gcm-sm4-rk
driver       : ctr-sm4-rk
driver       : ofb-sm4-rk
driver       : cfb-sm4-rk
driver       : cbc-sm4-rk
driver       : ecb-sm4-rk
```

Additional information, including version numbers, is also available in `/proc/rkcrypto`.

There are also some other related pieces of information in the system:

```bash
radxa@rock-5a:~$ ls -la /sys/bus/platform/drivers/rk-crypto
total 0
drwxr-xr-x   2 root root    0 Jan  1  1970 .
drwxr-xr-x 199 root root    0 Jan  1  1970 ..
--w-------   1 root root 4096 Nov  1 06:40 bind
lrwxrwxrwx   1 root root    0 Nov  1 06:40 fe370000.crypto -> ../../../../devices/platform/fe370000.crypto
--w-------   1 root root 4096 Jan  1  1970 uevent
--w-------   1 root root 4096 Nov  1 06:40 unbind
radxa@rock-5a:~$ sudo dmesg | grep crypto
[   13.195785] rk-crypto fe370000.crypto: invalid resource
[   13.197071] rk-crypto fe370000.crypto: register to cryptodev ok!
[   13.197081] rk-crypto fe370000.crypto: CRYPTO V2.0.0.0 Accelerator successfully registered
[   13.197461] cryptodev: driver 1.12 loaded.
```

If your system's output is inconsistent with the above, please check whether the node is enabled in the device tree:

```bash
radxa@rock-5a:~$ cat /proc/device-tree/crypto@*/status
okayradxa@rock-5a:~$
```

And whether the kernel has enabled the corresponding driver:

```bash
radxa@rock-5a:~$ zcat /proc/config.gz | grep CONFIG_CRYPTO_DEV_ROCKCHIP
CONFIG_CRYPTO_DEV_ROCKCHIP=y
CONFIG_CRYPTO_DEV_ROCKCHIP_V1=y
CONFIG_CRYPTO_DEV_ROCKCHIP_V2=y
CONFIG_CRYPTO_DEV_ROCKCHIP_V3=y
CONFIG_CRYPTO_DEV_ROCKCHIP_DEV=y
```

If the driver is compiled as a module, you need to check whether the `rk-crypto` module is included in `lsmod`. If this module is not loaded, you can try running `sudo modprobe rk-crypto` to manually load it.

## Using `librkcrypto`

`librkcrypto` is a user-space development library provided by Rockchip for using hardware encryption. The following describes how to compile the test and demo cases of this project.

### Compilation

```bash
sudo apt update
sudo apt install git cmake build-essential

git clone -b linux5.10-rk356x https://github.com/TinkerBoard/rockchip-linux-librkcrypto.git librkcrypto

mkdir -p librkcrypto/out/target/lib/arm64
ln -sf ../../include librkcrypto/out/target/include

pushd librkcrypto/out/target/lib/arm64
cmake ../../../../ -DCMAKE_C_FLAGS="-Wno-stringop-truncation -Wno-array-parameter" -DCMAKE_CXX_COMPILER=/usr/bin/g++
make -j$(nproc)
popd

pushd librkcrypto/demo
make -j$(nproc) bit=64 CC=/usr/bin/cc
popd
```

### Execution

```bash
sudo librkcrypto/out/target/lib/arm64/test/librkcrypto_test
sudo LD_LIBRARY_PATH="librkcrypto/out/target/lib/arm64:$LD_LIBRARY_PATH" librkcrypto/demo/librkcrypto_demo
```

For more information, please refer to the [Rockchip documentation](https://gitlab.com/rockchip_linux_sdk_6.1/linux/bsp/docs/-/tree/cn/Common/CRYPTO).
