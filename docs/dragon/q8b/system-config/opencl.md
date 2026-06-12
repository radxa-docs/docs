---
sidebar_position: 5
---

# OpenCL 使用指南

在 Dragon Q8B 上安装并验证 OpenCL（基于 Mesa RustiCL + Freedreno GPU）。

## 安装 OpenCL

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash

sudo apt update
sudo apt install mesa-opencl-icd -y

```

</NewCodeBlock>

## 验证 OpenCL

启用 Freedreno 后端并查看 OpenCL 信息：

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash

RUSTICL_ENABLE=freedreno clinfo

```

</NewCodeBlock>

终端输出示例：

```bash

radxa@radxa-dragon-q8b:~$ RUSTICL_ENABLE=freedreno clinfo
Number of platforms                               1
  Platform Name                                   rusticl
  Platform Vendor                                 Mesa/X.org
  Platform Version                                OpenCL 3.0
  Platform Profile                                FULL_PROFILE
  Platform Extensions                             cl_khr_icd cl_khr_byte_addressable_store cl_khr_create_command_queue cl_khr_expect_assume cl_khr_extended_bit_ops cl_khr_extended_versioning cl_khr_global_int32_base_atomics cl_khr_global_int32_extended_atomics cl_khr_il_program cl_khr_local_int32_base_atomics cl_khr_local_int32_extended_atomics cl_khr_integer_dot_product cl_khr_spirv_no_integer_wrap_decoration cl_khr_spirv_queries cl_khr_suggested_local_work_size cl_ext_immutable_memory_objects cl_khr_spirv_linkonce_odr cl_khr_fp16 cles_khr_int64 cl_khr_kernel_clock cl_khr_image2d_from_buffer cl_khr_3d_image_writes cl_khr_depth_images cl_ext_image_unorm_int_2_101010 cl_khr_priority_hints cl_khr_device_uuid
  Platform Extensions with Version                cl_khr_icd                                                       0x800000 (2.0.0)
                                                  cl_khr_byte_addressable_store                                    0x400000 (1.0.0)
                                                  cl_khr_create_command_queue                                      0x400000 (1.0.0)
                                                  cl_khr_expect_assume                                             0x400000 (1.0.0)
                                                  cl_khr_extended_bit_ops                                          0x400000 (1.0.0)
                                                  cl_khr_extended_versioning                                       0x400000 (1.0.0)
                                                  cl_khr_global_int32_base_atomics                                 0x400000 (1.0.0)
                                                  cl_khr_global_int32_extended_atomics                             0x400000 (1.0.0)
                                                  cl_khr_il_program                                                0x400000 (1.0.0)
                                                  cl_khr_local_int32_base_atomics                                  0x400000 (1.0.0)
                                                  cl_khr_local_int32_extended_atomics                              0x400000 (1.0.0)
                                                  cl_khr_integer_dot_product                                       0x800000 (2.0.0)
                                                  cl_khr_spirv_no_integer_wrap_decoration                          0x400000 (1.0.0)
                                                  cl_khr_spirv_queries                                             0x400000 (1.0.0)
                                                  cl_khr_suggested_local_work_size                                 0x400000 (1.0.0)
                                                  cl_ext_immutable_memory_objects                                  0x400000 (1.0.0)
                                                  cl_khr_spirv_linkonce_odr                                        0x400000 (1.0.0)
                                                  cl_khr_fp16                                                      0x400000 (1.0.0)
                                                  cles_khr_int64                                                   0x400000 (1.0.0)
                                                  cl_khr_kernel_clock                                              0x400000 (1.0.0)
                                                  cl_khr_image2d_from_buffer                                       0x400000 (1.0.0)
                                                  cl_khr_3d_image_writes                                           0x400000 (1.0.0)
                                                  cl_khr_depth_images                                              0x400000 (1.0.0)
                                                  cl_ext_image_unorm_int_2_101010                                  0x400000 (1.0.0)
                                                  cl_khr_priority_hints                                            0x400000 (1.0.0)
                                                  cl_khr_device_uuid                                               0x400000 (1.0.0)
  Platform Numeric Version                        0xc00000 (3.0.0)
  Platform Extensions function suffix             MESA
  Platform Host timer resolution                  1ns

  Platform Name                                   rusticl
Number of devices                                 1
  Device Name                                     FD690
  Device Vendor                                   Qualcomm
  Device Vendor ID                                0x5143
  Device Version                                  OpenCL 3.0
  Device UUID                                     463bc9b2-20ab-14eb-a880-fe78d7aeeb54
  Driver UUID                                     b251c0ed-95c4-4ac2-0c0b-6df49772396f
  Valid Device LUID                               No
  Device LUID                                     0000-000000000000
  Device Node Mask                                0
  Device Numeric Version                          0xc00000 (3.0.0)
  Driver Version                                  26.0.3-1ubuntu1
  Device OpenCL C Version                         OpenCL C 1.2
  Device OpenCL C Numeric Version                 0x402000 (1.2.0)
  Device OpenCL C all versions                    OpenCL C                                                         0xc00000 (3.0.0)
                                                  OpenCL C                                                         0x402000 (1.2.0)
                                                  OpenCL C                                                         0x401000 (1.1.0)
                                                  OpenCL C                                                         0x400000 (1.0.0)
  Device OpenCL C features                        __opencl_c_integer_dot_product_input_4x8bit                      0x800000 (2.0.0)
                                                  __opencl_c_integer_dot_product_input_4x8bit_packed               0x800000 (2.0.0)
                                                  __opencl_c_int64                                                 0x400000 (1.0.0)
                                                  __opencl_c_kernel_clock_scope_device                             0x400000 (1.0.0)
                                                  __opencl_c_kernel_clock_scope_sub_group                          0x400000 (1.0.0)
                                                  __opencl_c_images                                                0x400000 (1.0.0)
                                                  __opencl_c_read_write_images                                     0x400000 (1.0.0)
                                                  __opencl_c_3d_image_writes                                       0x400000 (1.0.0)
                                                  __opencl_c_ext_image_unorm_int_2_101010                          0x400000 (1.0.0)
  Latest conformance test passed                  v0000-01-01-00
  Device Type                                     GPU
  Device Profile                                  EMBEDDED_PROFILE
  Device Available                                Yes
  Compiler Available                              Yes
  Linker Available                                Yes
  Max compute units                               8
  Max clock frequency                             690MHz
  Device Partition                                (core)
    Max number of sub-devices                     0
    Supported partition types                     None
    Supported affinity domains                    (n/a)
  Max work item dimensions                        3
  Max work item sizes                             1024x1024x64
  Max work group size                             2048
  Preferred work group size multiple (device)     16
  Preferred work group size multiple (kernel)     128
  Max sub-groups per work group                   0
  Preferred / native vector sizes
    char                                                 1 / 1
    short                                                1 / 1
    int                                                  1 / 1
    long                                                 1 / 1
    half                                                 1 / 1        (cl_khr_fp16)
    float                                                1 / 1
    double                                               0 / 0        (n/a)
  Half-precision Floating-point support           (cl_khr_fp16)
    Denormals                                     No
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 No
    Round to infinity                             No
    IEEE754-2008 fused multiply-add               No
    Support is emulated in software               No
  Single-precision Floating-point support         (core)
    Denormals                                     No
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 No
    Round to infinity                             No
    IEEE754-2008 fused multiply-add               No
    Support is emulated in software               No
    Correctly-rounded divide and sqrt operations  No
  Double-precision Floating-point support         (n/a)
  Address bits                                    64, Little-Endian
  Global memory size                              16071417856 (14.97GiB)
  Error Correction support                        No
  Max memory allocation                           2147483647 (2GiB)
  Unified memory for Host and Device              Yes
  Shared Virtual Memory (SVM) capabilities        (core)
    Coarse-grained buffer sharing                 No
    Fine-grained buffer sharing                   No
    Fine-grained system sharing                   No
    Atomics                                       No
  Minimum alignment for any data type             128 bytes
  Alignment of base address                       4096 bits (512 bytes)
  Preferred alignment for atomics
    SVM                                           0 bytes
    Global                                        0 bytes
    Local                                         0 bytes
  Atomic memory capabilities                      relaxed, work-group scope
  Atomic fence capabilities                       relaxed, acquire/release, work-group scope
  Max size for global variable                    0
  Preferred total size of global vars             0
  Global Memory cache type                        None
  Image support                                   Yes
    Max number of samplers per kernel             16
    Max size for 1D images from buffer            134217727 pixels
    Max 1D or 2D image array size                 2048 images
    Base address alignment for 2D image buffers   64 bytes
    Pitch alignment for 2D image buffers          64 pixels
    Max 2D image size                             16384x16384 pixels
    Max 3D image size                             2048x2048x2048 pixels
    Max number of read image args                 16
    Max number of write image args                32
    Max number of read/write image args           32
  Pipe support                                    No
  Max number of pipe args                         0
  Max active pipe reservations                    0
  Max pipe packet size                            0
  Local memory type                               Global
  Local memory size                               32768 (32KiB)
  Max number of constant args                     16
  Max constant buffer size                        67108864 (64MiB)
  Generic address space support                   No
  Max size of kernel argument                     4096 (4KiB)
  Queue properties (on host)
    Out-of-order execution                        Yes
    Profiling                                     Yes
  Device enqueue capabilities                     (n/a)
  Queue properties (on device)
    Out-of-order execution                        No
    Profiling                                     No
    Preferred size                                0
    Max size                                      0
  Max queues on device                            0
  Max events on device                            0
  Prefer user sync for interop                    Yes
  Profiling timer resolution                      52ns
  Execution capabilities
    Run OpenCL kernels                            Yes
    Run native kernels                            No
    Non-uniform work-groups                       No
    Work-group collective functions               No
    Sub-group independent forward progress        No
    IL version                                    SPIR-V_1.0 SPIR-V_1.1 SPIR-V_1.2 SPIR-V_1.3 SPIR-V_1.4 SPIR-V_1.5 SPIR-V_1.6
    ILs with version                              SPIR-V                                                           0x400000 (1.0.0)
                                                  SPIR-V                                                           0x401000 (1.1.0)
                                                  SPIR-V                                                           0x402000 (1.2.0)
                                                  SPIR-V                                                           0x403000 (1.3.0)
                                                  SPIR-V                                                           0x404000 (1.4.0)
                                                  SPIR-V                                                           0x405000 (1.5.0)
                                                  SPIR-V                                                           0x406000 (1.6.0)
  printf() buffer size                            1048576 (1024KiB)
  Built-in kernels                                (n/a)
  Built-in kernels with version                   (n/a)
  Device Extensions                               cl_khr_byte_addressable_store cl_khr_create_command_queue cl_khr_expect_assume cl_khr_extended_bit_ops cl_khr_extended_versioning cl_khr_global_int32_base_atomics cl_khr_global_int32_extended_atomics cl_khr_il_program cl_khr_local_int32_base_atomics cl_khr_local_int32_extended_atomics cl_khr_integer_dot_product cl_khr_spirv_no_integer_wrap_decoration cl_khr_spirv_queries cl_khr_suggested_local_work_size cl_ext_immutable_memory_objects cl_khr_spirv_linkonce_odr cl_khr_fp16 cles_khr_int64 cl_khr_kernel_clock cl_khr_image2d_from_buffer cl_khr_3d_image_writes cl_khr_depth_images cl_ext_image_unorm_int_2_101010 cl_khr_priority_hints cl_khr_device_uuid
  Device Extensions with Version                  cl_khr_byte_addressable_store                                    0x400000 (1.0.0)
                                                  cl_khr_create_command_queue                                      0x400000 (1.0.0)
                                                  cl_khr_expect_assume                                             0x400000 (1.0.0)
                                                  cl_khr_extended_bit_ops                                          0x400000 (1.0.0)
                                                  cl_khr_extended_versioning                                       0x400000 (1.0.0)
                                                  cl_khr_global_int32_base_atomics                                 0x400000 (1.0.0)
                                                  cl_khr_global_int32_extended_atomics                             0x400000 (1.0.0)
                                                  cl_khr_il_program                                                0x400000 (1.0.0)
                                                  cl_khr_local_int32_base_atomics                                  0x400000 (1.0.0)
                                                  cl_khr_local_int32_extended_atomics                              0x400000 (1.0.0)
                                                  cl_khr_integer_dot_product                                       0x800000 (2.0.0)
                                                  cl_khr_spirv_no_integer_wrap_decoration                          0x400000 (1.0.0)
                                                  cl_khr_spirv_queries                                             0x400000 (1.0.0)
                                                  cl_khr_suggested_local_work_size                                 0x400000 (1.0.0)
                                                  cl_ext_immutable_memory_objects                                  0x400000 (1.0.0)
                                                  cl_khr_spirv_linkonce_odr                                        0x400000 (1.0.0)
                                                  cl_khr_fp16                                                      0x400000 (1.0.0)
                                                  cles_khr_int64                                                   0x400000 (1.0.0)
                                                  cl_khr_kernel_clock                                              0x400000 (1.0.0)
                                                  cl_khr_image2d_from_buffer                                       0x400000 (1.0.0)
                                                  cl_khr_3d_image_writes                                           0x400000 (1.0.0)
                                                  cl_khr_depth_images                                              0x400000 (1.0.0)
                                                  cl_ext_image_unorm_int_2_101010                                  0x400000 (1.0.0)
                                                  cl_khr_priority_hints                                            0x400000 (1.0.0)
                                                  cl_khr_device_uuid                                               0x400000 (1.0.0)

NULL platform behavior
  clGetPlatformInfo(NULL, CL_PLATFORM_NAME, ...)  rusticl
  clGetDeviceIDs(NULL, CL_DEVICE_TYPE_ALL, ...)   Success [MESA]
  clCreateContext(NULL, ...) [default]            Success [MESA]
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_DEFAULT)  Success (1)
    Platform Name                                 rusticl
    Device Name                                   FD690
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CPU)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_GPU)  Success (1)
    Platform Name                                 rusticl
    Device Name                                   FD690
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ACCELERATOR)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CUSTOM)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ALL)  Success (1)
    Platform Name                                 rusticl
    Device Name                                   FD690

ICD loader properties
  ICD loader Name                                 OpenCL ICD Loader
  ICD loader Vendor                               OCL Icd free software
  ICD loader Version                              2.3.4
  ICD loader Profile                              OpenCL 3.0

```

## OpenCL 信息

### OpenCL 平台信息

```text
Platform Name        rusticl
Platform Vendor      Mesa/X.org
Platform Version     OpenCL 3.0
Platform Profile     FULL_PROFILE
```

说明当前系统已启用 Mesa RustiCL OpenCL 平台，并支持 OpenCL 3.0 运行时。

### GPU 设备信息

```text
Device Name          FD690
Device Vendor        Qualcomm
Device Type          GPU
Device Available     Yes
Driver Version       26.0.3-1ubuntu1
```

### OpenCL C 支持情况

```text
Device OpenCL C Version    OpenCL C 1.2
```

说明当前系统支持 OpenCL C 1.2。

### ICD Loader 信息

```text
ICD loader Name      OpenCL ICD Loader
ICD loader Vendor    OCL Icd free software
ICD loader Version   2.3.4
ICD loader Profile   OpenCL 3.0
```
