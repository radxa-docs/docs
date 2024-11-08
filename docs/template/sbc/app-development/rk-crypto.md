---
title: "Rockchip Crypto"
---

Rockchip 系列 SoC 通常集成了硬件加解密模块，用于加速常见的加密算法。

## 检查 Rockchip Crypto 是否开启

Rockchip Crypto 需要在设备树中使能对应节点。使能成功后，系统会自动加载对应驱动。

若加载成功，可通过以下命令查看系统中注册的加密算法：

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

`/proc/rkcrypto` 中也包含了包括版本号在内的额外信息。

同时，系统中也会有一些其他相关的信息：

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

若您的系统的输出与上述不一致，请检查设备树中结点是否使能：

```bash
radxa@rock-5a:~$ cat /proc/device-tree/crypto@*/status
okayradxa@rock-5a:~$
```

以及内核是否有使能对应驱动：

```bash
radxa@rock-5a:~$ zcat /proc/config.gz | grep CONFIG_CRYPTO_DEV_ROCKCHIP
CONFIG_CRYPTO_DEV_ROCKCHIP=y
CONFIG_CRYPTO_DEV_ROCKCHIP_V1=y
CONFIG_CRYPTO_DEV_ROCKCHIP_V2=y
CONFIG_CRYPTO_DEV_ROCKCHIP_V3=y
CONFIG_CRYPTO_DEV_ROCKCHIP_DEV=y
```

若驱动是以模块方式编译，则需检查 `lsmod` 里面有没有包含 `rk-crypto` 模块。若此模块并未加载，可尝试运行 `sudo modprobe rk-crypto` 手动加载。

## 使用 `librkcrypto`

`librkcrypto` 是 Rockchip 提供在用户层使用硬件加密的开发库。以下仅介绍如何编译该项目的测试和演示用例。

### 编译

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

### 运行

```bash
sudo librkcrypto/out/target/lib/arm64/test/librkcrypto_test
sudo LD_LIBRARY_PATH="librkcrypto/out/target/lib/arm64:$LD_LIBRARY_PATH" librkcrypto/demo/librkcrypto_demo
```

更多信息请参考 [Rockchip 相关文档](https://gitlab.com/rockchip_linux_sdk_6.1/linux/bsp/docs/-/tree/cn/Common/CRYPTO)。
