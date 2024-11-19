---
sidebar_position: 1
---

# 周易 AIPU SDK

“周易” AIPU 是由安谋中国针对深度学习而自主研发的创新性 AI 专用处理器，它采用了创新性的架构设计，提供完整的硬件和软件生态，并且具有 PPA 最佳平衡。
安谋中国还为“周易” AIPU 的客户提供很多工具来帮助他们进行开发，包括仿真器、编译器和调试器等进行数据的采集、分析。
“周易” AIPU 也支持业界主流的 AI 规模框架，包括 TensorFlow、ONNX 等，未来也将支持更多不同的扩展框架。

“周易” Z2 AIPU 将主要面向中高端安防、智能座舱和 ADAS、边缘服务器等应用场景。

## 周易 AIPU SDK 安装教程

:::tip
周易 AIPU SDK 需要安装在 X86 平台的计算机上
:::
周易 SDK 是一个全栈平台，可为用户提供快速上市的开发和部署能力。整体架构图如下：
![input.webp](/img/sirider/s1/aipu_0.webp)

### 准备安装环境

周易 SDK 需要安装在 python3.8 的环境中，在此前需准备一个纯净的 python3.8 的环境

- （可选）安装 [Anaconda](https://www.anaconda.com/)

  如果系统中没有安装 Python 3.8（必要版本），或者同时有多个版本的 Python 环境，建议使用 [Anaconda](https://www.anaconda.com/) 创建新的 Python 3.8 环境

  - 安装 Anaconda

    在计算机的终端窗口中执行以下命令，检查是否安装 Anaconda，若已安装则可省略此节步骤

    ```bash
    $ conda --version
    conda 23.10.0
    ```

    如出现 conda: command not found, 则表示未安装 anaconda, 请参考 [Anaconda](https://www.anaconda.com/) 官网进行安装

  - 创建 conda 环境
    ```bash
    conda create -n aipu python=3.8
    ```
  - 进入 aipu conda 环境

    ```bash
    conda activate aipu
    ```

  - 退出环境
    ```bash
    conda deactivate
    ```

### 下载 SDK 安装包

在[瑞莎下载站](https://dl.radxa.com/sirider/s1/)下载 `Zhouyi_Z2.tar.gz` 安装包后解压安装

```bash
tar -xvf Zhouyi_Z2.tar.gz
cd Zhouyi_Z2 && bash +x SETUP.SH
```

安装后得到的完整 SDK 文件如下

- `AI610-SDK-r1p3-AIoT` : ARM ZhouYi Z2 工具包

- `siengine` : siengine 提供的 ARM ZhouYi Z2 模型编译(nn-compiler-user-case-example)及板子部署(nn-runtime-user-case-example)的 demos

### 配置 nn-compiler 环境

- 安装依赖
  ```bash
  cd AI610-SDK-r1p3-AIoT/AI610-SDK-r1p3-00eac0/Out-Of-Box/out-of-box-nn-compiler
  pip3 install -r lib_dependency.txt
  ```
  :::tip
  因为此 SDK 不包含模拟功能, 故安装过程会出现安装 AIPUSimProfiler 的报错，可以忽略
  :::
- 启动 nn-compiler 环境

  若使用 venv 的用户请在 env_setup.sh 中 pip3 install 部分去掉 --user 选项

  ```bash
  source env_setup.sh
  ```

## SDK 文档参考

开源代码地址： https://github.com/Arm-China

Github SDK 文档参考：https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs

SDK 附带文档路径： `AI610-SDK-r1p3-AIoT/AI610-SDK-r1p3-00eac0/AI610-DOC-1001-r1p3-eac0`

建议阅读顺序：

[Zhouyi_Compass_Software_Technical_Overview_61010011_0103_00_en.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Software_Technical_Overview_61010011_0103_00_en.pdf)
[Zhouyi_Compass_Getting_Started_Guide_61010012_0303_00_en.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Getting_Started_Guide_61010012_0303_00_en.pdf)
[Zhouyi_Compass_Driver_Runtime_User_Guide_61010023_0001_00_en.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Driver_Runtime_User_Guide_61010023_0001_00_en.pdf)
[Zhouyi_Compass_NN_Compiler_User_Guide_61010024_0001_00_en.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_NN_Compiler_User_Guide_61010024_0001_00_en.pdf)
[Zhouyi_Compass_C_Programming_Guide_61010015_0114_00_en.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_C_Programming_Guide_61010015_0114_00_en.pdf)
[Zhouyi_Compass_Debugger_User_Guide_61010016_0110_00_en.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Debugger_User_Guide_61010016_0110_00_en.pdf)
[Zhouyi_Compass_IR_Definition_Application_Note_61010013_010_en.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_IR_Definition_Application_Note_61010013_010_en.pdf)
[Zhouyi_Compass_Operators_Specification_Application_Note_61010017_010_en.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Operators_Specification_Application_Note_61010017_010_en.pdf)
[Zhouyi_CompassStudio_User_Guide_61010019_0300_06_zh.pdf](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_CompassStudio_User_Guide_61010019_0300_06_zh.pdf)
