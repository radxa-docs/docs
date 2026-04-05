---
sidebar_position: 105
---

# 常见问题

## 系统问题

### 系统无法启动

我们提供标准系统镜像和 Phoenix 系统镜像。

- 标准系统镜像：包含分区表，可以直接安装系统到系统启动介质上。

- Phoenix 系统镜像：不包含分区表，需要借助 Phoenix 工具烧录系统镜像。

先确认安装的系统镜像是否正确，若系统镜像正确，可以通过串口调试获取系统启动日志，根据日志信息进行排查。

## 远程问题

### SSH 无法远程

出厂系统镜像默认开启 SSH 服务，一般情况下，您只需要确保 Cubie A7Z 和 PC 端处于同一局域网，即可通过 SSH 远程。

排查方法：

1. 检查 Cubie A7Z 是否连接到网络以及 IP 地址是否正确：使用 `ip a` 命令可以查看网络连接的详细信息。
2. 检查 Cubie A7Z 和 PC 端是否处于同一局域网：使用 `ping` 彼此 IP 地址测试是否可以 ping 通。
3. 检查 SSH 服务是否启动：使用 `sudo systemctl status ssh` 命令查看 SSH 服务状态。

### VNC 无法远程

VNC 远程需要您手动配置 VNC 服务器；若按照教程操作，每次重启或者关机后，VNC 服务器都会自动关闭。

排查方法：

1. 按照教程完成 VNC 远程的配置。
2. 确保 SSH 远程一切正常。
3. 检查是否启动 VNC 服务器：使用 `vncserver -list` 命令查看 VNC 服务器是否启动。
4. 使用 `ip:5901` 进行 VNC 远程，其中 `ip` 是 Cubie A7Z 的 IP 地址。

## 串口问题

### 打开串口失败

若打开串口出现 `Error: Permission denied, cannot open /dev/ttyUSB0` 错误提示！

您需要按照以下步骤排查问题：

1. 检查串口设备是否正确连接

2. 检查串口设备权限

以 Linux 系统为例，若串口设备权限不足，您需要在终端命令行运行以下命令，让所有用户都有权限访问串口设备。

<NewCodeBlock tip="Linux@host$" type="host">

```bash
sudo chmod 777 /dev/ttyUSB0
```

</NewCodeBlock>

3. 检查串口设备是否被其他程序占用

## 网络带宽测试

### 端口占用

若系统提示 `iperf3: error - unable to start listener for connections: Address already in use`，说明 iperf3 进程占用了 5201 端口。

解决办法：

1. 查看 iperf3 的进程

<NewCodeBlock tip="Linux@host$" type="device">

```bash
ps -ef | grep iperf3
```

</NewCodeBlock>

2. 终止 iperf3 进程：将 `<PID>` 替换为 iperf3 进程的 PID。

<NewCodeBlock tip="Linux@host$" type="device">

```bash
sudo kill <PID>
```

</NewCodeBlock>

## KDE Discover 无法使用

KDE Discover 默认使用 OpenGL 渲染，而当前 GPU 驱动不支持 OpenGL 渲染，导致 KDE Discover 无法使用，解决方案：直接使用 apt 命令行工具安装软件包。

<NewCodeBlock tip="Linux@host$" type="device">

```bash
sudo apt search <package_name>
sudo apt install <package_name>
```

</NewCodeBlock>

apt 可以模糊搜索软件包，在使用apt install命令时，可以使用 tab 键自动补全软件包名称。

<NewCodeBlock tip="Linux@host$" type="device">

```bash
sudo apt search vlc
sudo apt install vlc
```

</NewCodeBlock>

## 系统安装与软件更新问题

### 安装软件或更新 initramfs 时系统卡死

在 Cubie A7Z 上安装软件或更新 initramfs 时，如果系统卡死并出现以下错误：
- `FDT_ERR_BADMAGIC` 设备树错误
- SD 卡时序错误（`RTO` - Response Timeout）
- 系统挂起或响应缓慢

#### 排查方法：

1. **检查 SD 卡质量与兼容性**：
   - 使用知名品牌的正品 SD 卡（如 Samsung EVO、SanDisk Extreme、Kingston Canvas）
   - 推荐使用 U3/A2 速度等级的 SD 卡以获得更好的持续性能
   - 避免使用标称速度过高（300MB/s+）的 SD 卡，可能与 Allwinner 平台存在兼容性问题
   - 确保 SD 卡不是假冒产品（假冒卡通常报告错误的规格）

2. **检查电源供应**：
   - 使用专用的 5V/4A 电源适配器
   - 在更新 initramfs 或安装软件时断开所有外设
   - 确保电源线连接牢固，无接触不良

3. **软件解决方法**：
   - 手动更新 initramfs 并降低 I/O 优先级：
   <NewCodeBlock tip="Linux@host$" type="device">
   
   ```bash
   sudo ionice -c 3 update-initramfs -u
   ```
   
   </NewCodeBlock>
   - 如果系统在安装软件包时挂起，尝试逐个安装软件包
   - 考虑使用不同的系统镜像版本（如果有可用的更新版本）

4. **SD 卡性能优化**：
   - 如果使用极高速 SD 卡，可以尝试在 U-Boot 中限制 SD 卡速度
   - 检查 SD 卡是否有坏块或文件系统错误

5. **系统日志检查**：
   - 通过串口查看完整的系统启动日志
   - 检查 `dmesg` 输出中是否有 SD/MMC 控制器错误
   - 查看 `/var/log/syslog` 中 initramfs 更新过程的详细错误信息

如果以上方法都无法解决问题，可能是内核或驱动程序的问题，建议：
- 更新到最新的系统镜像
- 向 Radxa 技术支持报告具体错误日志
- 考虑使用 UFS 存储作为替代方案
