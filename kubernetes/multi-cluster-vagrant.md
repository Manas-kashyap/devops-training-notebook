## Why do we require multi node cluster setup?

Multi node Kubernetes clusters offer a production-like environment which has various advantages. Even though Minikube provides an excellent platform for getting started, it doesn’t provide the opportunity to work with multi node clusters which can help solve problems or bugs that are related to application design and architecture. For instance, Ops can reproduce an issue in a multi node cluster environment, Testers can deploy multiple versions of an application for executing test cases and verifying changes. These benefits enable teams to resolve issues faster which make the more agile.

## Why use Vagrant ?

**Vagrant:** is a tool for building and managing virtual machine environments in a single workflow and by far the easiest and fastest way to create a virtualized environment, and an effective way of deploying Kubernetes. In order for vagrant to work, you’ll need a virtual machine provider such as VirtualBox, VMware or Hyper-V.

## Dependencies

You should install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) before you start.

## Step 1) Installing Vagrant

Vagrant must first be installed on the machine you want to run it on. To make installation easy, Vagrant is distributed as a binary package for all supported platforms and architectures. Installing Vagrant is extremely easy. Head over to the [Vagrant downloads page](https://www.vagrantup.com/downloads.html) and get the appropriate installer or package for your platform. Install the package using standard procedures for your operating system.

After vagrant has been installed. You can verify its installation by running the binary to show the version

```bash
root@ubuntuvm01:~# ./vagrant version
Installed Version: 2.2.6
Latest Version: 2.2.6
You're running an up-to-date version of Vagrant!
```

## Step 2) Install git

This may be necessary if it isn’t already installed on your system

```bash
apt-get install git -y
```

## Step 3) Using Vagrant file for setting up cluster

##### Clone this github repo:

I am using one from Randomly

```text
git clone https://github.com/sayems/kubernetes.resources.git
```

Navigate to `k8s-vagrant` directory

```text
$ cd kubernetes.resources/k8s-vagrant/
```

##### Spin up Kubernetes cluster

Navigate to `k8s/` directory and then run the following command to start the Vagrant:

```bash
$ vagrant up
```

Now, wait for kubernetes cluster to be ready. This might take a while to complete



**Vagrantfile**: The primary function of the Vagrantfile is to describe the type of machine required for a project, and how to configure and provision these machines. In this file, you will have settings such as operating system type, hostnames of your VMs in the cluster, node count for a few examples. The file also specifies the bootstrap scripts.

**bootstrap.sh:** This file is a basic set of initial instructions that will generally be applied to both the master Kubernetes node and the worker nodes as well. It does things such as update the /etc/hosts file to include all the nodes, installs docker, disable selling and firewalld. It also installed Kubernetes 

**bootstrap_kmaster.sh:** This file Initialize Kubernetes, create the flannel network

**bootstrap_kworker:** This script will join the worker nodes to the cluster

- Almost all interaction with Vagrant is done through the command-line interface. The interface is available using the vagrant command, and comes installed with Vagrant automatically. The vagrant command in turn has many sub commands.

## Step 4) Checking the Status

Once the cluster is completed build you can check the status of there system with the status flag.

```bash
$~/kubernetes/vagrant-provisioning$ vagrant status
Current machine states:
kmaster                   running (virtualbox)
kworker1                  running (virtualbox)
kworker2                  running (virtualbox)
```

## Step 5) Logging into the Head Node

To log into the head node or any of the nodes in the cluster simply run “vagrant ssh <hostname>.

```bash
$~/kubernetes/vagrant-provisioning$ vagrant ssh kmaster
Last login: Wed May 18 00:27:31 2020
```

Your Cluster is now ready to use. You can verify by running “kubectl get nodes”.

```bash
[vagrant@kmaster ~]$ kubectl get nodes
NAME                   STATUS     ROLES    AGE    VERSION
kmaster.example.com    Ready   master   14m    v1.16.2
kworker1.example.com   Ready   <none>   11m    v1.16.2
kworker2.example.com   Ready   <none>   9m8s   v1.16.2
```

