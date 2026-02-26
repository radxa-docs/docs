---
sidebar_position: 1
---

# Docker Installation

The Radxa Debian system already has Docker-related configurations enabled in the kernel. You only need to install the Docker application to start using it.

:::tip
Currently, users in certain regions may not be able to access Docker Hub. You may need to configure a Docker mirror or use a proxy to access it.
:::

## Install Docker

Run the following commands in the terminal to install Docker:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo apt update
sudo apt install docker.io
```
</NewCodeBlock>

## Configure iptables

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
```
</NewCodeBlock>

After rebooting the system, the Docker configuration will take effect.

## Verify Installation

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
docker --version
```
</NewCodeBlock>

If the installation was successful, you should see output similar to:

```text
Docker version 20.10.24+dfsg1, build 297e128
```

## Add User to Docker Group

To run Docker commands without using `sudo`, add your current user to the Docker group by running:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo usermod -aG docker $USER
```
</NewCodeBlock>

After rebooting the system, the Docker configuration will take effect.
