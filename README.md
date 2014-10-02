# Using NFD with Docker

## Step 1: Install Docker

Follow the [official installation instructions](http://docs.docker.com/installation/). Docker runs natively on (recent) Linux kernels, and via a VM on Windows and Mac OS X.

## Step 2: Build the image

Open a terminal and change to the new directory created above. Now execute the following command to build an image called `named_data/nfd`:

    docker build -t named_data/ubuntu-14.04 ubuntu-14.04

This is similar to a compilation step to transform source code (the Dockerfile) into executable code (the Docker image). The first time you run that command, it will pull the Ubuntu base image; this will take some time. Later rebuilds happen fast, thanks to Docker's snapshotting.

## Step 3: Run the image

To start a process (create a Docker container), you use the `docker run` command.

    docker run named_data/ubuntu-14.04

# About Docker

[Docker](https://www.docker.com/) is a command-line frontend to operating system-level virtualization solutions such as Linux containers (LXC). This allows running application processes in isolation, just like a VM, but without the overhead of a traditional VM – for example, there is no (operating system) boot process involved.

The [interactive Docker tutorial](https://www.docker.com/tryit/) is a great way to get started with Docker.

You find the full documentation of the [`docker run` command](https://docs.docker.com/reference/run/) along with the full [command line reference](https://docs.docker.com/reference/commandline/cli/) on the [Docker documentation site](https://docs.docker.com/).

Docker works best if a container runs only one process at a time, such as NFD. Bash is usually only used for exploration.

# TODO

* Push a trusted build to the [Docker registry](https://registry.hub.docker.com/) so others can directly pull the pre-built image.
