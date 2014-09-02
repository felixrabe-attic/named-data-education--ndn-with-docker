# Using NFD with Docker

(This document is a work in progress.)

Docker is a command-line frontend to operating system-level virtualization solutions such as Linux containers (LXC). This allows running application processes in isolation, just like a VM, but without the overhead of a traditional VM – for example, there is no (operating system) boot process involved. For more information, see https://www.docker.com/ and http://en.wikipedia.org/wiki/Docker_%28software%29.


## Docker is currently not usable for NFD

The Docker-based installation method described below currently fails with the following error:

    felix-mba:docker-images fr$ docker run --rm -ti nfd
    root@cb92f60fb4c0:/# nfd-start
    root@cb92f60fb4c0:/# nfd-status
    ERROR: error while connecting to the forwarder (No such file or directory)

Please report any fixes you may have for this process on https://github.com/named-data-education/ndn-with-docker/issues/1.


## Step 1: Install Docker

Go to https://docs.docker.com/installation/ for installation instructions. Docker runs natively on (recent) Linux kernels, and via a VM on Windows and OS X.


## Step 2: Save the Dockerfile

Create a new directory and put the following in a file called `Dockerfile`:

    # This is based on the instructions from:
    # http://named-data.net/doc/NFD/0.2.0/INSTALL.html#install-nfd-using-the-ndn-ppa-repository-on-ubuntu-linux

    FROM ubuntu:14.04

    RUN apt-get update
    RUN apt-get install -y software-properties-common

    RUN add-apt-repository -y ppa:named-data/ppa
    RUN apt-get update
    RUN apt-get install -y nfd

The syntax is documented at http://docs.docker.com/reference/builder/.


## Step 3: Build the image

Open a terminal and change to the new directory created above, and execute the following command to build an image called `named_data/nfd`:

    docker build -t named_data/nfd .

This is similar to a compilation step to transform source code (the Dockerfile) into executable code (the Docker image). If you are new to Docker, the first time you run that command, it will pull the Ubuntu base image, which will take some time. Later rebuilds happen fast, thanks to Docker's snapshotting.


## Step 4: Run a shell from the image

To start a process (create a Docker container), you use the `docker run` command. As you might want to explore the Docker container at first, this shows you the usual way to start a Bash process that leaves no traces: (`--rm` removes the container afterwards)

    docker run --rm -ti named_data/nfd /bin/bash

You find the full documentation of the `docker run` command at https://docs.docker.com/reference/run/, and the full command-line reference at https://docs.docker.com/reference/commandline/cli/.


## Next steps

There is an interactive Docker tutorial at https://www.docker.com/tryit/, and more documentation at https://docs.docker.com/. `docker help [command]` is also helpful.

Docker works best if a container runs only one process at a time, such as NFD. Bash is usually only used for exploration. To trim down the image, consider using Debian (90 MB) or Busybox (2.5 MB) as a base image instead of Ubuntu (225 MB). (There are currently no instructions for these base images, as these distributions are currently not supported / tested by the Named Data project.)

(TODO: Push a trusted build to https://registry.hub.docker.com/ so others can directly pull the pre-built image.)


## Summary of the Docker command line

This section lists the `docker` commands and arguments that are most commonly used.


### Commands

    build            Build an image from a Dockerfile (`docker build -t imageName directory`)
    run              Run a command in a new container (`docker run --rm -ti ubuntu:14.04`)


### `docker run` arguments: general

Arguments marked with `*` can also be defined in the `Dockerfile`.

    -d                            Run in the background (and use `docker ps/logs/stop/kill`)
    -i                            Keep STDIN open (together with `-t`, for Bash)
    --name containerName          Give a container a name (for `--link` and `--volume-from`)
    --rm                          Remove the container after it exits
    -t                            Allocate a pseudo-TTY (together with `-i`, for Bash)


### `docker run` arguments: networking

    --expose port               * Expose a port for use with `--link`
    --link otherContainer:alias   Link to exposed ports of another container (sets env. vars)
    -p hostPort:containerPort     Publish a TCP port to the host


### `docker run` arguments: filesystem

    -v /containerPath           * Make a mount point available without content (for `--volumes-from`)
    -v /hostPath:/containerPath   Mount a host path into a volume (mount point, also for `--volumes-from`)
    --volumes-from name           Mount volumes from another container
