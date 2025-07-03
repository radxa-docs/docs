---
sidebar_position: 2
---

# ROS2 环境搭建

主要介绍搭建 ROS2 Humble 版本的环境。

:::tip

- 建议以下操作基于 VNC 远程桌面或者连接显示器进行操作。
- ROS2 环境是搭建在 Docker 容器中的，建议先安装和学习 Docker 的使用。
- Ubuntu 是 ROS2 官方首选和主要支持的发行版，我们会基于 Docker 的 Ubuntu 镜像来搭建 ROS2 环境。
  :::

## 拉取 Docker 镜像

使用 `docker pull` 命令拉取 Ubuntu22.04 的 Docker 镜像。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
docker pull ubuntu:22.04
```
</NewCodeBlock>

## 编写 Docker 脚本

使用脚本启动 Ubuntu22.04 的 Docker 容器。

您需要编写一个启动脚本 `ros_humble.sh`:

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
vi ros_humble.sh
```
</NewCodeBlock>

添加以下内容到脚本内：

<NewCodeBlock tip="ros_humble.sh" type="device">
```
#!/bin/bash
xhost +

docker run -it \
--net=host \
--env="DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
-v /tmp/.X11-unix:/tmp/.X11-unix \
ubuntu:22.04 /bin/bash

```
</NewCodeBlock>

参数说明：
- `xhost +`: 允许 Docker 容器访问 X11 服务器
- `-it`: 以交互模式运行容器
- `--net=host`: 使用主机的网络栈
- `--env="DISPLAY"`: 设置环境变量，用于显示 X11 图形界面
- `--env="QT_X11_NO_MITSHM=1"`: 设置环境变量，用于 Qt 应用程序的显示
- `-v /tmp/.X11-unix:/tmp/.X11-unix`: 挂载 X11 Unix 域套接字，用于显示 X11 图形界面
- `ubuntu:22.04`: 使用 Ubuntu 22.04 镜像
- `/bin/bash`: 在容器内启动 Bash shell

## 启动 Docker 容器

使用 `bash` 命令启动脚本。

<NewCodeBlock tip="radxa@docker$" type="device">
```

bash ros_humble.sh

```
</NewCodeBlock>

## 安装 Humble

### 编码环境检查

确保安装 Humble 的环境支持 UTF-8 编码。

<NewCodeBlock tip="radxa@docker$" type="device">
```

locale

```
</NewCodeBlock>

若系统编码格式是 UTF-8，你可以在终端看到类似以下信息输出：

```

LANG=en_US.UTF-8
LANGUAGE=
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=

```

若终端输出的信息不是 UTF-8 编码，你可以在终端输入以下命令来安装和修改编码环境：

<NewCodeBlock tip="radxa@docker$" type="device">
```

apt update && apt install locales
locale-gen en_US en_US.UTF-8
echo "export LANG=en_US.UTF-8" >> ~/.bashrc
source ~/.bashrc

```
</NewCodeBlock>

### 设置软件源和密钥

确保系统处于最新的环境，然后启用Ubuntu Universe存储库和添加 ROS2 密钥。

<NewCodeBlock tip="radxa@docker$" type="device">
```

apt-cache policy | grep universe
apt install software-properties-common curl -y
add-apt-repository universe
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

```
</NewCodeBlock>

若出现错误提示：`curl: (7) Failed to connect to raw.githubusercontent.com port 443 after 43 ms: Connection refused`
解决办法：访问 `https://www.ipaddress.com/搜索raw.githubusercontent.com` 域名，并将搜索得到的IP地址填写进/etc/hosts文件。

<NewCodeBlock tip="radxa@docker$" type="device">
```

vi /etc/hosts

```
</NewCodeBlock>
添加以下内容：

```

185.199.110.133 raw.githubusercontent.com

```
然后重新运行添加 ROS2 密钥的命令。
<NewCodeBlock tip="radxa@docker$" type="device">
```

curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

```
</NewCodeBlock>

将存储库添加到源列表中：

<NewCodeBlock tip="radxa@docker$" type="device">
```

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

```
</NewCodeBlock>

### 安装 Humble

使用以下命令安装 Humble 完整桌面版。

<NewCodeBlock tip="radxa@docker$" type="device">
```

apt update && apt upgrade
apt install ros-humble-desktop-full -y

```
</NewCodeBlock>

### 安装 ROS2 开发工具

使用以下命令安装 ROS2 开发工具。

<NewCodeBlock tip="radxa@docker$" type="device">
```

apt install ros-dev-tools -y

```
</NewCodeBlock>

## 设置环境变量

使用以下命令设置环境变量：

<NewCodeBlock tip="radxa@docker$" type="device">
```

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc

```
</NewCodeBlock>

## 保存 Docker 镜像

目前我们的修改都是基于 Ubuntu22.04 的 Docker 容器，我们需要把这个修改的容器保存为镜像，以便下次直接使用。

注意:若没有保存为镜像，下次启动容器时需要重新安装 ROS2 环境。

### 查看正在运行的容器

在 Cubie A7A 的另一个没有进入 Docker 容器的终端输入以下命令查看正在运行的容器。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```

docker ps

```
</NewCodeBlock>

### 提交容器为镜像

在 Cubie A7A 的另一个没有进入 Docker 容器的终端输入以下命令提交容器为镜像。

:::tip
需要根据 `docker ps` 命令输出的容器 ID进行命令的修改。
:::

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```

docker commit [CONTAINER ID] [NEW NAME]

# 示例

docker commit 937a98f8ad9e ros_humble:1.0

```
</NewCodeBlock>

等待提交完成，完成后会输出类似以下信息输出：

```

sha256:32288d439ffab73505d0754d4c43d8aad83210441b41553118e81ff6ab2887af

```

### 修改启动脚本

将启动脚本 `ros_humble.sh` 内的启动镜像修改为刚才保存的镜像名称：

<NewCodeBlock tip="ros_humble.sh" type="device">
```

#!/bin/bash

xhost +

docker run -it \
--net=host \
--env="DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
-v /tmp/.X11-unix:/tmp/.X11-unix \
ros_humble:1.0 /bin/bash

```
</NewCodeBlock>
```
