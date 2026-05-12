---
sidebar_position: 2
description: 介绍如何安装 Neuron SDK
---

# Device 环境配置

在 Ubuntu 系统下配置设备端的 NPU 环境很简单，在终端运行下面的命令：

<NewCodeBlock tip="Device" type="device">

```bash
snap install mtk-neuropilot --edge
```

</NewCodeBlock>

--edge 渠道发布的是最新的软件包，可能比稳定渠道更新得更频繁，如果想要用于稳定的生产环境，可以前往 Snap 商店查看各版本的渠道和官方支持状态。

---

mtk-neuropilot 安装完成之后，在终端验证是否安装成功：

`ncc-tflite` 是用于将模型从 tflite 格式转换为 dla 格式的命令行工具。

<NewCodeBlock tip="Device" type="device">

```bash
$ ncc-tflite

Usage:
  ncc-tflite [OPTION...] filename

      --verify                  Force tflite model verification
      --no-verify               Bypass tflite model verification
  -d, --dla-file <file>         Specify a filename for the output DLA file
      --check-target-only       Check target support and exit
      --resize <dims,...>       Specify a list of input dimensions for resizing
                                (e.g., 1x3x5,2x4x6)
  -s, --show-tflite             Show tensors and nodes in the tflite model
      --show-io-info            Show input and output tensors of the tflite
                                model
      --show-builtin-ops        Show available builtin operations and exit
      --show-mtkext-ops         Show available MTKEXT operations and exit
      --verbose                 Enable verbose mode
      --version                 Output version information and exit
      --help                    Display this help and exit
  -e, --exec                    Enable execution (inference) mode
  -i, --input <file,...>        Specify a list of input files for inference
  -o, --output <file,...>       Specify a list of output files for inference
      --arch <name,...>         Specify a list of target architecture names
      --platform <name>         Platform preference as hint for compilation
  -O, --opt <level>             Specify which optimization level to use:
                                [0]: no optimization
                                [1]: enable basic optimization for fast codegen
                                [2]: enable most optimizations
                                [3]: enable -O2 with other optimizations that
                                     take longer compilation time (default: 2)
      --opt-accuracy            Optimize for accuracy
      --opt-aggressive          Enable optimizations that may lose accuracy
      --opt-bw                  Optimize for memory bandwidth
      --opt-footprint           Optimize for memory footprint
      --opt-size                Optimize for size, including code and static
                                data
      --relax-fp32              Run fp32 models using fp16
      --l1-size-kb <size>       Hint the size of L1 memory (default: 0)
      --l2-size-kb <size>       Hint the size of L2 memory (default: 0)
      --suppress-input          Suppress input data conversion
      --suppress-output         Suppress output data conversion
      --gen-debug-info          Produce debugging information in the DLA file.
                                Runtime can work with this info for profiling
      --show-exec-plan          Show execution plan
      --show-memory-summary     Show memory allocation summary
      --dla-metadata <key1:file1,key2:file2,...>
                                Specify a list of key:file pairs for DLA
                                metadata
      --disallow-bridge         Report error if bridging is needed
      --avoid-reorder           Keep execution order during graph optimization
                                if possible
      --extract-static-data <filename>
                                Extract static parameters into file and make
                                them as input tensors
      --intval-color-fast       Disable exhaustive search in interval coloring
      --show-l1-req             Show the requirement for L1 without dropping.
                                Only effective when global buffer allocation is
                                in effect
      --int8-to-uint8           Convert data types from INT8 to UINT8
      --fc-to-conv              Convert Fully Connected to Conv2D
      --decompose-qlstmv2       Decompose QLSTM V2 to sub-OPs
      --stable-linearize        Stable linearize NIR (respect the input NIR
                                order), making layer order predictable
      --rewrite-pattern <pattern1,pattern2,...>
                                Specify a list of patterns to be rewritten if
                                matched in a graph.
                                Use --rewrite-pattern=? to show available
                                patterns
      --sink-concat             Sink concat operations if possible
      --reshape-to-4d           Reshape tensor to 4D if possible

 aps options:
      --aps-cbfc-vids <vid,...>
                                Provide idle CBFC vids for APS internal use.
                                (e.g., 0,1)
      --aps-ext-datatype        Enable more datatype support for extension.

 gno options:
      --gno <opt1,opt2,...>  Specify a list of graphite neuron optimizations.
                             Available options: NDF, SMP, BMP
      --basic-tiling         Enable basic tiling

 gpu options:
      --cltuner-file <path>   An output file path for CL tuner that generates
                              optimization settings (default:
                              /vendor/etc/armnn_app.config)
      --cltuning-mode <mode>  Set the tuning level of CL tuner (default: -1)
      --cmdl-dir <path>       An output directory for CmdL that dumps infos
      --clprofile             Enable CmdL clprofile
      --clfinish              Enable CmdL clfinish

 mdla options:
      --num-mdla <num>          Use numbers of MDLA cores (default: 1)
      --mdla-bw <num>           Hint MDLA bandwidth (MB/s) (default: 10240)
      --mdla-freq <num>         Hint MDLA frequency (MHz) (default: 960)
      --mdla-wt-to-l1           Hint MDLA try to put weight into L1
      --mdla-wt-pruned          The weight of given model has been pruned
      --prefer-large-acc <num>  Use large accumulator to improve accuracy
      --use-sw-dilated-conv     Use software dilated convolution
      --use-sw-deconv           Convert DeConvolution to Conv2Ds
      --req-per-ch-conv         Requant invalid per-channel convs
      --trim-io-alignment       Trim the model IO alignment

 mvpu options:
      --mvpu-algo <bit_flags>   The selection of MVPU algo libraries:
                                [bit 0]: NN
                                [bit 1]: CV
                                [bit 16~17]: custom (default: 0xFFFFFFFF)
      --mvpu-l1-heuristic <percentage>
                                Hint the percentage of L1 memory usage:
                                The range is from 0 to 100 (default: 75)
      --mvpu-l2-limit <size>    Hint the maximum L2(TCM) usage size limit
                                 (default: 1048576)
      --mvpu-disable-cycle-mem-opt
                                Disable MVPU cycle memory optimization
      --num-mvpu <num>          Use numbers of MVPU cores (default: 1)

 vpu options:
      --dual-vpu  Use dual VPU
```

</NewCodeBlock>

---

`neuronrt` 可以运行 dla 模型，测试模型完整性。

<NewCodeBlock tip="Device" type="device">

```bash
$ neuronrt -v
INFO: dlopen libneuronusdk_runtime.mtk.so
Version: 6.3.3
```

</NewCodeBlock>
