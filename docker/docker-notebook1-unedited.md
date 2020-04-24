Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.
//https://www.youtube.com/watch?v=TDLKQWsrSykContainer is a software package that consists of all the dependencies to run an application.
Docker is a tool that is used to automate the deployment of applications in lightweight containers so that the applications can work efficiently in different environments.
Multiple containers run on the same hardware.High productivity as compared to VMs.Maintains isolated applications. Has a very quick and easy configuration process.



What happens when you install something on the container
It remains in the container
The image is not affected
You have to commit the changes and make a new image
docker commit -t MANAS978/tor:v2 #hash



Namespaces
Docker uses a technology called namespaces to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.

These namespaces provide a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace.

Docker Engine uses namespaces such as the following on Linux:

The pid namespace: Process isolation (PID: Process ID).
The net namespace: Managing network interfaces (NET: Networking).
The ipc namespace: Managing access to IPC resources (IPC: InterProcess Communication).
The mnt namespace: Managing filesystem mount points (MNT: Mount).
The uts namespace: Isolating kernel and version identifiers. (UTS: Unix Timesharing System).
Control groups
Docker Engine on Linux also relies on another technology called control groups (cgroups). A cgroup limits an application to a specific set of resources. Control groups allow Docker Engine to share available hardware resources to containers and optionally enforce limits and constraints. For example, you can limit the memory available to a specific container.

Union file systems
Union file systems, or UnionFS, are file systems that operate by creating layers, making them very lightweight and fast. Docker Engine uses UnionFS to provide the building blocks for containers. Docker Engine can use multiple UnionFS variants, including AUFS, btrfs, vfs, and DeviceMapper.

Container format
Docker Engine combines the namespaces, control groups, and UnionFS into a wrapper called a container format. The default container format is libcontainer. In the future, Docker may support other container formats by integrating with technologies such as BSD Jails or Solaris Zones.


CMD and ENTRYPOINT
CMD is the instruction to specify what component is to be run by your image with arguments in the following form: CMD [“executable”, “param1”, “param2”…].

You can override CMD when you’re starting up your container by specifying your command after the image name like this: $ docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...].

You can only specify one CMD in a Dockerfile (OK, physically you can specify more than one, but only the last one will be used).

It is good practice to specify a CMD even if you are developing a generic container, in this case an interactive shell is a good CMD entry. So you do CMD ["python"] or CMD [“php”, “-a”] to give your users something to work with.

So what’s the deal with ENTRYPOINT? When you specify an entry point, your image will work a bit differently. You use ENTRYPOINT as the main executable of your image. In this case whatever you specify in CMD will be added to ENTRYPOINT as parameters.

ONBUILD
This is so nice. You can specify instructions with ONBUILD that will be executed when your image is used as the base image of another Dockerfile. :)

This is useful when you want to create a generic base image to be used in different variations by many Dockerfiles, or in many projects or by many parties.

So you do not need to add the specific stuff immediately, like you don’t need to copy the source code or config files in the base image. How could you even do that, when these things will be available only later?

So what you do instead is to add ONBUILD instructions. So you can do something like this:

ONBUILD COPY . /usr/src/app
ONBUILD RUN /usr/src/app/mybuild.sh
ONBUILD instructions will be executed right after the FROM instruction in the downstram Dockerfile.


 volume is a persistent data stored in /var/lib/docker/volumes/...

You can either declare it in a Dockerfile, which means each time a container is started from the image, the volume is created (empty), even if you don't have any -v option.

You can declare it on runtime docker run -v [host-dir:]container-dir.
combining the two (VOLUME + docker run -v) means that you can mount the content of a host folder into your volume persisted by the container in /var/lib/docker/volumes/...

docker volume create creates a volume without having to define a Dockerfile and build an image and run a container. It is used to quickly allow other containers to mount said volume.

If you had persisted some content in a volume, but since then deleted the container (which by default does not deleted its associated volume, unless you are using docker rm -v), you can re-attach said volume to a new container (declaring the same volume).

See "Docker - How to access a volume not attached to a container?".
With docker volume create, this is easy to reattached a named volume to a container.

docker volume create --name aname
docker run -v aname:/apath --name acontainer
...




