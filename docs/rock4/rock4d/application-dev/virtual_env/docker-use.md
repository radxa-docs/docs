---
sidebar_position: 2
---

# Docker 使用

主要通过 Docker 常用命令来演示 Docker 的使用方法，以下命令均是在 Radxa ROCK 4D 的终端命令行运行。

:::tip
镜像（Image）：镜像包含了应用程序及其运行环境（包括依赖、库、配置文件等）的只读模板。

容器（Container）：容器是镜像的运行实例，在镜像的基础上创建的一个可执行环境，包含应用程序和所有依赖，但与主机系统隔离。
:::

## 查看帮助

可以通过 Docker 内置的帮助命令查看 Docker 所有命令的使用方法。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker --help
```
</NewCodeBlock>

终端会输出类似如下信息：

```
Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
--config string Location of client config files (default "/home/radxa/.docker")
-c, --context string Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context
set with "docker context use")
-D, --debug Enable debug mode
-H, --host list Daemon socket(s) to connect to
-l, --log-level string Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
--tls Use TLS; implied by --tlsverify
--tlscacert string Trust certs signed only by this CA (default "/home/radxa/.docker/ca.pem")
--tlscert string Path to TLS certificate file (default "/home/radxa/.docker/cert.pem")
--tlskey string Path to TLS key file (default "/home/radxa/.docker/key.pem")
--tlsverify Use TLS and verify the remote
-v, --version Print version information and quit

Management Commands:
builder Manage builds
completion Generate the autocompletion script for the specified shell
config Manage Docker configs
container Manage containers
context Manage contexts
image Manage images
manifest Manage Docker image manifests and manifest lists
network Manage networks
node Manage Swarm nodes
plugin Manage plugins
secret Manage Docker secrets
service Manage services
stack Manage Docker stacks
swarm Manage Swarm
system Manage Docker
trust Manage trust on Docker images
volume Manage volumes

Commands:
attach Attach local standard input, output, and error streams to a running container
build Build an image from a Dockerfile
commit Create a new image from a container's changes
cp Copy files/folders between a container and the local filesystem
create Create a new container
diff Inspect changes to files or directories on a container's filesystem
events Get real time events from the server
exec Run a command in a running container
export Export a container's filesystem as a tar archive
history Show the history of an image
images List images
import Import the contents from a tarball to create a filesystem image
info Display system-wide information
inspect Return low-level information on Docker objects
kill Kill one or more running containers
load Load an image from a tar archive or STDIN
login Log in to a Docker registry
logout Log out from a Docker registry
logs Fetch the logs of a container
pause Pause all processes within one or more containers
port List port mappings or a specific mapping for the container
ps List containers
pull Pull an image or a repository from a registry
push Push an image or a repository to a registry
rename Rename a container
restart Restart one or more containers
rm Remove one or more containers
rmi Remove one or more images
run Run a command in a new container
save Save one or more images to a tar archive (streamed to STDOUT by default)
search Search the Docker Hub for images
start Start one or more stopped containers
stats Display a live stream of container(s) resource usage statistics
stop Stop one or more running containers
tag Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
top Display the running processes of a container
unpause Unpause all processes within one or more containers
update Update configuration of one or more containers
version Show the Docker version information
wait Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.

To get more help with docker, check out our guides at https://docs.docker.com/go/guides/
```

## 查看 Docker 系统信息

使用 `docker info` 命令可以查看 Docker 系统信息，包括 Docker 版本、系统配置、存储驱动、网络配置等。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker info
```
</NewCodeBlock>

终端会输出类似如下的信息：

```
Client:
Context: default
Debug Mode: false

Server:
Containers: 0
Running: 0
Paused: 0
Stopped: 0
Images: 1
Server Version: 20.10.24+dfsg1
Storage Driver: overlay2
Backing Filesystem: extfs
Supports d_type: true
Native Overlay Diff: true
userxattr: false
Logging Driver: json-file
Cgroup Driver: systemd
Cgroup Version: 2
Plugins:
Volume: local
Network: bridge host ipvlan macvlan null overlay
Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
Swarm: inactive
Runtimes: io.containerd.runc.v2 io.containerd.runtime.v1.linux runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 1.6.20~ds1-1+deb12u1
runc version: 1.1.5+ds1-1+deb12u1
init version:
Security Options:
seccomp
Profile: default
cgroupns
Kernel Version: 6.1.84-7-rk2410-nocsf
Operating System: Debian GNU/Linux 12 (bookworm)
OSType: linux
Architecture: aarch64
CPUs: 8
Total Memory: 3.829GiB
Name: rock-4d-spi
ID: NOPY:K5AM:5IDH:CS7I:VUGO:2U4I:YCZZ:MHNC:SV3D:4GEE:X55W:YQZU
Docker Root Dir: /var/lib/docker
Debug Mode: false
Registry: https://index.docker.io/v1/
Labels:
Experimental: false
Insecure Registries:
127.0.0.0/8
Live Restore Enabled: false
```

