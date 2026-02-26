---
sidebar_position: 2
---

# Docker Usage

This guide demonstrates common Docker commands and their usage. All the following commands are executed in the terminal of Radxa ROCK 4D.

:::tip
**Image**: A read-only template containing an application and its runtime environment (including dependencies, libraries, configuration files, etc.).

**Container**: A runnable instance of an image, providing an executable environment that includes the application and all its dependencies, isolated from the host system.
:::

## View Help

You can view the usage of all Docker commands using the built-in help command.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker --help
```
</NewCodeBlock>

The terminal will display output similar to:

```text
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

## View Docker System Information

Use the `docker info` command to view Docker system information, including version, system configuration, storage driver, network configuration, and more.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker info
```
</NewCodeBlock>

The terminal will display output similar to:

```text
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
Labels:
Experimental: false
Insecure Registries:
127.0.0.0/8
Live Restore Enabled: false
```

## Check Version

To view only the Docker version information, use the `docker --version` command.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker --version
```
</NewCodeBlock>

The terminal will display output similar to:

```text
Docker version 20.10.24+dfsg1, build 297e128
```

## Pull an Image

Use the `docker pull` command to download an image from a registry (Docker Hub by default).

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker pull <image_name>
# Example: Pull the latest hello-world image
docker pull hello-world
```
</NewCodeBlock>
After successfully pulling the image, the terminal will display output similar to:

```text
Using default tag: latest
latest: Pulling from library/hello-world
c9c5fd25a1bd: Pull complete
Digest: sha256:0b6a027b5cf322f09f6706c754e086a232ec1ddba835c8a15c6cb74ef0d43c29
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest
```

## Run a Container

If the image is not available locally, Docker will automatically pull it from the cloud and then run the container.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker run <image_name>
# Example: Run the latest hello-world image
docker run hello-world
```
</NewCodeBlock>

After the container runs successfully, the terminal will display output similar to:

```text
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

### Run a Container in Interactive Mode

In interactive mode, the container will keep running, allowing you to directly operate within the container from the terminal command line until you type `exit` to leave the container.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker run -it <image_name> /bin/bash
# Example: Run ubuntu:24.04 image in interactive mode
docker run -it ubuntu:24.04 /bin/bash
```
</NewCodeBlock>

After the container runs successfully, the terminal will display output similar to: where `8a18a7ee0838` is the container ID.

```text
root@8a18a7ee0838:/#
```

Type `exit` inside the container to exit.

### Access the Same Container from Multiple Terminals

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker exec -it <container_id> /bin/bash
# Example: Access a running container by its ID
docker exec -it 8a18a7ee0838 /bin/bash
```
</NewCodeBlock>

## List Images

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker images
```
</NewCodeBlock>

The terminal will display output similar to:

```text
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
ubuntu        24.04     9d45648b4030   11 days ago   101MB
hello-world   latest    f1f77a0f96b7   4 months ago  5.2kB
```

## List Containers

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker ps -a
```
</NewCodeBlock>

The terminal will display output similar to: You can check the `STATUS` column to see if a container is running.

```text
CONTAINER ID   IMAGE           COMMAND       CREATED         STATUS                     PORTS     NAMES
8a18a7ee0838   ubuntu:24.04   "/bin/bash"   2 minutes ago   Up About a minute                   frosty_beaver
d1799e93de85   hello-world    "/hello"      2 minutes ago   Exited (0) 2 minutes ago             epic_gagarin
```

## Save a Container

If you've made changes to a running container, you can use the `docker commit` command to save the container as a new image, which can be used to quickly create new containers later.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker commit <container_id> <new_image_name>
# Example: Save container with ID 8a18a7ee0838 as ubuntu_24_v1 image
docker commit 8a18a7ee0838 ubuntu_24_v1
```
</NewCodeBlock>

After successfully saving, the terminal will display output similar to:

```text
sha256:be234207cfb6841bbef6bb4639ac2cc035a4bbebdcf5e74a08a8db327a57d569
```

## Stop a Container

If your terminal is inside a running container, you can type `exit` to leave the container.

If you're not inside a running container, you can use the `docker stop` command to stop it.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker stop <container_id>
# Example: Stop container with ID 8a18a7ee0838
docker stop 8a18a7ee0838
```
</NewCodeBlock>

After successfully stopping the container, the terminal will display output similar to:

```text
8a18a7ee0838
```

## Clean Up Containers

This command will only remove stopped containers and won't affect running ones.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker container prune
```
</NewCodeBlock>

The terminal will display output similar to: You'll need to confirm by typing `y` after entering the command.

```text
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:yun3
cbb96ce305f30647e03012f979ca604ec31b93f4b1cead64b48d2db85d139171

Total reclaimed space: 5B
```

## Remove an Image

Use the `docker rmi` command to remove an image.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker rmi <image_name>
# Example: Remove the ubuntu:24.04 image
docker rmi ubuntu:24.04
```
</NewCodeBlock>

After successfully removing the image, the terminal will display output similar to:

```text
Untagged: ubuntu:24.04
Untagged: ubuntu@sha256:b59d21599a2b151e23eea5f6602f4af4d7d31c4e236d22bf0b62b86d2e386b8f
Deleted: sha256:9d45648b40307b523984e200d90f737b39a705c335fbf484113d4ad0660d97a6
Deleted: sha256:c2f2f00da4ebbfa69fd966cc712f4d400283f6ade9fcd8ebb4801dfae55f86f1
```
