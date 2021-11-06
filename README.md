# ympd-docker - a Docker image for ympd

## Reference

First and foremost, the reference to the awesome project:

[Music Player Daemon](https://www.musicpd.org/)
[ympd](https://ympd.org/)

## Links
Source: [GitHub](https://github.com/giof71/ympd-docker)<br />
Images: [DockerHub](https://hub.docker.com/r/giof71/ympd)

## Why

I prepared this Dockerfile Because I wanted to be able to install ympd easily on any machine (provided the architecture is amd64 or arm). Also I wanted to be able to configure and govern the parameters easily. Configuring the container is easy through a webapp like Portainer.

## Prerequisites

You need to have Docker up and running on a Linux machine, and the current user must be allowed to run containers (this usually means that the current user belongs to the "docker" group).

You can verify whether your user belongs to the "docker" group with the following command:

`getent group | grep docker`

This command will output one line if the current user does belong to the "docker" group, otherwise there will be no output.

The Dockerfile and the included scripts have been tested on the following distros:

- Manjaro Linux with Gnome (amd64)
- Asus Tinkerboard
- Raspberry Pi 3 (but I have no reason to doubt it will also work on a Raspberry Pi 4/400)

As I test the Dockerfile on more platforms, I will update this list.

## Get the image

Here is the [repository](https://hub.docker.com/repository/docker/giof71/ympd) on DockerHub.

Getting the image from DockerHub is as simple as typing:

`docker pull giof71/ympd:stable`

You may want to pull the "stable" image as opposed to the "latest".

## Usage

You can start ympd by simply typing:

`docker run -d --rm -p 8080:8080 giof71/ympd:stable`

We need to give access to port 8080 so we can access the ympd web interface.

The following table reports all the currently supported environment variables.

VARIABLE | DEFAULT | NOTES
---|---|---
MPD_HOSTNAME|localhost|The hostname or ip address of the running Music Player Daemon Instance
MPD_PORT|6600|The port used by the running Music Player Daemon Instance
STARTUP_DELAY_SEC|0|Delay before starting the application.

## Build

You can build (or rebuild) the image by opening a terminal from the root of the repository and issuing the following command:

`docker build . -t giof71/ympd`

It will take very little time even on a Raspberry Pi. When it's finished, you can run the container following the previous instructions.
Just be careful to use the tag you have built.

## Issues

I am currently using ubuntu:bionic as a base image due to a linker issue on the arm/v7 build.
I will try to upgrade to a more current base image as soon as possibile.

