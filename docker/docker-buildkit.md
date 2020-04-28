# Building Efficient Docker Container Images with BuildKit

## Introduction to Building Container Images with Docker BuildKit

Docker BuildKit is the next generation container image builder, which helps us to make Docker images more efficient, secure, and faster. It’s integrated into the Docker release version v18.06. BuildKit is a part of the Moby project which was developed after learning’s and failures to make the image build process –

- Concurrent
- Cache-efficient
- Better Support for storage management

BuildKit works on multiple export formats such as OCI or [Docker](https://www.docker.com/) along with the Support of Frontends (Dockerfile) and provides features such as efficient caching and running parallel build operations. BuildKit only needs container runtime for its execution and currently supported runtimes include containerd and runc.

Before getting to the critical components of BuildKit project, let’s take a look at the features it provides.

------

## BuildKit Key Features

- Automatic garbage collection

- Extendable Frontend formats

- Concurrent dependency resolution

- Efficient instruction caching

- Build cache import/export

- Nested build job invocations

- Distributable workers

- Multiple output formats

- Pluggable architecture

- Execution without root privileges

  

  ## Requirements

  - System requirements are docker-ce x86_64, ppc64le, s390x, aarch64, armhf; or docker-ee x86_64 only
  - Network connection required for downloading images of custom frontends

  ## Limitations

  - Only supported for building Linux containers
  - BuildKit mode is compatible with UCP 3.2 or newer

  ## To enable BuildKit builds

  Easiest way from a fresh install of docker is to set the `DOCKER_BUILDKIT=1` environment variable when invoking the `docker build` command, such as:

  ```shell
  $ DOCKER_BUILDKIT=1 docker build .
  ```

  To enable docker BuildKit by default, set daemon configuration in `/etc/docker/daemon.json` feature to true and restart the daemon:

  ```json
  { "features": { "buildkit": true } }
  ```

  ## What are the various BuildKit Use Cases?

  ### Building Docker Images in Kubernetes

  Currently, while building Docker images in the Kubernetes cluster, we need to have a pod running with /var/run/docker. sock hostPath mount. So docker could share the sock with the host, or the other way could be running the docker:dind ( docker in docker ) image as a base image for the docker build process in Kubernetes.

  Both of these solutions are not secure at all. But with BuildKit can be executed as a non-root user and also it does need to define the security Context configuration. BuildKit works in rootless mode.

  ### Custom Outputs

  BuildKit leverages its power beyond just building the docker images. We could add an output directory flag, and it would output the resultant binary or any result to local. For example, we don’t have the Go Environment setup on our system, but we have a docker file with build Environment and after running that Dockerfile can output the binary to the local that could be used by another Dockerfile in the build process. The output directory feature was integrated into the version v19.03 beta.

  ### Concurrent build process and execution

  BuildKit Uses DAG-style low-level intermediate language LLB which help us to get the Accurate dependency analysis and cache invalidation. Also, it would check and run multiple verticals in parallel. So all the instructions in the Dockerfile or any frontend backend could run in parallel.

  ### Remote caching

  This feature is an upgraded version from the –cache-from which was having problems such as images need to be pre-pulled, no support for multi-stage builds, etc. but now in the latest v19.03 release you could pull the cache from remote source and it would pull only the cacheable content from a docker image from remote location instead of pulling down the whole docker image.

  ------

  ## A Holistic Startegy

  BuildKit is very useful for building the Dockerfile more efficiently and securely. It will be great to see it in action with more new features