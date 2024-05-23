---
sidebar_position: 25
---

# ROOBI OS 高级功能

以下内容面向为专业人员，您应当清楚您所有操作的后果。

## ROOBI OS 为高度定制的 Linux 系统

ROOBI 开放运行 Linux 命令的所有权限。

您可以正常运行 Linux 命令，但您应当具备一定的专业知识，否则请不要使用命令行界面。

## 进入终端

使用按键 Ctrl + Alt + F2, 即可进入终端界面，用户名和密码均为 ps。

## 开启ssh连接

ROOBI OS 提供一个快捷开启ssh 的方式，只需要在命令行中运行 `ssh` 即可。ROOBI 将开启 ssh 命令起了个别名。

如果您的设备为 [ROCK 5 ITX](https://radxa.com/products/rock5/5itx)， 则默认开启ssh。

如果需要使用 ROOBI OS ssh 连接到其他设备，您可以 sudo 运行。

## 手动更新 ROOBI 主程序

在终端中输入 `roobi update` 即可，会有相应的日志输出。

## 搭建自定义镜像源

ROOBI 采用简洁方式进行通信，大致流程如下：

1. 通过网络 json 列表获取镜像列表。

2. 通过镜像列表获取镜像的详情：下载地址，安装方式等。

具体参考： 安装脚本编写(#安装脚本编写)

将 json 文件列表的网络地址作为自定义镜像源地址，即可。

## 安装脚本编写

### 执行脚本文件的版本（script_version）

[str]

该值请保持为 1，不允许修改

### uuid

[str]

代表该安装文件的唯一值

### 名称（name）

[str]

将会显示到安装界面上

### 图像（img）

[str]

该安装文件的 图片 的 url 地址

### 描述（description）

[str|langObject]

改安装文件的描述，应当包含版权，注意事项等

### 版本（version）

[str]

该安装文件的版本，只做展示

### 作者（author）

[str]

表示该安装文件的作者， 只做展示

### 日期（date）

[str]

### 下载（download）

object|array[object]

#### object 的内容

file_name:[str]保存的文件名

size:[int] 文件的字节大小数

urls:[str|array[str]]允许分块下载，下载的url

md5:[str]整个文件的md5sum

### 运行脚本（scripts）

#### 支持的格式

scriptObject|array[scriptObject]

程序将按顺序执行script脚本对象

#### scriptObject的详细内容如下

type:[str|null] 在以下内容选择

1. auto：

   如果你的scriptObject中包含这个类型，那么就不允许有其他类型出现，这一项将要求：

   1. 下载的文件名只能包含一项:镜像：.img / .img.gz / .img.xz ,安装前脚本: before.sh,安装后脚本: after.sh，脚本支持格式化文本。这些脚本结束后返回值为0则正常安装，非零则报错
   2. 镜像必须包含分区信息
   3. 程序会自动生成一个名为disk的**参数**
   4. img\*, before 和 after 文件允许为空。
   5. size:如果文件为gz则可以添加上这个参数，减少读取全文的时间

安全起见：当前版本仅支持该参数。

### 其他

#### 格式化文本

允许字符串中带一层大括号，并放上**参数名**，例如 "dd if=xx.img of=\{disk\}" 程序将会自动的将改文本转化为 "dd if=xx.img of=/dev/sda" (假设disk为 "/dev/sda")。如需要输出大括号 "\{" 、"\}" 请使用 "\{\{"、"\}\}" 代替

目前版本仅有 disk 参数

#### langObject

支持多国语言的文本

形式为 国家代号：文本

例如：

```json
{
  "en": "Choose the disk to install.",
  "zh-CN": "选择安装的磁盘"
}
```

### list.json 内容

[list[object]]

object:

uuid: 同上文的uuid，两者必须保持一致

name: 同上文的name， 两者最好保持一致

url:指向上文脚本内容的url

## 将您的镜像上传到官方源

参考 [github](https://github.com/radxa/roobi-config/pulls) 仓库
