# Kubernetes Architecture

![kube7-arch](https://static1.tothenew.com/blog/wp-content/uploads/2016/08/kube7-arch.png)

 

## Master Node Architecture

**Etcd**: It is an open source key-value store developed by CoreOs team. Kubernetes uses ‘Etcd’ to store the configuration data accessed by all nodes (minions and master) in the cluster.

**Kube-ApiServer:** The Kubernetes api-server generally validates the configuration data store in ‘Etcd’ and the details of the deployed container that are in agreement. It also provides a RESTful interface to make communication easy.

**Kube-Schedule Server**: It is responsible for assigning task to minions in the cluster. It keeps watch over the resource capacity and ensures that a worker node’s performance is within an appropriate threshold.

**Kube-Controller-Manager:** It is generally responsible for handling the cluster level function such as replication controller. Whenever the desired state of the cluster changes it is written to Etcd and then the controller manager tries to bring up the cluster in the desired state.

![Showing How a Kubernetes Master Node is Built Up](https://kublr.com/wp-content/uploads/2017/09/Screen-Shot-2019-09-06-at-11.43.45-AM.png)

## Minion Node Architecture (**Kubernetes Worker Nodes**)

**Docker:** One of  the basic requirement of nodes is Docker. Docker is responsible for pulling down and running container from Docker images. Read here for more information on [docker](https://www.tothenew.com/blog/what-is-docker-and-why-use-it/) .

**Kube-Proxy:** Every node in the cluster runs a simple network proxy. Using proxy node in cluster routes request to the correct container in a node.

**Kubelet**: It is an agent process that runs on each node. It is responsible for managing pods and their containers. It deal with pods specifications which are defined in YAML or JSON format. Kubelet takes the pod specifications and checks whether the pods are running healthy or not.

**Flannel**: It is an overlay network that works on assigning  a range of subnet address. It is used to assign IPs to each pods running in the cluster and to make the  pod-to-pod  and pod-to-services communications.

![The Process of Kubernetes Nodes and Pods](https://kublr.com/wp-content/uploads/2017/09/Screen-Shot-2019-09-06-at-11.43.58-AM.png)

### FAQs

#### What is Kubernetes used for?

Kubernetes keeps track of your container applications that are deployed into the cloud. It restarts orphaned containers, shuts down containers when they’re not being used, and automatically provisions resources like memory, storage, and CPU when necessary.

#### How does Kubernetes work with Docker?

Actually, Kubernetes supports several base container engines, and Docker is just one of them. The two technologies work great together, since Docker containers are an efficient way to distribute packaged applications, and Kubernetes is designed to coordinate and schedule those applications.

#### **What are different Container Engines supported by Kubernetes ?**

Kubernetes supports several container runtimes: [Docker](https://docs.docker.com/engine/), [containerd](https://containerd.io/docs/), [CRI-O](https://cri-o.io/#what-is-cri-o), and any implementation of the [Kubernetes CRI (Container Runtime Interface)](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-node/container-runtime-interface.md).

#### How do I use Kubernetes?

If you’re interested in trying Kubernetes out, you can install [Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/) as a local testing environment or even make LXC containers to form a cluster if you have a really nice system.. When you’re ready to try Kubernetes out for real, you’ll use [kubectl](https://kubernetes.io/docs/tutorials/kubernetes-basics/deploy-app/deploy-intro/) to deploy your application managed by Kubernetes.