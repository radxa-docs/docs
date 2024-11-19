---
sidebar_position: 1
---

# Zhouyi AIPU SDK

The "Zhouyi" AIPU is an innovative AI processor specifically designed for deep learning by Arm China. It features a unique architecture, providing a complete hardware and software ecosystem with optimal PPA balance. Arm China also offers a range of tools for "Zhouyi" AIPU customers to assist with development, including simulators, compilers, and debuggers for data collection and analysis.

The "Zhouyi" AIPU supports mainstream AI frameworks such as TensorFlow and ONNX and will extend to support more frameworks in the future.

The "Zhouyi" Z2 AIPU is primarily designed for mid-to-high-end applications, including security, smart cockpits, ADAS, and edge servers.

## Zhouyi AIPU SDK Installation Guide

:::tip
The Zhouyi AIPU SDK must be installed on an X86 platform computer.
:::
The Zhouyi SDK is a full-stack platform designed to provide users with rapid development and deployment capabilities. Its overall architecture is shown below:  
![input.webp](/img/sirider/s1/aipu_0.webp)

### Preparing the Installation Environment

The Zhouyi SDK requires a clean Python 3.8 environment. Before proceeding, ensure you have Python 3.8 set up.

- _(Optional)_ Install [Anaconda](https://www.anaconda.com/)

  If Python 3.8 (the required version) is not installed, or multiple versions of Python are present, it is recommended to use [Anaconda](https://www.anaconda.com/) to create a new Python 3.8 environment.

  - **Install Anaconda**

    Open a terminal window and run the following command to check if Anaconda is installed. If installed, skip these steps.

    ```bash
    $ conda --version
    conda 23.10.0
    ```

    If you see `conda: command not found`, it indicates Anaconda is not installed. Please refer to the [Anaconda](https://www.anaconda.com/) website for installation instructions.

  - **Create a Conda Environment**

    ```bash
    conda create -n aipu python=3.8
    ```

  - **Activate the `aipu` Conda Environment**

    ```bash
    conda activate aipu
    ```

  - **Exit the Environment**
    ```bash
    conda deactivate
    ```

### Download the SDK Installation Package

Download the `Zhouyi_Z2.tar.gz` installation package from [Radxa's download site](https://dl.radxa.com/sirider/s1/) and extract it:

```bash
tar -xvf Zhouyi_Z2.tar.gz
cd Zhouyi_Z2 && bash +x SETUP.SH
```

After installation, the complete SDK directory will include the following:

- `AI610-SDK-r1p3-AIoT`: ARM Zhouyi Z2 toolkit.
- `siengine`: Example demos provided by siengine for ARM Zhouyi Z2 model compilation (`nn-compiler-user-case-example`) and board deployment (`nn-runtime-user-case-example`).

### Configure the `nn-compiler` Environment

- **Install Dependencies**

  ```bash
  cd AI610-SDK-r1p3-AIoT/AI610-SDK-r1p3-00eac0/Out-Of-Box/out-of-box-nn-compiler
  pip3 install -r lib_dependency.txt
  ```

  :::tip
  Since this SDK does not include simulation features, errors during the installation of `AIPUSimProfiler` can be ignored.
  :::

- **Start the `nn-compiler` Environment**

  For users of `venv`, remove the `--user` option in the `pip3 install` section of `env_setup.sh`.

  ```bash
  source env_setup.sh
  ```

## SDK Documentation References

- Open Source Code Repository: [https://github.com/Arm-China](https://github.com/Arm-China)
- GitHub SDK Documentation: [https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs)
- SDK Included Documentation Path:  
  `AI610-SDK-r1p3-AIoT/AI610-SDK-r1p3-00eac0/AI610-DOC-1001-r1p3-eac0`

### Recommended Reading Order:

1. [Zhouyi Compass Software Technical Overview](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Software_Technical_Overview_61010011_0103_00_en.pdf)
2. [Zhouyi Compass Getting Started Guide](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Getting_Started_Guide_61010012_0303_00_en.pdf)
3. [Zhouyi Compass Driver Runtime User Guide](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Driver_Runtime_User_Guide_61010023_0001_00_en.pdf)
4. [Zhouyi Compass NN Compiler User Guide](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_NN_Compiler_User_Guide_61010024_0001_00_en.pdf)
5. [Zhouyi Compass C Programming Guide](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_C_Programming_Guide_61010015_0114_00_en.pdf)
6. [Zhouyi Compass Debugger User Guide](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Debugger_User_Guide_61010016_0110_00_en.pdf)
7. [Zhouyi Compass IR Definition Application Note](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_IR_Definition_Application_Note_61010013_010_en.pdf)
8. [Zhouyi Compass Operators Specification Application Note](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_Compass_Operators_Specification_Application_Note_61010017_010_en.pdf)
9. [Zhouyi CompassStudio User Guide (Chinese)](https://github.com/zifeng-radxa/siriders1_Zhouyi_SDK_docs/blob/main/Zhouyi_CompassStudio_User_Guide_61010019_0300_06_zh.pdf)
