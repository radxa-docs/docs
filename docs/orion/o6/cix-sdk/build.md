---
title: 软件编译
---

## 初始化此芯 SDK 编译环境

请在 SDK 根目录下执行以下命令加载编译工具并安装编译依赖：

```bash
sudo apt-get update
. ./build-scripts/envtool.sh
newer_env
sudo apt-get install python-is-python3
```

此时方可执行以下命令来下载并解压额外的二进制资源：

```bash
i=$((1))
get_cix_ext() {
    local block="$(printf "%03d" $1)"
    echo "https://github.com/radxa-pkg/cix-prebuilt/releases/download/$EX_CUSTOMER-$EX_PROJECT-$EX_VERSION/cix-sdk-ext.7z.$block"
}
while wget "$(get_cix_ext "$i")"; do
    i=$((i + 1))
done
7z x cix-sdk-ext.7z.001
# rm cix-sdk-ext.7z.*
```

现在系统便已准备好进行 SDK 编译。

## 常见命令和编译对象

以下命令需要在加载 `envtoo.sh` 后方可运行：

- `help`：显示 SDK 命令帮助
- `build radxa`：编译所有组件，并最终生成可运行镜像