VOLUME instruction becomes interesting when you combine it with volumes-from runtime parameter.

Given the following Dockerfile:

FROM busybox
VOLUME /myvolume
Build an image with:

docker build -t my-bb .
And spin up a container with:

docker run --rm -it --name my-first-bb my-bb
The first thing to notice is you will have a folder in this image named myvolume. But it is not particularly interesting since when we exit the container the volume will be removed as well.

Create an empty file in this folder, so run the following in the container:

cd myvolume
touch hello.txt
Now spin up a new container, but share the same volume with my-first-bb:

docker run --rm -it --volumes-from my-first-bb --name my-second-bb my-bb
You will see that my-second-bb contains the file hello.txt in myvolume folder.

Once you exit both containers, your volume will be removed as well.











Docker uses a [copy-on-write](https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/#/the-copy-on-write-strategy) technique and a [union file system](https://docs.docker.com/glossary/#union_file_system) for both images and containers to optimize resources and speed performance. Multiple copies of an entity share the same instance and each one makes only specific changes to its unique layer.

Multiple containers can share access to the same image, and make container-specific changes on a writable layer which is deleted when the container is removed. This speeds up container start times and performance.

Images are essentially layers of filesystems typically predicated on a base image under a writable layer, and built up with layers of differences from the base image. This minimizes the footprint of the image and enables shared development.

For more about copy-on-write in the context of Docker, see [Understand images, containers, and storage drivers](https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/).







In a Dockerfile, an `ENTRYPOINT` is an optional definition for the first part of the command to be run. If you want your Dockerfile to be runnable without specifying additional arguments to the `docker run` command, you must specify either `ENTRYPOINT`, `CMD`, or both.

- If `ENTRYPOINT` is specified, it is set to a single command. Most official Docker images have an `ENTRYPOINT` of `/bin/sh` or `/bin/bash`. Even if you do not specify `ENTRYPOINT`, you may inherit it from the base image that you specify using the `FROM` keyword in your Dockerfile. To override the `ENTRYPOINT` at runtime, you can use `--entrypoint`. The following example overrides the entrypoint to be `/bin/ls` and sets the `CMD` to `-l /tmp`.

  ```
  $ docker run --entrypoint=/bin/ls ubuntu -l /tmp
  ```

- `CMD` is appended to the `ENTRYPOINT`. The `CMD` can be any arbitrary string that is valid in terms of the `ENTRYPOINT`, which allows you to pass multiple commands or flags at once. To override the `CMD` at runtime, just add it after the container name or ID. In the following example, the `CMD` is overridden to be `/bin/ls -l /tmp`.

  ```
  $ docker run ubuntu /bin/ls -l /tmp
  ```

In practice, `ENTRYPOINT` is not often overridden. However, specifying the `ENTRYPOINT` can make your images more flexible and easier to reuse.







Chroot

#!/bin/sh
sudo chroot busy-box /bin/sh

busy-box => path to busy box install

/bin/sh => Command to execute in new root (will run relative to new root)

Securit Risk
No Real Isolation





Using qemu
Quick Emulator
qemu-system-x86_64 -boot d -cdrom random_os.iso -m 2048M -smp 4 -enable-kvm
-enable-kvm => Uses features of new CPUs to speed up.
-smp => The number of cores
-boot => boot from hda/dvd etc etc
-m => RAM

**REGISTRY**

#!/bin/bash

DOCKER_BUILDKIT=1 docker run -d -p 5000:5000 --restart=always --name registry registry:2
docker pull ubuntu:16.04
docker tag ubuntu:16.04 localhost:5000/my-ubuntu
docker push localhost:5000/my-ubuntu
docker image remove ubuntu:16.04
docker image remove localhost:5000/my-ubuntu
docker pull localhost:5000/my-ubuntu

docker container stop registry && docker container rm -v registry

Checklist
docker run -it img cmd [runs interactivley] CTRL-P + CTRL-Q = detach
docker run -d ... [run in background]
docker ps [show running containers]
docker ps -a [show all i.e. exited also]
docker rm ... [remove stopped containers]
docker run .. -p $HOSTP:$CONTP ... [expose ports]
docker run .. -v $HPATH:$CPATH ... [share files] Bind mount