## 查看版本信息

只看 Docker 版本信息，可以使用 `docker --version` 命令。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker --version
```
</NewCodeBlock>

终端会输出类似如下的信息：

```
Docker version 20.10.24+dfsg1, build 297e128
```

## 拉取镜像

使用 `docker pull` 命令可以从云端（默认是 Docker Hub）拉取镜像。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker pull <image_name>
# 示例：拉取 hello-world 最新镜像
docker pull hello-world
```
</NewCodeBlock>
拉取镜像成功后，终端会输出类似如下的信息：

```
Using default tag: latest
latest: Pulling from library/hello-world
c9c5fd25a1bd: Pull complete
Digest: sha256:0b6a027b5cf322f09f6706c754e086a232ec1ddba835c8a15c6cb74ef0d43c29
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest
```

## 运行容器

若本地没有运行的镜像，Docker 会自动从云端拉取镜像，然后运行容器。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker run <image_name>
# 示例：运行 hello-world 最新镜像
docker run hello-world
```
</NewCodeBlock>

运行容器成功后，终端会输出类似如下的信息：

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:

1.  The Docker client contacted the Docker daemon.
2.  The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
3.  The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
4.  The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/
```

### 以交互模式运行容器

在交互模式下，容器会保持运行状态，你可以直接在终端命令行操作容器，直到你输入 `exit` 退出容器。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker run -it <image_name> /bin/bash
# 示例：以交互模式运行 ubuntu:24.04 镜像
docker run -it ubuntu:24.04 /bin/bash
```
</NewCodeBlock>

运行容器成功后，终端会输出类似如下的信息：其中 `8a18a7ee0838` 为容器 ID。

```
root@8a18a7ee0838:/#
```

容器内输入 `exit` 可以退出容器。

### 多终端进入同一个容器

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker exec -it <container_id> /bin/bash
# 示例：根据正在运行的容器 ID 进入容器
docker exec -it 8a18a7ee0838 /bin/bash
```
</NewCodeBlock>

## 查看镜像

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker images
```
</NewCodeBlock>

终端会输出类似如下的信息：

```
REPOSITORY TAG IMAGE ID CREATED SIZE
ubuntu 24.04 9d45648b4030 11 days ago 101MB
hello-world latest f1f77a0f96b7 4 months ago 5.2kB
```

## 查看容器

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker ps -a
```
</NewCodeBlock>

终端会输出类似如下的信息：我们可以通过 `status` 来判断容器是否正在运行。

```
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
8a18a7ee0838 ubuntu:24.04 "/bin/bash" 2 minutes ago Up About a minute frosty_beaver
d1799e93de85 hello-world "/hello" 2 minutes ago Exited (0) 2 minutes ago epic_gagarin
```

## 保存容器

若你对正在运行的容器做了修改，可以使用 `docker commit` 命令保存容器为镜像，以后可以基于该镜像快速创建容器。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker commit <container_id> <new_image_name>
# 示例：将 id 为 8a18a7ee0838 的容器保存为 ubuntu_24_v1 镜像
docker commit 8a18a7ee0838 ubuntu_24_v1
```
</NewCodeBlock>

保存成功后，终端会输出类似如下的信息：

```
sha256:be234207cfb6841bbef6bb4639ac2cc035a4bbebdcf5e74a08a8db327a57d569
```

## 停止容器

若你终端正处于正在运行的容器内，可以输入 `exit` 退出容器。

若你不在正在运行的容器内，可以使用 `docker stop` 命令停止容器。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker stop <container_id>
# 示例：停止 id 为 8a18a7ee0838 的容器
docker stop 8a18a7ee0838
```
</NewCodeBlock>

停止容器成功后，终端会输出类似如下的信息:

```
8a18a7ee0838
```

## 清理容器

该命令只会清理停止的容器，不会影响正在运行的容器。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker container prune
```
</NewCodeBlock>

终端会输出类似如下的信息：输入命令后需要输入 `y` 确认执行。

```
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:yun3
cbb96ce305f30647e03012f979ca604ec31b93f4b1cead64b48d2db85d139171

Total reclaimed space: 5B
```

## 删除镜像

使用 `docker rmi` 命令可以删除镜像。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker rmi <image_name>
# 示例：删除 ubuntu:24.04 镜像
docker rmi ubuntu:24.04
```
</NewCodeBlock>

删除镜像成功后，终端会输出类似如下的信息:

```
Untagged: ubuntu:24.04
Untagged: ubuntu@sha256:b59d21599a2b151e23eea5f6602f4af4d7d31c4e236d22bf0b62b86d2e386b8f
Deleted: sha256:9d45648b40307b523984e200d90f737b39a705c335fbf484113d4ad0660d97a6
Deleted: sha256:c2f2f00da4ebbfa69fd966cc712f4d400283f6ade9fcd8ebb4801dfae55f86f1
```
